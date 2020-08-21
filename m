Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.128583.1597995169700898590
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 00:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FeJ0f7xV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07L7Wn0s021538
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 02:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597995169;
	bh=x32p6KqcS7VwyGiv0oYQxcDR15YY+Lwg0LNHTPzNDP0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FeJ0f7xVCbF2r6O+anjHgmDd4Mq6VP6BxAfhOV34rcTTZx+3vT53GkU6CuZBhxaqC
	 kpcxTFA07+5iNqJFlnz+phkISV/6+t30UTuPsuDPhnZvjdB8+xuKKdDgQCGon/mCRX
	 c5kDMB/vCuzYl1lKOttvQeDt3Ob4jB3YGSwzWCCk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07L7WnEI051315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 02:32:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 21
 Aug 2020 02:32:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 21 Aug 2020 02:32:48 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07L7Wcaj041602;
	Fri, 21 Aug 2020 02:32:46 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 3/3] prusw-fw: Package the firmware images from ti-linux-firmware
Date: Fri, 21 Aug 2020 13:02:38 +0530
Message-ID: <20200821073238.18926-4-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821073238.18926-1-lokeshvutla@ti.com>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Directly take the images from ti-linux-firmware instead of using pdk

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb | 38 ++++++++++++++++++++++++
 recipes-bsp/prusw-fw/prusw-fw_git.bb   | 40 --------------------------
 2 files changed, 38 insertions(+), 40 deletions(-)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
 delete mode 100644 recipes-bsp/prusw-fw/prusw-fw_git.bb

diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb b/recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
new file mode 100644
index 00000000..514237eb
--- /dev/null
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "PRU Switch firmware for AM57xx, AM437x and AM335x"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "3.0.3"
+PR = "r1"
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
+TARGET_ti33x = "am335x-pru0-prusw-fw.elf am335x-pru1-prusw-fw.elf"
+TARGET_ti43x = "am437x-pru0-prusw-fw.elf am437x-pru1-prusw-fw.elf"
+TARGET_am57xx-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
+TARGET_am57xx-hs-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
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
diff --git a/recipes-bsp/prusw-fw/prusw-fw_git.bb b/recipes-bsp/prusw-fw/prusw-fw_git.bb
deleted file mode 100644
index 2921fb1d..00000000
--- a/recipes-bsp/prusw-fw/prusw-fw_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "PRU Switch firmware for AM57xx"
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
-B = "${S}/icss_switch"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "ti-cgt-pru-native"
-
-PRU_VERSION = ""
-PRU_VERSION_dra7xx = "REV2"
-
-FW_PREFIX = ""
-FW_PREFIX_dra7xx = "am57xx"
-
-
-EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
-	install -m 0644 ./elf/${PRU_VERSION}/icss_stp_switch_PRU0.elf \
-		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru0-prusw-fw.elf
-	install -m 0644 ./elf/${PRU_VERSION}/icss_stp_switch_PRU1.elf \
-		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru1-prusw-fw.elf
-}
-
-FILES_${PN} = "${base_libdir}/firmware"
-
-INSANE_SKIP_${PN} = "arch"
-- 
2.23.0

