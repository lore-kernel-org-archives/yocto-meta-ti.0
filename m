Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77736E0159A
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 19:27:51 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTL0072VYTN7V91@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Sep 2013 21:27:36 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7DF3720173; Mon,
	23 Sep 2013 22:27:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Sep 2013 22:27:10 -0400
Message-id: <1379989631-8098-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1379989631-8098-1-git-send-email-denis@denix.org>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/4] linux-ti-staging: make 3.12-rc the default for supported platforms, drop omap5-sevm.dtb
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
X-List-Received-Date: Tue, 24 Sep 2013 02:27:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

* DTB for OMAP5 sEVM was removed upstream, drop it from the recipe
* Don't mask the default preference to be picked up normally by supported machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index d3d11d2..e903215 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -17,15 +17,13 @@ RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb"
 KERNEL_DEVICETREE_am437x-evm = "am43x-epos-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
-DEFAULT_PREFERENCE = "-1"
-
 S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
-- 
1.8.3.2


