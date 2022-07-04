Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498A0C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 03:09:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.68367.1656904160526053232
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=T94HX2CL;
 spf=pass (domain: baylibre.com, ip: 209.85.210.179,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pf1-f179.google.com with SMTP id w185so4066781pfb.4
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fpKDaZn69hxE8a2z715emkLIxXhXWeGVFx3iJrUUCRw=;
        b=T94HX2CLklilMLieI4Lxrh7l00aCUXBOBAb1bbovioFCrmafNlxhKTQbA8NtM5GPol
         LTBeFGPNT2RyZvk9NyNHBLvhFqs2wqD4cz34dyp2df0LOM9qPKljkqVBjJkRqqSnCJjR
         K6pUKDd2FrjO9pNdHiikLtuNFVl8azH7RR52IB9iaWEruGv83cE4XFlBWqmtZlw1vnqK
         zrMFGRyvL+ODeEjs0XW0ca75ENSefKBIYn3KKBMc/NqLN9eW0JIztI4K+Xt5CsXUF5g1
         dd1mhndwfVVV7851qY0NjodUk7IJ0uuwNu3rxH6eYQHoZWNnc6SswW1QlUYW77HzMLEQ
         PlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fpKDaZn69hxE8a2z715emkLIxXhXWeGVFx3iJrUUCRw=;
        b=ObxzwCHKgrhWzK1u8UWLhzXdlf91GOwEZ8rtfwR3RCmBfHNvSExLw/YfaYTxP8gyFd
         n3zZwAscJn72mbJ+hEkXX07fPmX7a6Lr5bFbmZx0r7gyfe99UPRNhxhyjj3a8Gax23dj
         EQK4xBGRlXQct5CTin0Jza1nJajLF9A+RG0nP4Vtfd9AcKz75ckhZ86nKcbIXHpuapnR
         WuRQfxcPbJTDigszBO08Txz9809IuwhpohJXzvZdyapR4qxww3+BP9m7k19oAdss4AK9
         eKKbwYE/o7S2p3m1FSBCG91WuZf59qv/aHlZiQWE0V11pd21eoy5x5acMWGh0qJCE9FN
         nlSw==
X-Gm-Message-State: AJIora+rLFIVSsgOlRCfk3v0jbyA8hiU63u6AqvBNjlY2KGNUtqbt9iY
	M/a0iYkOwi2w+/EVbC64LACiI3OAQqndTQ==
X-Google-Smtp-Source: 
 AGRyM1usPyKDO4w3OMSezM1qpTKyRjR5w99T6HdJVbib4hnuQgjBZ5ktbRu1KTMuo1JtBPwAgJO3VA==
X-Received: by 2002:a63:9516:0:b0:40c:c3b9:f984 with SMTP id
 p22-20020a639516000000b0040cc3b9f984mr23597362pgd.116.1656904159876;
        Sun, 03 Jul 2022 20:09:19 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1001:7090:139e:6a0c:c997:d6a3])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a158900b001ef3daa0f21sm8203692pja.16.2022.07.03.20.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 20:09:19 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH dunfell 1/3] conf: am57xx-evm: avoid missing dtb files when
 ARAGO_BRAND=mainline
Date: Sun,  3 Jul 2022 20:06:07 -0700
Message-Id: <20220704030607.2292135-2-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220704030607.2292135-1-dfustini@baylibre.com>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Jul 2022 03:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14869

For ARAGO_BRAND=mainline with the am57xx-evm MACHINE, avoid the
inclusion of device tree files that do not exist upstream.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 conf/machine/am57xx-evm.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index afcfbb4318ad..2fde75fe7603 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -13,9 +13,9 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revb1.dtb \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
-    am57xx-evm.dtb \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'am57xx-evm.dtb', d)} \
     ti/am57xx-evm-common.dtbo \
-    am57xx-evm-reva3.dtb \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'am57xx-evm-reva3.dtb', d)} \
     ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
     ti/am571x-idk-touchscreen.dtbo \
@@ -25,7 +25,7 @@ KERNEL_DEVICETREE = " \
     ti/am572x-idk-touchscreen.dtbo \
     ti/lcd-osd101t2587.dtbo \
     ti/lcd-osd101t2045.dtbo \
-    ti/ov10635.dtbo \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti/ov10635.dtbo', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.32.0


