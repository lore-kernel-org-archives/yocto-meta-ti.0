Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E26C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:45:32 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.68925.1674719126872914134
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 23:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=SxiPpTH9;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197]) by mx-outbound20-247.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 26 Jan 2023 07:45:10 +0000
Received: by mail-pf1-f197.google.com with SMTP id cr14-20020a056a000f0e00b0058da951c487so587553pfb.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 23:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gc0Zl0OcjWwp+zgdVrEU1feMIuM2RZotfuBUBTp2MDM=;
        b=SxiPpTH9l2rSMypuICYgOJrBdWsrBH0DZjFyd72OF01+zvaFdL29MS3T8rk3YT8CVZ
         mTatveqd8PKBdIjSyGjT8XOzJP4H2zeyUXdqyp1kl8Mgk22VX4nUUh760/b13WSpOgh2
         XOYy4J357VCyo2SX6f+CIcSpclASk32LPXMbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc0Zl0OcjWwp+zgdVrEU1feMIuM2RZotfuBUBTp2MDM=;
        b=aubBkjrXSL0sE+UZW9wfWLSO50ClLE0pbd7n2FxXylhZahGuNG9t3Srw8IoU5ebMaX
         t/tmX8rj68iqVzkg0w9RnlZKs81MNeOZVTI0X95tbCXzoN1ljCDNaXNm2nsAH5KXw3lv
         eBP8EYb2N63I9s43Mk9o7aNwD2jXGd8fMOHiS/xv6wFJXBam7zshEcOpXTUq/lPlwsuh
         Ea272gQCodJ4/M2CRwLmSvEtexNzuT80zyKbE5f/xTGdYZNyHomclNkiq/9yWIdI4ZMh
         ZyGvBjApwV9nU0GdZ6UxYCxNO9qt1FyIbmi0XizD2U1WccstDCAY3+ZN76glEVfu6rGI
         dGMw==
X-Gm-Message-State: AFqh2kpiPgmtcS405cPypBNbK/3dfPhGvEq/bNqiHZjkSP5vYV9mkui0
	oUbFezLTHfhN4ZtHyM5NaU5OXxvAg8unhtivcLOkF0/RIpYP66LMhv+yZE5ZFlbbZPJ+RGZFyNB
	i1kKpdSeyMErzP03M5FljkTk+oIMaNcNNE4Nc7D5WGlQ9fGrFrVeGybAOEo0XEyE=
X-Received: by 2002:a17:90b:92:b0:229:3009:524d with SMTP id bb18-20020a17090b009200b002293009524dmr36291338pjb.20.1674719088653;
        Wed, 25 Jan 2023 23:44:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvc4sqpHyZqfJi2lrxyLpmE33hLJVBFc57mzNkB9upkZPg9VCtjM8mdbZ7xnExLzdEPP5wZzQ==
X-Received: by 2002:a17:90b:92:b0:229:3009:524d with SMTP id bb18-20020a17090b009200b002293009524dmr36291317pjb.20.1674719088215;
        Wed, 25 Jan 2023 23:44:48 -0800 (PST)
Received: from localhost.localdomain ([49.207.202.116])
        by smtp.gmail.com with ESMTPSA id p1-20020a63ab01000000b004d2f344430bsm258499pgf.75.2023.01.25.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:44:47 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add FPDLink overlays for am68-sk
Date: Thu, 26 Jan 2023 13:14:41 +0530
Message-Id: <20230126074441.9948-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1674719108-305367-5377-1811-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.210.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245715 [from 
	cloudscan12-49.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 07:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15673

From: Sinthu Raja <sinthu.raja@ti.com>

Add the overlay files, over AM68 SK, for the following:

 1. Fusion board (For FPDLink-III cameras).
 2. IMX390 FPDLink-III camera module which includes both the CM and
    RCM type of modules.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 conf/machine/j721s2-evm.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 9fce4d59..7c120dcc 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -16,7 +16,24 @@ KERNEL_DEVICETREE = " \
     ti/k3-am68-sk-base-board.dtb \
     ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
+    ti/k3-am68-sk-fpdlink-fusion.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
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
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
-- 
2.36.1


