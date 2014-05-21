Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 005E9E00BF0; Wed, 21 May 2014 12:32:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5985E00BE8
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:32:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5207452A1E; Wed, 21 May 2014 19:32:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521193210.5207452A1E@arago-project.org>
Date: Wed, 21 May 2014 19:32:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: u-boot: rename tci6638 to k2hk evm config
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
X-List-Received-Date: Wed, 21 May 2014 19:32:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: e16b3f5c490d3ce75425ec45d33a686f1239fb61
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e16b3f5c490d3ce75425ec45d33a686f1239fb61

Author: Hao Zhang <hzhang@ti.com>
Date:   Fri May 16 22:59:44 2014 +0000

keystone: u-boot: rename tci6638 to k2hk evm config

Rename U-boot "tci6638_evm_config" to "k2hk_evm_config" to align
with DTB device name.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc             |    2 +-
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index b961ad3..63f069c 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -12,7 +12,7 @@ MACHINE_KERNEL_PR = "r7"
 
 KERNEL_IMAGETYPE = "uImage"
 
-UBOOT_MACHINE = "tci6638_evm_config"
+UBOOT_MACHINE = "k2hk_evm_config"
 
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 6717e62..5e5eb51 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -4,10 +4,10 @@ DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
-# Tag "K2_UBOOT_2013_01_14.03_02"
-SRCREV = "0b9b4be2f3097b5bdc3b0ea7aa5e8f465097e365"
+# Tag "K2_UBOOT_2013_01_14.05_16"
+SRCREV = "fee500417b989fc9906d86e377b4d3d96033d54e"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"


