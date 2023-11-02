Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A12EC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:48:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.27789.1698922121597467899
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 03:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/lhZJxo;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-408425c7c10so5898585e9.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 02 Nov 2023 03:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698922120; x=1699526920; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4lJd/7mErpgYe3UbSlmPVV9Y87Fv8nFUAA3Cyy4ICg=;
        b=f/lhZJxo1negop2c0WKDvycFSZ99XWTwt10S5d6CD95E4ezjZxRgl2CAGgpopGYmi7
         jVY5xEkD8vxvx+mJQI7MuQdA2buSMcrJSQWiYlh4jwTGEYgJwrbZnaBzT/HEma7aq2LJ
         UnBUmqMprdS9PdypJth3V1rOJLXE24yVJivCeIMOHkFyvjIKBstmYn2bP01IRLTCyWc9
         tX4/Z3qYeAVoYr5usPnc/qct1WFvMbk7cd06zHEKTiVYCspzJqJCbYJAg77BbT9YDhqC
         um/jabpzOpU4ZhJb/ISudmymRMUUYzejYaU4nRC8cigf4aWa00Gjpq7iVWfNAQ7HsNlo
         Dswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698922120; x=1699526920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4lJd/7mErpgYe3UbSlmPVV9Y87Fv8nFUAA3Cyy4ICg=;
        b=d8ukGrWQaLAxW5oXFhB9YVmb/G+D1vn3gduLBcIKnKj4iF6gtEjS86h957KyYRpDrA
         rxf32HHyCkRhzx9RXAIYwW5VJej6d/fgjHGwPOqW6ovG04Xg4sXsxVDXvreKSqYvdACi
         lZUFX40xlOw0HAvu1lCNoVBSs1Tcipv8pyEjwtBJnGjGXyvuavGvGkvf7bentIvtydS6
         qyYshgY/omlVe/5/5imyk9wM+PJ469JbPQl4odu09JR75ughlfi6+P3EYJW1DsjQ3HNv
         +vwCl6h6Oqly6rtDlayOoh4VbiU6ah1XnkoJm6E1CW/xrnYOLeSfWSUu+X+2VNWmc5Ta
         d6LQ==
X-Gm-Message-State: AOJu0Ywh9uDJ9/1B3O8z9p91b6zY8Zyr+0tTqp52vYl4WJNfEBk9Ufjv
	/Ga/LDuxIwEGxg9eu0iRAd7PKXrGIsG+7Q==
X-Google-Smtp-Source: AGHT+IHZiW3P/gts8gcId/SyIAiMNvsoxtvrQDTF21NiksPP0STqM5whJBF2ZVsjKEMFhOuUhZxzRg==
X-Received: by 2002:a05:6000:2c8:b0:32f:869e:b24b with SMTP id o8-20020a05600002c800b0032f869eb24bmr12601960wry.14.1698922119499;
        Thu, 02 Nov 2023 03:48:39 -0700 (PDT)
Received: from localhost ([147.161.152.103])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d5152000000b00327b5ca093dsm2069523wrt.117.2023.11.02.03.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 03:48:39 -0700 (PDT)
From: Massimiliano Minella <massimiliano.minella@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Ryan Eatmon <reatmon@ti.com>,
	Massimiliano Minella <massimiliano.minella@se.com>
Subject: [kirkstone][PATCH] k3r5: Use the ?= default assignment to allow for overrides
Date: Thu,  2 Nov 2023 11:48:28 +0100
Message-ID: <20231102104828.100681-1-massimiliano.minella@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Nov 2023 10:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17221

From: Ryan Eatmon <reatmon@ti.com>

Move to setting the values for PREFERRED_PROVIDER using the
?= default assignment so that we can override the setting if
we would like to.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index c5c03cbf..184d3a09 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -11,9 +11,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
-PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 SPL_SUFFIX = "bin"
 SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
-- 
2.42.0


