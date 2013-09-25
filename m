Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73DA8E01623
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 13:57:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5C5D4529E2; Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130925205739.5C5D4529E2@arago-project.org>
Date: Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: make 3. 12-rc the default for supported platforms, drop omap5-sevm.dtb
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
X-List-Received-Date: Wed, 25 Sep 2013 20:57:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f472c8dca139f061db03c8ccad5857587461627e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f472c8dca139f061db03c8ccad5857587461627e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 23 22:16:11 2013 -0400

linux-ti-staging: make 3.12-rc the default for supported platforms, drop omap5-sevm.dtb

* DTB for OMAP5 sEVM was removed upstream, drop it from the recipe
* Don't mask the default preference to be picked up normally by supported machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

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


