Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 125CCE00B04; Mon, 31 Oct 2016 14:22:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33769E00AF2
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 14:22:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BE44C52996; Mon, 31 Oct 2016 21:22:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161031212222.BE44C52996@arago-project.org>
Date: Mon, 31 Oct 2016 21:22:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.44.00
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
X-List-Received-Date: Mon, 31 Oct 2016 21:22:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: bd9687339b14092ceeff6dc6f3c1a281aab90476
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bd9687339b14092ceeff6dc6f3c1a281aab90476

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sun Oct 30 18:19:39 2016 +0000

ti-ipc: Update to new version 3.44.00

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |   10 +++++-----
 recipes-ti/ipc/ti-ipc.inc         |    8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index e03e753..5b0bed5 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,16 +26,16 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.43.03.05
-SRCREV_ipc-examples = "766ee598c790c95dad80f9e5db5051e35de4e18f"
+# Corresponds to tag: 3.44.00.00
+SRCREV_ipc-examples = "a934d057647af00401e4bfd1c6a4a0f6144441b7"
 
-# Corresponds to tag: 3.43.04.05
-SRCREV_ipc-metadata = "70d397241ebb4b2fd5a09cb9d506ecbbb3f4ad1e"
+# Corresponds to tag: 3.44.00.00
+SRCREV_ipc-metadata = "07a745d47ecd7b4b64860e7c5d0fbe4e89524f2e"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
 DEPENDS_append_keystone = " ti-cgt6x-native \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index cf576d1..869dada 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,17 +6,17 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.43"
+TI_IPC_GIT_BRANCH = "ipc-next"
 
-#Corresponds to 3.43.03.05
-TI_IPC_SRCREV = "6c2b64342cbd0317527a0924140566b2446488f5"
+#Corresponds to 3.44.00.00
+TI_IPC_SRCREV = "e6f64d4b04f1c929366c922a2e5a4728fbb4d919"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.43.03.05"
+PV = "3.44.00.00"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


