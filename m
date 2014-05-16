Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51E27E00716; Fri, 16 May 2014 12:13:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2CCBE00716
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:13:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJDtDM031719
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:13:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJDtSt008212
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:13:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:13:54 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJDs8E015792;	Fri, 16 May 2014 14:13:55 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNZq-0006MG-PE; Fri, 16 May 2014
	15:13:54 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 May 2014 15:13:53 -0400
Message-ID: <1400267633-24410-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/3] keystone: machine config: change machine config name from keystone-evm to k2hk-evm
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
X-List-Received-Date: Fri, 16 May 2014 19:13:58 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Keystone II SOC family has multiple devices and EVMs: k2hk, k2l
and k2e, each EVM should have a separate machine config, and share
the common keystone SOC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/k2hk-evm.conf                     |   26 ++++++++++++++++++++++++
 conf/machine/keystone-evm.conf                 |   26 ------------------------
 recipes-bsp/boot-monitor/boot-monitor_git.bb   |    2 +-
 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    2 +-
 recipes-kernel/linux/linux-keystone_3.10.bb    |    2 +-
 5 files changed, 29 insertions(+), 29 deletions(-)
 create mode 100644 conf/machine/k2hk-evm.conf
 delete mode 100644 conf/machine/keystone-evm.conf

diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
new file mode 100644
index 0000000..088e524
--- /dev/null
+++ b/conf/machine/k2hk-evm.conf
@@ -0,0 +1,26 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2
+
+require conf/machine/include/keystone.inc
+
+IMAGE_FSTYPES += "ubi tar.gz cpio"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+SYSVINIT_ENABLED_GETTYS = ""
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 3856 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              2048
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
deleted file mode 100644
index 088e524..0000000
--- a/conf/machine/keystone-evm.conf
+++ /dev/null
@@ -1,26 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2
-
-require conf/machine/include/keystone.inc
-
-IMAGE_FSTYPES += "ubi tar.gz cpio"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
-SYSVINIT_ENABLED_GETTYS = ""
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              2048
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 7c5e9cf..0b559fa 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -9,7 +9,7 @@ BOOT_MONITOR_MAKE_TARGET  ?= "all"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
-COMPATIBLE_MACHINE = "keystone-evm"
+COMPATIBLE_MACHINE = "k2hk-evm"
 
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index cbd02d6..eb4bbd2 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 54cb86a..93b5481 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-- 
1.7.9.5


