Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398C8C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:44:24 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.1412.1669221856309592139
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 08:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=foOsOO0y;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id j10-20020a17090aeb0a00b00218dfce36e5so2072481pjz.1
        for <meta-ti@lists.yoctoproject.org>; Wed, 23 Nov 2022 08:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkTc9WjS47qHfJv7rudWYrR/vEebFtszpEKz1wMbrxo=;
        b=foOsOO0yGkmkrvl9wni52gxbc2Lu5dCM7K6F3ThijeNDHkYq+gk1TZdOy8t2i3Icyd
         18OKPUqnC/rVeoFKC58GJlq6tSnfyFQMbTsaG5CEs477ffY2AzJnHz3iHzUZ0SuA7CtQ
         iqcNJOUXrkIuJtp8LqXUh0UbrFL+80JotCmU+/fHltN3dKOqxIvJ46xoPhP9ne15xwbT
         W5NsRBr9D+30MA6qvhDz+Iwz4+/BeXNp2TUuhVlASu+1C/E6VeEdWkvBcE4cWP8T1mGH
         jZGSFr1yvu94nXQdewLEjjSqUJZk9Fb8+IiiOtqh0oiNRPVPMoH8qnzuvZJbUEBeDW5D
         Y+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkTc9WjS47qHfJv7rudWYrR/vEebFtszpEKz1wMbrxo=;
        b=NVl1mYq0oV0D9nGLlSseDjKydWOyuNkLS/2A+wlRUT4uX37xevBjtaPNrKPYVI8O68
         rSeFkIrT4gloBVFuaeC/wmC/9fPiNtsJlUp3IiHaWEjeVwQsVkl3Qwf0Ixf3jd7688aT
         RSJRORazVm5nTvM/GV3rNE7AJe/MxqgmmMlwJA3VkXgUE8G9y1P5jADMtSD7GV7xl55E
         N5kyXb1Ce2WGf1sqRtVaMSKwWtjQiBdoLQ9IJjR4Sz+bV3VQTrX/6rFxRbsWLCTaZSZu
         ux3Cg1fXpFklPhsRuZqjBVpUQOQMhmzhH5SXudeM1EJcF3qzkWFyxaBj33QZP2alX9Xf
         RK9Q==
X-Gm-Message-State: ANoB5pl9FKUzPqSB7vcAMLEWGTvCyHZxa87rbF3NLOn1z4Pq9EUVh4se
	89TviU2JZjvIuyHtyrYPidlLlAIbm8w=
X-Google-Smtp-Source: AA0mqf5G1aAUyv601rTKoutE9vWKdMet0BM/wVWG89OWijBORrsypjLhTAbOkZmAcBiaUgFxbwZEIg==
X-Received: by 2002:a17:903:286:b0:189:39e4:c50b with SMTP id j6-20020a170903028600b0018939e4c50bmr6521594plr.101.1669221855132;
        Wed, 23 Nov 2022 08:44:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b00176e6f553efsm14468833pls.84.2022.11.23.08.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:44:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffa-debugfs-mod: Remove bbappend
Date: Wed, 23 Nov 2022 08:44:12 -0800
Message-Id: <20221123164412.3764415-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Nov 2022 16:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15360

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
2.38.1


