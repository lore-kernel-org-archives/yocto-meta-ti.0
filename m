Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.3225.1588795463187399238
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 13:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iu3lOJVz;
 spf=none, err=permanent DNS error (domain: ula0866189, ip: 198.47.23.248, mailfrom: a0866189local@ula0866189)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046K4MP9038476
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 15:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588795462;
	bh=Zwwrf8cgYsgxDbpM5xVb35TbNQoosYRjczm2AsYLlmc=;
	h=From:To:CC:Subject:Date;
	b=iu3lOJVz/5c+gZPNeHPE69lqSEDpnRCiNadGSS6Jbqdtl9w/tDdwWry9u1cqdGEQb
	 ofs584oa168ZN3vqk8y1ci8J2+3DJJk6Nii5j+z/zI7Q8EPGrJpAf7GsjUwUN3jQ3K
	 FTBmiSWINCeLjbx3D8y3sC4cJY78zAlegowPaAGI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046K4McG072789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 15:04:22 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 15:04:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 15:04:22 -0500
Received: from ula0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046K4Maj028114;
	Wed, 6 May 2020 15:04:22 -0500
Received: from a0866189local by ula0866189 with local (Exim 4.90_1)
	(envelope-from <a0866189local@ula0866189>)
	id 1jWQHF-0005qc-Lj; Wed, 06 May 2020 15:04:21 -0500
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][master][PATCH 1/3] ti-ipc: remove am65xx build
Date: Wed, 6 May 2020 15:04:13 -0500
Message-ID: <20200506200415.22380-1-angelabaker@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Only ipc-lld is supported for am65xx.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc      |  1 -
 recipes-ti/ipc/ti-ipc-examples_git.bb |  2 --
 recipes-ti/ipc/ti-ipc-rtos.inc        |  9 ---------
 recipes-ti/ipc/ti-ipc-rtos_git.bb     | 17 -----------------
 recipes-ti/ipc/ti-ipc_git.bb          |  1 -
 5 files changed, 30 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 96cbd667..449903f1 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -15,7 +15,6 @@ PLATFORM_k2g = "66AK2G"
 PLATFORM_omapl138 = "OMAPL138"
 PLATFORM_c667x-evm = "C6678"
 PLATFORM_c665x-evm = "C6678"
-PLATFORM_am65xx = "AM65XX"
 
 ALT_PLATFORM_k2hk = "TCI6636"
 ALT_PLATFORM_am57xx-evm = "AM572X AM571X"
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 43e45e64..c46e5c81 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -3,8 +3,6 @@ require ti-ipc-examples.inc
 
 DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
 
-DEPENDS_append_am65xx = " sciclient-rtos"
-
 do_compile_append() {
 
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index c4ab2687..a68ba806 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -53,9 +53,6 @@ DEPENDS_append_omapl138 = " ti-cgt6x-native \
 DEPENDS_append_c66x = " ti-cgt6x-native \
 "
 
-DEPENDS_append_am65xx = " ti-cgt-arm-native \
-                              gcc-linaro-baremetal-aarch64-native"
-
 IPC_TARGETS = ""
 
 IPC_TARGETS_omap-a15 = "\
@@ -79,11 +76,6 @@ IPC_TARGETS_c66x = " \
     ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
 
-IPC_TARGETS_am65xx = "\
-    gnu.targets.arm.A53F="${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}" \
-    ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
-"
-
 PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
@@ -93,5 +85,4 @@ EXTRA_OEMAKE = "\
     ${PARALLEL_XDC} \
     JAVA_TOOL_OPTIONS=-Xss2560k \
 "
-EXTRA_OEMAKE_append_am65xx = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 4c0e71e6..b292d677 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -3,7 +3,6 @@ require ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
-DEPENDS_append_am65xx = " sciclient-rtos"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${base_libdir}/firmware/*"
@@ -62,12 +61,6 @@ do_compile() {
   fi
 }
 
-do_install_prepend_am65xx () {
-  # Trim directory name
-  mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F0 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F0
-  mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F1 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F1
-}
-
 do_install() {
   CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
@@ -129,13 +122,3 @@ pkg_postinst_${PN}-fw_omapl138 () {
 pkg_postrm_${PN}-fw_omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
 }
-
-pkg_postinst_${PN}-fw_am65xx () {
-  update-alternatives --install /lib/firmware/am65x-mcu-r5f0_0-fw am65x-mcu-r5f0_0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
-  update-alternatives --install /lib/firmware/am65x-mcu-r5f0_1-fw am65x-mcu-r5f0_1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
-}
-
-pkg_postrm_${PN}-fw_am65xx () {
-  update-alternatives --remove am65x-mcu-r5f0_0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f
-  update-alternatives --remove am65x-mcu-r5f0_1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f
-}
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 2ebd03fd..425ca4e1 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -22,7 +22,6 @@ DAEMON_k2l = "lad_tci6630"
 DAEMON_k2e = "lad_66ak2e"
 DAEMON_k2g = "lad_66ak2g"
 DAEMON_omapl138 = "lad_omapl138"
-DAEMON_k3 = "lad_am65xx"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
-- 
2.17.1

