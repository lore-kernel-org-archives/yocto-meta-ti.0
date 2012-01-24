Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43D6EE0074A
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 01:24:45 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id b10so3247199wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 01:24:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.132.19 with SMTP id n19mr523385wei.31.1327397084946;
	Tue, 24 Jan 2012 01:24:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm13177824wib.0.2012.01.24.01.24.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 01:24:44 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 24 Jan 2012 10:24:30 +0100
Message-Id: <1327397074-15731-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327397074-15731-1-git-send-email-koen@dominion.thruhere.net>
References: <1327397074-15731-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm+qtn5x55mFpl8IGKQPz/vZk+FEwAeNi4U3Y1wLn6oyZ7TS/ANAmqZImOhtNq5oPzOGoqw
Subject: [PATCH 3/7] libgles-omap3: package DRI windowing system as well
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
X-List-Received-Date: Tue, 24 Jan 2012 09:24:45 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 0a05a0b..fff19f0 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r19"
+PR = "r20"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -240,12 +240,13 @@ FILES_${PN}-es5 = "${libdir}/ES5*/* ${bindir}/ES5*/*"
 FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
 FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
 
-PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl ${PN}-x11wsegl"
+PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl ${PN}-x11wsegl ${PN}-driwsegl"
 FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so*"
+FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so*"
 
 PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
 FILES_${PN}-blitwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
@@ -283,6 +284,13 @@ FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.*"
 FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.*"
 RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
 
+FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*"
+FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.*"
+FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.*"
+FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*"
+FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.*"
+RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
+
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/lib*.so.* ${libdir}/ES*/* ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*/*"
@@ -316,6 +324,7 @@ INSANE_SKIP_${PN}-flipwsegl = "ldflags"
 INSANE_SKIP_${PN}-frontwsegl = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
 INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
 INSANE_SKIP_${PN}-tests = "ldflags"
 INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
 
-- 
1.7.2.5


