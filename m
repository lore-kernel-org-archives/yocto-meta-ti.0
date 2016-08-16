Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 736E9E009B1; Tue, 16 Aug 2016 13:26:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1600FE0043F
	for <meta-ti@yoctoproject.org>; Tue, 16 Aug 2016 13:26:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 37CC45298A; Tue, 16 Aug 2016 20:26:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160816202648.37CC45298A@arago-project.org>
Date: Tue, 16 Aug 2016 20:26:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: move TI_SECURE_DEV_PKG and add UBOOT_* vars for fitimage support
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
X-List-Received-Date: Tue, 16 Aug 2016 20:26:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 6ec5e0dab202accc4b313bbf7923c220ff62b43e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6ec5e0dab202accc4b313bbf7923c220ff62b43e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug 16 08:05:13 2016 +0000

machines: move TI_SECURE_DEV_PKG and add UBOOT_* vars for fitimage support

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am437x-hs-evm.conf                 |    7 +++++++
 conf/machine/am57xx-hs-evm.conf                 |    7 +++++++
 conf/machine/dra7xx-hs-evm.conf                 |    7 +++++++
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    3 ---
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index e8d88a4..4fb277d 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -5,3 +5,10 @@
 require conf/machine/am437x-evm.conf
 
 UBOOT_MACHINE = "am43xx_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AM4}"
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index a375017..bd5a145 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -5,3 +5,10 @@
 require conf/machine/am57xx-evm.conf
 
 UBOOT_MACHINE = "am57xx_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_DRA7}"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index a898716..537152b 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -5,3 +5,10 @@
 require conf/machine/dra7xx-evm.conf
 
 UBOOT_MACHINE = "dra7xx_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_DRA7}"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 699c221..c5a374a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -18,9 +18,6 @@ SRCREV = "052f3bfd39e212e43fd141a49331107409e4f993"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""
-TI_SECURE_DEV_PKG_dra7xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
-TI_SECURE_DEV_PKG_am57xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
-TI_SECURE_DEV_PKG_am437x-hs-evm = "${TI_SECURE_DEV_PKG_AM4}"
 export TI_SECURE_DEV_PKG
 
 SPL_BINARY = "MLO"


