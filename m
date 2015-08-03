Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D456E00A01; Mon,  3 Aug 2015 12:24:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41790E009D9
	for <meta-ti@yoctoproject.org>; Mon,  3 Aug 2015 12:24:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 021D852A08; Mon,  3 Aug 2015 19:24:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150803192445.021D852A08@arago-project.org>
Date: Mon,  3 Aug 2015 19:24:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging 4.1: update to 4.1.4
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
X-List-Received-Date: Mon, 03 Aug 2015 19:24:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ac0d92a2526f396ce28d4cb604e1a46e6604d56d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ac0d92a2526f396ce28d4cb604e1a46e6604d56d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug  4 01:20:47 2015 +0000

linux-ti-staging 4.1: update to 4.1.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index cd4497a..67fba2c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -47,11 +47,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.1.y"
 
-SRCREV = "83b86ca5dacc381b5c21db27aba348f187890632"
-PV = "4.1.3+git${SRCPV}"
+SRCREV = "583d3e9ad9f1610b3ac0c531b10fed1cad466b5c"
+PV = "4.1.4+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


