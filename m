Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30BACE00BD5; Thu,  6 Jul 2017 15:37:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,TVD_SPACE_RATIO,
	TVD_SPACE_RATIO_MINFP autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  0.0 TVD_SPACE_RATIO_MINFP Space ratio
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49991E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:37:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MbpB3025842
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380671;
	bh=AAUQ0ZXiTndXOFpt0YgEBHBlmjBk3y+9Oilgoj6XFlU=;
	h=From:To:CC:Subject:Date;
	b=nY2EsXVBDxRwjxiIdtAfKUKd30tETfs20a0juktppqOsuyB4q+6zjOkMIz4+glN2x
	C4ARYJ57g961xM1M6NSJ8dDL8O2jRX8XHHyRrNy/xg6XWiC2m5L6W+zZouzZfbAb2D
	eP1aBVWReTdBU+CpReI+iLNChydkOgfF6MNTRb6c=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MbpVm021895
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:37:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:37:51 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MboCw026579;	Thu, 6 Jul 2017 17:37:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:37:46 -0400
Message-ID: <1499380666-60390-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-pdk-setup: Add ti-pdk-setup recipe
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
X-List-Received-Date: Thu, 06 Jul 2017 22:37:53 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb | 104 ++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb

diff --git a/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb b/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
new file mode 100644
index 0000000..bd66f56
--- /dev/null
+++ b/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
@@ -0,0 +1,104 @@
+DESCRIPTION = "Package containing scripts to setup the PDK development environment"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://release/full/pdksetupenv.sh;beginline=1;endline=20;md5=1858f90ca160daa7ca1b05dc3e474791"
+
+require recipes-ti/includes/ti-paths-append.inc
+
+PDK_SETUP_GIT_URI = "git://git@bitbucket.itg.ti.com/processor-sdk/processor-pdk-packages.git"
+PDK_SETUP_GIT_PROTOCOL = "ssh"
+PDK_SETUP_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.PDK_PACKAGES.01.00.00.01"
+PDK_SETUP_SRCREV = "23f310087fded4955d6d64e6df20fd057d1cede8"
+
+BRANCH = "${PDK_SETUP_GIT_BRANCH}"
+SRC_URI = "${PDK_SETUP_GIT_URI};protocol=${PDK_SETUP_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PDK_SETUP_SRCREV}"
+PV = "01.00.00.01"
+PR = "r0"
+
+S = "${WORKDIR}/git/"
+
+CLEANBROKEN = "1"
+
+LIMIT_SOCS_ti33x = "am335x"
+LIMIT_SOCS_ti43x = "am437x"
+LIMIT_SOCS_omap-a15 = "am571x am572x"
+LIMIT_SOCS_dra7xx-evm = "dra72x dra75x dra78x"
+LIMIT_SOCS_omapl137-evm = "omapl137"
+LIMIT_SOCS_omapl138-lcdk = "omapl138"
+LIMIT_SOCS_k2hk-evm = "k2h k2k"
+LIMIT_SOCS_k2e-evm = "k2e"
+LIMIT_SOCS_k2l-evm = "k2l"
+LIMIT_SOCS_k2g = "k2g"
+LIMIT_SOCS_c665x-evm = "c665x"
+LIMIT_SOCS_c667x-evm = "c6678"
+
+LIMIT_BOARDS_ti33x = "evmAM335x icev2AM335x bbbAM335x skAM335x"
+LIMIT_BOARDS_ti43x = "evmAM437x idkAM437x skAM437x"
+LIMIT_BOARDS_omap-a15 = "evmAM572x idkAM571x idkAM572x"
+LIMIT_BOARDS_dra7xx-evm = "evmDRA72x evmDRA75x evmDRA78x"
+LIMIT_BOARDS_omapl137-evm = "evmOMAPL137"
+LIMIT_BOARDS_omapl138-lcdk = "lcdkOMAPL138"
+LIMIT_BOARDS_k2hk-evm = "evmK2H evmK2K"
+LIMIT_BOARDS_k2e-evm = "evmK2E"
+LIMIT_BOARDS_k2l-evm = "evmK2L"
+LIMIT_BOARDS_k2g = "evmK2G iceK2G"
+LIMIT_BOARDS_c665x-evm = "evmC6657"
+LIMIT_BOARDS_c667x-evm = "evmC6678"
+
+PDK_SOC = "${@'${MACHINE}'.replace('-evm','')}"
+PDK_SOC_omapl138-lcdk = "${@'${MACHINE}'.replace('-lcdk','')}"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+
+    install -m 0755 release/full/pdksetupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdksetupenv.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkProjectCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkProjectCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkAppImageCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkAppImageCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/macros.ini ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0644 release/full/Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+
+    sed -i -e "s|__PDK_VER__|${PDK_VERSION}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdkProjectCreate.sh
+    sed -i -e "s|__PDK_VER__|${PDK_VERSION}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdkProjectCreate.bat
+
+    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
+    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
+    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+
+    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
+    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
+    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+
+    TI_PDK_VERSION=`echo ${PDK_VERSION} | sed -e 's|\.|_|g' -e 's|^0||'`
+
+    sed -i -e "s|__PDK_SOC__|${PDK_SOC}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+    sed -i -e "s|__PDK_VER__|${TI_PDK_VERSION}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+}
+
+do_install_append_omapl1() {
+    sed -i -e "s|c66x|c674x|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
+    sed -i -e "s|c66x|c674x|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.9.1


