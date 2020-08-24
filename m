Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.70.1598290260359075964
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D25C340C4F;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGJ06oGGivUc; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C01A540C46;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 41A67174472;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 09/14] Revert "ti-cgt7x: upgrade 1.2.0 -> 1.3.0"
Date: Mon, 24 Aug 2020 13:30:44 -0400
Message-Id: <1598290249-23943-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit ce230a6b15fc788963cc869cd3a57d08d4c32f15.
---
 recipes-ti/devtools/{ti-cgt7x_1.3.0.bb => ti-cgt7x_1.2.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-cgt7x_1.3.0.bb => ti-cgt7x_1.2.0.bb} (84%)

diff --git a/recipes-ti/devtools/ti-cgt7x_1.3.0.bb b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
similarity index 84%
rename from recipes-ti/devtools/ti-cgt7x_1.3.0.bb
rename to recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index 55ec91e..09178af 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.3.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -8,7 +8,7 @@ libraries and standard header files needed to produce a working DSP application.
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=3ee1c9f774004535003f80cb8142bb0f"
+LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=f1156d241d104c281bc64a6ec8eadc64"
 
 require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-paths.inc
@@ -25,7 +25,8 @@ SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/$
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[cgt7x_x86_installer.sha256sum] = "24071fe0369e55af80e334852cda7fa78b64ae79a411c57ac6995470a7a23694"
+SRC_URI[cgt7x_x86_installer.md5sum]    = "813840908f333dd2a31f92edec71c1fb"
+SRC_URI[cgt7x_x86_installer.sha256sum] = "21379811a8857489f72ca8ec45a46eb086ced0bdbb58e78f73a86e63984ab2f5"
 
 S = "${WORKDIR}/c7000_${PV}"
 
@@ -34,9 +35,10 @@ do_install() {
     cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}.STS/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
 }
 
+
 FILES_${PN} += "${TI_CGT7X_INSTALL_DIR_RECIPE}"
 
-INSANE_SKIP_${PN} += "arch staticdev textrel file-rdeps"
+INSANE_SKIP_${PN} += "arch staticdev textrel"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
-- 
2.7.4

