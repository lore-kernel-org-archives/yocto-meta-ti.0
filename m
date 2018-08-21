Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 409B7E0097C; Tue, 21 Aug 2018 07:17:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0701DE006C7
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 07:16:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LEGxpn100944
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 09:16:59 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LEGx2g018573
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 09:16:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 09:16:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 09:16:58 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LEGwNp030827;
	Tue, 21 Aug 2018 09:16:58 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 21 Aug 2018 10:16:57 -0400
Message-ID: <1534861017-23311-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v3] ti-ipc: Update to new version 3.50
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
X-List-Received-Date: Tue, 21 Aug 2018 14:17:01 -0000
Content-Type: text/plain

Add AM65XX platform support

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- Update commit id with fixes
- Update firmware link names in filesystem
NOTE: This patch depends on gcc-linaro-baremetal-aarch64-native patch to be checked in
---
---
 recipes-ti/ipc/ti-ipc-common.inc   |  3 ++-
 recipes-ti/ipc/ti-ipc-examples.inc |  2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc     | 16 ++++++++++++----
 recipes-ti/ipc/ti-ipc-rtos_git.bb  |  8 ++++++++
 recipes-ti/ipc/ti-ipc.inc          |  6 +++---
 5 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 7f93842..6aea8e6 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.47.02.00"
+PV = "3.50.01.00"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -13,6 +13,7 @@ PLATFORM_k2g = "66AK2G"
 PLATFORM_omapl138 = "OMAPL138"
 PLATFORM_c667x-evm = "C6678"
 PLATFORM_c665x-evm = "C6678"
+PLATFORM_am65xx-evm = "AM65XX"
 
 ALT_PLATFORM_k2hk = "TCI6636"
 ALT_PLATFORM_am57xx-evm = "AM572X AM571X"
diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-examples.inc
index cd2240c..022b13f 100644
--- a/recipes-ti/ipc/ti-ipc-examples.inc
+++ b/recipes-ti/ipc/ti-ipc-examples.inc
@@ -3,7 +3,7 @@ require ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=fb83580b16bce88e8ed568a6005c8f02"
+LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
 
 INSANE_SKIP_${PN} += "arch"
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 868743e..13b1914 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,11 +24,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.47.02.00
-SRCREV_ipc-metadata = "e8aff83111b8a0d64d7a77413b6f66d3106084d8"
+# Corresponds to tag: 3.50.01.00
+SRCREV_ipc-metadata = "19a8e70cf6ca4fe0984987e25d937c61a62c7658"
 
-# Corresponds to tag: 3.47.02.00
-SRCREV_ipc-examples = "351e9a6d94c68f7ff64b2c002ee6750242ece6d9"
+# Corresponds to tag: 3.50.01.00
+SRCREV_ipc-examples = "1975687076426b587be8d2530df56c24425ca53a"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
@@ -50,6 +50,9 @@ DEPENDS_append_omapl138 = " ti-cgt6x-native \
 DEPENDS_append_c66x = " ti-cgt6x-native \
 "
 
+DEPENDS_append_am65xx-evm = " ti-cgt-arm-native \
+                              gcc-linaro-baremetal-aarch64-native"
+
 IPC_TARGETS = ""
 
 IPC_TARGETS_omap-a15 = "\
@@ -73,6 +76,11 @@ IPC_TARGETS_c66x = " \
     ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
 
+IPC_TARGETS_am65xx-evm = "\
+    gnu.targets.arm.A53F="${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}" \
+    ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
+"
+
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index b292d67..c374bb1 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -122,3 +122,11 @@ pkg_postinst_${PN}-fw_omapl138 () {
 pkg_postrm_${PN}-fw_omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
 }
+
+pkg_postinst_${PN}-fw_am65xx-evm () {
+  update-alternatives --install /lib/firmware/am65x-mcu-r5f0-fw am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
+}
+
+pkg_postrm_${PN}-fw_am65xx-evm () {
+  update-alternatives --remove am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X/messageq_single.xe674
+}
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index e8038a5..c52c707 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.47"
+TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.47.02.00
-TI_IPC_SRCREV = "24c36385d096613af123d1e1696fb2fee652ef36"
+#Corresponds to 3.50.01.00A
+TI_IPC_SRCREV = "4da40c42c21c73da090731f5e7999ae837b6b02a"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


