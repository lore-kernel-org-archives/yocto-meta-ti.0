Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58DA0E009C5; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A73F3E009C5
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jlhrb009099
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlhGY014854
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:43 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7B022118;	Tue, 3 Nov 2015 13:47:43 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:17 -0500
Message-ID: <1446580053-16935-12-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 11/27] iqn2-lld: Clean up recipes
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
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb |  2 ++
 recipes-bsp/iqn2-lld/iqn2-lld.inc         | 16 ++++++++++++----
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb      |  2 ++
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
index f1aa9e4..f276c4b 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip iqn2-lld dfe-lld"
 
 include iqn2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
 
 do_compile () {
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 812d3f6..4a43a26 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -1,13 +1,21 @@
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 LICENSE = "BSD-3-Clause"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git;destsuffix=git/ti/drv/iqn2;protocol=git;branch=${BRANCH}"
+IQN2_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git"
+IQN2_LLD_GIT_PROTOCOL = "git"
+IQN2_LLD_GIT_BRANCH = "master"
+IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
+
 # Following commit corresponds to DEV.IQN_LLD.01.00.00.08F
-SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
+IQN2_LLD_SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
+
+BRANCH = "${IQN2_LLD_GIT_BRANCH}"
+SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${IQN2_LLD_SRCREV}"
 
 PV = "1.0.0.8"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-S = "${WORKDIR}/git/ti/drv/iqn2"
+S = "${WORKDIR}/${IQN2_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
index 19ffc05..4e68116 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip"
 
 include iqn2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
1.9.1


