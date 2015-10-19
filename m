Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9DEDE00ADD; Mon, 19 Oct 2015 14:11:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84713E0071C
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 156B552AB6; Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211147.156B552AB6@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 1.0.8.3
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 8f104fb8f8d689fc9f2fd37ab4cfa75947c93685
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f104fb8f8d689fc9f2fd37ab4cfa75947c93685

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:37:36 2015 +0000

mpm-transport: Update to new version 1.0.8.3

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index fd68721..752ada5 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -8,10 +8,10 @@ DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld cmem rm-lld qmss-lld cppi
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.07.00A
-SRCREV = "267db40a9c551bd91dbed470d57cd1ed0d9e9141"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.08.03
+SRCREV = "f6c5426d68c2be832903b6d215370c94e134167f"
 
-PV = "1.0.7.0"
+PV = "1.0.8.3"
 PR = "r1"
 
 S = "${WORKDIR}/git"


