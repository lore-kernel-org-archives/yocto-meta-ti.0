Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8582.1589962340643714888
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 189DD40C42;
	Wed, 20 May 2020 08:12:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PB-oC2rA33Vd; Wed, 20 May 2020 08:12:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC82F40C3D;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1303D173209;
	Wed, 20 May 2020 04:12:17 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 6/8] ti-cgt7x: upgrade 1.2.0 -> 1.3.0
Date: Wed, 20 May 2020 04:11:46 -0400
Message-Id: <1589962308-54665-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589962308-54665-1-git-send-email-denis@denix.org>
References: <1589962308-54665-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

License change due to year update.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/{ti-cgt7x_1.2.0.bb => ti-cgt7x_1.3.0.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename recipes-ti/devtools/{ti-cgt7x_1.2.0.bb => ti-cgt7x_1.3.0.bb} (84%)

diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/recipes-ti/devtools/ti-cgt7x_1.3.0.bb
similarity index 84%
rename from recipes-ti/devtools/ti-cgt7x_1.2.0.bb
rename to recipes-ti/devtools/ti-cgt7x_1.3.0.bb
index 09178af..55ec91e 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.3.0.bb
@@ -8,7 +8,7 @@ libraries and standard header files needed to produce a working DSP application.
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=f1156d241d104c281bc64a6ec8eadc64"
+LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=3ee1c9f774004535003f80cb8142bb0f"
 
 require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-paths.inc
@@ -25,8 +25,7 @@ SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/$
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[cgt7x_x86_installer.md5sum]    = "813840908f333dd2a31f92edec71c1fb"
-SRC_URI[cgt7x_x86_installer.sha256sum] = "21379811a8857489f72ca8ec45a46eb086ced0bdbb58e78f73a86e63984ab2f5"
+SRC_URI[cgt7x_x86_installer.sha256sum] = "24071fe0369e55af80e334852cda7fa78b64ae79a411c57ac6995470a7a23694"
 
 S = "${WORKDIR}/c7000_${PV}"
 
@@ -35,10 +34,9 @@ do_install() {
     cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}.STS/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
 }
 
-
 FILES_${PN} += "${TI_CGT7X_INSTALL_DIR_RECIPE}"
 
-INSANE_SKIP_${PN} += "arch staticdev textrel"
+INSANE_SKIP_${PN} += "arch staticdev textrel file-rdeps"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
-- 
2.7.4

