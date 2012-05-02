Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A506E0140F
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 05:33:43 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id c12so414550wer.35
	for <meta-ti@yoctoproject.org>; Wed, 02 May 2012 05:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=FUpD1JABFMbnQ010RbDGBv+B2S5Xbf2+KF6B/RQxkew=;
	b=ZfhM32/svNpSREQCXDaRic2OQAKBM6JbLp/LyY27498iKKwmZztUD0owtkt5MGkGRf
	y/jchORtrVLn9YnD9YzL1YChgDg0X+LqARDsDni2Md6rgMkQwSKMUoSA6DFlCdqEGa69
	r5gCzzQVCi6cBjOplSF19iyJ2Sx/BQ8Woyb/XWio9+v5Zorw+vH8IMpM+nO12WjALzCg
	9DZC3R1fdgH5x8tAiEwah4O2QWMcM9J5f+PxdqFlX7zfpHI2yDUcwNPRmd/FT6cV8ExX
	o0yxsaZRRmEUtbug1vOB8iArr5uIprKctmTWul4fU5Ke8qHe86DAzm84GGzJsSvTgavl
	ihqg==
Received: by 10.180.94.161 with SMTP id dd1mr13773346wib.16.1335962023007;
	Wed, 02 May 2012 05:33:43 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm43952500wib.2.2012.05.02.05.33.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 05:33:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  2 May 2012 14:33:26 +0200
Message-Id: <1335962006-27727-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
References: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnlLWw6xkRRJipsreASHyPR6Wjw5xXvLUbJ6xEIW0mj5HqcVlf9t+gtinNXSOFxFuXFN9Nk
Cc: denys@ti.com
Subject: [PATCH 4/4] libgles-omap3: work around bug in opkg
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 12:33:43 -0000

All the EGL_BADALLOC failures that user have been reporting turn out to be a bug in opkg: http://groups.google.com/group/opkg-devel/browse_thread/thread/741d18b0ef31435e#

Opkg decides to relink symlinks to the wrong files. As a workaround we check the symlink during every bootup and fix it if needed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc    |    2 +-
 recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 6d8fc7a..2b40acc 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r30"
+PR = "r31"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index 07efa66..a425d75 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -61,6 +61,12 @@ sgxprepare () {
 }
 
 sgxfinish () {
+	# Fix up a bug in opkg
+	if [ $(readlink /usr/lib/libsrv_um.so) != $(readlink /usr/lib/libsrv_um.so.1) ] ; then 
+		cd /usr/lib
+		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
+	fi
+
 	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
 		echo -n "Starting SGX fixup for"
 		echo " ES${ES_REVISION}.x"
@@ -68,6 +74,7 @@ sgxfinish () {
 		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
 		echo "${ES_REVISION}" > /etc/powervr-esrev
 	fi
+
 	/usr/bin/pvrsrvinit
 }
 
-- 
1.7.10


