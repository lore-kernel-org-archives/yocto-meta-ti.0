Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.13621.1643502877210901802
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 29 Jan 2022 16:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ErrsvbNP;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id q5so8932722qkc.1
        for <meta-ti@lists.yoctoproject.org>; Sat, 29 Jan 2022 16:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6wtlwrZJAZWA3obsWM5iuOftl/Y+Xxg7mQSN9UWjixA=;
        b=ErrsvbNPGnJpM4NUwLK2P69aCQLTLWRWHlfxY3wC7aElC+Mk7kvK8ygOtqNfVO8oHr
         zG0g1dcByVfABVzMfZopbf6mQ6QvWq2nXUfFO8s/4/B9wjN7uqqIdXpjz3YTPTOGZFJ7
         MPb2pkpVk0FWbEUEjFkE78XU0C5r7DqgKMctHStpY/yfJHGlzt1iGpJKv4oIbQHifivU
         LW79BryTOvUSiTV1MvA+wHe6rCrwYWcZ/eDi7nwqigcLSODZThxdPqNYbZEGoeC3kwYy
         ltnRoENck1BIzaTgfS8yW5PdV+T/m9yWbHNAUEY+nJbTPEqbRifomVzp3xCVfGYY9vBi
         lKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6wtlwrZJAZWA3obsWM5iuOftl/Y+Xxg7mQSN9UWjixA=;
        b=RCrWL0ktragVI7ic1IQUFIq9nfJ4CZdsKT6v0vzJAuO4px9A58iq4hWzz61HK/ahPh
         M7fT09gP/bJHOR0P61L4lD5ToEDyAMNKxHwlaV7Jxl8jbJSwULApn/D1MJgy0ROAps5C
         2v9oPmSW6JO5/1PibEMhnePiuuUdc0693KgXdc9h/rjKWHuowIqhqZ7cBoU1r7YJQe+f
         SvVTxj9gpc/8LTBudk6uV8m2TD9sN/yPe9D4dctxTia2qXz008qAKba3tMpAfFsdLfB+
         KZOjB0Y9baSkeVJvBrEew+4sjzommh8TQivh7tayEf8zf6WwImemyIQi9ntz+Z1MIZY2
         0J7Q==
X-Gm-Message-State: AOAM5308NA+mfIaoJSRGElxzP/xcKNLcacYmjnQ1C0ePO6oCVSqTpE5L
	5fTP8X6rVeuS64MHsRwpojiynnH7E/g=
X-Google-Smtp-Source: ABdhPJx9wRZ8VVRx+msH5HLiR1G0cMAp21qW7/obJkTfcZQ+ZULprk/yC0u9hQRkdRl9ryNlLJ92Fg==
X-Received: by 2002:a05:620a:28d5:: with SMTP id l21mr8017512qkp.588.1643502876301;
        Sat, 29 Jan 2022 16:34:36 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id h6sm4460229qkk.14.2022.01.29.16.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 16:34:36 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: [meta-ti][RESEND 2/2] ti33x: move screen feature to machine configs
Date: Sat, 29 Jan 2022 14:33:20 -0500
Message-Id: <20220129193320.2945618-2-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220129193320.2945618-1-vdidelot@pbsc.com>
References: <20220129193320.2945618-1-vdidelot@pbsc.com>
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
index fe3127bb..a079ff7b 100644
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
2.35.0

