Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC656E009B8; Wed, 15 Feb 2017 11:41:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8D0DE009B8
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 11:41:27 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9CE4652970; Wed, 15 Feb 2017 19:41:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170215194126.9CE4652970@arago-project.org>
Date: Wed, 15 Feb 2017 19:41:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am180x-evm: update machine config to work with latest BSP
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
X-List-Received-Date: Wed, 15 Feb 2017 19:41:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 18697ca48bef2b0a23fe3d8433bcc1f7bd30e624
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=18697ca48bef2b0a23fe3d8433bcc1f7bd30e624

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 14 04:22:53 2017 +0000

am180x-evm: update machine config to work with latest BSP

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am180x-evm.conf     |    4 +++-
 recipes-bsp/u-boot/u-boot-ti.inc |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

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


