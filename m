Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.22358.1623620921314793946
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 13 Jun 2021 14:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: tom.rini@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id t6so13628419qvp.5
        for <meta-ti@lists.yoctoproject.org>; Sun, 13 Jun 2021 14:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=l4ibu0xaqWpafkb5hjSXsmCWIYSQC0Is4/xmQdVFsh4=;
        b=L34kkjqdCDQc/E59beQeSGWWFkarqRfNp8JJzVyFE9vwuSICs6/MD9XM0p0CWhI6f8
         TrRarYAvJSFqYhOw6MMy7Jfc4164i1p9OZEYV+6Op2+Bd5s4bn5QVW/G8rWJQ07l9QQk
         QUBurmYzik0r/nQ2HGmV0aRxNAYZjbMvkm3oksIfWffA8TEekc9WWRfwCIqIupB8nD/E
         eVu+V1aLhDTxUi0ec8bt2WZ8ycqs9U7Vx+hptbx0vP4rp2dgBLZ+M2vHSB/N1ia8o3bF
         yBfzryY4Hsq+3tlSC+S8BeH9ejaPdWiFaK/wrkvNNlpXryf3K2P7g2IoeOSX+BmiM7V4
         01FA==
X-Gm-Message-State: AOAM531bI44skmWey102lkc3LJiE4N4pRF61y+3XCXupEGUhnB4/hJfi
	EcmkPk6/m6dHB2LvDciI3wNl0uIlR9CK
X-Google-Smtp-Source: ABdhPJytRUGUXky5V5YJvyN2EVAGjrjCZNYneuPy8ytuNF6Vl5kZx4kep5FzYZHZVMVjqfbAx8xgLw==
X-Received: by 2002:a0c:ca94:: with SMTP id a20mr15486747qvk.49.1623620919942;
        Sun, 13 Jun 2021 14:48:39 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-390b-d38a-992f-44f1.res6.spectrum.com. [2603:6081:7b01:cbda:390b:d38a:992f:44f1])
        by smtp.gmail.com with ESMTPSA id w4sm8454192qtv.79.2021.06.13.14.48.39
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 14:48:39 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] omap-a15: Add extlinux.conf support
Date: Sun, 13 Jun 2021 17:48:36 -0400
Message-Id: <20210613214836.30570-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1

To make use of the "generic distro boot" support in U-Boot, an
extlinux.conf file needs to be generated and reside in the extlinux
directory.  The extlinux.conf file will be parsed by U-Boot and the
"append" line will be evaluated and expanded and used entirely as the
bootargs passed to the kernel.  Our generated extlinux.conf states that
the kernel image and device trees live one level up (so the root
directory) from it, so populate that location with our kernel and device
trees.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 conf/machine/include/omap-a15.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

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
-- 
2.17.1

