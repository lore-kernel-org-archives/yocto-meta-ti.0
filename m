Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA7BEE00ABE; Wed, 17 Oct 2018 15:04:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 364 seconds by postgrey-1.32 at yocto-www;
	Wed, 17 Oct 2018 15:04:52 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D1D3E00A94
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:04:52 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D7C8420D4D;
	Wed, 17 Oct 2018 21:58:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m3BHKqHwqXPi; Wed, 17 Oct 2018 21:58:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8A2D20D44;
	Wed, 17 Oct 2018 21:58:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1E5EE1648EE;
	Wed, 17 Oct 2018 17:58:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 17:58:39 -0400
Message-Id: <1539813520-35570-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539813520-35570-1-git-send-email-denis@denix.org>
References: <1539813520-35570-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] u-boot-ti: move setting UBOOT_SUFFIX and SPL_BINARY to machine configs
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
X-List-Received-Date: Wed, 17 Oct 2018 22:04:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index f22fcb4..d3267be 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -11,6 +11,7 @@ def get_git_revision(p):
 UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
 
 UBOOT_SUFFIX ?= "img"
+SPL_BINARY ?= "MLO"
 
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 
@@ -50,15 +51,6 @@ S = "${WORKDIR}/git"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-# SPL (Second Program Loader)
-SPL_BINARY = "MLO"
-SPL_BINARY_k2e-hs-evm = ""
-SPL_BINARY_k2hk-hs-evm = ""
-SPL_BINARY_k2g-hs-evm = ""
-SPL_BINARY_k2l-hs-evm = ""
-SPL_BINARY_omapl138 = ""
-SPL_BINARY_k3 = "tispl.bin"
-
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY = "u-boot-spl.bin"
 SPL_UART_BINARY_keystone = ""
@@ -67,9 +59,6 @@ SPL_UART_BINARY_k3 = ""
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 
-# Keystone specifics
-UBOOT_SUFFIX_keystone = "bin"
-
 # SPI NOR Flash binaries
 UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
 UBOOT_SPI_SPL_BINARY_k2e-hs-evm = ""
-- 
2.7.4


