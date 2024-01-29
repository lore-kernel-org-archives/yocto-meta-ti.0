Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22937C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 11:54:06 +0000 (UTC)
Received: from egress-ip43a.ess.de.barracuda.com (egress-ip43a.ess.de.barracuda.com [18.185.115.202])
 by mx.groups.io with SMTP id smtpd.web10.13017.1706529238309571617
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 03:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Tdk6t8FE;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.202, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound11-134.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Jan 2024 11:53:55 +0000
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d8c8dedd33so13307855ad.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1706529235; x=1707134035; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G52WY5oyqfxFT/4qbmDsAJovQR+bv2dTk6NJEZr82Oc=;
        b=Tdk6t8FEpTUL/3IE62LFfQo7f2NyMbbUJbn8oPntpZm1hhx1JGz0/nNXcYDkjmByMY
         wITAcgyCDcQ8T2P7d9fDSTqv115+LL1g1ZTsgsn7yIzh9/pT07bhyFpXfEzZ/FC9SGCH
         jpe4TSUiHOGbTa37GbRPvHZP+aVFHkPvf7GEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529235; x=1707134035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G52WY5oyqfxFT/4qbmDsAJovQR+bv2dTk6NJEZr82Oc=;
        b=m7LZvcdQroxke03WjqdNi8b/ZboUCOH6VSH6KT7yzqqzaOcpFW7R5Cht6hMnhE8H1R
         Ar0K2eodgQFJXm+Zfc4GXpgEcKCSt6c9lTZapRjbbSYcvJ9/inLLF6BkKKlQE9bi/9i4
         Jn2+juKWjgrfPzaXSqF4FhSvcHCK82NQDy4R1EMslVWh6Jt8+UfIdbalYABUdx+Wykng
         gU66/WBdmAn2s7pS6l8WjFDfEnLHJAvsBY7splDPNEIIfcB+0N7BXDKMlsIFS5XcWaTu
         pr6of0BataXPnqgtfvC+CHBShShR5Hs5nCyJzo11aI/f8h7LRNCaJBtNYcC2glMZOjlg
         7Iyg==
X-Gm-Message-State: AOJu0YwHq3vSf3+uSnC7ke9BdI4dxUSlhPZnWDiAUKFal9sl3kzv0/6b
	HeMeqodL7LMmgQh5vZ8N3OWQW2hFJmqU190TgntjhaaGfc3CdGs77WiPcp94TNIcnV054/ezAyP
	Xt/+IAB4ren5pLyv5UAq16rLbOBvz5Y1MV4BQyssi8DGa1Ayp16Kzk77xdotBncfPwHYE3mqxGZ
	oz2uIUFdAS0+qXVWtJJda7fA4=
X-Received: by 2002:a17:902:e84b:b0:1d8:d71b:8801 with SMTP id t11-20020a170902e84b00b001d8d71b8801mr2914699plg.54.1706529234892;
        Mon, 29 Jan 2024 03:53:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZHqi+7FMqvDnjTITI82nL9T6+5W8lmcsqIjAE5yN4WEaOpUrpu/uDNCXOlKkMbKGzeXca+w==
X-Received: by 2002:a17:902:e84b:b0:1d8:d71b:8801 with SMTP id t11-20020a170902e84b00b001d8d71b8801mr2914691plg.54.1706529234633;
        Mon, 29 Jan 2024 03:53:54 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001d7274cbd33sm5096391plb.121.2024.01.29.03.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:53:53 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][kirkstone][PATCH 3/4] ti-test: Remove OAMP-DRM test
Date: Mon, 29 Jan 2024 17:23:41 +0530
Message-Id: <20240129115342.9321-4-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240129115342.9321-1-sinthu.raja@ti.com>
References: <20240129115342.9321-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1706529235-302950-12655-3374-1
X-BESS-VER: 2019.1_20240125.1952
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDC2ALIygIJGBqlJpoamBo
	kmpqkWaaaJScnm5uaJJkZJKYYGZonJJkq1sQBNL0lbQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253837 [from 
	cloudscan14-72.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 11:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17427

From: Sinthu Raja <sinthu.raja@ti.com>

The omapdrm test is outdated and the required test cases shall be executed
using the GST commands. Disable the same which is no longer required.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index cf720c03..9a6dc67a 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -87,15 +87,12 @@ TI_TEST_TI_TOOLS:append:ti43x = " \
     switch-config \
 "
 
-NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
-
 TI_TEST_TI_TOOLS:append:omap-a15 = " \
     omapconf \
     pru-icss \
     switch-config \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-	    ${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
 
-- 
2.36.1


