Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DBEAE00ADD; Wed, 19 Apr 2017 14:02:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D0F2E00AC8
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 14:02:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3JL2ErK003533
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 16:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492635734;
	bh=EQfSUhnfSlgBwV8BR0Wxrz642LgBlakibotaT5NhD8M=;
	h=From:To:CC:Subject:Date;
	b=N2CuwUYOIFXBPw0n4e3aLiBI2Su2guxYqnfbCUlj2CFN1bEgCF7u5e3rnNknzmKgy
	ggheUpnqwrPXHgcWzrnLKhtPGh3AIxxCrg9RHILTt18j8vx8vU1Ync4u8CorFN0uQe
	90kp4vlkWQtGVoBBKk0ScZkryH5STT6UuX1sa8yw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JL2E08026697
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 16:02:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 16:02:13 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3JL2D3f014986;	Wed, 19 Apr 2017 16:02:13 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Apr 2017 17:02:10 -0400
Message-ID: <1492635730-18421-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v4] ti-ipc: Update to new verison 3.46.00.01_eng
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
X-List-Received-Date: Wed, 19 Apr 2017 21:02:19 -0000
Content-Type: text/plain

Add support for omapl138 platforms

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Update to new version 3.46.00.01_eng and corresponding code and docs
commit ids
- Updated branch
- Adjusted spaces in recipe
---
---
 recipes-ti/ipc/ti-ipc-common.inc |  5 +++--
 recipes-ti/ipc/ti-ipc-rtos.inc   | 20 +++++++++++++++-----
 recipes-ti/ipc/ti-ipc.inc        |  6 +++---
 recipes-ti/ipc/ti-ipc_git.bb     |  1 +
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index c5f28e7..d0f3aa5 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
-PV = "3.45.00.00"
-INC_PR = "r1"
+PV = "3.46.00.01"
+INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,5 +10,6 @@ PLATFORM_k2hk-evm = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g = "66AK2G"
+PLATFORM_omapl138 = "OMAPL138"
 
 ALT_PLATFORM_k2hk-evm = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index b29e984..0d7e0e6 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -28,16 +28,16 @@ name=${TI_IPC_METADATA_NAME}"
 # Corresponds to tag: 3.45.00.00
 SRCREV_ipc-examples = "3a8ee1841ec36117a9bcd3d45bb2781bbd53ecf8"
 
-# Corresponds to tag: 3.45.00.00
-SRCREV_ipc-metadata = "30b83f09be1877f86b22c971d978cb478fc7dd6e"
+# Corresponds to tag: 3.46.00.01_eng
+SRCREV_ipc-metadata = "a04b677e9c55bbffd4bd7071ab7dfb6dde3eb97f"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-RELEASE_TYPE = "GA"
-RELEASE_SUFFIX = ""
+RELEASE_TYPE = "ENG"
+RELEASE_SUFFIX = "_eng"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.r0"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
@@ -46,7 +46,12 @@ DEPENDS_append_omap-a15 = " ti-cgt6x-native \
                             ti-ccsv6-native \
                             gcc-arm-none-eabi-native \
 "
+DEPENDS_append_omapl138 = " ti-cgt6x-native \
+                            gcc-arm-none-eabi-native \
+"
+
 IPC_TARGETS = ""
+
 IPC_TARGETS_omap-a15 = "\
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
@@ -54,6 +59,11 @@ IPC_TARGETS_omap-a15 = "\
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
+IPC_TARGETS_omapl138 = "\
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C674="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
+
 IPC_TARGETS_keystone = " \
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index ea256d2..e2a91cf 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "master"
+TI_IPC_GIT_BRANCH = "3.46"
 
-#Corresponds to 3.45.00.00
-TI_IPC_SRCREV = "1584985938884bf6cb1d839779578354b1865ea4"
+#Corresponds to 3.46.00.01_eng
+TI_IPC_SRCREV = "a404d6aac840b6170cf4e9d819738842ec91746e"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 05b4d85..ce2eee0 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -20,6 +20,7 @@ DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e = "lad_66ak2e"
 DAEMON_k2g = "lad_66ak2g"
+DAEMON_omapl138 = "lad_omapl138"
 
 inherit autotools-brokensep pkgconfig update-rc.d
 
-- 
1.9.1


