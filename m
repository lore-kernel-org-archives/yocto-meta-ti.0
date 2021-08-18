Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.58732.1629310671824750722
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Aug 2021 11:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g4FuzGMC;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id j187so2984465pfg.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 18 Aug 2021 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf8W66oRb+eB4gILzKX7o4wshCjUPGHO79NWcTzaJt0=;
        b=g4FuzGMCHl/kcVBStC3UUt+b9G2+YNUMzzaeskA1GMwWH6scCz0vL5aOaOoxNqPo/h
         sgxs52JIFLGGsH6VlQkjwUJNJMsw3mlkQi5dq8vs4avbAMMM985FSsH4fig4VFO/DnAF
         FK/nsfdqKiBSjZ28RNIz2QqEubxHcjhjdWWushzMte3PTZOUC1lX3IdA8apnF5Y7Vx3a
         HC2PufOrudCCCIDJz38LeXrKY4unRuE6WJkIe08Yn6Ep2j9b4LRFEXH8VbHFwXIk4dfz
         WWEhzRn/xptDjaoExVvu8IGPPLpb4rNg8Bp2KWNNSrUJQL6moy/SStxaBNrXoMZDOu9R
         zDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf8W66oRb+eB4gILzKX7o4wshCjUPGHO79NWcTzaJt0=;
        b=eF1G/YfgVUj0UX2+yHCs7+9+7gMnqxsLcqBlnwEZNagr1MnpKvnFb+Xb7SMT62ALVE
         KzKHB4ich1z9fAYKOr+dyC0L7JzdShnAmgOR8aEeJgaIrs1FYXSrE7IsAm2vfSOAuBhd
         FdNxYmN5sV+v5xvvzqbzTusvewPbV+0oj+W3/hqHXOCCCpkPVZF8c6Rar89k8dlI/6Nm
         PScntG3eGm2b0WGyXVccGzgCcv8trilQMiL7eevuvWrsVPY+KMSgW9rl3MfjDt90OvFR
         1BgmBjSebEQdoSHIXwVy5JU6lsxGykWGpOoiLeJZczAA6qwa2CeXpGDh8Do8WXXpu5fY
         PsFg==
X-Gm-Message-State: AOAM530VAO57s8rLdExxXfyH77tjCTBU4S7CG8EqIzCvj4WVBsrk8+zy
	IDxge1nFUGyPXxXhglrZZgD7bv0ASK2MJw==
X-Google-Smtp-Source: ABdhPJyU/MN3UvF2geiG3rm6UyFZYN3EIjf+8nR8idMNINo8y4MmX5vUia673meFRQAggFZzsgcuvA==
X-Received: by 2002:a63:9752:: with SMTP id d18mr9921787pgo.320.1629310671213;
        Wed, 18 Aug 2021 11:17:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id k6sm490194pgk.1.2021.08.18.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 11:17:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-ti][PATCH] machines: Adjust to use new location of tune files in oe-core
Date: Wed, 18 Aug 2021 11:17:48 -0700
Message-Id: <20210818181748.3887480-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/include/davinci.inc  | 2 +-
 conf/machine/include/k3r5.inc     | 2 +-
 conf/machine/include/keystone.inc | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/omap3.inc    | 2 +-
 conf/machine/include/omap4.inc    | 2 +-
 conf/machine/include/ti33x.inc    | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index d2681740..b8d207de 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -1,4 +1,4 @@
-require conf/machine/include/tune-arm926ejs.inc
+require conf/machine/include/arm/armv5/tune-arm926ejs.inc

 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r54"
diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
index 93f08c04..3cc79061 100644
--- a/conf/machine/include/k3r5.inc
+++ b/conf/machine/include/k3r5.inc
@@ -5,7 +5,7 @@ SOC_FAMILY:append = ":k3r5"

 # The closest of existing tunes for Cortex-R5F
 DEFAULTTUNE = "armv7athf"
-require conf/machine/include/tune-cortexa8.inc
+require conf/machine/include/arm/armv7a/tune-cortexa8.inc

 # R5 runs early bootloader and loads SYSFW
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 83dca19d..851328ac 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":keystone"

 DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/tune-cortexa15.inc
+require conf/machine/include/arm/armv7a/tune-cortexa15.inc

 PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 553835c8..57295a85 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":omap-a15"

 DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/tune-cortexa15.inc
+require conf/machine/include/arm/armv7a/tune-cortexa15.inc

 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r7"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index ab069b00..6e0d8dbc 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":omap3"

 DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/tune-cortexa8.inc
+require conf/machine/include/arm/armv7a/tune-cortexa8.inc

 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index b6f43744..b8bd9d37 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":omap4"

 DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/tune-cortexa9.inc
+require conf/machine/include/arm/armv7a/tune-cortexa9.inc

 PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 3da2aba5..896328d9 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":ti33x"

 DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/tune-cortexa8.inc
+require conf/machine/include/arm/armv7a/tune-cortexa8.inc

 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index eaed1812..0f28cc91 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":ti43x"

 DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/tune-cortexa9.inc
+require conf/machine/include/arm/armv7a/tune-cortexa9.inc

 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"

--
2.33.0
