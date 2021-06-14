Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.435.1623689724691212897
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 09:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: tom.rini@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id d196so33922711qkg.12
        for <meta-ti@lists.yoctoproject.org>; Mon, 14 Jun 2021 09:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=uI0QWxCklxBWnw3VoeIEW/I18xdJiI2+VCrlSulVIxc=;
        b=JYQkql+LZ0jJ5REttJ8vonjzSIggTqjDfLnru3XJqR1mNcMJJFRPwtxLiFuxx837lK
         hSg/w38BlJUMHDzrbeOdBOIRtdL2YMNFuXGqRCFb09Jdr0NVTRKowHZSsYnTL8UxlIys
         il39bfG2kz5Fg5KtmIA8sn5Q0YUA6cyISf785TnojHWr0FrPB+pjV2HehGzvtr5mBbVe
         3xK18Rla+fZuLbmak4eaYIJPm5wnhz2qJgJWMF7JkwDVeeuvgaU4yW3KEmX7e4SJ7f3J
         xwO57pK4rA3ogBLqwaM15Lc30BT8pdW+H6KSYLJJPyTYKtZAmrfBBAjmch0j09ze9NV6
         W/5Q==
X-Gm-Message-State: AOAM530NM+G7uCwm/M6QbU4TahxyLM04tVlajVHWNMbgxGQopDpUTLEm
	hAUpGEzl/nmNgH8JeUaKMM75oEjCHoo1
X-Google-Smtp-Source: ABdhPJxFD4PjfdGTva6HZJwXFX36ZgtfbiytmfVJsuQ+i9aLxzZFAii+8zXpT+IKSN+tyDJ3bbZm2g==
X-Received: by 2002:a05:620a:10b1:: with SMTP id h17mr16927499qkk.267.1623689723239;
        Mon, 14 Jun 2021 09:55:23 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-390b-d38a-992f-44f1.res6.spectrum.com. [2603:6081:7b01:cbda:390b:d38a:992f:44f1])
        by smtp.gmail.com with ESMTPSA id p145sm6697878qka.13.2021.06.14.09.55.22
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:55:22 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] ti43x: Add extlinux.conf support
Date: Mon, 14 Jun 2021 12:55:19 -0400
Message-Id: <20210614165519.24673-1-trini@konsulko.com>
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
 conf/machine/include/ti43x.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

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

