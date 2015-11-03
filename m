Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E1F4E009B8; Tue,  3 Nov 2015 11:47:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB01FE009B8
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:40 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JldiR014569
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JldC2001376
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:39 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:39 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla73022118;	Tue, 3 Nov 2015 13:47:39 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:09 -0500
Message-ID: <1446580053-16935-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 03/27] cppi-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:41 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb |  2 ++
 recipes-bsp/cppi-lld/cppi-lld.inc         | 17 ++++++++++++-----
 recipes-bsp/cppi-lld/cppi-lld_git.bb      |  2 ++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
index 871546e..8f4856a 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld"
 
 include cppi-lld.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 do_compile () {
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index 21c8fe0..ae81a3f 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -1,14 +1,21 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git;destsuffix=git/ti/drv/cppi;protocol=git;branch=${BRANCH}"
+CPPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git"
+CPPI_LLD_GIT_PROTOCOL = "git"
+CPPI_LLD_GIT_BRANCH = "master"
+CPPI_LLD_GIT_DESTSUFFIX = "git/ti/drv/cppi"
 
 # Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.10"
-SRCREV = "97c537fa544a78e83512db3499a49d0bd86fad32"
+CPPI_LLD_SRCREV = "97c537fa544a78e83512db3499a49d0bd86fad32"
+
+BRANCH = "${CPPI_LLD_GIT_BRANCH}"
+SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${CPPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${CPPI_LLD_SRCREV}"
 PV = "02.01.00.10"
+INC_PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/cppi"
+S = "${WORKDIR}/${CPPI_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index cd419f6..169e0fc 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -5,6 +5,8 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld"
 
 include cppi-lld.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI += "file://init_cppi.sh"
 
 inherit update-rc.d
-- 
1.9.1


