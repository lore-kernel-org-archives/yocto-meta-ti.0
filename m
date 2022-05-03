Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89468C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 16:09:55 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.1091.1651594193019793552
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 09:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GmIL6fRC;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id i1so9225071plg.7
        for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lkgkI6QTCQ/A2MdvsmlEXII2bP5KtmJy/bJHykviJY=;
        b=GmIL6fRCGxULopl/VrUtd8AQwJf1urTwMGFGGr8hDMno0aeamARQ9qYkOLaDlYnEwR
         jFG1FJorj3pGGDnWDPuKvKw6Nmp8rzcQEs8Wd7hdhvQ52mLI3upHQSA1vun362fz5LxV
         29N2n6m/+FwuDmTBPpYsvTGYQtxWWrXtVHyPwowaS8h/6680q3qgCp7aFlWTqF6F/utt
         nRPG9/FLLFTxVSfBdZW6sI/F5uscErNkRzK4W4lNmdNznzh2SXqDWt0mT/AaGXsxHIa8
         Vikqj2/ZNYEGUNcG37pcS4ClsCpIsrXtr4gbBW8YFgO50iewK/j4g+PG/+E2oqVm9E4d
         kJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lkgkI6QTCQ/A2MdvsmlEXII2bP5KtmJy/bJHykviJY=;
        b=J+V6wR9Ml010ogpEgQwfrsflTmcpDMdJk5m6IJj4N9daiFO4ugA+fTzx2mT/sU8Dhm
         z9ksSnnVs2ockZ1YTRLt1Wjttt3JYHNk8XH4o7fqz0rdMJQ6GWBF7F9YS2tW6wS8MrFb
         6qtmLxhAQp7FZ7J1Y4owSYHpwaKUDF4TsKmQ0PYqsjgB5e1K+3twTIzvr+slteLGnSh6
         10/xRFCNPQdN6eUIaFpFSrOi1FyCT7wkXjFJs/zNoZnZG7ZMUnQYQiU1L7gRIjAIhC1V
         w3k0+3Bul8qPw5q+kl2IrjdCWUTyMEEhKMLG6VLqqSazxr3V9dnKyc1JcKOuXwHZ5grm
         4G6g==
X-Gm-Message-State: AOAM532wQd6b0K4hNhNXUPgEO+hzCbNLWM0JlvP6fFkBSIwD1gzWWvlC
	Byey+Qo+F0JDRdeZdebAq7lXeDAy0qKFqg==
X-Google-Smtp-Source: 
 ABdhPJycGgKVL5KrCt6oG8PLKRKGuKvr1afsOtP3nGXDz8xozhquv1GFVl72ph6yNNvFJsT03Ggazg==
X-Received: by 2002:a17:902:d5ce:b0:158:48db:9719 with SMTP id
 g14-20020a170902d5ce00b0015848db9719mr17252282plh.7.1651594192077;
        Tue, 03 May 2022 09:09:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 i10-20020a17090a65ca00b001cd4989ff4esm1539294pjs.21.2022.05.03.09.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 09:09:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ffa-debugfs-mod: Do not build for TI SOCs
Date: Tue,  3 May 2022 09:09:49 -0700
Message-Id: <20220503160949.1685272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 16:09:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14686

The module can not be compiled without patching kernel 5.10
This helps meta-ti to live in multi-BSP envs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend             | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend

diff --git a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
new file mode 100644
index 00000000..67fcf6ec
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
@@ -0,0 +1,5 @@
+# Added my meta-arm, this needs ceetain backports in 5.10
+# Disable until kernel upgrades to newer than 5.10 where it
+# is already upstreamed
+# Revisit when kernel is upgraded to 5.15 or newer e.g.
+COMPATIBLE_HOST:ti-soc = "null"
-- 
2.36.0


