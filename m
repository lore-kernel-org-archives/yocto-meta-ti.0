Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58EC1E00BDC; Thu,  6 Jul 2017 15:49:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4A37E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:49:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Mna4V007542
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499381376;
	bh=AEBBB6Rb1bvJ1JnQ94m1M2FqkCm+NZz8EIKUEik3mRQ=;
	h=From:To:CC:Subject:Date;
	b=e2CskVFClwkLQkcSsRU2sOAVHECGLlKRUbDpNfupFxocDVnFz9YJ7fK5VU5WrNHMH
	ILkQuTuN2ZZdc8VXUdy5q5kYBL1ZrBGtKaTpB+EbDx9HpN64qbeDxIQAjWgXoXeh9m
	6GG7d8LV8S1+YH8MKu8MpX/jqwY4SSkdPg3bgRZ8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MnV7b005757
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:49:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:49:31 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MnVdg017292;	Thu, 6 Jul 2017 17:49:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:49:29 -0400
Message-ID: <1499381369-60942-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] cmb-addon-rtos: Add rtos recipe for cmb-addon
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
X-List-Received-Date: Thu, 06 Jul 2017 22:49:49 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
new file mode 100644
index 0000000..55769ec
--- /dev/null
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -0,0 +1,67 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
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
+
+export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
+
+LIMSOCS_k2g = "k2g"
+LIMBOARDS_k2g = "evmK2G"
+LIMSOCS_omapl137-evm = "omapl137"
+LIMBOARDS_omapl137-evm = "evmOMAPL137"
+
+export PDK_CMB_ROOT_PATH = "${WORKDIR}/git"
+
+do_compile() {
+    cd ${S}
+
+    make release LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+}
+
+do_install() {
+    cd ${S}
+
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-- 
1.9.1


