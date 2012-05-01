Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44440E01409
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 06:04:10 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so3155018wib.11
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 06:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Mek0WQWLuXf+sTW1saUbxEATQRpM/13mS2bHTRn3KDc=;
	b=ld7WddXMbCEnUJq0TP5E/2GpHS700BiKYc+iJBMzYyWYHRJxZvkDOE+J8W8r9B6kqf
	mLmaWIm1ro0aaBwBi8FfsbVOdulbbrGNnxfwafDSgg38U8pQB09ivttXQ4jFhtcQ1YzJ
	kFCC2Ffw/ZhyconIlCEXiUjpAL/aXdNqs6XSID4wBFsSD7ONHSuI/7GJBii0zU7yRpUz
	mWb07lEZEOy6EPaAi7kkJFvzUXBz6tXmHbVqPMkkS4WZ/jBQO7cSp2pE3wBg0zeLc+OE
	BWrtcSy6zS09XSnrmloG7MUgG7eQOx11g2tz+S8l9CV0Hv/qYfmQkMwV3lXbmya+O+Qm
	X/1g==
Received: by 10.216.144.228 with SMTP id n78mr14854232wej.100.1335877449145;
	Tue, 01 May 2012 06:04:09 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id b3sm36292951wib.4.2012.05.01.06.04.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 06:04:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue,  1 May 2012 15:03:58 +0200
Message-Id: <1335877438-23916-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335877438-23916-1-git-send-email-koen@dominion.thruhere.net>
References: <1335877438-23916-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmi2hLCQpbel9BTlLz8I+F/eoDMxPNU9aeerRuYIY15X35sU3h01ThJwqDLM+myk5PdejIR
Cc: denys@ti.com
Subject: [PATCH 2/2] libgles-omap3: move X related binaries into X11WSEGL subpackages to avoid dragging in libx11 and friends
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
X-List-Received-Date: Tue, 01 May 2012 13:04:10 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index c363361..3a6ffd0 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r28"
+PR = "r29"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -238,7 +238,7 @@ FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
-FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so*"
+FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
 FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so*"
 
 PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
@@ -270,11 +270,11 @@ FILES_${PN}-linuxfbwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 RRECOMMENDS_${PN}-linuxfbwsegl = " ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
 
-FILES_${PN}-x11wsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.*"
-FILES_${PN}-x11wsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.*"
-FILES_${PN}-x11wsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.*"
-FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.*"
-FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.*"
+FILES_${PN}-x11wsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x* ${bindir}/ES2*/*x"
+FILES_${PN}-x11wsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x* ${bindir}/ES3*/*x"
+FILES_${PN}-x11wsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x* ${bindir}/ES5*/*x"
+FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x* ${bindir}/ES6*/*x"
+FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
 RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
 
 FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*"
@@ -286,10 +286,10 @@ RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driws
 
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
 
-FILES_${PN} = "${sysconfdir} ${libdir}/lib*.so.* ${libdir}/ES*/* ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*/*"
+FILES_${PN} = "${sysconfdir} ${libdir}/*.so* ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*"
 
 FILES_xserver-kdrive-powervrsgx = "${bindir}/Xsgx"
-FILES_${PN}-tests = "${bindir}/*"
+FILES_${PN}-tests = "${bindir}/*test*"
 FILES_${PN}-dbg = "${libdir}/.debug/* ${bindir}/.debug/* \
                    ${libdir}/ES*/.debug ${bindir}/*/.debug\
                    ${bindir}/SGX/demos/*/.debug/* \
-- 
1.7.10


