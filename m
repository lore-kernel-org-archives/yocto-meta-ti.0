Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A008E00AA5; Tue,  3 Nov 2015 12:57:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1183E00B01
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 12:57:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 67D8352AB7; Tue,  3 Nov 2015 20:57:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151103205744.67D8352AB7@arago-project.org>
Date: Tue,  3 Nov 2015 20:57:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : k2g-evm: add K2G platform
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
X-List-Received-Date: Tue, 03 Nov 2015 20:57:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 88b45cf17553663dc3a8a56a170ca702bb885cb1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=88b45cf17553663dc3a8a56a170ca702bb885cb1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Oct 31 04:46:31 2015 +0000

k2g-evm: add K2G platform

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2g-evm.conf                    |   30 ++++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb |    1 +
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
new file mode 100644
index 0000000..9c7b4e0
--- /dev/null
+++ b/conf/machine/k2g-evm.conf
@@ -0,0 +1,30 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2G machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2G EVM
+
+require conf/machine/include/keystone.inc
+
+UBOOT_MACHINE = "k2g_evm_config"
+
+BOOT_MONITOR_MAKE_TARGET = "k2g"
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
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index c8c3f2c..11e7acc 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -43,6 +43,7 @@ KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-es.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
+KERNEL_DEVICETREE_k2g-evm = "k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"


