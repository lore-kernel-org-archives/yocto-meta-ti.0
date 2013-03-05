Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18530E014CB
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:11:36 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ700AV6KAGP8B0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Mar 2013 16:11:20 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A94AF20530; Tue,
	05 Mar 2013 17:11:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Mar 2013 17:10:33 -0500
Message-id: <1362521433-9996-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1362521433-9996-1-git-send-email-denis@denix.org>
References: <1362521433-9996-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/5] am180x: cleanup machine config, remove common SoC settings
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
X-List-Received-Date: Tue, 05 Mar 2013 22:11:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am180x-evm.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index 827885b..7ea25cf 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -11,9 +11,6 @@ UBOOT_LOADADDRESS = "0xc0008000"
 
 IMAGE_FSTYPES += "tar.gz ubi"
 
-MACHINE_FEATURES = "kernel26 serial ethernet"
-
 SERIAL_CONSOLE = "115200 ttyS2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omapl138-psp"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-- 
1.8.1.5


