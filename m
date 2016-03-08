Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CAF4E00B8B; Tue,  8 Mar 2016 15:44:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E0AEE00951
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3654752AD1; Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234430.3654752AD1@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ipumm-fw: update to 3.00.10.00 version
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1a04a95a371ac29791ea870154c4e23ea6d3269d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1a04a95a371ac29791ea870154c4e23ea6d3269d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Mar  9 00:18:12 2016 +0000

ipumm-fw: update to 3.00.10.00 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index b54306c..022d307 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,11 +17,11 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "486aa14f700783dbee63a0d81fb2e57d27a286e6"
+SRCREV = "c579a48d3b201fe276e406add64512eb5e90e75f"
 
 S = "${WORKDIR}/git"
 
-PV = "3.00.09.01"
+PV = "3.00.10.00"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
@@ -59,4 +59,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r2"
+PR = "r0"


