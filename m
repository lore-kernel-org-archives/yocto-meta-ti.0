Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68713E0136C
	for <meta-ti@yoctoproject.org>; Fri, 29 Mar 2013 10:35:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 36A82529B3; Fri, 29 Mar 2013 17:35:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130329173547.36A82529B3@arago-project.org>
Date: Fri, 29 Mar 2013 17:35:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : dra7xx-evm: Add DRA7xx machine type
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
X-List-Received-Date: Fri, 29 Mar 2013 17:35:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 886bea2308bdd56ac7eae24436a84a7c863e72fa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=886bea2308bdd56ac7eae24436a84a7c863e72fa

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Mar 29 08:59:00 2013 -0500

dra7xx-evm: Add DRA7xx machine type

* Add the dra7xx-evm machine type which is part of the omap-a15
  SOC_FAMILY

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
new file mode 100644
index 0000000..5543891
--- /dev/null
+++ b/conf/machine/dra7xx-evm.conf
@@ -0,0 +1,36 @@
+#@TYPE: Machine
+#@NAME: DRA7xx EVM
+#@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
+
+require conf/machine/include/omap-a15.inc
+
+IMAGE_FSTYPES += "ubi tar.gz"
+
+SERIAL_CONSOLE = "115200 ttyO2"
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
+UBOOT_MACHINE = "dra7xx_evm_config"
+
+# Currently removing the sgx machine feature because there is no SGX package
+# available for omap5
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"


