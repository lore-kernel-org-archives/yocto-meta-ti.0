Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.685.1576599013448905852
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 08:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V10+Nf61;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-stiffler@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHGACYf066720
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 10:10:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576599012;
	bh=1uc64adht7c9obGwnoToE2IUGK1o6kgMafvWMlErMSQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=V10+Nf61Y4lCO8fKmAcNzITDJVZ2BGiLO9ltv1iLWCh4PNJxEXDyD/Nq/u5erM+EW
	 QG3ECVxAhdx1+r7+e5o3TY8mho9sJU0K+ZOfSdTlw11TTJfzh+Kze2oVmQzVWjNtR1
	 JC7y/kBpqdIvDeAsJyRjxtBlMdw90m4gUjMR4Gpw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHGACVq061061
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 10:10:12 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 10:10:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 10:10:12 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHGA8pI104114;
	Tue, 17 Dec 2019 10:10:12 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud/ti2019.05][PATCH 3/3] prusw-fw: PRU switch firmware for am57xx
Date: Tue, 17 Dec 2019 10:51:04 -0500
Message-ID: <1576597865-9349-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576597865-9349-1-git-send-email-j-stiffler@ti.com>
References: <1576597865-9349-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/prusw-fw/prusw-fw_git.bb | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw_git.bb

diff --git a/recipes-bsp/prusw-fw/prusw-fw_git.bb b/recipes-bsp/prusw-fw/prusw-fw_git.bb
new file mode 100644
index 0000000..2921fb1
--- /dev/null
+++ b/recipes-bsp/prusw-fw/prusw-fw_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "PRU Switch firmware for AM57xx"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://icss_dualemac/src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
+
+PR = "${INC_PR}.0"
+
+TI_PDK_COMP = "ti.drv.icss_emac.firmware"
+
+B = "${S}/icss_switch"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "ti-cgt-pru-native"
+
+PRU_VERSION = ""
+PRU_VERSION_dra7xx = "REV2"
+
+FW_PREFIX = ""
+FW_PREFIX_dra7xx = "am57xx"
+
+
+EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	install -m 0644 ./elf/${PRU_VERSION}/icss_stp_switch_PRU0.elf \
+		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru0-prusw-fw.elf
+	install -m 0644 ./elf/${PRU_VERSION}/icss_stp_switch_PRU1.elf \
+		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru1-prusw-fw.elf
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4

