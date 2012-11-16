Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A74CE003DA
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 11:19:50 -0800 (PST)
Received: by mail-ob0-f176.google.com with SMTP id un3so3528330obb.35
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yUz7Nq2imllqQZ7EduRui9N90x6/W1SevBKp+THR+cU=;
	b=THEFibW0BJETvU752nnDdjR5F8bZuT/jPKlQuDz9SBQIiQdsiPiUMeBwzOJ8R8S57w
	C7Hy7CP33sKLYdAIoxVYRxmxPNp/Jo3oUsmQgShzF8kvIs1ImreK/4x7u5lCwFF4/CwQ
	WOhoP/368fHbAVRmvHzKHMZczACKm0GtsG/qtHbpwwTOovgVxNu/+sAaknK8OqxTlML5
	ICKPVqccXf1P/TpqG1nF2RaNmLZH+AnVfp8IcH4KiM8YZwbZXHyyGQyUkjzs/CqKqezA
	WZKxTD+3HnTeAvmxECR2E8inNNWEzXqDFoAJ6fxypDK/iNNe9fn3nmXGiBX0TvgUqXkL
	Omzg==
Received: by 10.60.14.200 with SMTP id r8mr4828795oec.45.1353093590861;
	Fri, 16 Nov 2012 11:19:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id sl7sm2299670obb.5.2012.11.16.11.19.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 11:19:49 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Nov 2012 13:19:42 -0600
Message-Id: <1353093582-11469-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353093582-11469-1-git-send-email-fcooper@ti.com>
References: <1353093582-11469-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 2/2] libgles-omap3: Verify pvrsrvkm module was found
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2012 19:19:51 -0000

* Check to see if the pvrsrvkm.ko module was found and that the insmod
  for that module was successful.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc    |    2 +-
 recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 574cf17..d9f598a 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r34"
+PR = "r35"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index 00cd994..e5a4cd1 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)
 sgxprepare () {
 	echo Starting PVR
 	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" != "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
 	modprobe omaplfb
 	modprobe bufferclass_ti
 
-- 
1.7.0.4


