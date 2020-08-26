Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.6175.1598417795224404055
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 21:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lo11sRFg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07Q4uYdA038458
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 23:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598417794;
	bh=PKb/SxOSUw3cINfr3FSO9ep+TmftFgl0xS9VLqHsA0M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lo11sRFgsdWMHUT1ZIGeYMQnV0bNBcmoMHu/qOT96IxrOUYm3JYTigHTVxt0CGPSh
	 2DdpkNOJ9U4aYY99uzzxOLHdGw5iSP0rZ5pWuTthMc0U7lBxmS259AfSEKhj7GLAEI
	 4WC9OsBKBlaqz+ON0uEBJPR22bf9LlHWUhP6/KKg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07Q4uYHp049381
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 23:56:34 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 23:56:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 23:56:33 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07Q4uQii093597;
	Tue, 25 Aug 2020 23:56:31 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 2/3] prueth-fw: Package the firmware images from ti-linux-firmware
Date: Wed, 26 Aug 2020 10:26:24 +0530
Message-ID: <20200826045625.19492-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200826045625.19492-1-lokeshvutla@ti.com>
References: <20200826045625.19492-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Directly take the images from ti-linux-firmware instead of using pdk
Aldo drop build for k2g as firmwares are not yet available.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb     | 37 +++++++++++++++
 recipes-bsp/prueth-fw/prueth-fw_git.bb       | 47 --------------------
 recipes-kernel/linux/linux-ti-staging_5.4.bb |  1 -
 3 files changed, 37 insertions(+), 48 deletions(-)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
 delete mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bb

diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb b/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
new file mode 100644
index 00000000..2840b2f1
--- /dev/null
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
@@ -0,0 +1,37 @@
+SUMMARY = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
+BRANCH ?= "ti-linux-firmware"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = ""
+TARGET_ti33x = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
+TARGET_ti43x = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
+TARGET_am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+TARGET_am57xx-hs-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
+	done
+}
+
+
+FILES_${PN} = "${base_libdir}/firmware"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
deleted file mode 100644
index f7718ad2..00000000
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x, AM335x and K2G"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://icss_dualemac/src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
-
-PR = "${INC_PR}.0"
-
-TI_PDK_COMP = "ti.drv.icss_emac.firmware"
-
-B = "${S}/icss_dualemac"
-
-COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm|ti43x|ti33x|k2g"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "ti-cgt-pru-native"
-
-PRU_VERSION = ""
-PRU_VERSION_ti33x = "REV1"
-PRU_VERSION_ti43x = "REV1"
-PRU_VERSION_am57xx-evm = "REV2"
-PRU_VERSION_am57xx-hs-evm = "REV2"
-PRU_VERSION_k2g = "REV2"
-
-FW_PREFIX = ""
-FW_PREFIX_ti33x = "am335x"
-FW_PREFIX_ti43x = "am437x"
-FW_PREFIX_am57xx-evm = "am57xx"
-FW_PREFIX_am57xx-hs-evm = "am57xx"
-FW_PREFIX_k2g = "k2g"
-
-EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
-	install -m 0644 ./elf/${PRU_VERSION}/icss_dualemac_PRU0.elf \
-		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru0-prueth-fw.elf
-	install -m 0644 ./elf/${PRU_VERSION}/icss_dualemac_PRU1.elf \
-		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru1-prueth-fw.elf
-}
-
-FILES_${PN} = "${base_libdir}/firmware"
-
-INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 3a4fdd86..2a35bf1d 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -48,7 +48,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw pr
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
 
-- 
2.23.0

