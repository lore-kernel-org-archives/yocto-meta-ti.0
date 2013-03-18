Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D2EAE01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:59:18 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV004C4E2IXAS2@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 13:59:07 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8C68020077; Mon,
	18 Mar 2013 14:59:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 14:59:06 -0400
Message-id: <1363633146-22749-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCHv2 2/3] ti33x: switch default preference to ti-staging tree
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
X-List-Received-Date: Mon, 18 Mar 2013 18:59:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

SDKs or other users of meta-ti can still use one of the older 3.2 recipes for
stability or featureset, by setting PREFERRED_PROVIDER in distro or local config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - make unified change in SOC include file

 conf/machine/am335x-evm.conf   | 2 --
 conf/machine/beaglebone.conf   | 2 --
 conf/machine/include/ti33x.inc | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 91f7e54..21e79a2 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -13,8 +13,6 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
-
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index f4112f5..8a83a1a 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -7,8 +7,6 @@ require conf/machine/include/ti33x.inc
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
-
 IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index f00c797..62afe16 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -19,7 +19,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 MACHINE_KERNEL_PR = "r18"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 KERNEL_IMAGETYPE = "uImage"
-- 
1.8.1.5


