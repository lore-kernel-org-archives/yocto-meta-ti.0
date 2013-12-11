Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66481E007DA
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 10:35:41 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXN00JD2NMSBK10@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 11 Dec 2013 12:35:16 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EC1DD2016B; Wed,
	11 Dec 2013 13:35:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Dec 2013 13:35:05 -0500
Message-id: <1386786908-6652-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/4] am437x-evm.conf: update UBI values specific to AM437x NAND
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
X-List-Received-Date: Wed, 11 Dec 2013 18:35:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-evm.conf | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 901bfe8..266f1fd 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -18,18 +18,18 @@ SERIAL_CONSOLE = "115200 ttyO0"
 # details about this board please see
 # http://processors.wiki.ti.com/index.php/UBIFS_Support
 
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
+# UBI: smallest flash I/O unit:    4096
+# UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
-# UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+# UBI device number 0, total 994 LEBs
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 994"
 
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-# UBI: VID header offset:          2048 (aligned 2048)
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+# UBI: smallest flash I/O unit:    4096
+# UBI: physical eraseblock size:   262144 bytes (256 KiB)
+# UBI: sub-page size:              4096
+# UBI: VID header offset:          4096 (aligned 4096)
+UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
-- 
1.8.3.2


