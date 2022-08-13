Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D57C3F6B0
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 19:35:46 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.8324.1660419336642001335
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=0UC1/7Hg;
 spf=pass (domain: baylibre.com, ip: 209.85.216.45,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pj1-f45.google.com with SMTP id gj1so3814376pjb.0
        for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dvlKR0ClDyjU3KO7y1zuTIP/mYt6E7vxWbPdnUkhfuo=;
        b=0UC1/7HgLwHCOLVvhOhgQ5oKTlOhDXW8j4tFqfrjJBeJyO7qoIO7/0IvAwAZW/lTc6
         6xg1MYk+H7pgSbi9mszBgSjnpqm1tu7/8ieGvtyN489oW/XOALrkDmNW40S0DElsmHH+
         nhA63bJ3fO/4iN7lpGpQpua6zob6FhO3M7IcvOklu75XO+K+Z3/4MfD4sDr3hX/f3dt5
         RES2zNZ4TwErcDME3Y3MvtN+Uv4W/eYXvxF+JOaAuTJ3F9lEyV8kwZzH75Mq78AkezcI
         uNhPbYx8VThvVFz1VqlvW5uxcDWY7SuLYEtp+OdwQv38E7ymSPU3p4+0i1nxIFu6Hsaz
         tGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dvlKR0ClDyjU3KO7y1zuTIP/mYt6E7vxWbPdnUkhfuo=;
        b=Hrxi8OCDL4WNf43raqy/G7/ouylTls1z+n/wJy0VHg2zssz3JZPFX41V5/S6fUZs6N
         89LNJKgwq0S6N66Y8ypxlPkagQijCY4cVQGgM156yMkCmgjUbdhIKHqnJismwBABicEs
         Le5zNRE4APgXSYFGHfUcitV9Exe0WVLjcCuL+WxrdMXC3MWwnNxQzRNBTEzYV1URw7P7
         3kOW87BNxhmmxlAkcWbpaESJ1aH6LBr/iI4h9nsVp7EuL+SxwulUDMNO4atMTnUCoL1C
         30m6noiqT1KSU5ZTTNuYKyQ+JCsWPGbfwzounMH2KRKXs6XlTwwafGYB2JFzuoePobvA
         5tzw==
X-Gm-Message-State: ACgBeo1kNLLc5r+/Ufu/OJrWzHpKorLcqL6lDh8tNGOxIbXieefab8s6
	9kjsvvft98DCgIVaZbTOUmeUmSpOLzdZdw==
X-Google-Smtp-Source: 
 AA6agR4Xx7/WxyWzZpkqyvlKepiNut0tiAMWk+pwTvnN5rJ44wxcptf1h42E74qViFlDktegC9c2Qw==
X-Received: by 2002:a17:90a:5517:b0:1f8:a7ce:ac33 with SMTP id
 b23-20020a17090a551700b001f8a7ceac33mr15172909pji.83.1660419335929;
        Sat, 13 Aug 2022 12:35:35 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1002:ab0:d51c:b519:7caf:31b8])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001f30f823145sm1930768pjb.55.2022.08.13.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 12:35:35 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 3/3] conf: am43: avoid missing dtb files for
 linux-ti-mainline
Date: Sat, 13 Aug 2022 12:36:54 -0700
Message-Id: <20220813193654.2908698-4-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220813193654.2908698-1-dfustini@baylibre.com>
References: <20220813193654.2908698-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 13 Aug 2022 19:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14961

Avoid the inclusion of device tree files that do not exist upstream
when virtual/kernel is linux-ti-mainline for the am43xx machines.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 conf/machine/include/ti43x.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index fc9af94921c4..ace46b89046e 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -27,9 +27,11 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
+    am437x-gp-evm.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am437x-gp-evm-hdmi.dtb', d)} \
     am437x-sk-evm.dtb am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb \
+    am43x-epos-evm.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am43x-epos-evm-hdmi.dtb', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.32.0


