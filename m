Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21E4C43217
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:31:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.25175.1664983878704522160
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 08:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBtr5d/a;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id b2so10814520plc.7
        for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IYF+KqDQlfH1XSRQitejlZO9FmNix7bny38KKBxsBzk=;
        b=RBtr5d/atj0FxVKzQH2XRoeP5qD3H9/sPueZh/Su/nzVcGse/y4PuN3EUg7pX8ystP
         fWxQcAOVBN0q2F+yr1rxERHazpCZdp0//t/yod8W/NDhlOtZtDiPAPXJWbwdT/jz0lPc
         7Rg1MKkVulCPhMFluxuEyMq4CQzBP8LC2c6FFKNFBl3UHiqwedcl13pnHvGyIy3JeCzB
         AGLvoT9u19M3yzZ3wvK/RWUHv9RcqqUNWJK/hRlS8EKC5vVzX4Y3WWEIvM95fhK2pw3L
         S4KPZd7VMG4SXj0EzbzYH06CzLL7R3Lmss58BBqNWuVHXturXaeTcMrLMeNxHlAEt6Ds
         QoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IYF+KqDQlfH1XSRQitejlZO9FmNix7bny38KKBxsBzk=;
        b=CJ8FtkIrKjpZGnhyRin177dcAeJcYic1I2YihqFPACpeZT0myvHAW2SaSAc4P58q4s
         8DXKs580RP7F6MBhqd9iuR1Y2LtETocbhSU5Ox79HYmlt+TySfq6Q86rJvJYzQiPx41U
         4bmhngDR3Ugomv3tczJgizBjcpeTUlanrY/4RJkk3wKYvrslSeF0VeFT+ZtoQU1eQeIK
         dXIdBPk1jD1pyFyk6oh1r1PynABVUw4VD8DS3u7c+3cJxMWt2KH3vw3MI2Qk+Qp4P10i
         k+wSz0Sc0+EPWyhE2nBZchaNCL9BzCWMPSF2KDxzpI67OnDIeBJ9+xhYmzdYsE4gS+I5
         N6Bg==
X-Gm-Message-State: ACrzQf34RGHwCDMAaNYUwzSrUz3mNXj0TCzQIZC98Z+MeeuJ7ghWnxYI
	osRHbzIlk2jSJ36WpJmTIfdUA7OJX+nDzQ==
X-Google-Smtp-Source: 
 AMsMyM7lEptakDKCbzTHEPCC2yuuEZQdvFcxk2JUf95Q+mIwhXryDkxCkK4YSccXCfPG9sA6jiQG8A==
X-Received: by 2002:a17:902:b70c:b0:179:eb79:cf9a with SMTP id
 d12-20020a170902b70c00b00179eb79cf9amr297457pls.130.1664983877823;
        Wed, 05 Oct 2022 08:31:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b00177f32b1a32sm10760913pla.271.2022.10.05.08.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:31:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ffa-debugfs-mod: Remove bbappend
Date: Wed,  5 Oct 2022 08:31:14 -0700
Message-Id: <20221005153114.265420-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005153114.265420-1-raj.khem@gmail.com>
References: <20221005153114.265420-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Oct 2022 15:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15112

The main recipe in meta-arm is gone with 5.19 kernel onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend             | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend

diff --git a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
deleted file mode 100644
index 67fcf6ec..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Added my meta-arm, this needs ceetain backports in 5.10
-# Disable until kernel upgrades to newer than 5.10 where it
-# is already upstreamed
-# Revisit when kernel is upgraded to 5.15 or newer e.g.
-COMPATIBLE_HOST:ti-soc = "null"
-- 
2.38.0


