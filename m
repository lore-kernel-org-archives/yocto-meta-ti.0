Return-Path: <poojaprajod@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2443BE00CF9; Wed, 12 Oct 2016 08:17:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0EF1E00CBB
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 08:17:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CFGx6u023516
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:17:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CFGxGR030345
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:16:59 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 10:16:59 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CFGwAu008710;	Wed, 12 Oct 2016 10:16:58 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <1476285415-14221-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:52:03 -0800
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-ti/ti-ipc] ti-ipc: Update to 3.43.03.05
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
Date: Wed, 12 Oct 2016 15:17:04 -0000
X-Original-Date: Wed, 12 Oct 2016 20:46:55 +0530
X-List-Received-Date: Wed, 12 Oct 2016 15:17:04 -0000
Content-Type: text/plain

Update PV and commits of ipcdev, ipc-examples, ipc-metadata

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 6 +++---
 recipes-ti/ipc/ti-ipc.inc         | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 53c9a6e..42fdd7a 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,11 +26,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.43.02.04
+# Corresponds to tag: 3.43.03.05
 SRCREV_ipc-examples = "766ee598c790c95dad80f9e5db5051e35de4e18f"
 
-# Corresponds to tag: 3.43.02.04
-SRCREV_ipc-metadata = "394e8b9fda6981f4c485c4a48c0a13a0a3236390"
+# Corresponds to tag: 3.43.03.05
+SRCREV_ipc-metadata = "70d397241ebb4b2fd5a09cb9d506ecbbb3f4ad1e"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index c6c0965..cbcbbb7 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,16 +8,16 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.43"
 
-#Corresponds to 3.43.02.04
-TI_IPC_SRCREV = "c179a1f4a102fc0c2b72da4db87753c8e523d639"
+#Corresponds to 3.43.03.05
+TI_IPC_SRCREV = "6c2b64342cbd0317527a0924140566b2446488f5"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.43.02.04"
-INC_PR = "r0"
+PV = "3.43.03.05"
+INC_PR = "r3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.9.1


