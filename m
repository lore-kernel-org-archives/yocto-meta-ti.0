Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50E36E01498
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:58 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV008E2QS247B2@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F1E2219DA; Mon,
	18 Mar 2013 19:33:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:24 -0400
Message-id: <1363649547-4693-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 16/19] am180x: switch default u-boot preference to machine-specific tree
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
 conf/machine/am180x-evm.conf     | 2 ++
 conf/machine/include/davinci.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index 7ea25cf..cff1565 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -14,3 +14,5 @@ IMAGE_FSTYPES += "tar.gz ubi"
 SERIAL_CONSOLE = "115200 ttyS2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omapl138-psp"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am180x"
+PREFERRED_PROVIDER_u-boot = "u-boot-am180x"
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 756a1e5..6be5eb7 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/tune-arm926ejs.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r52"
+MACHINE_KERNEL_PR = "r53"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.8.1.5


