Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C14A5E00C87; Thu, 31 Mar 2016 08:47:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B593EE00C87
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:47:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 22E0E52AE1; Thu, 31 Mar 2016 15:47:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160331154717.22E0E52AE1@arago-project.org>
Date: Thu, 31 Mar 2016 15:47:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : mmap-lld: Upgrade to 2.0.0.7
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
X-List-Received-Date: Thu, 31 Mar 2016 15:47:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5f403d5e831620dc8ce5772fe93ad55b27739eb0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5f403d5e831620dc8ce5772fe93ad55b27739eb0

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Mar 24 22:48:41 2016 +0000

mmap-lld: Upgrade to 2.0.0.7

* add k2l-evm and k2g-evm support

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld-test_git.bb |    4 +++-
 recipes-bsp/mmap-lld/mmap-lld.inc         |    6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 5fdb646..b29df8b 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
 include mmap-lld.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,6 +10,8 @@ RDEPENDS_${PN}="uio-module-drv"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2g-evm  = "k2g"
 
 CHOICELIST = " yes \
                no \
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 37bd0bd..c65ceb3 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -9,14 +9,14 @@ MMAP_LLD_GIT_PROTOCOL = "git"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
-# Commit correspond to DEV.MMAP.02.00.00.06
-MMAP_LLD_SRCREV = "70c10fbce809a3ed1cd67c9da2e2a47d3de8f832"
+# Commit correspond to DEV.MMAP.02.00.00.07
+MMAP_LLD_SRCREV = "4426949ddfafdc8ea9408dbf5a642c3e840f4997"
 
 BRANCH="${MMAP_LLD_GIT_BRANCH}"
 SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${MMAP_LLD_SRCREV}"
 
-PV = "2.0.0.6"
+PV = "2.0.0.7"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"


