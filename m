Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D5D8E00E88; Wed, 14 Feb 2018 19:20:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04F57E00D17
	for <meta-ti@yoctoproject.org>; Wed, 14 Feb 2018 19:20:07 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E8F07204AF;
	Thu, 15 Feb 2018 03:20:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A5QUdDCxYqT3; Thu, 15 Feb 2018 03:20:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B14432017C;
	Thu, 15 Feb 2018 03:20:05 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4417D1632A7;
	Wed, 14 Feb 2018 22:20:05 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Feb 2018 22:20:02 -0500
Message-Id: <1518664803-56132-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] linux-ti-staging: upgrade to 4.14
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
X-List-Received-Date: Thu, 15 Feb 2018 03:20:09 -0000

Some DTBs have changed, am57xx-evm moved to DT overlays.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf                                      | 3 +--
 conf/machine/dra7xx-evm.conf                                      | 7 ++++---
 .../{linux-ti-staging-4.9 => linux-ti-staging-4.14}/defconfig     | 0
 .../dra7xx/defconfig                                              | 0
 .../{linux-ti-staging-4.9 => linux-ti-staging-4.14}/k2g/defconfig | 0
 .../keystone/defconfig                                            | 0
 .../omapl138/defconfig                                            | 0
 .../ti33x/defconfig                                               | 0
 .../ti43x/defconfig                                               | 0
 .../defconfig                                                     | 0
 .../dra7xx/defconfig                                              | 0
 .../k2g/defconfig                                                 | 0
 .../keystone/defconfig                                            | 0
 .../ti33x/defconfig                                               | 0
 .../ti43x/defconfig                                               | 0
 .../{linux-ti-staging-rt_4.9.bb => linux-ti-staging-rt_4.14.bb}   | 8 ++++----
 .../defconfig                                                     | 0
 .../dra7xx/defconfig                                              | 0
 .../k2g/defconfig                                                 | 0
 .../keystone/defconfig                                            | 0
 .../omapl138/defconfig                                            | 0
 .../ti33x/defconfig                                               | 0
 .../ti43x/defconfig                                               | 0
 ...ti-staging-systest_4.9.bb => linux-ti-staging-systest_4.14.bb} | 4 ++--
 .../linux/{linux-ti-staging_4.9.bb => linux-ti-staging_4.14.bb}   | 8 ++++----
 25 files changed, 15 insertions(+), 15 deletions(-)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/omapl138/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.9 => linux-ti-staging-4.14}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.9 => linux-ti-staging-rt-4.14}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.9 => linux-ti-staging-rt-4.14}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.9 => linux-ti-staging-rt-4.14}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.9 => linux-ti-staging-rt-4.14}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.9 => linux-ti-staging-rt-4.14}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.9 => linux-ti-staging-rt-4.14}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt_4.9.bb => linux-ti-staging-rt_4.14.bb} (39%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/omapl138/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.9 => linux-ti-staging-systest-4.14}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest_4.9.bb => linux-ti-staging-systest_4.14.bb} (55%)
 rename recipes-kernel/linux/{linux-ti-staging_4.9.bb => linux-ti-staging_4.14.bb} (93%)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 1832548..7724be3 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -11,8 +11,7 @@ IMAGE_FSTYPES += "tar.xz"
 SERIAL_CONSOLE = "115200 ttyS2"
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
-                    am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm-cam-ov10635.dtb \
-                    am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-mt9t111.dtb am57xx-evm-reva3-cam-ov10635.dtb \
+                    ti/am57xx-evm.dtbo ti/mt9t111.dtbo ti/ov10635.dtbo \
                     am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
                     am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb \
                     am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb \
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 7db9ff6..e0717c5 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -10,10 +10,11 @@ IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
-                    dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
+KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
+                    dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
                     dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
-                    dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb dra76-evm.dtb dra76-evm-tfp410.dtb"
+                    dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb \
+                    dra76-evm.dtb dra76-evm-tfp410.dtb"
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.9/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.14/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.9/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.14/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.9/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.14/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.9/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.14/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.9/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.14/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.9/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.14/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.9/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.14/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
similarity index 39%
rename from recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
rename to recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index f8b3584..802a8b1 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -1,9 +1,9 @@
-require linux-ti-staging_4.9.bb
+require linux-ti-staging_4.14.bb
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
-BRANCH = "ti-rt-linux-4.9.y"
+BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "764089ed2a847e9d4c06c0e0baaaeaf42aa2d99f"
+SRCREV = "92c3e398509d57ea7ad40ac87aa5b7ed5e5014e2"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/omapl138/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.9/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.14/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.9.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.14.bb
similarity index 55%
rename from recipes-kernel/linux/linux-ti-staging-systest_4.9.bb
rename to recipes-kernel/linux/linux-ti-staging-systest_4.14.bb
index c53f94c..5fa8fe2 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-systest_4.14.bb
@@ -1,5 +1,5 @@
-require linux-ti-staging_4.9.bb
+require linux-ti-staging_4.14.bb
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
similarity index 93%
rename from recipes-kernel/linux/linux-ti-staging_4.9.bb
rename to recipes-kernel/linux/linux-ti-staging_4.14.bb
index 467cddc..613fb58 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -10,7 +10,7 @@ require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
@@ -52,10 +52,10 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-lsk-linux-4.9.y"
+BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "89d085d1a407961d43d2492803facb6a8e678fda"
-PV = "4.9.69+git${SRCPV}"
+SRCREV = "36a950c35adcec9c55c20ef1deb5e33c87ae0a3f"
+PV = "4.14.19+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.7.4


