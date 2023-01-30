Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC5DC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 14:47:58 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web10.42828.1675090068943842062
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 06:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=M+B2a0hZ;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198]) by mx-outbound19-167.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 30 Jan 2023 14:47:46 +0000
Received: by mail-pf1-f198.google.com with SMTP id 12-20020a62160c000000b005808c2cd0b6so5530966pfw.12
        for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 06:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4TliseWoQXC0UsoVoISH7t2/vMzmHgm5LOwduGIiCs=;
        b=M+B2a0hZuxprtz9fiE0Opf43sgxfK4tT3tUCEd1syzM6Y3s4xmH4mTcUqvCPPzibry
         1XY4rAKsTMOtwbGxY5vgmSPBuxT6HP25TdOmsW9s0fxhFezB19d50muls/Gqocmx+NQ+
         64aPtgM/eqy080Pt0fhatKGnUUAb9DafMNVck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4TliseWoQXC0UsoVoISH7t2/vMzmHgm5LOwduGIiCs=;
        b=pPgWLaH+iVrtBPeRV+EQu3hCFxyKOnQrWMvcklxHKT/QBC+yvpXljs4yrp9Db6TLoz
         7hQw7aI2w8f+ke/5bn3RdO2EKuj5OZGk/NwCEKKCx27zdrU7YR+cBMFbPePuZkW/T02a
         ORiSSkUmvMBIkcHqB5MwCkicLCKo0gg4s6B+iSHFpIKkGUOGqaNa+PZS9BFJHT85UNSo
         LseqzWKEvzIblzhJlMeD8AQIfWsiJvwaDxBHaZh9mpYszN8VlOHT/FOvj898KEYWXuj6
         ipBU4PxrvyBppKK3hzfgCZ2F2UvvOhrA12Do8CNlN4PZfuYRK1d/Gp5lrnunX0yS461n
         wxxg==
X-Gm-Message-State: AFqh2krT1+COKEOeTk4Rh9CfcskMdV5uKgRonwSSu/Dz3xli7gD5ST8q
	w5J1KJ4jkr9PHuVbxTfZVBW+cf0rpXdrDbUd/wMBZeoTxTiWOvq9QPMYty02NQHbRBDSsNWCc8N
	VRtebqTbunJWyYcZ8Xun17XwgbbEOlRYrnGzRURaF023677xXmKeGIYaT4bM8DfQ=
X-Received: by 2002:a62:2582:0:b0:58d:a7f4:9630 with SMTP id l124-20020a622582000000b0058da7f49630mr43604913pfl.16.1675090065242;
        Mon, 30 Jan 2023 06:47:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvu/2F+ZrPuzqbfZmBXCnK9voHuJK2HcETSjno8kfkZilKqeWe9ePNrREV5UFIEJoKV3MhWMA==
X-Received: by 2002:a62:2582:0:b0:58d:a7f4:9630 with SMTP id l124-20020a622582000000b0058da7f49630mr43604893pfl.16.1675090064941;
        Mon, 30 Jan 2023 06:47:44 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:61b6:8248:9f1:b2eb:bc8f:f50f])
        by smtp.gmail.com with ESMTPSA id b2-20020aa79502000000b0058da92f7c8dsm7756180pfp.17.2023.01.30.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 06:47:44 -0800 (PST)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Dasnavis Sabiya <sabiya.d@ti.com>
Subject: [dunfell] conf: machine: j784s4: Add FPDLink overlays for AM69 SK
Date: Mon, 30 Jan 2023 20:17:38 +0530
Message-Id: <20230130144738.97582-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675090065-305031-5395-16869-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.210.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245805 [from 
	cloudscan17-30.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO, NO_REAL_NAME
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 14:47:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15698

From: Dasnavis Sabiya <sabiya.d@ti.com>

Add the overlay files for AM69 SK:
1. Fusion board (For FPDLink-III cameras).
2. IMX390 FPDLink-III camera module that includes both the CM and
   RCM type of modules.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
---
 conf/machine/j784s4-evm.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index 24fa3356..e892f597 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -16,7 +16,24 @@ KERNEL_DEVICETREE = " \
     ti/k3-am69-sk.dtb \
     ti/k3-am69-sk-csi2-ov5640.dtbo \
     ti/k3-am69-sk-ddr-mem-carveout.dtbo \
+    ti/k3-am69-sk-fpdlink-fusion.dtbo \
     ti/k3-am69-sk-rpi-cam-imx219.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j784s4-evm.dtb \
 "
 
-- 
2.25.1


