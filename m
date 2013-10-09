Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25829E0159B
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 15:00:39 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUF0088194BUND0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 09 Oct 2013 17:00:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C08820091; Wed,
	09 Oct 2013 18:00:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 09 Oct 2013 18:00:10 -0400
Message-id: <1381356010-21556-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ti33x: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Wed, 09 Oct 2013 22:00:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

To be used with latest u-boot that prefers zImage over uImage

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/ti33x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.3.2


