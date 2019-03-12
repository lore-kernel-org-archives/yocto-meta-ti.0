Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC092E00CCC; Mon, 11 Mar 2019 18:44:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46D20E00B81
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 18:44:06 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2C1i5gp039143
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552355046;
	bh=kz18c+deWiMiYKbER75sMxwUSpIGyP9xj6sDdsKmj90=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cItZ/967C5Aaw6U5wUlE7mJS13hh1mZEmDHNVib+EljH1Ankaot9YwmOfFjO8mIWA
	+GrJBdP8iVesNmdlT1WVkIZ5/wV2TpfRIowLbcaNIgYY04oqKS0Kf6sChZLFaPzdyS
	7F+ZkX6RZcPn/J8SDtbUYT7c3w8XLVBm6pHSwYmg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2C1i5LU117042
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 20:44:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 20:44:05 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2C1hssS014989
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:04 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2019 21:43:47 -0400
Message-ID: <1552355028-25739-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 6/7] ti-cgt-arm: Update to version 18.1.5 LTS
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
X-List-Received-Date: Tue, 12 Mar 2019 01:44:07 -0000
Content-Type: text/plain

The license checksum change is due to version number. License has not
been changed. However Patrick powell license which was missing earlier
has been added now.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 ...-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb} |  6 +++---
 recipes-ti/devtools/ti-cgt-arm.inc                       | 16 ++--------------
 2 files changed, 5 insertions(+), 17 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb} (9%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
similarity index 9%
rename from recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
rename to recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
index f642a5b..0ed1939 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
+++ b/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
@@ -1,6 +1,6 @@
 include ti-cgt-arm.inc
 
-LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=1c0dc8c15d8c4768e399b9ce7651c25e"
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3faed35326711d6596f0377279323df1"
 
-BINFILE_MD5 = "ccae16e9c6fc3749e7da49d3a2b6fb44"
-BINFILE_SHA256 = "13b66686cc012af6f2e7f021099b5bc735a461d8eb254a2b0edef0fd8b26e81e"
+BINFILE_MD5 = "d0559bccc323002a9256dd68e1d223ab"
+BINFILE_SHA256 = "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
index d55b55b..d2d768c 100644
--- a/recipes-ti/devtools/ti-cgt-arm.inc
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -1,6 +1,6 @@
 SUMMARY = "TI ARM Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
 
 inherit native
 require recipes-ti/includes/ti-unpack.inc
@@ -9,7 +9,7 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ti-cgt-arm-${PV}"
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
 
@@ -17,18 +17,6 @@ BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
-do_configure_append() {
-    # Remove the library if it exists to prevent an error when building the
-    # library in do_compile().
-    rm -f ./ti-cgt-arm_${PV}.LTS/lib/rtsv7R4_A_le_v3D16_eabi.lib
-}
-
-do_compile_append() {
-    cd ${S}/ti-cgt-arm_${PV}.LTS
-    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
-    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
-}
-
 do_install() {
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
     cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-- 
1.9.1


