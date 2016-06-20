Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7E5BE00984; Mon, 20 Jun 2016 13:56:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FBE4E0091D
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:56:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 79DD352A82; Mon, 20 Jun 2016 20:56:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160620205652.79DD352A82@arago-project.org>
Date: Mon, 20 Jun 2016 20:56:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new patch version 3.43.01.02
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
X-List-Received-Date: Mon, 20 Jun 2016 20:56:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: eb25debd4941a189104359edefd443b658f10e1d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=eb25debd4941a189104359edefd443b658f10e1d

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Jun 18 03:44:38 2016 +0000

ti-ipc: Update to new patch version 3.43.01.02

Only examples and documentation updated

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |    8 ++++----
 recipes-ti/ipc/ti-ipc.inc         |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 4c82f35..740de53 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,11 +26,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.43.00.01
-SRCREV_ipc-examples = "54df963e83f2fd613f794dc3b1b72c8ed855e0ac"
+# Corresponds to tag: 3.43.01.02
+SRCREV_ipc-examples = "c2324cdcda4f6641cade25f95fa30996fb94bca0"
 
-# Corresponds to tag: 3.43.00.01
-SRCREV_ipc-metadata = "8829b3cf2068c87140ac062849c33cd1a21de636"
+# Corresponds to tag: 3.43.01.02
+SRCREV_ipc-metadata = "c3fc63be358c8c9a429366ebf54fe03812671129"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 6e09c3f..a74b4c1 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -16,7 +16,7 @@ SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};na
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.43.00.01"
+PV = "3.43.01.02"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


