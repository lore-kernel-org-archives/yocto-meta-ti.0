Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71D2AE0093F; Wed,  8 Feb 2017 11:50:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 389E3E006C6
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2017 11:50:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v18JoJsV031138
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 13:50:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18JoJPg024195
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 13:50:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 13:50:19 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v18JoJ7h021095;	Wed, 8 Feb 2017 13:50:19 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 8 Feb 2017 14:50:18 -0500
Message-ID: <1486583418-3484-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Update to new version 3.45.00.00_eng
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
X-List-Received-Date: Wed, 08 Feb 2017 19:50:24 -0000
Content-Type: text/plain

Also moved RELEASE_TYPE & RELEASE_SUFFIX variables to ti-ipc-rtos.inc

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc  | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc    | 9 ++++++---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 3 ---
 recipes-ti/ipc/ti-ipc.inc         | 6 +++---
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
-- 
1.9.1


