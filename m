Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.745.1623868644079854448
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 11:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: tom.rini@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id u30so429701qke.7
        for <meta-ti@lists.yoctoproject.org>; Wed, 16 Jun 2021 11:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=xMO45UzQfdzkKYhstGkSbJrBD9xxKB+8X1VMqiTbYYE=;
        b=it/OGCW/t2BP5lIOmTOQeXx1y9MaIjqJy8rvI/6Ucgsx6yCRlikvFQCpB0IYG1YpIS
         aE31JnHvoAW9LTRMcD0USr91Yizi2Mzqp9WzUivX2J2i+J//SHO9QxNZXx9AXz4YohAa
         kSX0RNWK7gH4SKYeb536L6Oxm/fNqk+Ei1MeES2B0y5o92tGAiCqsyN35fAwzb9xowIn
         +bTPyJ3jAo4RigXe3zfTDDRRkR5sB9a2eUIs5jXlfra3k94NlshmL7QLs2XlDovhXmGs
         moeWDmP5GEi8BSBw3WtsJ7oTKR7vUx+ODql//na7/nNgm+Agg6cVtqwFC6sOlfX8+CFI
         18Jg==
X-Gm-Message-State: AOAM533ormj4U+e+9zYVgBrut2HGaSc/oeEiPoYWV/0tuNz76ChUamk3
	DuPZqhYFW8NdgVNDqvH8dvPU89aybfb3
X-Google-Smtp-Source: ABdhPJy+BY4+jmKGFt0PrxZVtPk/oDGYCMTE7txhpeyxtvPBI596jl3LIYdRDTJ/xCb4BrDESWlOJw==
X-Received: by 2002:a05:620a:408b:: with SMTP id f11mr1543740qko.200.1623868642681;
        Wed, 16 Jun 2021 11:37:22 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-507d-0469-e510-a4e0.res6.spectrum.com. [2603:6081:7b01:cbda:507d:469:e510:a4e0])
        by smtp.gmail.com with ESMTPSA id f24sm24655qkm.118.2021.06.16.11.37.21
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 11:37:22 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] conf/machine: k3: Enable grub-efi by default in wic images
Date: Wed, 16 Jun 2021 14:37:18 -0400
Message-Id: <20210616183718.25134-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1

All of our platforms here support running EFI binaries.  We can have wic
generate a simple grub.cfg file for us that will find the root partition
via PARTUUID and utilize the device tree that is already discoverable
via the EFI configuration tables.  Assuming the EFI loader is U-Boot,
this device tree can be replaced at run-time by the normal mechanism of
loading in to memory and passing that address as an argument to bootefi.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 conf/machine/include/k3.inc | 5 ++++-
 wic/sdimage-2part-efi.wks   | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 wic/sdimage-2part-efi.wks

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index e0970698b33d..61438abe8f19 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -45,7 +45,10 @@ IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
 
 IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
 
-WKS_FILE ?= "sdimage-2part.wks"
+EFI_PROVIDER ?= "grub-efi"
+MACHINE_FEATURES += "efi"
+
+WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/wic/sdimage-2part-efi.wks b/wic/sdimage-2part-efi.wks
new file mode 100644
index 000000000000..6b03080eb5bf
--- /dev/null
+++ b/wic/sdimage-2part-efi.wks
@@ -0,0 +1,7 @@
+# short-description: Create SD card image with 2 partitions and EFI support
+# long-description: Creates a partitioned SD card image for TI platforms that
+# supports EFI.  Boot files are located in the first vfat partition with extra
+# reserved space.  We cannot use a GPT here.
+bootloader --append="rootfstype=ext4 ro"
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid
+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.17.1

