Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0997AE00C09; Wed, 30 Aug 2017 15:42:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 648F2E00C09
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:42:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UMgaZr031984
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504132956;
	bh=gSlZvcHTlaVDQ3+LvFBmTB86nT6oluPrRTBywdOXEus=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cRxE0IPOyKlTWOJzRFIVu6n64TlnSyPeztR4s/S9F0T5pPvljGZnQ5uHA573frTKo
	ejoPc4GprCf1BJColeh+clYafxTl/u8KdF0n7GZ02MCRangHH36dUzeC1pPZgAZFDj
	UfeXGubIC3uYdY/VqBr/nG0be/FYWbJtg20QvH5k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgVLf009822
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 17:42:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 17:42:30 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgL0h004119;
	Wed, 30 Aug 2017 17:42:30 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 30 Aug 2017 18:42:16 -0400
Message-ID: <1504132936-7725-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 7/7] audk2g-addon-rtos: Adding rtos recipe for audio addons for k2g
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
X-List-Received-Date: Wed, 30 Aug 2017 22:42:54 -0000
Content-Type: text/plain

Upstreaming RTOS audio addon software for K2G
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v3 - Removed redundant code in do-compile & do-install
 v2 - Added summary

 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb | 56 +++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb

diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
new file mode 100644
index 0000000..9e233e2
--- /dev/null
+++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
@@ -0,0 +1,56 @@
+SUMMARY = "TI RTOS Audio add-on software for k2g"
+
+require recipes-ti/includes/ti-paths.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://audk2gaddonver.h;beginline=8;endline=47;md5=7a3996aaf1a3d3ca87358cf9b89bce3d"
+
+COMPATIBLE_MACHINE = "k2g"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+AUDK2G_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/audk2g-addon.git"
+AUDK2G_ADDON_GIT_PROTOCOL = "git"
+AUDK2G_ADDON_GIT_BRANCH = "master"
+AUDK2G_ADDON_GIT_DESTSUFFIX = "git/ti/addon/audk2g"
+
+# Below commit ID corresponds to "DEV.AUDK2G.01.04.00.00"
+AUDK2G_ADDON_SRCREV = "815180b45ceb1fa3c110f9979106c7f5aa8b3ca2"
+
+BRANCH = "${AUDK2G_ADDON_GIT_BRANCH}"
+SRC_URI = "${AUDK2G_ADDON_GIT_URI};destsuffix=${AUDK2G_ADDON_GIT_DESTSUFFIX};protocol=${AUDK2G_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${AUDK2G_ADDON_SRCREV}"
+PV = "01.04.00.00"
+PR = "r0"
+
+S = "${WORKDIR}/git/ti/addon/audk2g"
+
+DEPENDS = " ti-cgt6x-native \
+            ti-sysbios \
+            ti-xdctools \
+            ti-pdk-build-rtos \
+            common-csl-ip-rtos \
+            gpio-lld-rtos \
+            i2c-lld-rtos \
+            board-rtos \
+"
+
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+
+export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
+
+export PDK_AUDK2G_ROOT_PATH = "${WORKDIR}/git"
+
+do_compile() {
+    make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/audk2g
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-- 
1.9.1


