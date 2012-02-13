Return-Path: <tom.rini@gmail.com>
Received: from mail-pz0-f43.google.com (mail-pz0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC375E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:40:27 -0800 (PST)
Received: by damc16 with SMTP id c16so5353230dam.2
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=UPt59iLpCe0VlxoJDJA8qxUTV7kxqFRN7IJZ7/a3Gek=;
	b=i0d6QcH+r5Pxz9IBmdUSb4fsupbbRqOCOfx8Vj0UKf8qGvLyq5BsEfYYVt1U7Qlyuz
	MjHiHqpI22ItoUu37VqnpRNVNdLS4BPEC/fsXqJTwUgiiKbPVCi7njnHVUnOQP5yVh1B
	C3AOSQ6/GJm52UUyFD2awnoXx9d0CLcyK6sG8=
Received: by 10.68.222.133 with SMTP id qm5mr49561855pbc.78.1329158427254;
	Mon, 13 Feb 2012 10:40:27 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74]) by mx.google.com with ESMTPS id
	li19sm41467821pbb.17.2012.02.13.10.40.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:40:26 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 11:40:26 -0700
Message-Id: <1329158428-8747-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2 1/3] u-boot.inc: Move fw_env.config to main package
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
X-List-Received-Date: Mon, 13 Feb 2012 18:40:27 -0000

Now that u-boot-fw-utils is a separate recipe (in oe-core) we do not
want to try and build the tools here.  We also want to package the
fw_env.config file in the main package, if it exists.

Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Tom Rini <trini@ti.com>
---
 recipes-bsp/u-boot/u-boot.inc |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot.inc b/recipes-bsp/u-boot/u-boot.inc
index 9669ade..9303568 100644
--- a/recipes-bsp/u-boot/u-boot.inc
+++ b/recipes-bsp/u-boot/u-boot.inc
@@ -28,7 +28,6 @@ do_compile () {
 	unset CFLAGS
 	unset CPPFLAGS
 	oe_runmake ${UBOOT_MAKE_TARGET}
-	oe_runmake tools env
 }
 
 do_install () {
@@ -37,22 +36,16 @@ do_install () {
 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
 	if [ -e ${WORKDIR}/fw_env.config ] ; then
-	    install -d ${D}${base_sbindir}
 		install -d ${D}${sysconfdir}
 		install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
-#		install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-#		install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
 	fi
 
 }
 
-FILES_${PN} = "/boot"
+FILES_${PN} = "/boot ${sysconfdir}"
 # no gnu_hash in uboot.bin, by design, so skip QA
 INSANE_SKIP_${PN} = True
 
-PACKAGES += "${PN}-fw-utils"
-FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"
-
 inherit deploy
 
 addtask deploy before do_package after do_compile
-- 
1.7.0.4


