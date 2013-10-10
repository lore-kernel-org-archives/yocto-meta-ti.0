Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6237BE0163D
	for <meta-ti@yoctoproject.org>; Thu, 10 Oct 2013 09:18:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7FB825299B; Thu, 10 Oct 2013 16:18:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131010161854.7FB825299B@arago-project.org>
Date: Thu, 10 Oct 2013 16:18:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti33x: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Thu, 10 Oct 2013 16:18:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6903f2aba8e1c159ef14dcd216d6c7832e409f28
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6903f2aba8e1c159ef14dcd216d6c7832e409f28

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct  9 17:59:18 2013 -0400

ti33x: switch KERNEL_IMAGETYPE to zImage by default

To be used with latest u-boot that prefers zImage over uImage

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 conf/machine/include/ti33x.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 12b80c6..8a91a52 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -16,14 +16,14 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r19"
+MACHINE_KERNEL_PR = "r20"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"


