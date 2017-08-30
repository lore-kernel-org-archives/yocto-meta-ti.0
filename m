Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F2B4E00A9B; Wed, 30 Aug 2017 15:42:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16742E00970
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:42:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UMgRgK005571
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504132947;
	bh=Gu9gdyOB35bHyohpusV96DRr5JqLhOIGaRl3QyGD41g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QnNZeTGHax06vLHbt4jYazlsSjte+Z0iFIq6h9FNsZ2PZOTKOKjItuZn+4LLcXoKo
	9vqkSa/eMkyIywPnFcWkoXs7p6CrPzjoiDnWYmN6oPZUDvsUX+tgTklsp1uj5FwXxA
	uFOYfso4SX5kQ6Asen/QVjFXmEZEsOWLZxos/a2o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgR6c014933
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 17:42:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 17:42:26 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgL0e004119;
	Wed, 30 Aug 2017 17:42:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 30 Aug 2017 18:42:13 -0400
Message-ID: <1504132936-7725-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 4/7] cmb-addon-rtos: Adding CMB rtos recipe
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
X-List-Received-Date: Wed, 30 Aug 2017 22:42:29 -0000
Content-Type: text/plain

Upstreaming the recipe for Circular Microphone array board (CMB) RTOS
software
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v3 - Removed redundant code in do_compile & do_install
 v2 - Added summary

 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
new file mode 100644
index 0000000..66d961b
--- /dev/null
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -0,0 +1,56 @@
+SUMMARY = "TI RTOS software supporting circular microphone array board"
+require recipes-ti/includes/ti-paths.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cmbaddonver.h;beginline=8;endline=47;md5=d0cb159bf210cfafed63042da01c83e0"
+
+COMPATIBLE_MACHINE = "k2g|omapl137-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CMB_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/circmicarray-addon.git"
+CMB_ADDON_GIT_PROTOCOL = "git"
+CMB_ADDON_GIT_BRANCH = "master"
+CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
+
+# Below commit ID corresponds to "DEV.CMB.01.01.00.00"
+CMB_ADDON_SRCREV = "29c05572b82251bac73cd685afcffdb8549eaaaf"
+
+SRCREV = "${CMB_ADDON_SRCREV}"
+PV = "01.01.00.00"
+PR = "r0"
+
+BRANCH = "${CMB_ADDON_GIT_BRANCH}"
+SRC_URI = "${CMB_ADDON_GIT_URI};destsuffix=${CMB_ADDON_GIT_DESTSUFFIX};protocol=${CMB_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
+
+
+S = "${WORKDIR}/git/ti/addon/cmb"
+
+DEPENDS = " ti-cgt6x-native \
+            ti-sysbios \
+            ti-xdctools \
+            ti-pdk-build-rtos \
+            common-csl-ip-rtos \
+            gpio-lld-rtos \
+            i2c-lld-rtos \
+            mcasp-lld-rtos \
+            board-rtos \
+"
+
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
+export PDK_CMB_ROOT_PATH = "${WORKDIR}/git"
+
+do_compile() {
+    make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-- 
1.9.1


