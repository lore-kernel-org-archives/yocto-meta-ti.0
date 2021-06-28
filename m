Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.14934.1624903589141184261
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 11:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: tom.rini@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id x6so9727517qvx.4
        for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 11:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to;
        bh=1iH6agmxhvxk/YQS+dkkcpyuqqGMLTUFCqzmFqMGZi4=;
        b=FUI/X/3lMs948qcsYXjt1C3f9H+UXyq7ESHxETWllcGzyg3wp+Jyb1wulOL/vFfp0Z
         u6vXCnVbpNh9fHa8oSDNXkDcSFCYHeUru0juktA83sBOzoEsQZd9UNP7JH5tmnPZvrSt
         m0zLGJM23sI20VegXUX0wOu+msXZHzGFEex1iSYx7s4bJy3/UOvrh266f6ttuS2STtcd
         +d0M11gFXwy+y4DsCQgTBVK+5Hn6h5Q4+k1UVyQO6Anf+plPc57qxK/HBO7s34Oyok7x
         IY7RK7MKvJMtSx2Cy7hcO6XqXlUj4Fe1/tYSB7jwkT5URiWi5RZgT2vd+8Mlr6yaYZAA
         C8OQ==
X-Gm-Message-State: AOAM531CpoQjTdH1q2quo4K//nDmovROlZ5ZWjObNWyIm9RSuLgd6Jb5
	paeMKqeCAGnIqWJHJ62AlEVZ0WR0225h
X-Google-Smtp-Source: ABdhPJzV69GavUo+dGo3P9yJPUVLjVsxxAgRI568r5w5n9oBdP0mBgeqRmOSfM6MXhU5u0IBjBX96g==
X-Received: by 2002:ad4:5b85:: with SMTP id 5mr26644382qvp.15.1624903587727;
        Mon, 28 Jun 2021 11:06:27 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-2808-537e-3f88-1d98.res6.spectrum.com. [2603:6081:7b01:cbda:2808:537e:3f88:1d98])
        by smtp.gmail.com with ESMTPSA id j3sm8601558qth.63.2021.06.28.11.06.26
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 11:06:27 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCHv3] conf: Add extlinux.conf support on some 32bit platforms
Date: Mon, 28 Jun 2021 14:06:24 -0400
Message-Id: <20210628180624.842-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
in-reply-to: 16888133C4B7EDFE.29241@lists.yoctoproject.org

To make use of the "generic distro boot" support in U-Boot, an
extlinux.conf file needs to be generated and reside in the extlinux
directory.  The extlinux.conf file will be parsed by U-Boot and the
"append" line will be evaluated and expanded and used entirely as the
bootargs passed to the kernel.  Our generated extlinux.conf states
that the kernel image and device trees live one level up (so the root
directory) from it, so populate that location with our kernel and device
trees.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v3:
- Merge in a number of other SoCs.
Changes in v2:
- Elaborate on how this feature works in the commit message.
---
 conf/machine/include/omap-a15.inc | 11 ++++++++++-
 conf/machine/include/ti33x.inc    | 11 ++++++++++-
 conf/machine/include/ti43x.inc    | 11 ++++++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index e491d2b501f1..c95b0cccaa42 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -19,6 +19,15 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX = "1"
+UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES = " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${KERNEL_DEVICETREE} \
+"
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
@@ -40,5 +49,5 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 6dfda754e9dd..35e057d57497 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -43,6 +43,15 @@ UBOOT_MACHINE = "am335x_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX = "1"
+UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES = " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${KERNEL_DEVICETREE} \
+"
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
@@ -61,5 +70,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index b1a27f93a2a4..75b745b37839 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -40,6 +40,15 @@ UBOOT_MACHINE = "am43xx_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX = "1"
+UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES = " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${KERNEL_DEVICETREE} \
+"
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
@@ -58,5 +67,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "u-boot:do_deploy"
-- 
2.17.1

