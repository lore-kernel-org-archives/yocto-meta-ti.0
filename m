Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 688E9E00ACE; Fri,  4 Nov 2016 14:41:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AFCCE007C2
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2016 14:41:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2E1CB52987; Fri,  4 Nov 2016 21:41:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161104214107.2E1CB52987@arago-project.org>
Date: Fri,  4 Nov 2016 21:41:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: pull in prueth-fw for k2g
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
X-List-Received-Date: Fri, 04 Nov 2016 21:41:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 296cbc1c586a3ad8e78ffbebec899fd2649ea64e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=296cbc1c586a3ad8e78ffbebec899fd2649ea64e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov  3 02:19:44 2016 +0000

linux-ti-staging: pull in prueth-fw for k2g

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 2f67a01..ddc221d 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -46,6 +46,7 @@ RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
 RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
 RDEPENDS_kernel-base_append_am335x-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_k2g = " prueth-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -83,7 +84,7 @@ SRCREV = "83973c23389df9755070a003b3a596beae056714"
 PV = "4.4.29+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"


