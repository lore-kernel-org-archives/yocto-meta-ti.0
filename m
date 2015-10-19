Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66B1EE0048C; Mon, 19 Oct 2015 14:11:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F6FEE006EA
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B5D6852A95; Mon, 19 Oct 2015 21:11:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211146.B5D6852A95@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : iqn2-lld: Update to new version 1.0.0.8
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: bcbe627ac50e4998b509e6eb17257a884f3ae221
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bcbe627ac50e4998b509e6eb17257a884f3ae221

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:25:51 2015 +0000

iqn2-lld: Update to new version 1.0.0.8

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/iqn2-lld/iqn2-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index fb6886f..812d3f6 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -3,10 +3,10 @@ LICENSE = "BSD-3-Clause"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git;destsuffix=git/ti/drv/iqn2;protocol=git;branch=${BRANCH}"
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.07A
-SRCREV = "94017e30c87853e48f6e947186c5075289b190c6"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.08F
+SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
 
-PV = "1.0.0.7"
+PV = "1.0.0.8"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 


