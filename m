Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BA26E00AB9; Mon, 24 Apr 2017 16:03:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAB8CE00867
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 16:03:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8222B20B85;
	Mon, 24 Apr 2017 23:03:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hGdFhVf7-hp2; Mon, 24 Apr 2017 23:03:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6197D2006A;
	Mon, 24 Apr 2017 23:03:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E331516247B;
	Mon, 24 Apr 2017 19:03:20 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Apr 2017 19:03:20 -0400
Message-Id: <1493075000-25046-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] u-boot-ti.inc: add support for k2hk-hs-evm and k2g-hs-evm
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
X-List-Received-Date: Mon, 24 Apr 2017 23:03:27 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 0d6a4b8..68b7989 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -45,6 +45,8 @@ export TI_SECURE_DEV_PKG
 # SPL (Second Program Loader)
 SPL_BINARY = "MLO"
 SPL_BINARY_k2e-hs-evm = ""
+SPL_BINARY_k2hk-hs-evm = ""
+SPL_BINARY_k2g-hs-evm = ""
 SPL_BINARY_omapl138 = ""
 
 # SPL (Second Program Loader) to be loaded over UART
@@ -60,9 +62,13 @@ UBOOT_SUFFIX_keystone = "bin"
 # SPI NOR Flash binaries
 UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
 UBOOT_SPI_SPL_BINARY_k2e-hs-evm = ""
+UBOOT_SPI_SPL_BINARY_k2hk-hs-evm = ""
+UBOOT_SPI_SPL_BINARY_k2g-hs-evm = ""
 UBOOT_SPI_BINARY = "u-boot.img"
 UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
 UBOOT_SPI_GPH_BINARY_k2e-hs-evm = ""
+UBOOT_SPI_GPH_BINARY_k2hk-hs-evm = ""
+UBOOT_SPI_GPH_BINARY_k2g-hs-evm = ""
 
 # SPI NOR Flash deployed images
 UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
-- 
2.7.4


