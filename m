Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA2B5E00AB9; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 568AEE00B05
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JliJX027140
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:45 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jlii2014947
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:45 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7G022118;	Tue, 3 Nov 2015 13:47:44 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:22 -0500
Message-ID: <1446580053-16935-17-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 16/27] pa-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:46 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pa-lld/pa-lld-test_git.bb |  2 ++
 recipes-bsp/pa-lld/pa-lld.inc         | 18 ++++++++++++------
 recipes-bsp/pa-lld/pa-lld_git.bb      |  2 ++
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
index b70dadd..0fb6f07 100644
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
 
 include pa-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEVICELIST = "k2h k2k k2l k2e"
 
 CHOICELIST = "yes no"
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index b8ade64..58f0f42 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -3,13 +3,19 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcd
 
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
+PA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pa-lld.git"
+PA_LLD_GIT_PROTOCOL = "git"
+PA_LLD_GIT_BRANCH = "master"
+PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
 # Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.05A"
-SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
+PA_LLD_SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
+
+BRANCH = "${PA_LLD_GIT_BRANCH}"
+SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${PA_LLD_SRCREV}"
+
 PV = "03.00.01.05"
-PR = "r1"
+INC_PR = "r2"
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/pa"
+S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 468113b..0cb3bc5 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld"
 
 include pa-lld.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI += "file://init_pa.sh"
 
 inherit update-rc.d
-- 
1.9.1


