Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89B9DE00BE8; Wed, 21 May 2014 12:32:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A694E00B6F
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:32:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 367BD52A6D; Wed, 21 May 2014 19:32:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521193203.367BD52A6D@arago-project.org>
Date: Wed, 21 May 2014 19:32:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: k2l-evm conf: add k2l-evm machine config
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
X-List-Received-Date: Wed, 21 May 2014 19:32:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 804c2bc8f238351fd34abe5695d2dee695ba0636
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=804c2bc8f238351fd34abe5695d2dee695ba0636

Author: Hao Zhang <hzhang@ti.com>
Date:   Mon May 19 19:51:43 2014 +0000

keystone: k2l-evm conf: add k2l-evm machine config

k2l-evm machine config shares the same Keystone SoC family, it has K2L EVM
specific machine configuration for UBI image, boot monitor, U-boot, etc.

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc            |    2 -
 conf/machine/k2hk-evm.conf                   |    4 +++
 conf/machine/k2l-evm.conf                    |   30 ++++++++++++++++++++++++++
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    7 ++---
 4 files changed, 37 insertions(+), 6 deletions(-)

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


