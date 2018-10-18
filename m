Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD437E00B5E; Wed, 17 Oct 2018 18:04:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,TVD_SPACE_RATIO
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64906E00AB9
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 18:04:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CDE5F20D4C;
	Thu, 18 Oct 2018 01:04:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id phGU-RwDLxh0; Thu, 18 Oct 2018 01:04:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8BA320D40;
	Thu, 18 Oct 2018 01:04:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 058AB1648F0;
	Wed, 17 Oct 2018 21:04:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 21:04:18 -0400
Message-Id: <1539824658-36380-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-gc320-driver: workaround for gcc8 stringop-overflow error
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
X-List-Received-Date: Thu, 18 Oct 2018 01:04:21 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...build-bypass-gcc8-stringop-overflow-error.patch | 26 ++++++++++++++++++++++
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
new file mode 100644
index 0000000..431afa7
--- /dev/null
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
@@ -0,0 +1,26 @@
+From c93a4217425ffebae1fb2d5c6c7fc957eb8aa18c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 16 Oct 2018 21:16:48 -0400
+Subject: [PATCH] Kbuild: bypass gcc8 stringop-overflow error
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ src/Kbuild | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Kbuild b/src/Kbuild
+index 574a107..df4368d 100755
+--- a/src/Kbuild
++++ b/src/Kbuild
+@@ -87,7 +87,7 @@ MODULE_NAME ?= galcore
+ CUSTOMER_ALLOCATOR_OBJS    ?=
+ ALLOCATOR_ARRAY_H_LOCATION ?= $(OS_KERNEL_DIR)/allocator/default/
+ 
+-EXTRA_CFLAGS += -Werror
++EXTRA_CFLAGS += -Werror -Wno-stringop-overflow
+ 
+ OBJS := $(OS_KERNEL_DIR)/gc_hal_kernel_device.o \
+         $(OS_KERNEL_DIR)/gc_hal_kernel_linux.o \
+-- 
+2.7.4
+
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 94485b6..e49a41f 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -13,7 +13,9 @@ BRANCH = "ti-${PV}-k4.14"
 
 SRCREV = "a36799d9329efcfff19e30e690156d5ebf7e0c55"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH} \
+	file://0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch;striplevel=2"
+
 S = "${WORKDIR}/git/src"
 
 EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
-- 
2.7.4


