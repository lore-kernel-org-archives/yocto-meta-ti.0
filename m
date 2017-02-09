Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22ED6E009C9; Thu,  9 Feb 2017 10:15:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7630E0094C
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2017 10:15:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 169D9529A0; Thu,  9 Feb 2017 18:15:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170209181532.169D9529A0@arago-project.org>
Date: Thu,  9 Feb 2017 18:15:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.45.00.00_eng
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
X-List-Received-Date: Thu, 09 Feb 2017 18:15:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 880ca7f51c7d40a1fed7f79ad8b39f0b597f4c81
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=880ca7f51c7d40a1fed7f79ad8b39f0b597f4c81

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Feb  9 01:50:18 2017 +0000

ti-ipc: Update to new version 3.45.00.00_eng

Also moved RELEASE_TYPE & RELEASE_SUFFIX variables to ti-ipc-rtos.inc

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-common.inc  |    2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc    |    9 ++++++---
 recipes-ti/ipc/ti-ipc-rtos_git.bb |    3 ---
 recipes-ti/ipc/ti-ipc.inc         |    6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 8a2aa0a..6aa08c5 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.44.01.01"
+PV = "3.45.00.00"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 1c509b0..77ce7ec 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -25,15 +25,18 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.44.01.01
+# Corresponds to tag: 3.45.00.00_eng
 SRCREV_ipc-examples = "b19a3b7a003aa3304a12599a498d9b3a24f20c6e"
 
-# Corresponds to tag: 3.44.01.01
-SRCREV_ipc-metadata = "a21264bdbb1b64d41bbcb4e6bb17d2c1d4ccb839"
+# Corresponds to tag: 3.45.00.00_eng
+SRCREV_ipc-metadata = "92fa9ce4419abf0fa2cf4063ee84e524c51548d0"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
+RELEASE_TYPE = "ENG"
+RELEASE_SUFFIX = "_eng"
+
 PR = "${INC_PR}.0"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 693a4e9..f0ccb10 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -13,9 +13,6 @@ INSANE_SKIP_${PN}-dev += "arch"
 
 ALLOW_EMPTY_${PN} = "1"
 
-RELEASE_TYPE = "GA"
-RELEASE_SUFFIX = ""
-
 IPC_PACKAGE_DIR = "${S}/ipc-package"
 
 do_compile() {
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 3ac8bf5..876aca9 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "ipc-3.44-next"
+TI_IPC_GIT_BRANCH = "ipc-next"
 
-#Corresponds to 3.44.01.01
-TI_IPC_SRCREV = "cff640a4c7e083f78116266ef681cec49d9b584b"
+#Corresponds to 3.45.00.00_eng
+TI_IPC_SRCREV = "9dd159d851496047b6833a5b7c71ed9ea95efc07"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"


