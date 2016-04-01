Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2606E00CA3; Fri,  1 Apr 2016 14:36:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE5B9E00CA0
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 14:35:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EFF4052AE8; Fri,  1 Apr 2016 21:35:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160401213552.EFF4052AE8@arago-project.org>
Date: Fri,  1 Apr 2016 21:35:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging 4.1: add PRU Ethernet FW dependency for AM4
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 42e8f306a9105e858e7190a3683b010c7d236ada
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=42e8f306a9105e858e7190a3683b010c7d236ada

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr  2 03:17:34 2016 +0000

linux-ti-staging 4.1: add PRU Ethernet FW dependency for AM4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 5d639b1..3e7d0af 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -41,6 +41,7 @@ RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
 RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -73,7 +74,7 @@ SRCREV = "6b41ca0b945d73ac8c8318083f79411639836643"
 PV = "4.1.18+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "k"
+MACHINE_KERNEL_PR_append = "l"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


