Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0ACB4E013FB
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2012 04:53:44 -0700 (PDT)
Received: by werc1 with SMTP id c1so4370455wer.35
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2012 04:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ldXONVkaiaNCKgpQwPZIJ2wDj0wmb3eUELNUyL988CQ=;
	b=SVp7C6/HDF6PWmgh8N2kC37EyXX9DbA1jqAtcg6U1iWpo05DXOlZhjQhPHY4v1do9L
	qUYmT8osK3KcLPOd6WYGJi6ujzeOVbFsTUUWuRsn2JlFfRB9m72gSWIcIqKO4d7AkjVk
	KaqnIkpUSPqwkpeRaNYRF/cTpExJ3akeLBzhd/lUqvrBREmIHUdSaaomIQMMdjSBH/fM
	wMhNolZv7P5KtAMtaYRgEkPmeQkjMMueY0pnRfhG0kE5fHcRobjEW8QXTiVAyiE1apu9
	e6pBCDeykZA/Q30AV5y1H54YiSbGm8KMqs2sMVILs7hZB8OOGDY7vbyLOy6f4x/TKn8B
	cOuA==
Received: by 10.180.86.132 with SMTP id p4mr18057478wiz.15.1334577223377;
	Mon, 16 Apr 2012 04:53:43 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	ev10sm19188999wid.10.2012.04.16.04.53.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 04:53:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 16 Apr 2012 13:53:36 +0200
Message-Id: <1334577216-16277-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmMei+nRscw2gCiLfTRoG5QjvvJHT9v88DftTTigfhCGFyqPyK7/+gBZ8hx/Ilxfwaq4b1X
Cc: denys@ti.com
Subject: [PATCH] libgles-omap3: fix RRECOMMENDS
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
X-List-Received-Date: Mon, 16 Apr 2012 11:53:45 -0000

The modules assignment overwrote the previous ones, leading to missing libraries.

Before:
	 Package: libgles-omap3
	 Recommends: omap3-sgx-modules
After:
	 Package: libgles-omap3
	 Recommends: omap3-sgx-modules, libgles-omap3-es8, libgles-omap3-es6, libgles-omap3-es5, libgles-omap3-es3, libgles-omap3-es2

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 69254c1..fbd931f 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r25"
+PR = "r26"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -320,7 +320,7 @@ FILES_${PN}-x11trainingcourses = "${bindir}/SGX/trainingcourses/X11/*"
 RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-x11wsegl"
 
 # The libs need the kernel-modules
-RRECOMMENDS_${PN} = "omap3-sgx-modules"
+RRECOMMENDS_${PN} += "omap3-sgx-modules"
 
 # The initscript calls fbset, cputype calls devmem2
 RDEPENDS_${PN} += "fbset devmem2"
-- 
1.7.2.5


