Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 879A7E00AB5; Wed, 27 Jan 2016 12:54:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F14EAE00B88
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E040B52AB9; Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205449.E040B52AB9@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : rm-lld: Bump version to 02.02.00.00
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4593264a4f3f988010ee1537ff15248c3ed085f0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4593264a4f3f988010ee1537ff15248c3ed085f0

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:44 2016 +0000

rm-lld: Bump version to 02.02.00.00

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/rm-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
index 5b3b981..be71761 100644
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ b/recipes-bsp/rm-lld/rm-lld.inc
@@ -7,15 +7,15 @@ RM_LLD_GIT_PROTOCOL = "git"
 RM_LLD_GIT_BRANCH = "master"
 RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
 
-# Below commit ID corresponds to DEV.RM_LLD.02.01.02.00
-RM_LLD_SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
+# Below commit ID corresponds to DEV.RM_LLD.02.02.00.00
+RM_LLD_SRCREV = "48fc05bf1835f76760da4341a4c551398aeeb7cd"
 
 BRANCH = "${RM_LLD_GIT_BRANCH}"
 SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${RM_LLD_SRCREV}"
 
-PV = "02.01.02.00"
-INC_PR = "r3"
+PV = "02.02.00.00"
+INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "keystone"
 


