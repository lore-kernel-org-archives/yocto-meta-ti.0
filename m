Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0D14E00AB9; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5C42E00A38
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JlgCG003131
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:42 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlgXK001538
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:42 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla76022118;	Tue, 3 Nov 2015 13:47:41 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:12 -0500
Message-ID: <1446580053-16935-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 06/27] edma3-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:45 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |  2 +-
 recipes-bsp/edma3-lld/edma3-lld.inc         | 13 ++++++++++---
 recipes-bsp/edma3-lld/edma3-lld_git.bb      |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index a4e0df6..4ebfd16 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -2,7 +2,7 @@ require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 DEPENDS = "ti-cgt6x-native ti-sysbios ti-xdctools"
 
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 28c49e3..8dc80f7 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -2,9 +2,16 @@ DESCRIPTION = "TI EDMA3 low level driver and test code"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git;protocol=git;branch=${BRANCH}"
+EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
+EDMA3_LLD_GIT_PROTOCOL = "git"
+EDMA3_LLD_GIT_BRANCH = "master"
+
 # The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_21_RC1
-SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
+EDMA3_LLD_SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
+
+BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
+SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${EDMA3_LLD_SRCREV}"
 
 PV = "2.12.01.21"
+INC_PR = "r2"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
index 913dd3e..ec6ca47 100644
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -1,6 +1,6 @@
 require edma3-lld.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "keystone"
 
-- 
1.9.1


