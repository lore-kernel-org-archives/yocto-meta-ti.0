Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1634EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 07:03:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5964.1687417421318989059
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 00:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jUXdjOhF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35M73dVJ074192;
	Thu, 22 Jun 2023 02:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687417419;
	bh=5/c3wATHzHrPXNoTlwl8xMTCv13VD+MxmUsI0ME9f7w=;
	h=From:To:CC:Subject:Date;
	b=jUXdjOhFB+Q72qeuGpmv8TEtqEWZ3Moyig0J8ohvmulbkcFMQ1GwDBbhdSB8HRUcP
	 4E0N/afsvVulIJeApjqCbhBPGBjq+GQud6fPXqZlPS1nZEFSRw5kV6dM69gWaT6fFG
	 2z61eo59XC0OPbo9ZxVt2S73ecH3q9mbgsr5TWIg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35M73dxL024879
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 02:03:39 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 02:03:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 02:03:39 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35M73b2H067054;
	Thu, 22 Jun 2023 02:03:38 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
        <praneeth@ti.com>
CC: <r-gunasekaran@ti.com>
Subject: [master/kirkstone][PATCH v3] pruhsr-fw: SR2.0: Add new firmware
Date: Thu, 22 Jun 2023 12:33:36 +0530
Message-ID: <20230622070336.10002-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 07:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16770

From: Ryan Eatmon <reatmon@ti.com>

We need to package up new HSR firmware for am65x-sr2.  Add dependencies
for them on the correct platforms.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
Changes in v3:
--------------
Filename "pruhsr-fw_am65x-sr2_git.bb" and package name "pruhsr-fw-am65x-sr2"
were mismatching. Fixed the filename similar to switch firmware
"prusw-fw-am65x-sr2_git.bb"

Changes in v2:
--------------
Names of firmware were changed to match existing filenames.

 .../pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb      | 34 +++++++++++++++++++
 .../recipes-kernel/linux/kernel-rdepends.inc  |  4 +--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
new file mode 100644
index 00000000..c31af832
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "PRU HSR firmware for AM65xx SR2.0"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
+PR = "${INC_PR}.0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = " \
+    am65x-sr2-pru0-pruhsr-fw.elf \
+    am65x-sr2-pru1-pruhsr-fw.elf \
+    am65x-sr2-rtu0-pruhsr-fw.elf \
+    am65x-sr2-rtu1-pruhsr-fw.elf \
+    am65x-sr2-txpru0-pruhsr-fw.elf \
+    am65x-sr2-txpru1-pruhsr-fw.elf \
+"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
+	done
+}
+
+FILES:${PN} = "${nonarch_base_libdir}/firmware"
+
+INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index d2dcc3e5..7c8f3171 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -16,8 +16,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " cadence-mhdp-fw"
-- 
2.17.1


