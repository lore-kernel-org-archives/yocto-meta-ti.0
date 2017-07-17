Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0060E00C29; Mon, 17 Jul 2017 06:06:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B1D0E00C25
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 06:06:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6HD6pN7013410
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 08:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500296811;
	bh=oSQYs2VgdfEcG3KuKbdkgQ2SPDwIPc0LQyq6e/a0+38=;
	h=From:To:CC:Subject:Date;
	b=It9XoDUg7OTQo5KKO7z+ufv8LAKjt1dOlS6ZzzSS6tcs6t7lFoTRciekrBKKaSWhC
	IZJQrk7fMvwbIYSs6CrG1NrZ+jfK3m6+peL4wl/hiSltdQRAXztHxK0edI3pVtnO7W
	eNkzQuWY2FXg0l5BW2eWGIegoG5FIpD5HS7YaUro=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6HD6pok002452
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 08:06:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 08:06:51 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6HD6pv4016803;	Mon, 17 Jul 2017 08:06:51 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 17 Jul 2017 09:06:50 -0400
Message-ID: <1500296810-18719-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] ti-ipc: Update to new version 3.46.02.04_eng
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
X-List-Received-Date: Mon, 17 Jul 2017 13:06:55 -0000
Content-Type: text/plain

- Removed depency on gcc-arm for omapl138, which was a mistake

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc |  2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc   | 14 ++++++--------
 recipes-ti/ipc/ti-ipc.inc        |  6 +++---
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index f5d8502..d9956fc 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.46.01.03"
+PV = "3.46.02.04"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 115a9fb..7dc9602 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,17 +24,17 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.46.01.03
-SRCREV_ipc-examples = "3a8ee1841ec36117a9bcd3d45bb2781bbd53ecf8"
+# Corresponds to tag: 3.46.02.04_eng
+SRCREV_ipc-examples = "b833c759d620b4218ece6d64fae91e4777ef823a"
 
-# Corresponds to tag: 3.46.01.03
-SRCREV_ipc-metadata = "0d80fea7f79fb40109879d061b849b68bbab1124"
+# Corresponds to tag: 3.46.02.04_eng
+SRCREV_ipc-metadata = "bb07d3e00dcaf1074589e805be0a4ed2ada2d17c"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-RELEASE_TYPE = "GA"
-RELEASE_SUFFIX = ""
+RELEASE_TYPE = "ENG"
+RELEASE_SUFFIX = "_eng"
 
 PR = "${INC_PR}.r0"
 
@@ -46,7 +46,6 @@ DEPENDS_append_omap-a15 = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
 "
 DEPENDS_append_omapl138 = " ti-cgt6x-native \
-                            gcc-arm-none-eabi-native \
 "
 
 IPC_TARGETS = ""
@@ -59,7 +58,6 @@ IPC_TARGETS_omap-a15 = "\
 "
 
 IPC_TARGETS_omapl138 = "\
-    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C674="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
 
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 39e57a9..06c087a 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.46"
+TI_IPC_GIT_BRANCH = "ipc-next"
 
-#Corresponds to 3.46.01.03
-TI_IPC_SRCREV = "7b3a739876e46d3194861a2d93077ff95954affb"
+#Corresponds to 3.46.02.04_eng
+TI_IPC_SRCREV = "bf355e7d0f5c3993f56a6ea778743b656ef6b536"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


