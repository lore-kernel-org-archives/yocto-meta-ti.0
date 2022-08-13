Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AB6C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 19:35:46 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.8179.1660419335865498933
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=uUpQaAto;
 spf=pass (domain: baylibre.com, ip: 209.85.215.181,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pg1-f181.google.com with SMTP id c24so3429107pgg.11
        for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AIll0tXmzVdP3Jl8rF/oUlCORegxfKjO972+nT+8OR4=;
        b=uUpQaAto7zLOs9vpqDRvWOrK4Px5jaR2NUMDkYVIMevps4exCS7xoS6x6VpOPCqaOp
         klpMOai7KMouvBiJ71ylfaYb1UEMAK8Mqrht4nCn3mOSdl5ygtHXJ84CquTZ7yIi/RV6
         CPNJt7h7Hda+bVHr8kLUSI3DYXvqU4Kkn9lvG/ir9wfNu+fb4jRZ/NkPMDHZ5wWo4Up/
         +tw4Iktmg4R51ge9TSf3L7w1pmt94kElyjqlL7wk91OHYZpIBgnB3UAeA6+fpHslwRF6
         UxgYsH356WRUu8HWdwl+i5xlzSGdZrwQPYbt2pWq9/7YChey2OYXJrEZn9KJ5/vmAfs1
         KQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AIll0tXmzVdP3Jl8rF/oUlCORegxfKjO972+nT+8OR4=;
        b=4/on1mgCVcnjIkOeo3IKU6X7rNgxYzw5L341GWvhBJi51XVWwjbs4V+CTNV/8HyBH+
         So7zzefZKcvkpPidO9tkFb1XkX8YZmYff+Om075dgqG62b8uDjp/Ewp11iCLdn6kXYxP
         va5GfV8NbEHGGLb1/+KRfqvtWLE9dh1aTWIeHifkoeY6XjpbialpTYC+TD8Y7hdIAqia
         +fmkLLvNp+6Vf7/pGhhKzCeeq5H6hDxuL3UyiOWQ2l/TF+WXLNjYdjkNFHexwDfAgc2P
         QeOi6tuRqx2IipusgJoGX+wkycYqBSKz+iZxPP+mlZcKBl6Wl8xWJrKSSEb8YCw/q4nm
         g64Q==
X-Gm-Message-State: ACgBeo3gBs/7JOL7ieSSqISZAdMPDAJzGQnZvRqRx9eqeHdOBs5YMoUy
	Eu0DkvLeeOeQjDOii+4ufPUNtAv07DfkSg==
X-Google-Smtp-Source: 
 AA6agR4coEKFoGXMrkSz5o8xngcBLlW0OBTH8VmXpXBHF3cIzEY29sqHFduTJNc3nCvPxiRb9q9cyA==
X-Received: by 2002:a62:cd8c:0:b0:52d:a632:a8e0 with SMTP id
 o134-20020a62cd8c000000b0052da632a8e0mr9617589pfg.52.1660419335214;
        Sat, 13 Aug 2022 12:35:35 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1002:ab0:d51c:b519:7caf:31b8])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001f30f823145sm1930768pjb.55.2022.08.13.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 12:35:34 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 2/3] conf: am57xx-evm: avoid missing dtb files for
 linux-ti-mainline
Date: Sat, 13 Aug 2022 12:36:53 -0700
Message-Id: <20220813193654.2908698-3-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220813193654.2908698-1-dfustini@baylibre.com>
References: <20220813193654.2908698-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 13 Aug 2022 19:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14960

Avoid the inclusion of device tree files that do not exist upstream
when virtual/kernel is linux-ti-mainline for the am57xx-evm MACHINE.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 conf/machine/am57xx-evm.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index afcfbb4318ad..e27dffd0c286 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -13,9 +13,9 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revb1.dtb \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
-    am57xx-evm.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am57xx-evm.dtb', d)} \
     ti/am57xx-evm-common.dtbo \
-    am57xx-evm-reva3.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am57xx-evm-reva3.dtb', d)} \
     ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
     ti/am571x-idk-touchscreen.dtbo \
@@ -25,7 +25,7 @@ KERNEL_DEVICETREE = " \
     ti/am572x-idk-touchscreen.dtbo \
     ti/lcd-osd101t2587.dtbo \
     ti/lcd-osd101t2045.dtbo \
-    ti/ov10635.dtbo \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'ti/ov10635.dtbo', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.32.0


