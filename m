Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD73DE010BD; Sun, 17 Jun 2018 12:37:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B7BBE00E15
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 12:37:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA0A920C17;
	Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SWDSCoMuQkGR; Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 59112207AB;
	Sun, 17 Jun 2018 19:37:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B00581634AC;
	Sun, 17 Jun 2018 15:37:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sun, 17 Jun 2018 15:37:20 -0400
Message-Id: <1529264243-32781-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264243-32781-1-git-send-email-denys@ti.com>
References: <1529264243-32781-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/5] machine: am65xx-evm.conf: add machine definition for AM65xx platform
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:29 -0000

The AM654 SoC is a lead device of the K3 Multicore SoC architecture
platform, targeted for broad market and industrial control with aim to
meet the complex processing needs of modern embedded products.

See AM65x Technical Reference Manual (SPRUID7, April 2018)
for further details: http://www.ti.com/lit/pdf/spruid7

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 conf/machine/am65xx-evm.conf

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
new file mode 100644
index 0000000..6b3bdec
--- /dev/null
+++ b/conf/machine/am65xx-evm.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@NAME: AM65xx EVM
+#@DESCRIPTION: Machine configuration for the TI AM65xx EVM
+
+require conf/machine/include/k3.inc
+
+MACHINE_FEATURES += "touchscreen"
+
+IMAGE_FSTYPES += "tar.xz cpio cpio.xz wic.xz"
+
+SERIAL_CONSOLE = "115200 ttyS2"
+
+KERNEL_DEVICETREE = "ti/k3-am654-base-board.dtb"
+
+UBOOT_MACHINE = "am65x_evm_a53_defconfig"
+
+OPTEEMACHINE = "k3"
+OPTEEFLAVOR = "am65x"
+OPTEEOUTPUTMACHINE = "k3"
+
+WKS_FILE = "sdimage-bootpart.wks"
+IMAGE_BOOT_FILES = "u-boot.img"
+
+do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.7.4


