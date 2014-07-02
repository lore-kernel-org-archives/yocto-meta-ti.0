Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06743E00796; Wed,  2 Jul 2014 13:03:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C539DE00710
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8630752A5D; Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200326.8630752A5D@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : am57xx-evm: Add the AM57xx machine type
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: ff0b3236c442b96b82302573754087681ed90e64
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ff0b3236c442b96b82302573754087681ed90e64

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue Jul  1 19:36:07 2014 +0000

am57xx-evm: Add the AM57xx machine type

* Add the AM57xx machine type which is used to differentiate
  between the AM57xx and the DRA7xx which are derivative devices
  with different HW platforms and SoC capabilities.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-evm.conf |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
new file mode 100644
index 0000000..7069b44
--- /dev/null
+++ b/conf/machine/am57xx-evm.conf
@@ -0,0 +1,36 @@
+#@TYPE: Machine
+#@NAME: DRA7xx EVM
+#@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
+
+require conf/machine/include/dra7xx.inc
+
+IMAGE_FSTYPES += "ubi tar.gz"
+
+SERIAL_CONSOLE = "115200 ttyO0"
+
+UBOOT_MACHINE = "dra7xx_evm_config"
+
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+# Currently removing the sgx machine feature because there is no SGX package
+# available for omap5
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"


