Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68B1DE0083D; Wed,  1 Jun 2016 12:48:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DCBDE008BA
	for <meta-ti@yoctoproject.org>; Wed,  1 Jun 2016 12:48:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id ABA6852982; Wed,  1 Jun 2016 19:48:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160601194837.ABA6852982@arago-project.org>
Date: Wed,  1 Jun 2016 19:48:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.43
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
X-List-Received-Date: Wed, 01 Jun 2016 19:48:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 3ac974779d7e9d2b098b425a8b8342cc499493c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3ac974779d7e9d2b098b425a8b8342cc499493c7

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat May 28 22:00:45 2016 +0000

ti-ipc: Update to new version 3.43

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |    8 ++++----
 recipes-ti/ipc/ti-ipc.inc         |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 497fa95..4c82f35 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,11 +26,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.42.01.03
-SRCREV_ipc-examples = "bd4f28bd46467553e6610629ff13b4b5b3ba3af0"
+# Corresponds to tag: 3.43.00.01
+SRCREV_ipc-examples = "54df963e83f2fd613f794dc3b1b72c8ed855e0ac"
 
-# Corresponds to tag: 3.42.01.03
-SRCREV_ipc-metadata = "4d01fe4a7c41d2ce76a62b4325e66753d59b298c"
+# Corresponds to tag: 3.43.00.01
+SRCREV_ipc-metadata = "8829b3cf2068c87140ac062849c33cd1a21de636"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 27b360d..6e09c3f 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,17 +6,17 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.42"
+TI_IPC_GIT_BRANCH = "3.43"
 
-#Corresponds to 3.42.01.03
-TI_IPC_SRCREV = "dc6c5082f478225b7fbce4216173e6c5b36100b4"
+#Corresponds to 3.43.00.01
+TI_IPC_SRCREV = "9e6ebc02c14ed4150dad5d45d8a7e35258bf37ad"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.42.01.03"
+PV = "3.43.00.01"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


