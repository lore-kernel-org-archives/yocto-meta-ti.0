Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.54459.1597702274152008108
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 15:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6456640C36;
	Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsrR9ZVokq59; Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 46CA240C43;
	Mon, 17 Aug 2020 22:11:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0530E174464;
	Mon, 17 Aug 2020 18:11:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 4/6] ti-sci-fw: add support for the new j7200 platform
Date: Mon, 17 Aug 2020 18:10:59 -0400
Message-Id: <1597702261-12174-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597702261-12174-1-git-send-email-denis@denix.org>
References: <1597702261-12174-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 7f7171a..e50e7b3 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,6 +2,10 @@ require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 
+UBOOT_DEPENDS = ""
+UBOOT_DEPENDS_j7200-evm-k3r5 = "u-boot-ti-staging:do_deploy"
+do_compile[depends] += "${UBOOT_DEPENDS}"
+
 CLEANBROKEN = "1"
 PR = "r1"
 
@@ -45,6 +49,8 @@ EXTRA_OEMAKE_HS = " \
 "
 EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
 
+EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${DEPLOY_DIR_IMAGE}/u-boot-spl.bin""
+
 do_compile() {
 	cd ${WORKDIR}/imggen/
 	oe_runmake
@@ -76,4 +82,18 @@ do_deploy () {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install_j7200-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy_j7200-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+}
+
 addtask deploy before do_build after do_compile
-- 
2.7.4

