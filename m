Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1414.1624563739810030623
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 12:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nfrkPp5L;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: grygorii.strashko@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJgIOL096896
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Jun 2021 14:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624563738;
	bh=S4sgrv7UN0xTsm3Lcj7sNoNVLCcH0e/3XfuMU50odjo=;
	h=From:To:CC:Subject:Date;
	b=nfrkPp5LQcKlLEhPwhKCm5G0glvGghLGmPJl7kaa4sTxzcgXFgNOWbgk6gb17YWvO
	 YFwQkM+iAukSGxFUHALdO23RGUz5jFvNqw7LFPDKpXHFpR7sHlxflGokAIISu0c7nQ
	 aKG+qm9ypZXC8OpVdLdfl/QsF4ttZ0Wb1S3DGz0Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJgI7O111149
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Jun 2021 14:42:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:42:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:42:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJgGMV016342;
	Thu, 24 Jun 2021 14:42:17 -0500
From: "Grygorii Strashko" <grygorii.strashko@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>
Subject: [PATCH dunfell/master] prueth-fw: am65x: SR1.0: Package the firmware images from ti-linux-firmware
Date: Thu, 24 Jun 2021 22:42:06 +0300
Message-ID: <20210624194206.29673-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Directly take the images from ti-linux-firmware instead of using pdk build,
due to inconsistency of PDK releases vs Linux SDK releases vs different
SoCs.

Update to FW version: REL.CORESDK.08.00.00.20

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb | 46 ++++++++------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index 430e2a4e..d447df33 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -1,43 +1,35 @@
-SUMMARY = "PRU Ethernet firmware for AM65x"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-bsp/emac-lld/emac-lld.inc
+SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
 
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://icss_dualmac/src/makefile;beginline=6;endline=53;md5=3f9129d208f240940749757214bdc191"
-
-PR = "r0"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-TI_PDK_COMP = "ti.drv.emac.firmware"
+PV = "08.00.00.20"
 
-B = "${S}/icss_dualmac"
+CLEANBROKEN = "1"
 
 COMPATIBLE_MACHINE = "am65xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "ti-cgt-pru-native"
-
-EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}""
-
-do_compile() {
-    oe_runmake -C src
-}
-
-do_install() {
-    install -d ${D}${base_libdir}/firmware/ti-pruss
+SRCREV = "517b0cd8d8d80e91f1f7d80f035e6af041c39726"
+BRANCH ?= "ti-linux-firmware"
 
-    install -m 0644 bin/rxl2_txl2_rgmii0/rxl2_txl2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-pru0-prueth-fw.elf
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
-    install -m 0644 bin/rtu_test0/rtu_v2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-rtu0-prueth-fw.elf
+S = "${WORKDIR}/git"
 
-    install -m 0644 bin/rxl2_txl2_rgmii1/rxl2_txl2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-pru1-prueth-fw.elf
+TARGET = " \
+    am65x-pru0-prueth-fw.elf \
+    am65x-pru1-prueth-fw.elf \
+    am65x-rtu0-prueth-fw.elf \
+    am65x-rtu1-prueth-fw.elf \
+"
 
-    install -m 0644 bin/rtu_test1/rtu_v2.out \
-        ${D}${base_libdir}/firmware/ti-pruss/am65x-rtu1-prueth-fw.elf
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
+	done
 }
 
 FILES_${PN} = "${base_libdir}/firmware"
-- 
2.17.1

