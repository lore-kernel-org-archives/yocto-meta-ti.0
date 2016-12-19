Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC509E00B6C; Mon, 19 Dec 2016 15:19:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D06ECE00B6C
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:19:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0B1BE52AC8; Mon, 19 Dec 2016 23:19:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231938.0B1BE52AC8@arago-project.org>
Date: Mon, 19 Dec 2016 23:19:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new patch release 3.44.01.01
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
X-List-Received-Date: Mon, 19 Dec 2016 23:19:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 6bea060cdd5d7b6c0dc4857bb22064b841e8a696
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6bea060cdd5d7b6c0dc4857bb22064b841e8a696

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec 17 09:00:53 2016 +0000

ti-ipc: Update to new patch release 3.44.01.01

-Enables parallel build when rtos build invokes xdc to reduce build time

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-common.inc |    4 ++--
 recipes-ti/ipc/ti-ipc-rtos.inc   |   11 ++++++-----
 recipes-ti/ipc/ti-ipc.inc        |    6 +++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index ddb48bc..8a2aa0a 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
-PV = "3.44.00.00"
-INC_PR = "r2"
+PV = "3.44.01.01"
+INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index e1abf36..1c509b0 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -25,16 +25,16 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.44.00.00C
-SRCREV_ipc-examples = "1b73bc32c5bdd869b5121f86859afb122d286acc"
+# Corresponds to tag: 3.44.01.01
+SRCREV_ipc-examples = "b19a3b7a003aa3304a12599a498d9b3a24f20c6e"
 
-# Corresponds to tag: 3.44.00.00
-SRCREV_ipc-metadata = "07a745d47ecd7b4b64860e7c5d0fbe4e89524f2e"
+# Corresponds to tag: 3.44.01.01
+SRCREV_ipc-metadata = "a21264bdbb1b64d41bbcb4e6bb17d2c1d4ccb839"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.0"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
@@ -62,4 +62,5 @@ EXTRA_OEMAKE = "\
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     ${IPC_TARGETS} \
+    JOBS="--jobs=${BB_NUMBER_THREADS}" \
 "
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 2d38367..3ac8bf5 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.44"
+TI_IPC_GIT_BRANCH = "ipc-3.44-next"
 
-#Corresponds to 3.44.00.00
-TI_IPC_SRCREV = "a1852fc8b254ed207bd1c1c88f5b362c9b6cc454"
+#Corresponds to 3.44.01.01
+TI_IPC_SRCREV = "cff640a4c7e083f78116266ef681cec49d9b584b"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"


