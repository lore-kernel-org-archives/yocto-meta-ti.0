Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 108C3E00C4B; Wed,  4 Nov 2015 07:04:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FC9AE00C05
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0829A52AB2; Wed,  4 Nov 2015 15:03:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150354.0829A52AB2@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : srio-lld: Only compatible with k2hk-evm
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 327559a0a53cae4afdcfaa280026873b0a25563a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=327559a0a53cae4afdcfaa280026873b0a25563a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:31 2015 +0000

srio-lld: Only compatible with k2hk-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld-test_git.bb |    1 -
 recipes-bsp/srio-lld/srio-lld.inc         |    4 +++-
 recipes-bsp/srio-lld/srio-lld_git.bb      |    1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
index da3e357..6495a12 100644
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
-COMPATIBLE_MACHINE = "keystone"
 DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
 
 include srio-lld.inc
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index 6e51f79..2172a13 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -1,6 +1,8 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
 
+COMPATIBLE_MACHINE = "k2hk-evm"
+
 SRIO_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/srio-lld.git"
 SRIO_LLD_GIT_PROTOCOL = "git"
 SRIO_LLD_GIT_BRANCH = "master"
@@ -14,7 +16,7 @@ SRC_URI = "${SRIO_LLD_GIT_URI};destsuffix=${SRIO_LLD_GIT_DESTSUFFIX};protocol=${
 SRCREV = "${SRIO_LLD_SRCREV}"
 
 PV = "02.00.00.13"
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEVICELIST = "k2h k2k"
 
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
index ba3cc24..48e7633 100644
--- a/recipes-bsp/srio-lld/srio-lld_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld_git.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "TI SRIO peripheral low level driver"
-COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS="common-csl-ip rm-lld cppi-lld"
 


