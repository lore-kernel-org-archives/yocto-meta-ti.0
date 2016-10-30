Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE40CE00B34; Sun, 30 Oct 2016 05:19:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 416B3E009C9
	for <meta-ti@yoctoproject.org>; Sun, 30 Oct 2016 05:19:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9UCJgPq007112
	for <meta-ti@yoctoproject.org>; Sun, 30 Oct 2016 07:19:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9UCJg3U020260
	for <meta-ti@yoctoproject.org>; Sun, 30 Oct 2016 07:19:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 30 Oct 2016 07:19:42 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9UCJgoS017584;	Sun, 30 Oct 2016 07:19:42 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 30 Oct 2016 08:19:39 -0400
Message-ID: <1477829979-42600-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Update to new version 3.44.00
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
X-List-Received-Date: Sun, 30 Oct 2016 12:19:47 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 10 +++++-----
 recipes-ti/ipc/ti-ipc.inc         |  8 ++++----
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
-- 
1.9.1


