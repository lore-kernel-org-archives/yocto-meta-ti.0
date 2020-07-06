Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.3677.1594072800818903243
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 15:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EKsGnpWv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-karicheri2@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 066LxxaR047378
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Jul 2020 16:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594072799;
	bh=HhsqOt3HyEGlJ1GUA4TRVL60CHvItsyUHHaYV9tTAss=;
	h=From:To:Subject:Date;
	b=EKsGnpWva4BCmzFjE7kG2Rtkvv0fYjVPqOjpI1tb93cwcltHOusyzqyWdFeCnglvs
	 icHnYRzsYmDBhawRXr9KFYc0aIDgGMQATpZQ+qcTWikxy9puERgynLYnlDeuDC+5/C
	 15fAT6aBmXhAwx5Zs51R9fK5s4sGVLnn61S0ZxVA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 066LxxdW007015
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Jul 2020 16:59:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 6 Jul
 2020 16:59:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 6 Jul 2020 16:59:59 -0500
Received: from uda0868495.fios-router.home (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 066Lxxml037773;
	Mon, 6 Jul 2020 16:59:59 -0500
From: "Murali" <m-karicheri2@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
Subject: [meta-ti] prueth-hsr/prp: add hsr/prp firmware recipe for version 2.15.23
Date: Mon, 6 Jul 2020 17:59:58 -0400
Message-ID: <20200706215958.1520-1-m-karicheri2@ti.com>
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
 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb | 36 +++++++++++++++++++++++++
 recipes-bsp/pruprp-fw/pruprp-fw_git.bb | 37 ++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
 create mode 100644 recipes-bsp/pruprp-fw/pruprp-fw_git.bb

diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
new file mode 100644
index 000000000000..fd6665f29d17
--- /dev/null
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "PRU HSR firmware for AM57xx"
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
index 000000000000..0b9991a5a0a3
--- /dev/null
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "PRU PRP firmware for AM57xx"
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

