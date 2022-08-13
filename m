Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D09C25B08
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 19:35:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.8323.1660419335481951791
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=Dv1nitJc;
 spf=pass (domain: baylibre.com, ip: 209.85.215.177,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pg1-f177.google.com with SMTP id l64so3468394pge.0
        for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/vJAsngzHstbBQYoOha6jULW62p8+NqHC0y9/AT2RpY=;
        b=Dv1nitJc97WWyAYwt3wUB7m7a1xzn51G8RjH0xc6KYeV10kmaMRuPzojtOvRxeI8sM
         0mPnWPGBpDgV5JhsnypVggW83Vhg4+CDlRipHpqTp45mfikD4SyEQyeOhu362IxVWEYE
         sUcYBZYmoSrYILtbl2uxPFh3E/sXqmG5aY5+7ozIkN3ozEXrFBtILpXG4d28vGKq44wq
         ajZDexTMNaKa7wFN+NRAF9qYPIBwE9nFPAlm57wAskCTORNvX7Rni1ZJ05z8L4r+atwq
         +U0PYViIddV/G0LACjILekDzx6PxLa48eoWxIOG6dYnW4IiJkojQcT51ceMAEENhjXxz
         PDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/vJAsngzHstbBQYoOha6jULW62p8+NqHC0y9/AT2RpY=;
        b=Puy2z90CySqUK3yzMRZUh7s4xTAamD4rx1SXerrBKoaMVNpTfA5mGq6L0sUy/VTIoR
         w+bH96I7yZyT7qIXACdtYr0y84zrUEJ4ww0L8pSaYc791hC5H4w+fTCud9zeKHabYF2U
         S+6RHKrc2eCDDedkOE7GAz6yQaX1GqXX8g5FfAzTChjMu4ZQIW+ztLIIhcn5/2wrw7OI
         R3dVAMzsec0lg/WR0EjIRb2UmuvsWpLeG73NEKpLgU6srsiSTNdr8WwnrM6JOkblg9/F
         DmUgdwXHZaF0uNVedDnT8tQgKVx37rk55fA59BopJM3KbowlXdZsOy7dWi4bKtRGqoTT
         dL6Q==
X-Gm-Message-State: ACgBeo2qf23ZEwU18HPhjvE8gNEeyT1mzJaJsHR4Oaes4aF3UgAl6GZ5
	pTZQWWaLA7Mtoye59ju6UETG86kVXENmuw==
X-Google-Smtp-Source: 
 AA6agR4ESEz7+4IpGD+21B6ZUierSchH5jCPsx6kbdRCx1RbbV9zOsLUmU/qx3Nw3paNvJJLbBaoSw==
X-Received: by 2002:a05:6a00:2449:b0:528:3a29:e79d with SMTP id
 d9-20020a056a00244900b005283a29e79dmr9595111pfj.39.1660419334561;
        Sat, 13 Aug 2022 12:35:34 -0700 (PDT)
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
Subject: [PATCH v2 1/3] conf: dra7xx-evm: avoid missing dtb files for
 linux-ti-mainline
Date: Sat, 13 Aug 2022 12:36:52 -0700
Message-Id: <20220813193654.2908698-2-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220813193654.2908698-1-dfustini@baylibre.com>
References: <20220813193654.2908698-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 13 Aug 2022 19:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14959

Avoid the inclusion of device tree files that do not exist upstream
when virtual/kernel is linux-ti-mainline for the dra7xx-evm MACHINE.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 conf/machine/dra7xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index db4a5e1ca5fe..6ab7a18796c0 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -12,7 +12,7 @@ KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
     ti/dra7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
-    dra71-evm-nand.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'dra71-evm-nand.dtb', d)} \
     ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
-- 
2.32.0


