Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 031C0E0045D; Wed, 14 Sep 2016 10:04:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE4D3E0043B
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 10:03:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8EH3wlQ016352
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 12:03:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EH3wCd016875
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 12:03:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 12:03:57 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8EH3vuD005473;	Wed, 14 Sep 2016 12:03:57 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Sep 2016 13:03:56 -0400
Message-ID: <1473872636-65169-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ti-ipc: Update to new version 3.43.02.04
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
X-List-Received-Date: Wed, 14 Sep 2016 17:04:04 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 10 +++++-----
 recipes-ti/ipc/ti-ipc.inc         |  6 +++---
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
-- 
1.9.1


