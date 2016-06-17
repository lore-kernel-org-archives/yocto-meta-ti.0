Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9131E00E67; Fri, 17 Jun 2016 14:14:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F8AFE00E50
	for <meta-ti@yoctoproject.org>; Fri, 17 Jun 2016 14:14:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5HLEJ1A013959
	for <meta-ti@yoctoproject.org>; Fri, 17 Jun 2016 16:14:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5HLEqDb007227
	for <meta-ti@yoctoproject.org>; Fri, 17 Jun 2016 16:14:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Jun 2016 16:14:51 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5HLEoKq015759;	Fri, 17 Jun 2016 16:14:51 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 Jun 2016 17:14:48 -0400
Message-ID: <1466198088-59588-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Update to new patch version 3.43.01.02
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
X-List-Received-Date: Fri, 17 Jun 2016 21:14:56 -0000
Content-Type: text/plain

Only examples and documentation updated

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 4 ++--
 recipes-ti/ipc/ti-ipc.inc         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 4c82f35..7b810a9 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -26,10 +26,10 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.43.00.01
+# Corresponds to tag: 3.43.01.02
 SRCREV_ipc-examples = "54df963e83f2fd613f794dc3b1b72c8ed855e0ac"
 
-# Corresponds to tag: 3.43.00.01
+# Corresponds to tag: 3.43.01.02
 SRCREV_ipc-metadata = "8829b3cf2068c87140ac062849c33cd1a21de636"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
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
-- 
1.9.1


