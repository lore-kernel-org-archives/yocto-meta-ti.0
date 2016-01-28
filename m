Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78982E00AEA; Thu, 28 Jan 2016 10:43:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEE48E00B3D
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7D2B052AAD; Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184350.7D2B052AAD@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : srio-lld: Upgrade to version 02.00.00.14
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ee868aae19dd289b33db99ac705f46bc9e5c2d33
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ee868aae19dd289b33db99ac705f46bc9e5c2d33

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:10 2016 +0000

srio-lld: Upgrade to version 02.00.00.14

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index 2172a13..d697fb4 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -8,15 +8,15 @@ SRIO_LLD_GIT_PROTOCOL = "git"
 SRIO_LLD_GIT_BRANCH = "master"
 SRIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/srio"
 
-# commit ID corresponding to DEV.SRIO_LLD.02.00.00.13
-SRIO_LLD_SRCREV = "dc49972265afd3ffd3b29ca235b8ca6daf790bd1"
+# commit ID corresponding to DEV.SRIO_LLD.02.00.00.14
+SRIO_LLD_SRCREV = "d22dfe096b5ee6025388943e9eb626f149e6ac55"
 
 BRANCH = "${SRIO_LLD_GIT_BRANCH}"
 SRC_URI = "${SRIO_LLD_GIT_URI};destsuffix=${SRIO_LLD_GIT_DESTSUFFIX};protocol=${SRIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SRIO_LLD_SRCREV}"
 
-PV = "02.00.00.13"
-INC_PR = "r2"
+PV = "02.00.00.14"
+INC_PR = "r0"
 
 DEVICELIST = "k2h k2k"
 


