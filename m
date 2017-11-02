Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD7F9E00C45; Thu,  2 Nov 2017 12:27:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6D23E00C44
	for <meta-ti@yoctoproject.org>; Thu,  2 Nov 2017 12:27:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA2JR6ZP007946
	for <meta-ti@yoctoproject.org>; Thu, 2 Nov 2017 14:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509650826;
	bh=u1wk0xbLaekLOzVBnuBu2PXsFRnnub397h9Ocm2APY8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kn2Y1oRIYLB4DOGVhD2rjL04GfzvLCvhWIAoO+Y2/x9utO/N1975b22ufZzfTk9av
	npuwMOBG5HLoxPMva2aORWMBhTVpGITd8dRCTPxxDcyaBsWLcpWa5zMgGZPdWHBE4Q
	9Ktcdx7ebZLnU5XCfs09IIWpUs1KqW/snVtDR4MU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA2JR5KZ014795
	for <meta-ti@yoctoproject.org>; Thu, 2 Nov 2017 14:27:06 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 2 Nov 2017 14:27:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 2 Nov 2017 14:27:03 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA2JR2ex032141;
	Thu, 2 Nov 2017 14:27:03 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 Nov 2017 15:19:30 -0400
Message-ID: <1509650370-29526-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509650370-29526-1-git-send-email-j-stiffler@ti.com>
References: <1509650370-29526-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] icss-emac-lld: update to version 1.0.0.8
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
X-List-Received-Date: Thu, 02 Nov 2017 19:27:07 -0000
Content-Type: text/plain

* Extend compatibility to k2g-evm
* Simplify compile and install tasks as "TARGET" is no longer needed.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../icss-emac-lld/icss-emac-lld-test_git.bb        | 47 +++++++---------------
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |  6 +--
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  3 +-
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
index f62bf33..5093d7c 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI ICSS-EMAC low level driver tests"
 
-DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
+DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
 
 DEPENDS_append_ti33x = " starterware"
 DEPENDS_append_ti43x = " starterware"
@@ -9,39 +9,22 @@ include icss-emac-lld.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
 
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
+DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
 
-do_compile_am57xx-evm () {
-#   Build the tests
-    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
-    oe_runmake clean
-    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
+do_compile () {
+    # Build the tests
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake tests DEVICE="$device"
+    done
 }
 
-do_compile_ti33x () {
-#   Build the tests
-    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
-}
-
-do_compile_ti43x () {
-#   Build the tests
-    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
-}
-
-do_install_am57xx-evm () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
-}
-
-do_install_ti33x () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x" TARGET="SOC_AM335x"
-}
-
-do_install_ti43x () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x" TARGET="SOC_AM437x"
+do_install() {
+    # Install the binary
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+    done
 }
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index 8e2ffd4..621219b 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
 ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
-ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.08"
+ICSS_EMAC_LLD_SRCREV = "e689df18417236110590f7b290525a610d63f574"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-PV = "01.00.00.07C"
+PV = "01.00.00.08"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
index 272529b..81a6f5e 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
@@ -6,11 +6,10 @@ include icss-emac-lld.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
-
 TARGET_NAME_am57xx-evm = "SOC_AM572x"
 TARGET_NAME_ti33x = "SOC_AM335x"
 TARGET_NAME_ti43x = "SOC_AM437x"
+TARGET_NAME_k2g-evm = "SOC_K2G"
 
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
 
-- 
2.7.4


