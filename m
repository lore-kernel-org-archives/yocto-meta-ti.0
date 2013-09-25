Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3612AE01601
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 12:50:21 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTP008FV5R44QT3@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 25 Sep 2013 14:49:53 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4AC96200BD; Wed,
	25 Sep 2013 15:49:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 25 Sep 2013 15:49:51 -0400
Message-id: <1380138591-17071-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Tom Rini <trini@ti.com>
Subject: [PATCHv2 4/4] ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Wed, 25 Sep 2013 19:50:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

* To be used with latest u-boot, that prefers zImage over uImage
* ti33x will follow as soon as u-boot changes its default for that platform

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>
---
v2 - don't change the default for ti33x yet, wait for u-boot

 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 623f2df..aba122a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 62da105..adb66e3 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"
-- 
1.8.3.2


