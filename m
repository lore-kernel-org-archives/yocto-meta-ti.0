Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB04EE00C08; Thu, 28 Jan 2016 10:43:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 543C8E00928
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DAA9052A4B; Thu, 28 Jan 2016 18:43:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184349.DAA9052A4B@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : dfe-lld: Upgrade to version 1.0.0.7
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 47857e5626069f55ef53155717678112354665bc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=47857e5626069f55ef53155717678112354665bc

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:02 2016 +0000

dfe-lld: Upgrade to version 1.0.0.7

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dfe-lld/dfe-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index f2e4213..c1d8643 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -7,15 +7,15 @@ DFE_LLD_GIT_PROTOCOL = "git"
 DFE_LLD_GIT_BRANCH = "master"
 DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
 
-# The following commit correspond to DEV.DFE_LLD.01.00.00.05E
-DFE_LLD_SRCREV = "42e9df0108d208c92b9d2fee7e8b1b1ab62f4b69"
+# The following commit correspond to DEV.DFE_LLD.01.00.00.07
+DFE_LLD_SRCREV = "7a85310ee5e406f50a4c118610e07aade7d3cee2"
 
 BRANCH = "${DFE_LLD_GIT_BRANCH}"
 SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${DFE_LLD_SRCREV}"
 
-PV = "1.0.0.5"
-INC_PR = "r1"
+PV = "1.0.0.7"
+INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 


