Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0093EE00519; Mon, 27 Feb 2017 15:20:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B49DEE004E5
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 15:20:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5584F52A3D; Mon, 27 Feb 2017 23:20:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170227232012.5584F52A3D@arago-project.org>
Date: Mon, 27 Feb 2017 23:20:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: update to 3.00.13.00
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
X-List-Received-Date: Mon, 27 Feb 2017 23:20:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 103e50bebe91be68eef620dfc0c7b918fe31152f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=103e50bebe91be68eef620dfc0c7b918fe31152f

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Sat Feb 25 09:50:47 2017 +0000

ipumm-fw: update to 3.00.13.00

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 942ab93..1a5d285 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "97efa6fa9fc108096fcc18404a2d0ef43f9304ac"
+SRCREV = "fd441443a4289c801a0c8d9f00b6966f7fe3476c"
 
 S = "${WORKDIR}/git"
 
-PV = "3.00.12.00"
-PR = "r2"
+PV = "3.00.13.00"
+PR = "r5"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc


