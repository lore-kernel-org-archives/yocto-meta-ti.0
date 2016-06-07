Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB352E00C97; Tue,  7 Jun 2016 15:08:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A622E00C49
	for <meta-ti@yoctoproject.org>; Tue,  7 Jun 2016 15:08:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D9E9552A5B; Tue,  7 Jun 2016 22:08:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160607220830.D9E9552A5B@arago-project.org>
Date: Tue,  7 Jun 2016 22:08:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ipumm-fw: bump for codec updates and bugfixes
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
X-List-Received-Date: Tue, 07 Jun 2016 22:08:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: c0c9802a6842bb28e392a78f0e749801588de739
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c0c9802a6842bb28e392a78f0e749801588de739

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jun  2 23:21:26 2016 +0000

ipumm-fw: bump for codec updates and bugfixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index f415599..32d51cb 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,11 +17,11 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "c579a48d3b201fe276e406add64512eb5e90e75f"
+SRCREV = "a55e6e7b3a8b6917155f3f7ed6c10ed6170df3e7"
 
 S = "${WORKDIR}/git"
 
-PV = "3.00.10.00"
+PV = "3.00.10.01"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
@@ -66,4 +66,4 @@ ALTERNATIVE_PRIORITY = "20"
 
 FILES_${PN} += "${base_libdir}/firmware/*"
 
-PR = "r1"
+PR = "r0"


