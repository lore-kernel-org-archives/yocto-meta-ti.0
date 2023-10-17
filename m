Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E34CDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:30:45 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.199157.1697509838872698059
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 19:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edBvJsm/;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6c4bad60a1aso3111333a34.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509838; x=1698114638; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sSTFgCaVZwwCwb7RCqBCWr5ZyQfde8TCUlKvQ1LyF0=;
        b=edBvJsm/u0Kbf4lWDJMWgHBRoYq2bCW2du3kCY9ym8tIOAh75+kkCFWtGxhsT/ZyzY
         iRUEZxI2wvoH0xPj/cvZNBsFH7AKcbWwcWcl2cgJ2Id/xZLQuvjOS+7UZGTthhWcSvwH
         w3vxz9pIXgYN8Gr/L/yoqglez9DU+0uswxQgHmVxD7949nZPVFn2vKfQBRtbcXOaJuue
         bJa5+v0Wr1xf7aIfJednYLxrPW4NgnMf9xr1ei+HPas2D55Q8tmkMmtVQzsqxdznHmth
         g3lY//VPelQXG6ogMneR1DP8RJAK/tx0rGuYQrwv7vmHhv8Oky+cojty6t3W5g4qXXSM
         8lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509838; x=1698114638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sSTFgCaVZwwCwb7RCqBCWr5ZyQfde8TCUlKvQ1LyF0=;
        b=BvQJMi6DfSOZtptrMh7y8gd8VBqUED8ulS2WRLCxLCkANDGKKPkTlnOK+VymjEU4tq
         QA7IWUz8aUdSYGE0+WTH+wQQiZkM0QKTgEDE58V3OAmHjlxnF5pgEgwJ8X9BEr/6sJun
         B6n6u81ITRAlOoKVg8WSqHkZtlYqrzbU6TQCXrVID3G5/vQbznVJ4nvGr96RyevK63T8
         zBLL30K6lVKOniMqEyoDDx3BIp1fn3ufcRkrHENyxxTjH6ZZ3SlzrkTSFZ8bTrPS12rq
         J1fZSf5GZmaiO2ySsPrHd/ok1JeKSu4ggn27IgKHNhc1cGh08PowxnU5AlrVGZBBhgQr
         uwcw==
X-Gm-Message-State: AOJu0Yz8EPLS+ZO9KX6GGsNG24tYFgQEwvt4enwDcQyC0rFMSXfOXb5t
	KnmViCqG4FJAlAN2BwyzRqc=
X-Google-Smtp-Source: AGHT+IGEE0YEnalfQ2TIHKGDJiZTK9YQarIATXaz1UBuasfy3bqasjpQbjw8dXFBdyoXwxCAKO7JxQ==
X-Received: by 2002:a05:6870:13ca:b0:1ea:8645:6352 with SMTP id 10-20020a05687013ca00b001ea86456352mr471066oat.11.1697509838135;
        Mon, 16 Oct 2023 19:30:38 -0700 (PDT)
Received: from rig.lan ([2600:1700:eec4:a85f::3])
        by smtp.gmail.com with ESMTPSA id mo16-20020a056871321000b001e9a60dbc42sm95331oac.47.2023.10.16.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:30:37 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: reatmon@ti.com,
	denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org,
	Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv3 3/3] machine: include: enable sgx on tested platforms
Date: Mon, 16 Oct 2023 21:29:51 -0500
Message-ID: <20231017022951.108252-4-res.sapp@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017022951.108252-1-res.sapp@gmail.com>
References: <20231017022951.108252-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 02:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17130

From: Randolph Sapp <rs@ti.com>

Enable SGX Graphics on the currently tested platforms.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 405d82ad..2c427b88 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":am65xx"
 MACHINE_FEATURES += "screen touchscreen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
 
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index c9d16f3c..c1eb659b 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index ad19798d..567cf128 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ea5d1505..c70a8363 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
-- 
2.42.0


