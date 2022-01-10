Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.50.1641854584118450983
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 14:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dtwe20xc;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id t7so4913707qvj.0
        for <meta-ti@lists.yoctoproject.org>; Mon, 10 Jan 2022 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwNa5aBa+r+pitZ1OA+AifJ0/hw7/B4JBDpDVTfTUj4=;
        b=Dtwe20xczI+KC7np6VcCGKKMECUW27BkeSoB+3nu+lF6bAcY7CAYw44fiFp1awXoj6
         rYRkenyEAaRWlaBnoyCup/3yiBlW4VzVbEk0Lsmu3fEshfjnvystukA9tahf27lohkbX
         sILq7qx5qyMAZ8eW8vDbsml9xezd67wbAoaBsrJnPj0gRCvVEC6IM/z/BAiUOUR9HNTb
         ee++BdwzYvr6BzwjN6bLCnFfd4FT8Iqh2ocbpy5oJUEY53OmI2bl8bhrW949n4O9s2cx
         UEasqjGZRhZaY2VZGTT3y73jN6WFdC6+d625rWtI45ZkU5riOFkhKaaE2S4LWfGnyEES
         0i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwNa5aBa+r+pitZ1OA+AifJ0/hw7/B4JBDpDVTfTUj4=;
        b=NZnPwXg1SuS+Q5k8DXy9H0xAyWXwS5hoKxQyAzY5dlDkqb/B3JwAMxUp0sk64I857U
         LepRLIA48/9nsQEiIBv9Uzlsb0hvEFI3+9SwU42X1zjkeMVfMfsDxoMzmWSHFnJ6A+uN
         uAx730ExHxMu7l5iergoTAI5yj9K+EMT3UWD5jnMRJ3DwEd8jPoKK3tUG4ri7ALxgDMw
         FVwAUf0SBmFB6kp0VUdMkrfnf6jd8CdEPf9IMmMkKV5Sv5JCKM5lKFrl3WHFf5bTPeRD
         fAZZyoNhJ9xFdQn5cis8eMgMxyqck5q8VcU7if35RF61wYzQGeIjM6d2x/F6IOREvejQ
         HViQ==
X-Gm-Message-State: AOAM532j1irfiGkFltVK2I/27790+ruTtyQrfzYfJc5A64DKXnrSl8Ra
	hygM4d1vWCon9sQGF7vT3r1CVlfbpCM=
X-Google-Smtp-Source: ABdhPJzPUXWDRadmntIf+WSxU6MXalA+kVVZupm4x5TTU0TVHawtkLqxl6VDuRj2ikify95rVPgTNg==
X-Received: by 2002:a05:6214:2483:: with SMTP id gi3mr1569876qvb.15.1641854583130;
        Mon, 10 Jan 2022 14:43:03 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id u17sm5499542qko.133.2022.01.10.14.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 14:43:02 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [PATCH] ti33x: move screen feature to machine configs
Date: Mon, 10 Jan 2022 12:42:10 -0500
Message-Id: <20220110174210.2018323-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AM335x SoC has a built-in 16bit/24bit RGB LCD controller, and
the BeagleBone Black uses an external chip to convert this to HDMI.

But the SoC does not have a video output port per-se, thus the "screen"
machine feature does not belong to its configuration but rather to
the machine configurations.

Move the feature (and the MACHINE_GUI_CLASS definition) out of
ti33x.inc into am335x-evm.conf and beaglebone.conf respectively.

At the same time, drop the irrelevant comments regarding the external
screen, since MACHINE_GUI_CLASS is unlikely used and the BeagleBone
Black has a micro HDMI port, not a DVI port.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 conf/machine/am335x-evm.conf   | 2 +-
 conf/machine/beaglebone.conf   | 2 +-
 conf/machine/include/ti33x.inc | 5 +----
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 469c4d37..09bd3934 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/ti33x.inc
 
 MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_FEATURES += "touchscreen"
+MACHINE_FEATURES += "screen touchscreen"
 
 IMAGE_FSTYPES += "ubifs ubi"
 
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index dcb14cc9..76cac5b9 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -8,8 +8,8 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
                     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
                     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
 
-# Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
+MACHINE_FEATURES += "screen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 197cac19..c0e925f9 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -13,9 +13,6 @@ XSERVER = "xserver-xorg \
            xf86-video-fbdev \
            xf86-input-keyboard"
 
-# Default to external video, change to smallscreen for built-in LCD
-MACHINE_GUI_CLASS = "bigscreen"
-
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r22"
 
@@ -62,7 +59,7 @@ UBI_VOLNAME = "rootfs"
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
 
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "am335x"
-- 
2.34.1

