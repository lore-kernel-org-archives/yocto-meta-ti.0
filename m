Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6339BE0085D; Fri, 24 Feb 2017 19:50:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F329EE00655
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 19:50:26 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1P3oPds027378
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 21:50:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1P3oPEO007455
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 21:50:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 21:50:25 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1P3oN8D009340;
	Fri, 24 Feb 2017 21:50:24 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 25 Feb 2017 09:20:22 +0530
Message-ID: <1487994622-87927-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth] ti-ipc: update to 3.45.00.00
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
X-List-Received-Date: Sat, 25 Feb 2017 03:50:31 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc |  2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc   | 10 +++++-----
 recipes-ti/ipc/ti-ipc.inc        |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

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
index 1c509b0..332f238 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -25,16 +25,16 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.44.01.01
-SRCREV_ipc-examples = "b19a3b7a003aa3304a12599a498d9b3a24f20c6e"
+# Corresponds to tag: 3.45.00.00
+SRCREV_ipc-examples = "3a8ee1841ec36117a9bcd3d45bb2781bbd53ecf8"
 
-# Corresponds to tag: 3.44.01.01
-SRCREV_ipc-metadata = "a21264bdbb1b64d41bbcb4e6bb17d2c1d4ccb839"
+# Corresponds to tag: 3.45.00.00
+SRCREV_ipc-metadata = "30b83f09be1877f86b22c971d978cb478fc7dd6e"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 3ac8bf5..ea256d2 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "ipc-3.44-next"
+TI_IPC_GIT_BRANCH = "master"
 
-#Corresponds to 3.44.01.01
-TI_IPC_SRCREV = "cff640a4c7e083f78116266ef681cec49d9b584b"
+#Corresponds to 3.45.00.00
+TI_IPC_SRCREV = "1584985938884bf6cb1d839779578354b1865ea4"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


