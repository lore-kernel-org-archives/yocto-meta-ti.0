Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9915EE0083D; Mon, 19 Sep 2016 16:00:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E43BFE0083E
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 15:59:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9B15052AC9; Mon, 19 Sep 2016 22:59:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160919225955.9B15052AC9@arago-project.org>
Date: Mon, 19 Sep 2016 22:59:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.4.21 and ti2016. 04-rc2 tag
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
X-List-Received-Date: Mon, 19 Sep 2016 23:00:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1ddcc7c8e2e0f2c521f03ba22a2c60f142a596e0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1ddcc7c8e2e0f2c521f03ba22a2c60f142a596e0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 19 22:59:30 2016 +0000

linux-ti-staging: update to 4.4.21 and ti2016.04-rc2 tag

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index 049a7ee..8b79fe5 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "f8c45f6a24b969bfe5a734ebd721ab9c0a3d9f0c"
+SRCREV = "7e80288aba5918c3ce2d80050c644331f9750cce"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index f005dd2..9b791ab 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -76,8 +76,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "00f19d3e5347c2992fe0de52cabe5d379673973d"
-PV = "4.4.20+git${SRCPV}"
+SRCREV = "4fb4591a4ab1b3ef317fa87af3cd3c06f1a7284b"
+PV = "4.4.21+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"


