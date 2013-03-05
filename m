Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85F94E014E2
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:11:50 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ70051PKATF1S2@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Mar 2013 16:11:28 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E9F7C2058B; Tue,
	05 Mar 2013 17:11:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Mar 2013 17:11:08 -0500
Message-id: <1362521470-10038-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 1/3] hawkboard: remove machine definition, since it's unsupported
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
X-List-Received-Date: Tue, 05 Mar 2013 22:11:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

There is no support for this board from meta-ti. Plus I don't have the board.
If there's anyone willing to maintain it, please let me know.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/hawkboard.conf | 29 -----------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 conf/machine/hawkboard.conf

diff --git a/conf/machine/hawkboard.conf b/conf/machine/hawkboard.conf
deleted file mode 100644
index b6e7f2d..0000000
--- a/conf/machine/hawkboard.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-#@TYPE: Machine
-#@NAME: OMAP-L138 based board
-#@DESCRIPTION: Machine configuration for the TI Hawkboard
-
-require conf/machine/include/davinci.inc
-require conf/machine/include/omapl138.inc
-
-UBOOT_MACHINE = "da850_omapl138_evm_config"
-UBOOT_ENTRYPOINT = "0xc0008000"
-UBOOT_LOADADDRESS = "0xc0008000"
-
-MACHINE_FEATURES = "kernel26 serial ethernet ide screen"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 971 LEBs (123293696 bytes, 117.6 MiB), available 958 LEBs (121643008 bytes, 116.0 MiB), LEB size 126976 bytes (124.0 KiB)
-MKUBIFS_ARGS = "-m 2048 -e 126976 -c 948"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
-
-SERIAL_CONSOLE = "115200 ttyS2"
-- 
1.8.1.5


