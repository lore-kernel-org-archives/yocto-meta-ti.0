Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B5C8E01481
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:58 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV008E2QS247B2@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 180D820077; Mon,
	18 Mar 2013 19:33:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:27 -0400
Message-id: <1363649547-4693-20-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 19/19] beagleboard: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Mon, 18 Mar 2013 23:33:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beagleboard.conf  | 2 ++
 conf/machine/include/omap3.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index a65e360..f923119 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -8,6 +8,8 @@ require conf/machine/include/omap3.inc
 GUI_MACHINE_CLASS = "bigscreen"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
+PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"
 
 IMAGE_FSTYPES += "tar.gz ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 99f0c80..212ebe7 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r123"
+MACHINE_KERNEL_PR = "r124"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.8.1.5


