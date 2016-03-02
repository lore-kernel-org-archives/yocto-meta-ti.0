Return-Path: <sam.nelson@TI.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85B4AE0079A; Wed,  2 Mar 2016 10:04:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56A8BE00CFE
	for <meta-ti@yoctoproject.org>; Wed,  2 Mar 2016 10:04:33 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u22I4Wx1031494
	for <meta-ti@yoctoproject.org>; Wed, 2 Mar 2016 12:04:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22I4WNH022737
	for <meta-ti@yoctoproject.org>; Wed, 2 Mar 2016 12:04:32 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Mar 2016 12:04:32 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u22I4W51017809;	Wed, 2 Mar 2016 12:04:32 -0600
From: Sam Nelson <sam.nelson@TI.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Mar 2016 13:04:31 -0500
Message-ID: <1456941871-24499-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ti-ipc: Update to GA version IPC 3.42
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
X-List-Received-Date: Wed, 02 Mar 2016 18:04:36 -0000
Content-Type: text/plain

Updated to GA version and commit for IPC 3.42
Added additional platform for K2HK

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Removed 667x-evm platform
---
---
 recipes-ti/ipc/ti-ipc.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index a7e1ed9..69127aa 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,18 +6,18 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "ipc-next"
+TI_IPC_GIT_BRANCH = "3.42"
 
-#Corresponds to 3.42.00.00_eng
-TI_IPC_SRCREV = "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
+#Corresponds to 3.42.00.02
+TI_IPC_SRCREV = "a520969994378fb2629d7dfc25f306c3a711b5bc"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.42.00.00"
-INC_PR = "r1"
+PV = "3.42.00.02"
+INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,3 +28,5 @@ PLATFORM_k2hk-evm = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e-evm = "66AK2E"
 PLATFORM_k2g-evm = "66AK2G"
+
+ALT_PLATFORM_k2hk-evm = "TCI6636"
-- 
1.9.1


