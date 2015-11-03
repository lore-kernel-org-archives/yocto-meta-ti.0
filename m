Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80B59E00B01; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C619DE00AB9
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JliC9003137
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:44 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JliuY001737
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:44 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7E022118;	Tue, 3 Nov 2015 13:47:44 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:20 -0500
Message-ID: <1446580053-16935-15-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 14/27] nwal-lld: Clean up recipes
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
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb |  2 ++
 recipes-bsp/nwal-lld/nwal-lld.inc         | 13 ++++++++++---
 recipes-bsp/nwal-lld/nwal-lld_git.bb      |  2 ++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
index 3813df9..79528a0 100644
--- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib nwal-lld"
 
 include nwal-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 247bfc0..c4ccdbd 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -3,12 +3,19 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fb
 
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git;protocol=git;branch=${BRANCH}"
+NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
+NWAL_LLD_GIT_PROTOCOL = "git"
+NWAL_LLD_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.NWAL.02.01.00.08"
-SRCREV = "e6df99e59a848c7afffe90fc9710b7dcb8067c31"
+NWAL_LLD_SRCREV = "e6df99e59a848c7afffe90fc9710b7dcb8067c31"
+
+BRANCH = "${NWAL_LLD_GIT_BRANCH}"
+SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${NWAL_LLD_SRCREV}"
+
 PV = "02.01.00.08"
+INC_PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nwal-lld_git.bb
index da09730..a9690ca 100644
--- a/recipes-bsp/nwal-lld/nwal-lld_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib"
 
 include nwal-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
1.9.1


