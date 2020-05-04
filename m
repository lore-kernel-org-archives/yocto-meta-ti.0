Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.16006.1588626574010110022
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2020 14:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YY1IM8Tt;
 spf=pass (domain: linaro.org, ip: 209.85.210.67, mailfrom: daniel.diaz@linaro.org)
Received: by mail-ot1-f67.google.com with SMTP id j26so49074ots.0
        for <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2020 14:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4URxmEyYOpX1qlSiEzN8QPWn/IhgxXz45EJi3mbYgTo=;
        b=YY1IM8TtK2PuV4ngREIDNS9DSRE8TGjtsjGiNgbvW00uHlCtxh95kJhSWZyIwX/gyB
         mXzMNMkc1BtLyi1Pqb8a13eUHj0x5E9mt57AQOpLKhWVnSCyKCBfO46DE1h/hx/EfsFw
         qPuh/ydURKVDW3fDbfOFVDHKHMNdF1C7Q6bEYalGaArhskXyumvw5AYqC3voQqHfl+Rb
         oZmB7M0REpq5ZB4eNPF3xcRwiAmAVfva23d28v9IjxpTzGjomax/TiqaicAtfCyUIwwE
         kIgNfT7klHr1Qjmml6U6bXoaSbV2p0shxYFKdyMZ/oIWk8DhvW/oxgAvDCQcdz/37jcx
         6nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4URxmEyYOpX1qlSiEzN8QPWn/IhgxXz45EJi3mbYgTo=;
        b=m/3yw033rHjeaRxfigjCFFJQ73aAM4RS5DGAgAo850iP8svdNQ/iNdTsvfImSfqJs2
         oldTaeVAiTfiVA2bVZMeam1wu75woNF2OZcq2gP4UNtWsZDbiAvqHBoIH0E0NHQKUSNs
         al+XoKuCbnSy5x4pazYsNJtcasqrcEpa1Jg6cEMM7lGg3UKtU5jq7gLihRu1SycVUvdC
         ohaG9m0PcXJD48JEp/cOLw6Z6V7DnonYd+Efo6FAK/gO6Y7sbou7b+2lyY1V2AOPXiI/
         3H0PwSZH6xg+UUTUC7dfHwiQp35zxkZUOpKlzLsM0SYy/lZ0scADGPzn4Npzz4p0PO1+
         QJuA==
X-Gm-Message-State: AGi0Pua/2v9FBSZnl8LVMEhb9GI9eotU5xOukXiWlOj9J+tTZvA3YXmS
	vinCbp11x4diD1xlhJLyluc063Win40HJw==
X-Google-Smtp-Source: APiQypL5DiAqnZB8LCzUzQUlaYlPn/Joo3HufGqjcsYDbzSRfcgqhNGR4L129heHJ8qyqjiMZQ4M2A==
X-Received: by 2002:a9d:12f6:: with SMTP id g109mr16127669otg.0.1588626572382;
        Mon, 04 May 2020 14:09:32 -0700 (PDT)
Return-Path: <daniel.diaz@linaro.org>
Received: from alago.cortijodelrio.net (CableLink-189-219-75-147.Hosts.InterCable.net. [189.219.75.147])
        by smtp.googlemail.com with ESMTPSA id l11sm37415oom.15.2020.05.04.14.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 14:09:31 -0700 (PDT)
From: "Daniel D?az" <daniel.diaz@linaro.org>
To: meta-ti@lists.yoctoproject.org
Cc: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH] conf/machine: Use weak assignment for preferred virtual/kernel
Date: Mon,  4 May 2020 16:09:15 -0500
Message-Id: <20200504210915.24231-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A user of the meta-ti layer may choose to use a combination
of the machines herein with another kernel, not necessarily
the one from the machine definition.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 conf/machine/include/davinci.inc  | 2 +-
 conf/machine/include/k3.inc       | 2 +-
 conf/machine/include/keystone.inc | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/omap3.inc    | 2 +-
 conf/machine/include/omap4.inc    | 2 +-
 conf/machine/include/ti33x.inc    | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
 conf/machine/omapl137-evm.conf    | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 6de64839..62ca6887 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -5,7 +5,7 @@ MACHINE_KERNEL_PR = "r54"
 
 KERNEL_IMAGETYPE = "zImage"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 5e67f5f3..9428380d 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -6,7 +6,7 @@ require conf/machine/include/arm/arch-arm64.inc
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index ef33975f..e7ea9758 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -4,7 +4,7 @@ SOC_FAMILY_append = ":keystone"
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 7600126d..c22e6dd6 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -7,7 +7,7 @@ require conf/machine/include/tune-cortexa15.inc
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r7"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 489f1f9a..5696c82d 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -22,7 +22,7 @@ MACHINE_KERNEL_PR = "r127"
 KERNEL_IMAGETYPE = "zImage"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index d9706066..cbca267c 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -4,7 +4,7 @@ SOC_FAMILY_append = ":omap4"
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index db1df043..bf9b5570 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -20,7 +20,7 @@ MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_KERNEL_PR = "r22"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index e2aaf38c..5d6ea412 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -20,7 +20,7 @@ MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_KERNEL_PR = "r3"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
diff --git a/conf/machine/omapl137-evm.conf b/conf/machine/omapl137-evm.conf
index a8039f31..207b213a 100644
--- a/conf/machine/omapl137-evm.conf
+++ b/conf/machine/omapl137-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/davinci.inc
 require conf/machine/include/omapl137.inc
 
 # HACK: The omapl137 family does not have linux kernel support.
-PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
 EXTRA_IMAGEDEPENDS = ""
 
 IMAGE_FSTYPES = "tar.xz"
-- 
2.20.1

