Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19166E0071E; Wed,  2 Jul 2014 13:03:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8AF8E0043F
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5BEDE52A70; Wed,  2 Jul 2014 20:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200315.5BEDE52A70@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: switch from SPL/MLO to "ais" image for omapl138 SOCs
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b5d24149feea733a97f12c2eed2595f22982a4fe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b5d24149feea733a97f12c2eed2595f22982a4fe

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 27 00:18:15 2014 +0000

u-boot: switch from SPL/MLO to "ais" image for omapl138 SOCs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>

---

 conf/machine/am180x-evm.conf         |    4 +++-
 recipes-bsp/u-boot/u-boot-ti.inc     |    4 ++--
 recipes-bsp/u-boot/u-boot_2014.07.bb |    3 +++
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


