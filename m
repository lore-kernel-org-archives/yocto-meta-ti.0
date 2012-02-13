Return-Path: <tom.rini@gmail.com>
Received: from mail-pw0-f53.google.com (mail-pw0-f53.google.com
	[209.85.160.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 584EEE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 08:51:27 -0800 (PST)
Received: by pbbrq13 with SMTP id rq13so4446581pbb.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 08:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=cJvCbdz8lBBGkaXpIiBIaQQW/nWM+U4ppx0S8IMDimw=;
	b=o1zCnPtLnGgIdODLdIZOq7aFBBK5zpykBhlmF3f7hC8lLugGpBBl2ErMuz8kDBapC7
	uqdNfz/QqBh9HCjOkTraTFzTGplW15ckQYkEiv9Fs6qU2O+l6IYWly8a0q5bCI05VRFi
	/iwnlc7rnZkqbJ2cuUxvEEsLYSItpouGjA0pc=
Received: by 10.68.211.132 with SMTP id nc4mr28772670pbc.109.1329151887139;
	Mon, 13 Feb 2012 08:51:27 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id p2sm40953852pbb.14.2012.02.13.08.51.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 08:51:26 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 09:51:26 -0700
Message-Id: <1329151888-7525-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/3] u-boot.inc: Move fw_env.config to main package
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
X-List-Received-Date: Mon, 13 Feb 2012 16:51:27 -0000

Now that u-boot-fw-utils is a separate recipe (in oe-core) we do not
want to try and build the tools here.  We also want to package the
fw_env.config file in the main package, if it exists.

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


