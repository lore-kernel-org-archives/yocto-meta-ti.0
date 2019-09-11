Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67331E00E00; Wed, 11 Sep 2019 12:24:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C50A6E00E07
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 12:24:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F06A640BE3;
	Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sRR98Xbto7ow; Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DAB4E40BF5;
	Wed, 11 Sep 2019 19:24:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 95185173BB9;
	Wed, 11 Sep 2019 15:24:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Sep 2019 15:23:54 -0400
Message-Id: <1568229835-30920-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568229835-30920-1-git-send-email-denys@ti.com>
References: <1568229835-30920-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 3/4] ti-sgx-ddk-km: also support arm-oe-linux-gnueabi as a hardfp compiler
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
X-List-Received-Date: Wed, 11 Sep 2019 19:24:04 -0000

OE-built internal toolchain doesn't use "-gnueabihf" suffix and instead uses
"-gnueabi" for both softfp and hardfp.

For now we only support hardfp (user-space binaries are only available in
hardfp), but would be nice to check for "callconvention-hard" before applying
the patch.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 34 ++++++++++++++++++++++
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
new file mode 100644
index 0000000..071ce0c
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
@@ -0,0 +1,34 @@
+From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 9 Sep 2019 17:05:48 -0400
+Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
+ suffix
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
+index dead2f9..2ba3e5e 100644
+--- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
++++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
+@@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
+   ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
+    $(1)_compiler_preferred_target := aarch64-linux-gnu
+   endif
++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
++   $(1)_compiler_preferred_target := arm-linux-gnueabihf
++  endif
+   ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
+    $(1)_compiler_preferred_target := arm-linux-gnueabi
+   endif
+-  ifneq ($$(filter arm-%-gnueabihf,$$($(1)_compiler_preferred_target)),)
+-   $(1)_compiler_preferred_target := arm-linux-gnueabihf
+-  endif
+  endif
+ endef
+ 
+-- 
+2.7.4
+
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 8338ed7..c8dbe4f 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -18,7 +18,9 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "ti-img-sgx/${PV}/k4.19"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
+    file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


