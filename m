Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FFAEE00BC6; Thu, 28 Jan 2016 10:44:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BF10E00C00
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CBEBA52A60; Thu, 28 Jan 2016 18:43:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184353.CBEBA52A60@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : iqn2-lld: Upgrade to version 1.0.0.10
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
X-List-Received-Date: Thu, 28 Jan 2016 18:44:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: f5e6bf817f0ad9347e9fcf9839f302509bdebd3f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5e6bf817f0ad9347e9fcf9839f302509bdebd3f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:04 2016 +0000

iqn2-lld: Upgrade to version 1.0.0.10

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/iqn2-lld/iqn2-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 4a43a26..1d99d41 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -6,15 +6,15 @@ IQN2_LLD_GIT_PROTOCOL = "git"
 IQN2_LLD_GIT_BRANCH = "master"
 IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
 
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.08F
-IQN2_LLD_SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.10
+IQN2_LLD_SRCREV = "dfc6bdd3b397b58e234f74eadda6d79ee399e682"
 
 BRANCH = "${IQN2_LLD_GIT_BRANCH}"
 SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${IQN2_LLD_SRCREV}"
 
-PV = "1.0.0.8"
-INC_PR = "r1"
+PV = "1.0.0.10"
+INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 


