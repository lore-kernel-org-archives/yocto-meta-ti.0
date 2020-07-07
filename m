Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.20510.1594140299945123362
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 09:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YLGJ5Gl9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-karicheri2@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067Gix3t102004
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 11:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594140299;
	bh=xMylLNLMLSo6ya2AJAR5v68SLcgiKgskuQE4D3NHmzg=;
	h=From:To:Subject:Date;
	b=YLGJ5Gl9Xyi3z0ijBrMDEbdaZel4uxY9piqAP4JBfBwJ+4WcRfHYKjN0sHlwWz9sC
	 sdqeXnsd5J1Puf9sMLBr8ZyV61Vxp2teEuNXMrdtJSQrAryNdMoWWUPO086G3C7xxM
	 KNc+qgjDsqiXzI4hHJBVvcIaL+iEEVUO3sYSBKRI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067Gix9h004770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 11:44:59 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 11:44:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 11:44:58 -0500
Received: from uda0868495.fios-router.home (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067Giv9j098041;
	Tue, 7 Jul 2020 11:44:57 -0500
From: "Murali" <m-karicheri2@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
Subject: [meta-ti PATCH v2] prueth-hsr/prp: add hsr/prp firmware recipe for version 2.15.23
Date: Tue, 7 Jul 2020 12:44:57 -0400
Message-ID: <20200707164457.1324-1-m-karicheri2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This patch adds recipe for hsr/prp firmware on am3/4/5 SoCs. The binary
files are located on ti-linux-firmware.git. This is a forward port of
the recipe from processor sdk 6.3

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 changed DESCRIPTION to SUMMARY as per comment
 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb | 36 +++++++++++++++++++++++++
 recipes-bsp/pruprp-fw/pruprp-fw_git.bb | 37 ++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
 create mode 100644 recipes-bsp/pruprp-fw/pruprp-fw_git.bb

diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
new file mode 100644
index 000000000000..e9a15a08771e
--- /dev/null
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "PRU HSR firmware for AM57xx"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "2.15.23"
+PE = "1"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
+BRANCH ?= "ti-linux-firmware"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = ""
+TARGET_ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
+TARGET_ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
+TARGET_am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
+TARGET_am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
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
diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
new file mode 100644
index 000000000000..7212a598b2fc
--- /dev/null
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "PRU PRP firmware for AM57xx"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "2.15.23"
+PE = "1"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
+BRANCH ?= "ti-linux-firmware"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = ""
+TARGET_ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
+TARGET_ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
+TARGET_am57xx-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
+TARGET_am57xx-hs-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
+
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
-- 
2.17.1

