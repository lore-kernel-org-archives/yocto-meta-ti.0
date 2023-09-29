Return-Path: <jpanis@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5A6E71D23
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 12:26:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.15877.1695990377913006897
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 05:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=urPn6r2V;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jpanis@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4065f29e933so4482005e9.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 29 Sep 2023 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695990376; x=1696595176; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=85MxfPRRHRPk9+1UIXC8teJjunezucw7Bt3m/YBw8fE=;
        b=urPn6r2VGi4ywhTp/jOOUH02EYiN98gBuddau4nZ5Z473O3xmgeJadNfUK58SSJ9m6
         Yy/dpsK+Xh88/Te8VUYWjq/2ahuqaTCb8aT1IJ1qHFWY/GmvbQaNVfLoN3F/MitU0lSO
         0yAavuifrS8S4JaVwOc+vQoYO88+uh31llPsqipWZ9dosf+rbISoRRG50FJABoMdWB6Y
         cz86LOO/5Y6ewijVVKsvsNpkVjvxrXuc2UAqpvzHqAvukdcUF1WmsNRlZwb8j59mWUdy
         il8Q6iONUFRbUfN6Tefr0GoeeXWuF0CcQZZHbaJiQw8YaOsyTMpSFOtiKaIubpdzOqdz
         48rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990376; x=1696595176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85MxfPRRHRPk9+1UIXC8teJjunezucw7Bt3m/YBw8fE=;
        b=qKEpOXgipY/7AFIseFvK0/KHqUFKrypWuVyY2e3povfaPZp4/1hfySjnLO/wxKRGlI
         5s36hXYcrydOF1CCUfrV+6HCTCj4AKbVCkKFTBz6qgAsVv2Z9k31ioNAPiPOZ5i/OKZE
         mEsTa1+qIogIxvrJMTwTR7XLx4v38TqLtGl/NB5dAfG2/WB0BPJoCCcSMXS+6eu4KKlk
         khsMJHK8GLKc3SzJUIKEL1TRPIT2Ayo8gDhZBlJ8Pp1kfs6CFkMun0gR/JqYga7JMQMH
         nXGuaVO/U9kiur5fdDTCFcHWPUCZUbhkg6x0WbOPqevI1CwpxyBkDYq28YwKh1mzrLEz
         wp7w==
X-Gm-Message-State: AOJu0Yxaw3PWfpayE6Y37Wt7NruJune4c2CVpSnKDauZ6pBZwvBFpCpP
	/734ZBe3psWSXP25L/WSTPho3CA+BExKlN0DWXeiRg==
X-Google-Smtp-Source: AGHT+IHHuoVaweWb7oJUWRmaIE7iqi3yyiqA5Kpz+4UmK37GY4Nh/EbI6DjdwuXLoWO5z8TVH+IcBg==
X-Received: by 2002:a1c:7914:0:b0:405:40ab:7693 with SMTP id l20-20020a1c7914000000b0040540ab7693mr3675362wme.31.1695990375682;
        Fri, 29 Sep 2023 05:26:15 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. ([89.207.171.94])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c204c00b00403bbe69629sm1336176wmg.31.2023.09.29.05.26.13
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 05:26:14 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone] u-boot-ti: Fix SPL binary name for SD/MMC media on HS boards
Date: Fri, 29 Sep 2023 14:25:55 +0200
Message-Id: <20230929122555.10794-1-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 29 Sep 2023 12:26:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17029

The SPL binary built by u-boot for SD/MMC/eMMC media on HS platforms is
u-boot-spl_HS_MLO. Thanks to this fix, the binary is properly installed
and deployed.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index d9a3a520e857..9ca0fb44d127 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -100,9 +100,9 @@ UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
 
 # HS MLO
-UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
-UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
-UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
+UBOOT_HS_MLO_BINARY = "u-boot-spl_HS_MLO"
+UBOOT_HS_MLO_IMAGE = "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_MLO_SYMLINK = "u-boot-spl_HS_MLO-${MACHINE}"
 
 # HS ISSW
 UBOOT_HS_ISSW_BINARY = "u-boot-spl_HS_ISSW"
-- 
2.37.3


