Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2292.1588792812041730560
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 12:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A26E40C2D;
	Wed,  6 May 2020 19:20:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJcnAT3BQ0KS; Wed,  6 May 2020 19:20:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44D1A40A6E;
	Wed,  6 May 2020 19:20:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8CCCD16ECE4;
	Wed,  6 May 2020 15:20:09 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] prueth-fw-am65x-sr2: add prebuilt PRU Ethernet FW for AM65x SR2.0
Date: Wed,  6 May 2020 15:20:09 -0400
Message-Id: <1588792809-18686-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 39 ++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_5.4.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
new file mode 100644
index 0000000..6e17c4a
--- /dev/null
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "2.2.0.1+2.2.0.2-rc1"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am65xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
+BRANCH ?= "ti-linux-firmware"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = " \
+    am65x-sr2-pru0-prueth-fw.elf \
+    am65x-sr2-pru1-prueth-fw.elf \
+    am65x-sr2-rtu0-prueth-fw.elf \
+    am65x-sr2-rtu1-prueth-fw.elf \
+    am65x-sr2-txpru0-prueth-fw.elf \
+    am65x-sr2-txpru1-prueth-fw.elf \
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
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 9f893cc..7144a95 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -50,6 +50,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
-- 
2.7.4

