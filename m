Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEAA4E00CF0; Sun, 10 Jul 2016 12:41:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BC0DE00AD2
	for <meta-ti@yoctoproject.org>; Sun, 10 Jul 2016 12:41:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9673452A36; Sun, 10 Jul 2016 19:41:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160710194118.9673452A36@arago-project.org>
Date: Sun, 10 Jul 2016 19:41:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.43.01.03
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
X-List-Received-Date: Sun, 10 Jul 2016 19:41:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 5a92176066ce71eb97c0b96b86f909a179d46b98
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a92176066ce71eb97c0b96b86f909a179d46b98

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Jul  7 20:50:42 2016 +0000

ti-ipc: Update to new version 3.43.01.03

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |    8 ++++----
 recipes-ti/ipc/ti-ipc.inc         |    6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 379dcd0..c9c4714 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,11 +26,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.43.01.02
-SRCREV_ipc-examples = "c2324cdcda4f6641cade25f95fa30996fb94bca0"
+# Corresponds to tag: 3.43.01.03
+SRCREV_ipc-examples = "e003640aa2ae8f5d433f6cda2172ecadffb5ac92"
 
-# Corresponds to tag: 3.43.01.02
-SRCREV_ipc-metadata = "c3fc63be358c8c9a429366ebf54fe03812671129"
+# Corresponds to tag: 3.43.01.03
+SRCREV_ipc-metadata = "b6dd82a450d75b9483a7cc9b619a30cf3cc25ae6"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 03e0b79..069906b 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,15 +8,15 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.43"
 
-#Corresponds to 3.43.01.02
-TI_IPC_SRCREV = "9e6ebc02c14ed4150dad5d45d8a7e35258bf37ad"
+#Corresponds to 3.43.01.03
+TI_IPC_SRCREV = "eb4e543f60cccf427d47900014bcf9a5ae413cd6"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.43.01.02"
+PV = "3.43.01.03"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


