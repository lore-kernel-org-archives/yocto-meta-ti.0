Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CB70E00C7E; Thu, 31 Mar 2016 08:47:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7862E00B9E
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:47:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CC65B52A93; Thu, 31 Mar 2016 15:47:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160331154715.CC65B52A93@arago-project.org>
Date: Thu, 31 Mar 2016 15:47:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pa-lld: Bump SRCREV for fix
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
Commit: 49adca459a5b3147b16da224117a6c66e445cb53
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=49adca459a5b3147b16da224117a6c66e445cb53

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Mar 24 22:48:37 2016 +0000

pa-lld: Bump SRCREV for fix

* Fix linker option for linux example and test binaries

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/pa-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index b45d3bc..c083bc2 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,8 +9,8 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.08"
-PA_LLD_SRCREV = "43badac6ff6269e9449fb03fb7af985e61ab723c"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.08A"
+PA_LLD_SRCREV = "9294e42fd5763555c28e46b51246bab439fd552e"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
@@ -18,7 +18,7 @@ SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_L
 SRCREV = "${PA_LLD_SRCREV}"
 
 PV = "03.00.01.08"
-INC_PR = "r0"
+INC_PR = "r1"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 


