Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 741A8E00CCC; Mon, 21 Mar 2016 08:44:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22E9CE00CC5
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:44:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CEB3652AE8; Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160321154434.CEB3652AE8@arago-project.org>
Date: Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : srio-lld: Update to version 2.0.0.15
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
X-List-Received-Date: Mon, 21 Mar 2016 15:44:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2f62e739376e1bfccaa07abf66808375380b82b5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2f62e739376e1bfccaa07abf66808375380b82b5

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Mar 21 20:51:11 2016 +0000

srio-lld: Update to version 2.0.0.15

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index d697fb4..f8ff7b3 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -8,14 +8,14 @@ SRIO_LLD_GIT_PROTOCOL = "git"
 SRIO_LLD_GIT_BRANCH = "master"
 SRIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/srio"
 
-# commit ID corresponding to DEV.SRIO_LLD.02.00.00.14
-SRIO_LLD_SRCREV = "d22dfe096b5ee6025388943e9eb626f149e6ac55"
+# commit ID corresponding to DEV.SRIO_LLD.02.00.00.15
+SRIO_LLD_SRCREV = "b773a7d08225c30737abc45ebc92a186bac08797"
 
 BRANCH = "${SRIO_LLD_GIT_BRANCH}"
 SRC_URI = "${SRIO_LLD_GIT_URI};destsuffix=${SRIO_LLD_GIT_DESTSUFFIX};protocol=${SRIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SRIO_LLD_SRCREV}"
 
-PV = "02.00.00.14"
+PV = "02.00.00.15"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k"


