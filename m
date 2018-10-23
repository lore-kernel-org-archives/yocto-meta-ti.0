Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05787E008E3; Tue, 23 Oct 2018 08:01:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0026AE00B9F
	for <meta-ti@yoctoproject.org>; Tue, 23 Oct 2018 08:01:03 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9NF13Io040449
	for <meta-ti@yoctoproject.org>; Tue, 23 Oct 2018 10:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1540306863;
	bh=pccQQMdDTbFNISrZO2ZLElnlaJCkqEvu+wOgXNjmETI=;
	h=From:To:CC:Subject:Date;
	b=VWJWt9LLgx4iEfb76fC5HoylxO+M0X499Lb6ffoxQnT98gCk+2yjv+PiAnV0zQfHt
	FXmGmekY2FeeaQgj8wKf2ZND+dGRhI3J+r2lPEqXZYZduCkfaazFTYXItpalos/4aG
	oG644sjR8JNcDTD+nZ15mjoVIrfJtiwL+8nRHae4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id w9NF13cQ101089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 23 Oct 2018 10:01:03 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 23 Oct 2018 10:01:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 23 Oct 2018 10:01:02 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9NF12Ev028813;
	Tue, 23 Oct 2018 10:01:02 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <s-anna@ti.com>
Date: Tue, 23 Oct 2018 11:01:00 -0400
Message-ID: <1540306860-54497-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-ipc: Update to new version 3.50.03.03
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
X-List-Received-Date: Tue, 23 Oct 2018 15:01:05 -0000
Content-Type: text/plain

Adds split mode support for the R5 core

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
Fix typos in R5F1 link
---
---
 recipes-ti/ipc/ti-ipc-common.inc  |  2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc    |  8 ++++----
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 12 ++++++++++--
 recipes-ti/ipc/ti-ipc.inc         |  4 ++--
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index dddb734..f9514d0 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.50.02.02"
+PV = "3.50.03.03"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 7378d42..2b954c7 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,10 +24,10 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.50.02.02
-TI_IPC_METADATA_SRCREV = "171ed5b4cfc73fd2ebfeefe42249bec18f475613"
-# Corresponds to tag: 3.50.01.01
-TI_IPC_EXAMPLES_SRCREV = "71f6e59a6b2c7e20c2656e5000f318339ded2f3c"
+# Corresponds to tag: 3.50.03.03
+TI_IPC_METADATA_SRCREV = "88d4c734407f49d2edb8050b0b542e023b8750c8"
+# Corresponds to tag: 3.50.03.03
+TI_IPC_EXAMPLES_SRCREV = "e2b116ab30b79d5dc855febb7dcc07179e8aef50"
 
 SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
 SRCREV_ipc-examples = "${TI_IPC_EXAMPLES_SRCREV}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index ee7778a..a276f22 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -62,6 +62,12 @@ do_compile() {
   fi
 }
 
+do_install_prepend_am65xx-evm () {
+  # Trim directory name
+  mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F0 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F0
+  mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F1 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F1
+}
+
 do_install() {
   CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
@@ -125,9 +131,11 @@ pkg_postrm_${PN}-fw_omapl138 () {
 }
 
 pkg_postinst_${PN}-fw_am65xx-evm () {
-  update-alternatives --install /lib/firmware/am65x-mcu-r5f0-fw am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/am65x-mcu-r5f0-fw am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/am65x-mcu-r5f1-fw am65x-mcu-r5f1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
 }
 
 pkg_postrm_${PN}-fw_am65xx-evm () {
-  update-alternatives --remove am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X/messageq_single.xe674
+  update-alternatives --remove am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f
+  update-alternatives --remove am65x-mcu-r5f1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f
 }
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 230c7ef..428ad3d 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.50.02.02
-TI_IPC_SRCREV = "c2bb741e4a2723155d38ede6a5a5dea8d6592089"
+#Corresponds to 3.50.03.03
+TI_IPC_SRCREV = "f20ff3ad29a4ca37d7a81e4fe1163d0c7b4eb3c7"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


