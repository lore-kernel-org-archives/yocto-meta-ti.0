Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5949.1634624515910297608
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 23:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JSt3EKJW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19J6LoQO056869;
	Tue, 19 Oct 2021 01:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634624510;
	bh=FkAC3BOLCBqKV9ertIGDIiPcjrEBxtBtP/2T2lrlMDw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JSt3EKJWB07HU/e+GoI5oTT8RJF806gRZGLiADEbZAh99M+STeWWB1OpOo3skqod1
	 FZotWoIBFFLwgvOZaLDeDDcjK5IY8KG3PPn5WyMt5HnMXAvMi7hyv9CD1fVB6s/dgC
	 nFFL4lbUN4HrlNz8nbsyHoWxG436kTHGG1Ls0Gko=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19J6LohS120572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 01:21:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 01:21:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 01:21:50 -0500
Received: from uda0132425.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19J6LgpY018387;
	Tue, 19 Oct 2021 01:21:48 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <yogeshs@ti.com>
CC: <denis@denix.org>, <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH dunfell/master 2/2] prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for AM65x SR2.0
Date: Tue, 19 Oct 2021 11:51:41 +0530
Message-ID: <20211019062141.10228-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019062141.10228-1-vigneshr@ti.com>
References: <20211019062141.10228-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Vignesh Raghavedra <vigneshr@ti.com>

Add AM65x SR2.0 ICSSG Switch firmware. Base version is 02.02.09.06

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../prusw-fw/prusw-fw-am65x-sr2_git.bb        | 39 +++++++++++++++++++
 recipes-kernel/linux/kernel-rdepends.inc      |  2 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb

diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
new file mode 100644
index 000000000000..03cbe1d77475
--- /dev/null
+++ b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "PRU Ethernet Switch firmware for AM65xx SR2.0"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "02.02.09.06"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am65xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "10bcf8564c6e9277e7f402fb02cf941956d0d3eb"
+BRANCH ?= "ti-linux-firmware"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
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

