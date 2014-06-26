Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B792E00563; Thu, 26 Jun 2014 11:18:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7DDAE0043B
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 11:18:35 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7S00BZGG6JUPM0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 26 Jun 2014 13:18:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 18D5520091; Thu,
	26 Jun 2014 14:18:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Jun 2014 14:18:15 -0400
Message-id: <1403806695-6302-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Cc: Tom Rini <trini@ti.com>
Subject: [PATCH v2] u-boot: switch from SPL/MLO to "ais" image for omapl138 SOCs
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
X-List-Received-Date: Thu, 26 Jun 2014 18:18:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>
---
 conf/machine/am180x-evm.conf         | 4 +++-
 recipes-bsp/u-boot/u-boot-ti.inc     | 4 ++--
 recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index 3182e8a..f83814e 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -5,7 +5,9 @@
 require conf/machine/include/davinci.inc
 require conf/machine/include/omapl138.inc
 
-UBOOT_MACHINE = "da850evm_config"
+UBOOT_MACHINE = "da850_am18xxevm_config"
+UBOOT_SUFFIX = "ais"
+
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
 
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index c024e96..0cb53ea 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,3 +1,5 @@
+UBOOT_SUFFIX ?= "img"
+
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
@@ -14,8 +16,6 @@ PKG_${PN}-dbg = "u-boot-dbg"
 
 S = "${WORKDIR}/git"
 
-UBOOT_SUFFIX = "img"
-
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY ?= ""
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
index b326aa1..9da6f7d 100644
--- a/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -25,3 +25,6 @@ SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
+
+SPL_BINARY_omapl138 = ""
+SPL_UART_BINARY_omapl138 = ""
-- 
2.0.0


