Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23E79E00C00; Wed,  4 Nov 2015 07:04:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 936EAE00C00
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4366652A94; Wed,  4 Nov 2015 15:03:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150357.4366652A94@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : rm-lld: Clean up recipes
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
Branch: fido
Commit: 593e269a73195e7a7a8a1b882eba671396d84adf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=593e269a73195e7a7a8a1b882eba671396d84adf

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:27 2015 +0000

rm-lld: Clean up recipes

* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/rm-lld_git.bb |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index 8b2806c..d6cb62b 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -2,12 +2,20 @@ DESCRIPTION = "TI Resource Manager Low Level Driver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
+RM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/rm-lld.git"
+RM_LLD_GIT_PROTOCOL = "git"
+RM_LLD_GIT_BRANCH = "master"
+RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
+
 # Below commit ID corresponds to DEV.RM_LLD.02.01.02.00
-SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
+RM_LLD_SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
+
+BRANCH = "${RM_LLD_GIT_BRANCH}"
+SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${RM_LLD_SRCREV}"
+
 PV = "02.01.02.00"
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "keystone"
 


