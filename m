Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD009E00B72; Fri, 30 Oct 2015 15:46:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B20F8E00B70
	for <meta-ti@yoctoproject.org>; Fri, 30 Oct 2015 15:46:33 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NX200HJR1XKXPM0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 30 Oct 2015 17:46:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=5lJygRwiOn0A:10 a=sozttTNsAAAA:8
	a=AnlVjmvmy3SNboVgtkYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F3CC7161CBD;	Fri,
	30 Oct 2015 18:46:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 30 Oct 2015 18:46:31 -0400
Message-id: <1446245191-25380-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1446245191-25380-1-git-send-email-denis@denix.org>
References: <1446245191-25380-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] k2g-evm: add K2G platform
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
X-List-Received-Date: Fri, 30 Oct 2015 22:46:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/k2g-evm.conf                    | 30 ++++++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 conf/machine/k2g-evm.conf

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
-- 
2.2.0


