Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A473CCA473
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 03:09:28 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.67769.1656904161517899553
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=0ddKPXci;
 spf=pass (domain: baylibre.com, ip: 209.85.210.174,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pf1-f174.google.com with SMTP id b2so7764910pfb.8
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+rukeUY6w4vnB3SjuxWvSrdoYfmPHf83GIGQUtRhXI=;
        b=0ddKPXciQvoe1/42pCpY6EYXn9B8UpO3Z21Z39BnZVBDjYl1YX2ivBAydSa6d92m0Z
         kvXMS7nJttFgLlijWoO2xWbDluWH2Oa1bSwAIefu1orQ/gHSgV7SjaeOR8pMCStlnWHC
         fGH/BY84CiLBQO69cng7Kcyqxk5ODp2sx8jLLg5+6YL6CqbNKXKXbnWVTUx5RLgn86iK
         UhTtdmGG1bWdDvQEMKY2SQv0VyaYIWj3jfy33JSV7MbCWivJbeYQs4jrPkZPiCIMI0gD
         6iN9QM/NiOp2mGtH1lfrALtPTTB/RVVYvgESjIPUVLKQANfnCZEGDPdGlBC2kUa+J/My
         K+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+rukeUY6w4vnB3SjuxWvSrdoYfmPHf83GIGQUtRhXI=;
        b=XrnwrTsIj8ZFa/8uSBVGFtRNDN65A2pw4MG2AjOn7VQ3RepbSZIMtPqEQmAApGUQ5b
         49H9PVVMcJ1CB1hy0e3J5jLGJUSrGYt+nHkbyR9Xk5UoI/qfCJ1sCCIR7LZ3GIO9ow7E
         Jrc1T1os2hKTjFBwgY9hbUWCYxM3EzPTA3EY5Tuz4+eUGfPUFG8Oxe/MdexiwXhAyM3v
         2mdpYTq+CsSadUyzM04izuPhOlB0fGT4KIP+CuLQMJ8fSxp93t1ZIEdNRzdOvqXJwiL+
         GBLdIkE2QJz1crkoFPVRREGlo7lQH0E7wKZLdNglkiPxQx1cHxod08ghV5yPaQO+7eV+
         78yQ==
X-Gm-Message-State: AJIora/FKwHdx4d53zt/gaXz1kSaCxC6dIIss8qjAYC4eHC5T65jZmyc
	ODpj80jA/6VRwSMoUGBuLb84X/TWzKCE6w==
X-Google-Smtp-Source: 
 AGRyM1v5mho4RVMr/YYPbUll7hkBsHsn09lT5mf3jBLG0liC6sKIeqHwdzysYi8K2aCHjyZ2Pd6sZw==
X-Received: by 2002:a05:6a00:32c5:b0:525:933e:252f with SMTP id
 cl5-20020a056a0032c500b00525933e252fmr32608899pfb.26.1656904160721;
        Sun, 03 Jul 2022 20:09:20 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1001:7090:139e:6a0c:c997:d6a3])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a158900b001ef3daa0f21sm8203692pja.16.2022.07.03.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 20:09:20 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH dunfell 2/3] conf: dra7xx-evm: avoid missing dtb files when
 ARAGO_BRAND=mainline
Date: Sun,  3 Jul 2022 20:06:08 -0700
Message-Id: <20220704030607.2292135-3-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220704030607.2292135-1-dfustini@baylibre.com>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Jul 2022 03:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14870

For ARAGO_BRAND=mainline with the dra7xx-evm MACHINE, avoid the
inclusion of device tree files that do not exist upstream.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 conf/machine/dra7xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index db4a5e1ca5fe..128205735c93 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -12,7 +12,7 @@ KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
     ti/dra7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
-    dra71-evm-nand.dtb \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'dra71-evm-nand.dtb', d)} \
     ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
-- 
2.32.0


