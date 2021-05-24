Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2123.1621896037317927655
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 May 2021 15:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PqF7sgK+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OMeakX027987;
	Mon, 24 May 2021 17:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621896036;
	bh=iyxC6zMzJwyW+pVECCat6+/nDbgcPa0VMULwvR/dtvk=;
	h=From:To:CC:Subject:Date;
	b=PqF7sgK+QMtl9rgrk5nzJ7HBvybfaabtgr5gSmHzX4eBppVveThdiWmRbkr59SC5b
	 qA+hGzf/EqNubw2Xx4uOaRalm2R9TOL9SLpX/hhXupTdZg2Aveh9lgYIEuvVHK2X3t
	 qWv9oszB+y9HE7S7z+/HX692R3T4hFC/eUUcFs/c=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OMeaLB057376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 May 2021 17:40:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 17:40:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 17:40:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OMeaLn045533;
	Mon, 24 May 2021 17:40:36 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Nishant Menon <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH V3] linux-ti-staging: Add extra dtc flags to support dtb overlays
Date: Mon, 24 May 2021 17:40:36 -0500
Message-ID: <20210524224036.13526-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
compile dtbs with symbols. This fixes the issue where the dtbs
are build without symbols causing issue with overlays.

Enabling overlay support increases the size of the dtb, hence
it is done at a platform level rather than globally to allow custom
boards disable it from local.conf to reduce size.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/am335x-evm.conf                  | 2 ++
 conf/machine/am335x-hs-evm.conf               | 2 ++
 conf/machine/am437x-evm.conf                  | 2 ++
 conf/machine/am437x-hs-evm.conf               | 2 ++
 conf/machine/am57xx-evm.conf                  | 2 ++
 conf/machine/am57xx-hs-evm.conf               | 3 +++
 conf/machine/am65xx-evm.conf                  | 2 ++
 conf/machine/am65xx-hs-evm.conf               | 2 ++
 conf/machine/dra7xx-evm.conf                  | 2 ++
 conf/machine/dra7xx-hs-evm.conf               | 3 +++
 conf/machine/j7-evm.conf                      | 2 ++
 conf/machine/j7-hs-evm.conf                   | 2 ++
 conf/machine/j7200-evm.conf                   | 2 ++
 conf/machine/k2g-evm.conf                     | 2 ++
 conf/machine/k2g-hs-evm.conf                  | 2 ++
 recipes-kernel/linux/linux-ti-mainline_git.bb | 6 ++++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++--
 recipes-kernel/linux/ti-kernel.inc            | 9 +++++++++
 18 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 recipes-kernel/linux/ti-kernel.inc

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 469c4d37..9486b4c6 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -13,6 +13,8 @@ IMAGE_FSTYPES += "ubifs ubi"
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
index 7caa5bfd..5b9a8578 100644
--- a/conf/machine/am335x-hs-evm.conf
+++ b/conf/machine/am335x-hs-evm.conf
@@ -16,3 +16,5 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 4e3681d5..ee04f6e0 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -11,6 +11,8 @@ IMAGE_FSTYPES += "ubifs ubi"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 0a8ca06d..a02ba6a4 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -16,3 +16,5 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
 OPTEEMACHINE = "ti-am43xx"
 OPTEEFLAVOR = "am43xx"
 OPTEEOUTPUTMACHINE = "ti"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 78e730ca..00f52ec9 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -24,6 +24,8 @@ KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am5
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index d4f6e098..e2b91a63 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -17,3 +17,6 @@ OPTEEMACHINE = "ti-am57xx"
 OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 8b6ef546..a568b25f 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -5,3 +5,5 @@
 require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index e4eebb6a..73fae36b 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -20,3 +20,5 @@ UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ad4b0263..1856949a 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -18,6 +18,8 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index da4000f2..1ada68d5 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -17,3 +17,6 @@ OPTEEMACHINE = "ti-dra7xx"
 OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1b99baeb..1e074e43 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index 70e14754..8c2330b0 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -20,3 +20,5 @@ UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index 2565c90c..4195c42e 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -16,5 +16,7 @@ UBOOT_MACHINE = "j7200_evm_a72_config"
 # J7200 supports multi-certificate images, use the same
 IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index d4cf0605..582af418 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -19,6 +19,8 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
+
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    4096
diff --git a/conf/machine/k2g-hs-evm.conf b/conf/machine/k2g-hs-evm.conf
index 0620b1f5..3a0b7dc3 100644
--- a/conf/machine/k2g-hs-evm.conf
+++ b/conf/machine/k2g-hs-evm.conf
@@ -13,3 +13,5 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2g"
+
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index fc16485d..6770adca 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -8,10 +8,12 @@ inherit kernel
 DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
 
 DEPENDS += "gmp-native"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
@@ -23,7 +25,7 @@ SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
 PV = "5.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 4ec19af7..0a134f93 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -11,11 +11,13 @@ require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +27,7 @@ SRCREV = "d85aee3e19aa7403bd157d2ae30917e736096a7f"
 PV = "5.10.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
diff --git a/recipes-kernel/linux/ti-kernel.inc b/recipes-kernel/linux/ti-kernel.inc
new file mode 100644
index 00000000..a7eb476e
--- /dev/null
+++ b/recipes-kernel/linux/ti-kernel.inc
@@ -0,0 +1,9 @@
+# Add DTC FLAGS -@ when KERNEL_DTB_OVERLAY_SUPPORT is enabled
+
+def get_extra_dtc_args(d):
+    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
+        return "DTC_FLAGS=-@"
+    else:
+        return ""
+
+EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
-- 
2.17.1

