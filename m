Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A552E00C9D; Thu, 31 Mar 2016 08:47:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8282E00C76
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:47:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C884152A8E; Thu, 31 Mar 2016 15:47:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160331154715.C884152A8E@arago-project.org>
Date: Thu, 31 Mar 2016 15:47:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : cppi-lld: Bump SRCREV for fix
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
X-List-Received-Date: Thu, 31 Mar 2016 15:47:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: bc83d82ac6576c5745dcce941bd83e75b26dcbf4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bc83d82ac6576c5745dcce941bd83e75b26dcbf4

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Mar 24 22:48:36 2016 +0000

cppi-lld: Bump SRCREV for fix

* Fix linker option for linux example and test binaries

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cppi-lld/cppi-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index cee7142..b1f3f41 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -9,15 +9,15 @@ CPPI_LLD_GIT_PROTOCOL = "git"
 CPPI_LLD_GIT_BRANCH = "master"
 CPPI_LLD_GIT_DESTSUFFIX = "git/ti/drv/cppi"
 
-# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.12"
-CPPI_LLD_SRCREV = "1dc105ad256c49fbd1a92a0a27a27a34dae85e56"
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.12A"
+CPPI_LLD_SRCREV = "6a1d2891b3de9891dea71a069a261c6368209413"
 
 BRANCH = "${CPPI_LLD_GIT_BRANCH}"
 SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${CPPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${CPPI_LLD_SRCREV}"
 PV = "02.01.00.12"
-INC_PR = "r0"
+INC_PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"


