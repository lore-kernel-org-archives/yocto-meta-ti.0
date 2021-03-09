Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.12602.1615310700232684202
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 09:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltM0ap+U;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d11so10791065qtx.9
        for <meta-ti@lists.yoctoproject.org>; Tue, 09 Mar 2021 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32SCKhZlRq7FItm4GSW9UO7xVf+la3ud/nn6ab7hq+U=;
        b=ltM0ap+UmzAPWgr0QxPyr3RfajQq3KG6Fm2HKrEPzPAsLrOe9nMBIj78+GymrZerZL
         bN0V2KHA8DBfxmVtOIuersKJvTMjlpIkjx4OcdoSrfVnhd/c5WSPkYnYkzMDNcZTL94S
         9ji61hVx3d2AFBgUYZVq43Cn221O26/pGbeXcTy6l8MlCzv0z9P7ysK1uKU2+aDPqMFF
         NH5hIrKmBZWDwx0Qko6ZGXzu34F2BOjzUWF1thWvitbCbeEn5jYz0LxtEDPxaaK6nNb5
         NNS+SAvXM4tvcOpJvVFjSu9nsV1sFfKb1+tDqFkLqRHYtXFBRrPjaEIrskb1YKzgQga2
         iR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32SCKhZlRq7FItm4GSW9UO7xVf+la3ud/nn6ab7hq+U=;
        b=fxkBXepMF2HayvVbYBznlYvznnYswScMTMdXY8GpxxC0kweYXmssSVlvv11hcAJPqE
         oMeUkSRmEfxJHeR3xOH32lenGnp+zu+yZ3gBixR6xWXjQxRkPfczAy6UQvwCn85zU6AR
         dFUS8DIyEaR/6LSDeol4HgcskZ5BFgbzYMzuTPDKbnooDGYRiwfZNKkZEvukzlap+ow9
         eaSGaHYa697aTybX29Hr3pfPN2V0xF3RMksBv0x1Xc1RB1SbaQi9L/SgpioRpyI+8LRK
         Z1MBp6YshXlarIyv1dGTcs5ifzqqgZqp3BFnjMwRywuACi742s+wDGBgqlqbH3jtGQ7o
         w69g==
X-Gm-Message-State: AOAM532O1wsUDi0iZGfGZbXIWItkcwgSg4QuUsqFKKqXWusRYpAVjPM0
	NRNERcb6XazOtfDs78v3Z1Agcg4ByRE=
X-Google-Smtp-Source: ABdhPJw0DhyyMVxUhRbEMTLFuvhwVyXLBIWPl8omdmKM0LoBJF/5NuF8/iCLgXbAUwL7au42jiPGmQ==
X-Received: by 2002:a05:622a:90:: with SMTP id o16mr25154018qtw.49.1615310699128;
        Tue, 09 Mar 2021 09:24:59 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id j15sm4101801qtr.34.2021.03.09.09.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 09:24:58 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] ti33x: allow different virtual/bootloader
Date: Tue,  9 Mar 2021 12:23:31 -0500
Message-Id: <20210309172331.22122-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boards like the beaglebone currently hardcode "u-boot" as a dependency
for the image and the wic format, and this prevents one from choosing
a different bootloader via:

    PREFERRED_PROVIDER_virtual/bootloader = "non-u-boot-bootloader"

Depending on "virtual/bootloader" instead of "u-boot" fixes this.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 conf/machine/include/ti33x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index abfd7ec7..b3c3b6d7 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -51,7 +51,7 @@ UBOOT_SUFFIX = "img"
 # and u-boot.
 UBI_VOLNAME = "rootfs"
 
-EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
@@ -63,4 +63,4 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
-do_image_wic[depends] += "u-boot:do_deploy"
+do_image_wic[depends] += "virtual/bootloader:do_deploy"
-- 
2.30.1

