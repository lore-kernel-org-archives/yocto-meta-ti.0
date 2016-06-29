Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E6F0E00DEB; Wed, 29 Jun 2016 14:12:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE2C0E00DC2
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:11:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0217152AD5; Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160629211157.0217152AD5@arago-project.org>
Date: Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : dfe-lld: Bump version
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
X-List-Received-Date: Wed, 29 Jun 2016 21:12:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f76dd445ad96f601f4a4b4b7385e7cd30e25c0f0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f76dd445ad96f601f4a4b4b7385e7cd30e25c0f0

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Jun 30 00:52:53 2016 +0000

dfe-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dfe-lld/dfe-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index c1d8643..92c6034 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -7,14 +7,14 @@ DFE_LLD_GIT_PROTOCOL = "git"
 DFE_LLD_GIT_BRANCH = "master"
 DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
 
-# The following commit correspond to DEV.DFE_LLD.01.00.00.07
-DFE_LLD_SRCREV = "7a85310ee5e406f50a4c118610e07aade7d3cee2"
+# Below commit ID corresponds to "DEV.DFE_LLD.01.00.00.08"
+DFE_LLD_SRCREV = "d51482ef18889bbbd8e9cdc207c6fe9e27b1ab03"
 
 BRANCH = "${DFE_LLD_GIT_BRANCH}"
 SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${DFE_LLD_SRCREV}"
 
-PV = "1.0.0.7"
+PV = "1.0.0.8"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l-evm"


