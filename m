Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C7FAE00CC0; Fri, 16 Sep 2016 09:19:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5C6FE00CA1
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 93B1852ABB; Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161906.93B1852ABB@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.43.02.04
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fa5ca59327c85f4b321364556560f761f06f8324
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fa5ca59327c85f4b321364556560f761f06f8324

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Sep 14 23:03:56 2016 +0000

ti-ipc: Update to new version 3.43.02.04

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |   10 +++++-----
 recipes-ti/ipc/ti-ipc.inc         |    6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 5b26436..e49a555 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,16 +26,16 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.43.01.03
-SRCREV_ipc-examples = "e003640aa2ae8f5d433f6cda2172ecadffb5ac92"
+# Corresponds to tag: 3.43.02.04
+SRCREV_ipc-examples = "766ee598c790c95dad80f9e5db5051e35de4e18f"
 
-# Corresponds to tag: 3.43.01.03
-SRCREV_ipc-metadata = "b6dd82a450d75b9483a7cc9b619a30cf3cc25ae6"
+# Corresponds to tag: 3.43.02.04
+SRCREV_ipc-metadata = "394e8b9fda6981f4c485c4a48c0a13a0a3236390"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
 DEPENDS_append_keystone = " ti-cgt6x-native \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 069906b..1479fa6 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,15 +8,15 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.43"
 
-#Corresponds to 3.43.01.03
-TI_IPC_SRCREV = "eb4e543f60cccf427d47900014bcf9a5ae413cd6"
+#Corresponds to 3.43.02.04
+TI_IPC_SRCREV = "c179a1f4a102fc0c2b72da4db87753c8e523d639"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.43.01.03"
+PV = "3.43.02.04"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


