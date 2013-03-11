Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D753E00734
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:49:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7E34652AA1; Mon, 11 Mar 2013 20:49:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311204905.7E34652AA1@arago-project.org>
Date: Mon, 11 Mar 2013 20:49:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : hawkboard: remove machine definition, since it' s unsupported
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
X-List-Received-Date: Mon, 11 Mar 2013 20:49:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 24520543b12d8f05f8bf6ab18d3cc4dca23b6c31
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24520543b12d8f05f8bf6ab18d3cc4dca23b6c31

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 15:09:09 2013 -0500

hawkboard: remove machine definition, since it's unsupported

There is no support for this board from meta-ti. Plus I don't have the board.
If there's anyone willing to maintain it, please let me know.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/hawkboard.conf |   29 -----------------------------
 1 files changed, 0 insertions(+), 29 deletions(-)

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


