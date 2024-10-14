Return-Path: <sergio.prado@e-labworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F22D18145
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 20:28:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1949.1728937676368359856
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 13:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20230601.gappssmtp.com header.s=20230601 header.b=fob3hLAY;
 spf=none, err=permanent DNS error (domain: e-labworks.com, ip: 209.85.216.41, mailfrom: sergio.prado@e-labworks.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e0d9b70455so3620442a91.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20230601.gappssmtp.com; s=20230601; t=1728937675; x=1729542475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++c9P27Br9dyMUPX/gv2JnjYSvuvfz8MOyqbo/DxN78=;
        b=fob3hLAY+Q32Nsu0EXgKh6cr/COD2ZEkLFR+YJvTAM1dMsksp1XhfwOmH0ZKx0+DyQ
         uMeIDFOLE/y5glW+UCfhHEE08UKMiXXsVQyUCVp+nN8/XL5T7YX82g1KjFlvcAJza6sa
         g6LD7FDA5lD443UsrW9MTw3aogXiqqnpNYOPYu7Wsq6Ab7Ivgp8s5V+HMILLbIFPYanf
         fFGwceHjXjFOH7dhTA8cbLHzhXmpPuEyQTcK1pPCp5iJPu3jrpBGkzHJnWXTZlxjxOEJ
         qptkEook03YU981S2YxwXEFi2VeciLAtHqvwLEPQ1I7iTs2nRFM6KjR4O2ZgJekZ3D8+
         GPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728937675; x=1729542475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++c9P27Br9dyMUPX/gv2JnjYSvuvfz8MOyqbo/DxN78=;
        b=Qx64LjPwDIAJdcOUdf4dmHEqB7PVbRQTd3L+X/LU1GD9iMA/y64IMqgCxLNQVGG4bS
         MO+ekMfGwXq+lUVDazC+RV+TpYaUgTXqobY3qXeOR8FveRa24jY7Un8ymop58Nnj7csL
         LrxiuRrYcexunZCueP48kEZHk+8dRpsUfsyCXMnNi+2+99dtG1bViliLnv1iKx1W5f1Z
         F/oVZdQW8S7r/1zQE9vqHnFTFR8nD0EbAf8xL4bM5iEvKe6VSUppW4vHYHS/9nj0r5VG
         xgXY9jWbAD52K4YxRzu8CWoP2kASJIdXaVSTOA1JBJYX/xS9wDRtjuUG0MbN4fsCLXoM
         /28w==
X-Gm-Message-State: AOJu0Yxx7U15+JQy6G2aqJutKVCNNWuojXV/jvpUV3FbcJbj8Ld9ThzF
	VZADDXGhmR4T4SMmXzi3A5ETQjOZhqZaTEOZ+skeYQ+UV2nREG8DU2hMA2h1pPmWd5KanpRE+ny
	F0gk=
X-Google-Smtp-Source: AGHT+IFNziM1opRatnbqpJnTkc2rOJ9GrR8gSDUwzQoNqWc3puZSktIe/iZJeilIUOcNg1pWb4+m3w==
X-Received: by 2002:a17:90b:193:b0:2e2:b2ce:e41e with SMTP id 98e67ed59e1d1-2e2f0add938mr16094484a91.13.1728937675436;
        Mon, 14 Oct 2024 13:27:55 -0700 (PDT)
Received: from desktop.. ([2804:7f0:6400:b74:20a1:8702:50bb:4d87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea784b00d7sm3483834a12.22.2024.10.14.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 13:27:54 -0700 (PDT)
From: Sergio Prado <sergio.prado@e-labworks.com>
To: meta-ti@lists.yoctoproject.org
Cc: rogerio.borin@toradex.com,
	Sergio Prado <sergio.prado@e-labworks.com>
Subject: [master/scarthgap][PATCH] conf: machine: k3: use weak assignment for FIT image variables
Date: Mon, 14 Oct 2024 17:27:46 -0300
Message-Id: <20241014202746.1818435-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Oct 2024 20:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18006

Use weak assignment to make it possible to override the default
value via classes parsed after the machine configuration file.

This is the case when using the tdxref-signed class from
meta-toradex-security to generated signed images for AM6X.

Additionally, explicitly set FIT_SIGN_NUMBITS to 4096 to align with the
default rsa4096 algorithm, preventing potential mismatches between the
signing algorithm and key length.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Rogerio Borin <rogerio.borin@toradex.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index a296f64fa141..07f0bcb48bfc 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -26,10 +26,11 @@ UBOOT_SUFFIX = "img"
 
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
-UBOOT_SIGN_KEYNAME ?= "custMpk"
-UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
-FIT_HASH_ALG ?= "sha512"
-FIT_SIGN_ALG ?= "rsa4096"
+UBOOT_SIGN_KEYNAME ??= "custMpk"
+UBOOT_SIGN_KEYDIR ??= "${TI_SECURE_DEV_PKG}/keys"
+FIT_HASH_ALG ??= "sha512"
+FIT_SIGN_ALG ??= "rsa4096"
+FIT_SIGN_NUMBITS ??= "4096"
 
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
-- 
2.34.1


