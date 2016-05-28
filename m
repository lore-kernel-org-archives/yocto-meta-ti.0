Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8403E00E38; Sat, 28 May 2016 09:00:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F0ADE009CB
	for <meta-ti@yoctoproject.org>; Sat, 28 May 2016 09:00:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4SG0mOt032496
	for <meta-ti@yoctoproject.org>; Sat, 28 May 2016 11:00:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4SG0mIJ011600
	for <meta-ti@yoctoproject.org>; Sat, 28 May 2016 11:00:48 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 28 May 2016 11:00:48 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4SG0mW3015563;	Sat, 28 May 2016 11:00:48 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 28 May 2016 12:00:45 -0400
Message-ID: <1464451245-61447-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Update to new version 3.43
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
X-List-Received-Date: Sat, 28 May 2016 16:00:51 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 8 ++++----
 recipes-ti/ipc/ti-ipc.inc         | 8 ++++----
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
-- 
1.9.1


