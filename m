Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2AFCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:30:45 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.199156.1697509838511625418
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 19:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVncodK5;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e9d0fc55beso1936183fac.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509838; x=1698114638; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eoOuDtZ5iXSX+IDonYDR8iFYIjUOD2jp441Mvs6ecA=;
        b=fVncodK5zdkzHBJGA7ln14e+stp/ZFzJUqSxF8o0CIxob3Qn7uSRPkNIfIPSPiUMnt
         m++ymF63DwVJO0nFGx+5TYf6OEktn65i7BtLLTOxMZ6dIzyFJFKMssVa7BTiUm4MWF61
         fiSKtFbqo6OQsOzaVaeN4maNr6SIHoDMeylf3+rNIUhdtt9L9J1cFeoNx80yCIE7ERm5
         UJcz7RoX2ZD55Gjy6SXtznXqx7fFaOOAmmZebkGaHIf/sCLGlyvwIzwdktLTQmcm8RW7
         nrNcXTT/7le3tNJxV1Gl+P9Gxwltb5a8k8LrDCb2A5pZwfIKXBVsFjtcv0bnhaUfyeWg
         Dzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509838; x=1698114638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eoOuDtZ5iXSX+IDonYDR8iFYIjUOD2jp441Mvs6ecA=;
        b=FMPgfst/7OeS79kJAUKTpCrxrivw48QDqTIPPBGbm3NyOHe5tYU5umGhJ0mT8kyTfE
         pHaz1YiDfdLRNkV8Ia+tyegbwODMKFGCKTKhs8Dg1AGTcgYuaFZtduJrjzLyZ57fXwHD
         p4NBUA7iGME4Dzrrsv0456gli0KtiZxVea/DJTT4Cz0weii+42Cn6amfQiX4wi6zxVkm
         T2rzSY2qyyrHMZLyXHNQFGWGOXrCfo+3peT23mm+bDWplFgkd6qGpeb86R17Orxnjwku
         hf5OpU/cI7sdS3ZcYCoG3yJaelcxj4ASqpUFVAuqIvT/9w8WziVUXqRgdesB1ky6WFU+
         JeyQ==
X-Gm-Message-State: AOJu0Ywb3gcZ8Qraylft8/Vs7Etu/NoM4uyzptoaQXUIWUY6L3NEuD/C
	YAc2oN8L91F8hA959kTcTsQ=
X-Google-Smtp-Source: AGHT+IF6yfXRQwWvxUlCkQEkVZx/Qor7NmVMWGkB+vRfAkmCC+SPRRhZUPJ1knKjNMPFwN/AX9VRmg==
X-Received: by 2002:a05:6870:ab85:b0:1e9:8699:d20c with SMTP id gs5-20020a056870ab8500b001e98699d20cmr967091oab.53.1697509837668;
        Mon, 16 Oct 2023 19:30:37 -0700 (PDT)
Received: from rig.lan ([2600:1700:eec4:a85f::3])
        by smtp.gmail.com with ESMTPSA id mo16-20020a056871321000b001e9a60dbc42sm95331oac.47.2023.10.16.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:30:37 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: reatmon@ti.com,
	denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org,
	Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv3 2/3] mesa-pvr: bump srcrev for sgx support
Date: Mon, 16 Oct 2023 21:29:50 -0500
Message-ID: <20231017022951.108252-3-res.sapp@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017022951.108252-1-res.sapp@gmail.com>
References: <20231017022951.108252-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 02:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17129

From: Randolph Sapp <rs@ti.com>

Bump the SRCREV to include the required changes to build for SGX now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 281d6a21..857bbdf3 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -23,7 +23,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
+SRCREV = "13829fd7ffa8e9e961cc8702869da55d72f99a84"
 
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-- 
2.42.0


