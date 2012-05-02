Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5882FE0140F
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 05:33:41 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id c12so414550wer.35
	for <meta-ti@yoctoproject.org>; Wed, 02 May 2012 05:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=umZHIWOLPUAIZXv4lGY+Lh9E8rjYmCs5SbCVmV60tJo=;
	b=jkL+I7YzoIntp6AchN22Lp6v0YzYTjsnCxVauzgrfsnK//3y4Ydor8xPAiCzZK0iJO
	S04Bz8KraR/L6nRK4ArD75j008wb5xG4rZu64q6azodpRj5zSnsOE0SfnzY84x6HS5Bj
	60HKaWB2ocFgb4/vo16whPWNJ4eN7xRKtg5Aq9sn1bWkAmMzH5G1bt+euxqdrJHAzsSi
	5/6CTwARSMrmjK0uNeZS3P8fY/6xYkkjwHGPVGt0VndnGPcPbEEY3SvGyWz0nma1azOy
	BBcaFjQQlss8yTIRcenDTAUWHwbG8YafpHWo+2Er/JrT9pvn+8fARNgOUhsdIErHCfsA
	mfgA==
Received: by 10.216.138.38 with SMTP id z38mr12707022wei.63.1335962020979;
	Wed, 02 May 2012 05:33:40 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gd4sm6299767wib.6.2012.05.02.05.33.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 05:33:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  2 May 2012 14:33:25 +0200
Message-Id: <1335962006-27727-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
References: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm/pPD8aKxC12+hNPFOvspedcPl+unMXNrUPJO2vrxC454bdU9MJ+bPvNShFK2mIM2wvmI1
Cc: denys@ti.com
Subject: [PATCH 3/4] libgles-omap3: package dri files into driwsegl subpackages
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
X-List-Received-Date: Wed, 02 May 2012 12:33:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 3a6ffd0..6d8fc7a 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r29"
+PR = "r30"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -239,7 +239,7 @@ FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
-FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so*"
+FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
 
 PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
 FILES_${PN}-blitwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
@@ -277,11 +277,11 @@ FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/E
 FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
 RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
 
-FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.*"
+FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES2*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES3*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES5*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES6*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES8*/libsrv_um_dri*"
 RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
 
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
-- 
1.7.10


