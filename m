Return-Path: <alessio.bogani@elettra.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08B0C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 10:44:26 +0000 (UTC)
Received: from bacon.elettra.eu (bacon.elettra.eu [140.105.206.12])
 by mx.groups.io with SMTP id smtpd.web08.5658.1648637064729113575
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 03:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: elettra.eu, ip: 140.105.206.12, mailfrom: alessio.bogani@elettra.eu)
X-Envelope-From: <alessio.bogani@elettra.eu>
Received: from zmp.elettra.eu (zmp.elettra.trieste.it [140.105.206.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bacon.elettra.eu (Postfix) with ESMTPS id BE6F541D80
	for <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 12:44:20 +0200 (CEST)
Received: from zmp.elettra.eu (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTPS id AA5A1140180A;
	Wed, 30 Mar 2022 12:44:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTP id 910D1140180B;
	Wed, 30 Mar 2022 12:44:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zmp.elettra.eu
Received: from zmp.elettra.eu ([127.0.0.1])
	by localhost (zmp.elettra.eu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rcrF1H2KuNz0; Wed, 30 Mar 2022 12:44:20 +0200 (CEST)
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
 [192.168.205.44])
	by zmp.elettra.eu (Postfix) with ESMTP id 6FF08140180A;
	Wed, 30 Mar 2022 12:44:20 +0200 (CEST)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: meta-ti@lists.yoctoproject.org
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [master][PATCH] ti-cgt-pru: Update to version 2.3.3
Date: Wed, 30 Mar 2022 12:44:16 +0200
Message-Id: <20220330104416.29250-1-alessio.bogani@elettra.eu>
X-Mailer: git-send-email 2.17.1
X-elettra-Libra-ESVA-Information: Please contact elettra for more information
X-elettra-Libra-ESVA-ID: BE6F541D80.ABF05
X-elettra-Libra-ESVA: No virus found
X-elettra-Libra-ESVA-From: alessio.bogani@elettra.eu
X-elettra-Libra-ESVA-Watermark: 1649241860.91934@CG5W+Egr2iA/iIerNQ26eg
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 10:44:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14581

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 .../recipes-ti/devtools/ti-cgt-pru_2.3.2.bb   | 49 -------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
deleted file mode 100644
index 8b3e2a07..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-DESCRIPTION = "TI PRU Code Generation Tools"
-HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
-
-LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
-LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-unpack.inc
-
-BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
-BINFILE_NAME = "cgt-pru-x86"
-TI_BIN_UNPK_ARGS = "--prefix ${S}"
-TI_BIN_UNPK_CMDS = ""
-
-BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
-BINFILE_NAME:class-target = "cgt-pru-arm"
-
-SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
-
-SRC_URI[cgt-pru-x86.md5sum] = "270a0ecca383f66cad3a0e2a738c6ab0"
-SRC_URI[cgt-pru-x86.sha256sum] = "af1178a059d46d67d5672df053dd2fbebb0b89a513b17b8739dbe915b4a5d71a"
-
-SRC_URI[cgt-pru-arm.md5sum] = "fbf10083af1b0e5d69b018126603bb58"
-SRC_URI[cgt-pru-arm.sha256sum] = "75ac84775a5624ea7e4fad4efc1acb7e869c79160550d48ba780068a3dce879c"
-
-do_install() {
-    install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-    cp -r ${S}/ti-cgt-pru_${PV}/. \
-          ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
-}
-
-do_install:class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
-}
-
-FILES:${PN} += "${datadir}/ti/*"
-
-FILES:${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
-                   ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
-"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-INSANE_SKIP:${PN} += "arch staticdev already-stripped file-rdeps"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


