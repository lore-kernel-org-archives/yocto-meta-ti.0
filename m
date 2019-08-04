Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4274E00A5C; Sun,  4 Aug 2019 08:11:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A636FE00931
	for <meta-ti@yoctoproject.org>; Sun,  4 Aug 2019 08:11:45 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x74FBiXm091853
	for <meta-ti@yoctoproject.org>; Sun, 4 Aug 2019 10:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564931505;
	bh=Gr69RPoS5RqJANGU6dJAbXE4asUP32ZUNriJaJeVzvk=;
	h=From:To:Subject:Date;
	b=y6/GWD+7veVfqzLc9TNu3uCacZNo+5lb/8JuCe2HjmpR8puZ2p89qzwp1YjKeMIIr
	EhxgO9nOvQz5s1n7/w9e4WytxwWis0/gxp2jPjVKv1dfhi0kKkZ51sSbAGAQxHkv5T
	s+e37WMHHUjZXwx48/pB2+m+bjhbWzeEXTidBYng=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x74FBioY099864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 4 Aug 2019 10:11:44 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 4 Aug 2019 10:11:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 4 Aug 2019 10:11:44 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x74FBito002979
	for <meta-ti@yoctoproject.org>; Sun, 4 Aug 2019 10:11:44 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 4 Aug 2019 11:11:41 -0400
Message-ID: <1564931501-45964-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-sysbios: Update to sysbios 6.72.02.02
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
X-List-Received-Date: Sun, 04 Aug 2019 15:11:47 -0000
Content-Type: text/plain

The checksum has changed due to version & date, the license has not
changed
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/bios/ti-sysbios.inc                     |  3 +-
 .../{ti-sysbios.inc => ti-sysbios_6.76.02.02.bb}   | 34 +++++++---------------
 2 files changed, 11 insertions(+), 26 deletions(-)
 copy recipes-ti/bios/{ti-sysbios.inc => ti-sysbios_6.76.02.02.bb} (7%)

diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.inc
index d2a551f..087f2ed 100644
--- a/recipes-ti/bios/ti-sysbios.inc
+++ b/recipes-ti/bios/ti-sysbios.inc
@@ -10,8 +10,7 @@ require ../includes/ti-eula-unpack.inc
 S = "${WORKDIR}/bios_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
-
-BINFILE="bios_setuplinux_${PV}.bin"
+BINFILE="bios_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
 
 do_install() {
diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios_6.76.02.02.bb
similarity index 7%
copy from recipes-ti/bios/ti-sysbios.inc
copy to recipes-ti/bios/ti-sysbios_6.76.02.02.bb
index d2a551f..c7acf8e 100644
--- a/recipes-ti/bios/ti-sysbios.inc
+++ b/recipes-ti/bios/ti-sysbios_6.76.02.02.bb
@@ -1,29 +1,15 @@
-DESCRIPTION = "TI SYS/BIOS v6 Kernel"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
-SECTION = "devel"
-LICENSE = "BSD"
+require recipes-ti/bios/ti-sysbios.inc
 
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
+PV = "6_76_02_02"
+PR = "r0"
 
-S = "${WORKDIR}/bios_${PV}"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
+SRC_URI[sysbiosbin.md5sum] = "7ae35f34179492913e40f02ec5ffb7dd"
+SRC_URI[sysbiosbin.sha256sum] = "029981f79ce61fe28241944f4f60c37b2c4b8c83fe1ee38ed400d58412b4fdb6"
 
-BINFILE="bios_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
+TI_BIN_UNPK_CMDS = ""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}-dev += "${SYSBIOS_INSTALL_DIR_RECIPE}"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP_${PN}-dev = "arch ldflags staticdev file-rdeps"
+BINFILE = "bios_${PV}.run"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
-- 
1.9.1


