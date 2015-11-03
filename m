Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A945AE00AB5; Tue,  3 Nov 2015 11:47:43 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45FF9E00A70
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JlfFe027116
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:41 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jlf3r001524
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:42 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla75022118;	Tue, 3 Nov 2015 13:47:41 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:11 -0500
Message-ID: <1446580053-16935-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 05/27] dfe-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:43 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb |  2 ++
 recipes-bsp/dfe-lld/dfe-lld.inc         | 17 +++++++++++++----
 recipes-bsp/dfe-lld/dfe-lld_git.bb      |  2 ++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
index acaaf63..34b90c7 100644
--- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
+++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip dfe-lld iqn2-lld"
 
 include dfe-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
 
 do_compile () {
diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index f5778d9..f2e4213 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -1,13 +1,22 @@
 LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1f4217b705bf98762a302fd720649dcc"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git;destsuffix=git/ti/drv/dfe;protocol=git;branch=${BRANCH}"
+
+DFE_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git"
+DFE_LLD_GIT_PROTOCOL = "git"
+DFE_LLD_GIT_BRANCH = "master"
+DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
+
 # The following commit correspond to DEV.DFE_LLD.01.00.00.05E
-SRCREV = "42e9df0108d208c92b9d2fee7e8b1b1ab62f4b69"
+DFE_LLD_SRCREV = "42e9df0108d208c92b9d2fee7e8b1b1ab62f4b69"
+
+BRANCH = "${DFE_LLD_GIT_BRANCH}"
+SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${DFE_LLD_SRCREV}"
 
 PV = "1.0.0.5"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-S = "${WORKDIR}/git/ti/drv/dfe"
+S = "${WORKDIR}/${DFE_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-lld_git.bb
index a2477ca..3d33584 100644
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
+++ b/recipes-bsp/dfe-lld/dfe-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip"
 
 include dfe-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
1.9.1


