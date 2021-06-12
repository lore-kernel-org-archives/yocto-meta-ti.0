Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.5826.1623503616905725120
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Jun 2021 06:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: tom.rini@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id c9so7621699qkm.0
        for <meta-ti@lists.yoctoproject.org>; Sat, 12 Jun 2021 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7e320KEyiw7WwsOCtPH7zYlw58JMwNxyI0Kzj+/1g4A=;
        b=R7zhXEYbFsIs6lDloGUFphOqquC151NkkvdLtCsL8vSTCvnwepzqNovtN5thcYCtvw
         9HhBpb9Mu4wOw6rRe61UqVeYUSzC66LxexBgbeLDW3yZ/7a5524QMYl4JZN55T4Mn/fK
         W6bIqv+1YJcoGhN/5nNHLyPR4HGidkiu1prWPx/NURbrYRbBLk3hiePTsVkTbFZr+HCN
         P1u2j6oOJb3N1zjjJLdP+TLTF+9Y5M8xOkfuIVRhaaGTGu6+56Fd/aOYX0t+xxnCSDJe
         VN5goHCe9BJ9WgK9nJoS5RMgvBZ3Ui/+vQv/tyuEqk79Lc/6m7uQ7VcSHAzHfEC3Fq6O
         7qUw==
X-Gm-Message-State: AOAM532WO8YI6JtZtLoaEZ249IYC2Wid7Ch3UbI5Sq5OFqG5nVCyA/Fn
	mMfOCtmr1jfgpVEvfEgc/WKAizUMmg==
X-Google-Smtp-Source: ABdhPJwH7yaA5H6lNY7ZJe5xtFhUhUGvYDXqOJ+/VTPJXPMk/Kjy3vq0yEsgujt+1EpddDmokhVsqQ==
X-Received: by 2002:a37:618f:: with SMTP id v137mr8581555qkb.282.1623503615583;
        Sat, 12 Jun 2021 06:13:35 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-3c24-afde-29e9-71af.res6.spectrum.com. [2603:6081:7b01:cbda:3c24:afde:29e9:71af])
        by smtp.gmail.com with ESMTPSA id x10sm6465176qkf.42.2021.06.12.06.13.34
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 06:13:34 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCHv2] conf: am335x-evm: Add extlinux.conf support
Date: Sat, 12 Jun 2021 09:13:31 -0400
Message-Id: <20210612131331.13439-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <16875AD11A54340A.8333@lists.yoctoproject.org>
References: <16875AD11A54340A.8333@lists.yoctoproject.org>

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
Changes in v2:
- Elaborate on how this feature works in the commit message.
---
 conf/machine/include/ti33x.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

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
-- 
2.17.1

