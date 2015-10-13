Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E0C0E00C1A; Tue, 13 Oct 2015 11:01:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.223.173 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (adam.yh.lee[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2656DE0071C
	for <meta-ti@yoctoproject.org>; Tue, 13 Oct 2015 11:01:21 -0700 (PDT)
Received: by ioii196 with SMTP id i196so29679632ioi.3
	for <meta-ti@yoctoproject.org>; Tue, 13 Oct 2015 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sbKATUzwYUCMZ9J9lG9sWqV++E4G2cvf4j8oX3M2Dzk=;
	b=GkOgVXqw3vOluVugj4awVeTgdaWphEXF8Ty1+bwU4Ex/oZLhEH1L+PFwGsqMyQDBvJ
	60edfUxDIbLzueZd0GjG4FueToqjR7b7xtPmzhtPTeIlPsdgNEIy4LZ5St4R/qvE96IH
	1ThvseXfhwB/4ADxS7AssrRKxr3/NWBB7stsBo+8ANigV15hNxFzzGHEZpez8DKG72bK
	d9CB1d/jtVku4LTwEWhCnJRds4DchOFAtqrHyFosRTpMW0l9rf1UkP6MjrPFpMx3lIHm
	RXZdp2G5Q3D5Cj5hZsEaPEr56QHXZK3r3T1sQVCSdI4YjuiW50cG7hBdIBseq4LnWH6X
	0zGw==
X-Received: by 10.107.6.23 with SMTP id 23mr12620188iog.147.1444759280755;
	Tue, 13 Oct 2015 11:01:20 -0700 (PDT)
Received: from localhost.localdomain (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by smtp.gmail.com with ESMTPSA id n3sm7466258iga.0.2015.10.13.11.01.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Oct 2015 11:01:19 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 13 Oct 2015 11:00:27 -0700
Message-Id: <1444759227-25032-1-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Make libgles-omap3 compatible with RPM
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
X-List-Received-Date: Tue, 13 Oct 2015 18:01:25 -0000

When RPM is used as the packaging type, rootfs will fail because RPM, by
design, check for file level dependency. Here one of the shared objects
(libpvrEWS_REMWSEGL.so) has dependency on ld-linux.so.3 and libews.so.

It is unclear why meta-ti requires ld-linux.so.3, which is a dynamic
loader for soft-float arch. Hence I fake the existence here.

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 13418ad..7681a26 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -188,6 +188,9 @@ do_install () {
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/99-bufferclass.rules ${D}${sysconfdir}/udev/rules.d/
 
+	touch ${D}${libdir}/ES5.0/ld-linux.so.3
+	touch ${D}${libdir}/ES5.0/ld-linux.so.3\(GLIBC_2.4\)
+	cp -pPR ${S}/gfx_rel_es5.x/libews.so ${D}${libdir}/ES5.0/
 }
 
 PACKAGES =+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
@@ -209,6 +212,7 @@ PRIVATE_LIBS_${PN}-es9 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so lib
 
 
 RPROVIDES_${PN} += "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"
+RPROVIDES_${PN}-es5 += "ld-linux.so.3 ld-linux.so.3(GLIBC_2.4) libews.so"
 
 PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
 FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
@@ -330,3 +334,8 @@ rm -f $D${sysconfdir}/powervr-esrev
 pkg_postinst_${PN}-linuxfbwsegl() {
 rm -f $D${sysconfdir}/powervr-esrev
 }
+
+pkg_postinst_${PN}-es5() {
+rm -f $D${libdir}/ES5.0/ld-linux.so.3*
+rm -f $D${libdir}/ES5.0/libews.so
+}
-- 
2.1.4


