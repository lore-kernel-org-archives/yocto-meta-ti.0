Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAA0BE009F8; Sat, 18 Feb 2017 16:43:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96B8EE009F5
	for <meta-ti@yoctoproject.org>; Sat, 18 Feb 2017 16:43:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4C4BF52975; Sun, 19 Feb 2017 00:43:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170219004339.4C4BF52975@arago-project.org>
Date: Sun, 19 Feb 2017 00:43:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti.inc: restructure SPL/UART variables, disable k2e-hs-evm
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
X-List-Received-Date: Sun, 19 Feb 2017 00:43:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 3e118a8b4b0ab2dbbd97a3ded1f621ba68735915
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3e118a8b4b0ab2dbbd97a3ded1f621ba68735915

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Feb 18 19:42:31 2017 -0500

u-boot-ti.inc: restructure SPL/UART variables, disable k2e-hs-evm

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti.inc |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 7c19097..0c0b6e8 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -42,19 +42,21 @@ S = "${WORKDIR}/git"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-# SPL (Second Program Loader) to be loaded over UART
-SPL_UART_BINARY ?= ""
-SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
-SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
-
+# SPL (Second Program Loader)
 SPL_BINARY = "MLO"
 SPL_BINARY_k2e-hs-evm = ""
 SPL_BINARY_omapl138 = ""
+
+# SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY = "u-boot-spl.bin"
+SPL_UART_BINARY_k2e-hs-evm = ""
+SPL_UART_BINARY_keystone = ""
+
+SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
+SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 
 # Keystone specifics
 UBOOT_SUFFIX_keystone = "bin"
-SPL_UART_BINARY_keystone = ""
 
 # SPI NOR Flash binaries
 UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"


