Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12622E00D4C; Tue, 18 Jun 2019 12:16:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FD8EE00D4C
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 12:16:22 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGL7t097069
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560885382;
	bh=JDKW0u/kjYb+9uPaIRK91LNO6iUxDFhQfZoU5MyF8II=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M8+mRLDH1wwy87a9olpA5c41TQRiN7nfNaGD0YrzXFz5bor/aP25OBzgq9P1EAqZ4
	+D9ngv7fko8s2g6gxT6sgOWjvLRXR2XyFoMIQ9bsO5TScVX+X9841xVY+hJBFbq9ur
	HfCBwwXNxOOfu1Sf7qZ4kPR+KlBzrkqUthu29xYI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IJGL5t040404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 14:16:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 14:16:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGKUa113016;
	Tue, 18 Jun 2019 14:16:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jun 2019 15:00:16 -0400
Message-ID: <1560884418-23216-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud][PATCH 3/5] prueth-fw-am65xx: build am65xx prueth-fw from source
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2019 19:16:23 -0000
Content-Type: text/plain

* The sources for the am65xx prueth-fw are located in within the
  emac-lld sources.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
new file mode 100644
index 0000000..dcd30b4
--- /dev/null
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "PRU Ethernet firmware for AM65x"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-bsp/emac-lld/emac-lld.inc
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://src/makefile;beginline=6;endline=53;md5=3f9129d208f240940749757214bdc191"
+
+PV = "${PV_DUALEMAC_FW}"
+PR = "r0"
+
+S = "${WORKDIR}/git/firmware/icss_dualmac"
+
+COMPATIBLE_MACHINE = "am65xx"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "ti-cgt-pru-native"
+
+EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}""
+
+do_compile() {
+    oe_runmake -C src
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware/ti-pruss
+
+    install -m 0644 bin/rxl2_txl2_rgmii0/rxl2_txl2.out \
+        ${D}${base_libdir}/firmware/ti-pruss/am65x-pru0-prueth-fw.elf
+
+    install -m 0644 bin/rtu_test0/rtu_v2.out \
+        ${D}${base_libdir}/firmware/ti-pruss/am65x-rtu0-prueth-fw.elf
+
+    install -m 0644 bin/rxl2_txl2_rgmii1/rxl2_txl2.out \
+        ${D}${base_libdir}/firmware/ti-pruss/am65x-pru1-prueth-fw.elf
+
+    install -m 0644 bin/rtu_test1/rtu_v2.out \
+        ${D}${base_libdir}/firmware/ti-pruss/am65x-rtu1-prueth-fw.elf
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


