Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FDE9E00C17; Mon, 19 May 2014 06:51:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1ABAE00BF7
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 06:51:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JDpkWH009930
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 08:51:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JDpkmn024633
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 08:51:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 08:51:45 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JDpjAF006068;	Mon, 19 May 2014 08:51:45 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WmNyj-0005ny-IP; Mon, 19 May 2014
	09:51:45 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 09:51:43 -0400
Message-ID: <1400507503-22284-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit: v2 2/3] keystone: k2l-evm conf: add k2l-evm machine config
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
X-List-Received-Date: Mon, 19 May 2014 13:51:54 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

k2l-evm machine config shares the same Keystone SoC family, it has K2L EVM
specific machine configuration for UBI image, boot monitor, U-boot, etc.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/include/keystone.inc            |    2 --
 conf/machine/k2hk-evm.conf                   |    4 ++++
 conf/machine/k2l-evm.conf                    |   30 ++++++++++++++++++++++++++
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    7 +++---
 4 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 conf/machine/k2l-evm.conf

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 63f069c..a9449b2 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -12,8 +12,6 @@ MACHINE_KERNEL_PR = "r7"
 
 KERNEL_IMAGETYPE = "uImage"
 
-UBOOT_MACHINE = "k2hk_evm_config"
-
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 4b05f40..0ef6ad0 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -4,6 +4,10 @@
 
 require conf/machine/include/keystone.inc
 
+UBOOT_MACHINE = "k2hk_evm_config"
+
+BOOT_MONITOR_MAKE_TARGET = "k2hk"
+
 IMAGE_FSTYPES += "ubi tar.gz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
new file mode 100644
index 0000000..0824a09
--- /dev/null
+++ b/conf/machine/k2l-evm.conf
@@ -0,0 +1,30 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2L machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2L EVM
+
+require conf/machine/include/keystone.inc
+
+UBOOT_MACHINE = "k2l_evm_config"
+
+BOOT_MONITOR_MAKE_TARGET = "k2hk"
+
+IMAGE_FSTYPES += "ubi tar.gz cpio"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+SYSVINIT_ENABLED_GETTYS = ""
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    4096
+# UBI: logical eraseblock size:    253952 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1926 LEBs
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    4096
+# UBI: physical eraseblock size:   256 KiB
+# UBI: sub-page size:              4096
+UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index c3d41f5..6e68213 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -5,7 +5,6 @@ LICENSE = "BSD"
 
 BOOT_MONITOR_BINARY ?= "skern.bin"
 BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
-BOOT_MONITOR_MAKE_TARGET  ?= "all"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
@@ -14,14 +13,14 @@ COMPATIBLE_MACHINE = "keystone"
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "2.0"
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-#Tag "K2_BM_13.11"
-SRCREV = "ba597d183423971e63295cdd59d3c90245e9170a"
+#Tag "K2_BM_14.05"
+SRCREV = "0e3ffe1ea4a0cee38ae2406901b7cf4d5324b5e9"
 
 do_compile () {
 	unset LDFLAGS
-- 
1.7.9.5


