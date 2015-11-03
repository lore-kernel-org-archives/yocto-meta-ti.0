Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1218EE009EF; Tue,  3 Nov 2015 11:47:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 614C7E007FE
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:38 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JlcQI003125
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:38 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlcaQ001329
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:38 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla71022118;	Tue, 3 Nov 2015 13:47:37 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:07 -0500
Message-ID: <1446580053-16935-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 01/27] aif2-lld: Clean up recipes
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
 recipes-bsp/aif2-lld/aif2-lld-test_git.bb |  2 ++
 recipes-bsp/aif2-lld/aif2-lld.inc         | 17 +++++++++++++----
 recipes-bsp/aif2-lld/aif2-lld_git.bb      |  2 ++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
index 2a9de43..9180b95 100755
--- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip aif2-lld qmss-lld cppi-lld"
 
 include aif2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
 
 do_compile () {
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
index 212813c..cd1e169 100755
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -1,13 +1,22 @@
 LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/aif2-lld.git;destsuffix=git/ti/drv/aif2;protocol=git;branch=${BRANCH}"
+
+AIF2_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/aif2-lld.git"
+AIF2_LLD_GIT_PROTOCOL = "git"
+AIF2_LLD_GIT_BRANCH = "master"
+AIF2_LLD_GIT_DESTSUFFIX = "git/ti/drv/aif2"
+
 # The following commit correspond to DEV.AIF2LLD.01.02.00.00A
-SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+AIF2_LLD_SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+
+BRANCH = "${AIF2_LLD_GIT_BRANCH}"
+SRC_URI = "${AIF2_LLD_GIT_URI};destsuffix=${AIF2_LLD_GIT_DESTSUFFIX};protocol=${AIF2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${AIF2_LLD_SRCREV}"
 
 PV = "1.2.0.0"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "k2hk-evm"
 
-S = "${WORKDIR}/git/ti/drv/aif2"
+S = "${WORKDIR}/${AIF2_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
index f6e95c2..f310b17 100755
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip qmss-lld cppi-lld"
 
 include aif2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
1.9.1


