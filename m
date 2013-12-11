Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD06BE007D9
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 15:49:46 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A68052A83; Wed, 11 Dec 2013 23:49:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131211234946.2A68052A83@arago-project.org>
Date: Wed, 11 Dec 2013 23:49:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am437x-evm.conf: update UBI values specific to AM437x NAND
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
X-List-Received-Date: Wed, 11 Dec 2013 23:49:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 7d91b3d793ce6a96d04748c473d41cae948e2292
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7d91b3d793ce6a96d04748c473d41cae948e2292

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec 11 13:18:50 2013 -0500

am437x-evm.conf: update UBI values specific to AM437x NAND

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am437x-evm.conf |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

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


