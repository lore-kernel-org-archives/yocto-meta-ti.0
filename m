Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5511.1634720734385671676
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 02:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ygf6lbRT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: vigneshr@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19K95QwO013168;
	Wed, 20 Oct 2021 04:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634720726;
	bh=4TeVAJ/Xg8dnBee+TRWhBW5UlmfdSVm7CdRV/PJxai0=;
	h=From:To:CC:Subject:Date;
	b=Ygf6lbRToFItaPALOqrhbvz9hhmFpA+/VNtWjdoD7xosw9//+o/uB11UIhUGT+o+k
	 kMkr3BLS0vellto5/bJamw6svDtV4Xut7bOdeEhAhttoC0Y7VEWC3fQ2A2euO6povr
	 342uIoeQZSYOvX80UV6AsYFpPCyOGSgRvU7o2tt4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19K95QI4125097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Oct 2021 04:05:26 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Oct 2021 04:05:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 04:05:25 -0500
Received: from uda0132425.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19K95NHV038882;
	Wed, 20 Oct 2021 04:05:23 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <yogeshs@ti.com>
CC: <denis@denix.org>, <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [dunfell-next PATCH v2] prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for AM65x SR2.0
Date: Wed, 20 Oct 2021 14:35:22 +0530
Message-ID: <20211020090522.17590-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Vignesh Raghavedra <vigneshr@ti.com>

Add AM65x SR2.0 ICSSG Switch firmware. Base version is 02.02.09.06

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
v2:

Drop DUAL EMAC firmware recipe update as its now auto rev'd

 .../prusw-fw/prusw-fw-am65x-sr2_git.bb        | 34 +++++++++++++++++++
 recipes-kernel/linux/kernel-rdepends.inc      |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb

diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
new file mode 100644
index 000000000000..8cb450acc2b6
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
index 743b352c0b55..5e5241c9129d 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -34,7 +34,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-- 
2.33.1

