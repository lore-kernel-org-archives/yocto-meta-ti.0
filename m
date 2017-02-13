Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 120FAE0086E; Mon, 13 Feb 2017 14:22:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDDB6E00754
	for <meta-ti@yoctoproject.org>; Mon, 13 Feb 2017 14:22:56 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB22620B52;
	Mon, 13 Feb 2017 22:22:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Wb-GnDyNQ6GJ; Mon, 13 Feb 2017 22:22:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB678208B1;
	Mon, 13 Feb 2017 22:22:54 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 271B4162325;
	Mon, 13 Feb 2017 17:22:54 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 13 Feb 2017 17:22:53 -0500
Message-Id: <1487024573-96637-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] am180x-evm: update machine config to work with latest BSP
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
X-List-Received-Date: Mon, 13 Feb 2017 22:22:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am180x-evm.conf     | 4 +++-
 recipes-bsp/u-boot/u-boot-ti.inc | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index f83814e..ef248a3 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -11,6 +11,8 @@ UBOOT_SUFFIX = "ais"
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
 
-IMAGE_FSTYPES += "tar.gz"
+IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLE = "115200 ttyS2"
+
+KERNEL_DEVICETREE = "da850-evm.dtb da850-lcdk.dtb"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index c53689e..7c19097 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -49,6 +49,7 @@ SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 
 SPL_BINARY = "MLO"
 SPL_BINARY_k2e-hs-evm = ""
+SPL_BINARY_omapl138 = ""
 SPL_UART_BINARY = "u-boot-spl.bin"
 
 # Keystone specifics
-- 
2.7.4


