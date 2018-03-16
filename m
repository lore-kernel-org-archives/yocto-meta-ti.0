Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C66CE00B8F; Fri, 16 Mar 2018 08:38:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7B6FE0079D
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 08:38:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFc1FE028991
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 10:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521214681;
	bh=9tGDFj+wHrnvDm9yn1M8AgyTU/cBpuaXkGObRj7EYeY=;
	h=From:To:CC:Subject:Date;
	b=WYVXXFv8dF3TC53oeesrBqANUF0eKV/ZFr5YygeQc323nUwYouYwBlRzeHn4V9ksv
	V7dcNhLoZTpWZjP6tygx9hoVEb70/f5r50VnRSDlu9ghLOnej5gCrIErSPPgB/Vit+
	F6oEeauN5l2yh/IN101HZnagQlW5IYqYcVg30uUQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFc1OM009352
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 10:38:01 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:38:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:38:00 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFc0bQ009346;
	Fri, 16 Mar 2018 10:38:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Mar 2018 11:29:30 -0400
Message-ID: <1521214170-9859-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] prueth-fw: build firmware from source
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
X-List-Received-Date: Fri, 16 Mar 2018 15:38:02 -0000
Content-Type: text/plain

* Use ti-cgt-pru to build the firmware images

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw_git.bb | 46 ++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index 8359cf0..5a671e3 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -1,34 +1,54 @@
 DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x, AM335x and K2G"
 
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+LIC_FILES_CHKSUM = "file://src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
 
+require recipes-ti/includes/ti-paths.inc
+
+ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
+ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
+ICSS_EMAC_LLD_GIT_BRANCH = "master"
+ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
+
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.11B"
+ICSS_EMAC_LLD_SRCREV = "bd643d75a0322b6ca769d8ecbee310d859c0f761"
+
+BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
 PV = "5.1.4"
 PR = "r0"
 
-CLEANBROKEN = "1"
+S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}/firmware/icss_dualemac"
 
 COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm|k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "b9d9e4bef2f32d4b55a63ecfec2e21f7b1eaaa34"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+DEPENDS = "ti-cgt-pru-native"
+
+PRU_VERSION = ""
+PRU_VERSION_am335x-evm = "REV1"
+PRU_VERSION_am437x-evm = "REV1"
+PRU_VERSION_am57xx-evm = "REV2"
+PRU_VERSION_k2g = "REV2"
 
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+FW_PREFIX = ""
+FW_PREFIX_am335x-evm = "am335x"
+FW_PREFIX_am437x-evm = "am437x"
+FW_PREFIX_am57xx-evm = "am57xx"
+FW_PREFIX_k2g = "k2g"
 
-S = "${WORKDIR}/git"
 
-TARGET_am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
-TARGET_am437x-evm = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
-TARGET_am335x-evm = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
-TARGET_k2g = "k2g-pru0-prueth-fw.elf k2g-pru1-prueth-fw.elf"
+EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware/ti-pruss
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
-	done
+	install -m 0644 ./elf/${PRU_VERSION}/icss_dualemac_PRU0.elf \
+		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru0-prueth-fw.elf
+	install -m 0644 ./elf/${PRU_VERSION}/icss_dualemac_PRU1.elf \
+		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru1-prueth-fw.elf
 }
 
 FILES_${PN} = "${base_libdir}/firmware"
-- 
2.7.4


