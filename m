Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1237.1635795196413504981
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7876740C90
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuCuPmorHv5E for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E01740C93
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 53EBB174694
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 13/22] prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for AM65x SR2.0
Date: Mon,  1 Nov 2021 15:33:03 -0400
Message-Id: <1635795192-43144-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Vignesh Raghavedra <vigneshr@ti.com>

Add AM65x SR2.0 ICSSG Switch firmware. Base version is 02.02.09.06

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb | 34 ++++++++++++++++++++++++++
 recipes-kernel/linux/kernel-rdepends.inc       |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb

diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
new file mode 100644
index 0000000..8cb450a
--- /dev/null
+++ b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "PRU Ethernet Switch firmware for AM65xx SR2.0"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
+PR = "${INC_PR}.0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am65xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = " \
+    am65x-sr2-pru0-prusw-fw.elf \
+    am65x-sr2-pru1-prusw-fw.elf \
+    am65x-sr2-rtu0-prusw-fw.elf \
+    am65x-sr2-rtu1-prusw-fw.elf \
+    am65x-sr2-txpru0-prusw-fw.elf \
+    am65x-sr2-txpru1-prusw-fw.elf \
+"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
+	done
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index e81ce25..7777e2b 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -34,7 +34,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-hs-evm = " prueth-fw prusw-fw
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-- 
2.7.4

