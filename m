Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.15135.1624903583370129522
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 11:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: tom.rini@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q16so6877356qke.10
        for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 11:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to;
        bh=M08Ud4j2qV/EX/Ogh2AeSVIsgPuxlhLNk3p0YVNZmzk=;
        b=VHMPcrlVJ69RfYBff7EXJIvshsgM6DrX6eB+v0mtQvks08/i3tlQauPwrRXStC7C/X
         W6MHW8ZHiLUdOA/HKCqMLa/NHSGg6GtomQg+OzlGdzo7L4QTuIzD7pDyw1F04aPX/hWF
         Nt2ZyG0DRJLvrszZBWHsdEj7dJevpdi2J/b2+I/b8dH0LOoEYd/maDxuRryZghwGhHE2
         iIxy2MXI6rD2wpIf22ulUCZB4u6qwic5Bo4EqYqfX4wT4RnFzGgK1Zt3xmiHMjvqKLsM
         qc9vZkBzkTvXXmswVUckdDXKE7GE775wDIsduTElW2FopPL3IwllnsBIygmKIDT4Gi3t
         zFyw==
X-Gm-Message-State: AOAM531Jki+AJ4X29A849j0/sbZ2WfyU2jWmWsu3gNmooOrgTWEHNhaL
	bHGNLSvaF4HItxZ7/q7PVlW7nvtc3zRC
X-Google-Smtp-Source: ABdhPJysa3mX6ZULzrfooxrS2lKju1kbcbyKoAOr0iLb3ElyM8n9Szsxqxs21To3QZ6UOF+43tElPg==
X-Received: by 2002:a05:620a:84b:: with SMTP id u11mr10358980qku.348.1624903582016;
        Mon, 28 Jun 2021 11:06:22 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-2808-537e-3f88-1d98.res6.spectrum.com. [2603:6081:7b01:cbda:2808:537e:3f88:1d98])
        by smtp.gmail.com with ESMTPSA id k12sm5178235qtx.58.2021.06.28.11.06.20
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 11:06:21 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCHv2] conf/machine: k3: Enable grub-efi by default in wic images
Date: Mon, 28 Jun 2021 14:06:17 -0400
Message-Id: <20210628180617.789-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-reply-to: 20210616183718.25134-1-trini@konsulko.com

All of our platforms here support running EFI binaries.  We can have wic
generate a simple grub.cfg file for us that will find the root partition
via PARTUUID and utilize the device tree that is already discoverable
via the EFI configuration tables.  Assuming the EFI loader is U-Boot,
this device tree can be replaced at run-time by the normal mechanism of
loading in to memory and passing that address as an argument to bootefi.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Add missing IMAGE_EFI_BOOT_FILES which is how we populate in the
  various firmware portions.
- Use --fixed-size 128M to ensure we have some spare room on the boot
  partition.
---
 conf/machine/include/k3.inc | 6 +++++-
 wic/sdimage-2part-efi.wks   | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 wic/sdimage-2part-efi.wks

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index e0970698b33d..166c09239069 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -44,8 +44,12 @@ IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysf
 IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
 
 IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
+IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
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
index 000000000000..ffb8d24bacd1
--- /dev/null
+++ b/wic/sdimage-2part-efi.wks
@@ -0,0 +1,7 @@
+# short-description: Create SD card image with 2 partitions and EFI support
+# long-description: Creates a partitioned SD card image for TI platforms that
+# supports EFI.  Boot files are located in the first vfat partition with extra
+# reserved space.  We cannot use a GPT here.
+bootloader --append="rootfstype=ext4 ro"
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.17.1

