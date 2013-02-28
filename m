Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86105E003BC
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2013 12:20:27 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1986352A9A; Thu, 28 Feb 2013 20:20:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130228202027.1986352A9A@arago-project.org>
Date: Thu, 28 Feb 2013 20:20:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone-evm config: add ubifs support
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
X-List-Received-Date: Thu, 28 Feb 2013 20:20:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a5ebeba1c708c0aef6e7af5671ac516602052284
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a5ebeba1c708c0aef6e7af5671ac516602052284

Author: Hao Zhang <hzhang@ti.com>
Date:   Tue Feb 26 14:48:50 2013 -0500

keystone-evm config: add ubifs support

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/keystone-evm.conf |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index e73d84b..13df843 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -14,7 +14,7 @@ require conf/machine/include/keystone.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
-IMAGE_FSTYPES += "tar.bz2 cpio"
+IMAGE_FSTYPES += "ubi tar.bz2 cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
@@ -23,3 +23,18 @@ SYSVINIT_ENABLED_GETTYS = ""
 UBOOT_MACHINE = "tci6638_evm_config"
 
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 857 LEBs
+# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              2048
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"


