Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CF0C4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 11:29:24 +0000 (UTC)
Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.178322.1672226957469356033
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Dec 2022 03:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=bTdWmB9s;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69]) by mx-outbound9-209.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 28 Dec 2022 11:29:14 +0000
Received: by mail-pj1-f69.google.com with SMTP id i1-20020a17090a718100b00225c78f69c4so8125072pjk.7
        for <meta-ti@lists.yoctoproject.org>; Wed, 28 Dec 2022 03:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JDm4O3c5P7EX4sJmMBjLpMXK1WeO9OvGojWKTl4+ZH8=;
        b=bTdWmB9swwFdEpMr1qeMRaEh1Ct51sbsDWvtEKHRMpyQ5GHrbLEP6+Q9QeGeiGBA6+
         01jdFMr8orzxrGBvzQp3CmwzzPd/lJWdNErDvQ2RAepNlYHa9GTDBYW3lnAaB/JZN1wa
         25+jsXiqFVf/4GpERSDomzYDtZ/SjHfMZR234=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDm4O3c5P7EX4sJmMBjLpMXK1WeO9OvGojWKTl4+ZH8=;
        b=03p/O6VP6FbJTbnrvPtTGB9rsQTM+RQgXTLsUWunN15O4ho+viT1laidAEze2QMT+o
         E7yklh7ZlltVAO1Gbntbeab8z+y+MfmPX8OBhjHV1i58Uvf7/bfYgFn/57znrcVKTNKQ
         0Jtr95iArgFQS9zqaDZSuofBLNeolX+kWgAdIWPuWL6GOyboMeKZQMv0E3pt0cCqdCVW
         9eTuDiwVYPztJWoq/6KfoJrqon5p6huHBiwQzZB64a4z0a3HeY/FRMEIln3rxBxp4Fra
         IGtCLaA8kHW1Xe6vPvhAwBZYLv2MFBcjk3wnbC8Mt+8T1lElQtMEupRFjjVfLY16+KSj
         wTbg==
X-Gm-Message-State: AFqh2kqUcIfVB+PDi13MWyx5/bM7YSxZPoz7zNjBXNYSLBD++dyU2pkv
	AwG+rCumWEZZFEW9lykyRkEwj1szFm9bYC9kwt46Ilbpt9wLK2HIvczsnIVHxRA49rNdAuRM9bR
	jKUULOZDiPzGDg/RZuqmySzYBzsb8IfFS2HCV7GHAIn5E3neIeCMTIxJMOny8aO0=
X-Received: by 2002:a17:90b:1891:b0:226:280:9a40 with SMTP id mn17-20020a17090b189100b0022602809a40mr7163797pjb.30.1672226953478;
        Wed, 28 Dec 2022 03:29:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucXs7GdUnDygBc6JzheYgiC1gnj2v/xyVVTsnQajHW6ToTtZMcUqwFFNes3IAIs1N+By4mXQ==
X-Received: by 2002:a17:90b:1891:b0:226:280:9a40 with SMTP id mn17-20020a17090b189100b0022602809a40mr7163767pjb.30.1672226953058;
        Wed, 28 Dec 2022 03:29:13 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id om1-20020a17090b3a8100b00218fba260e2sm5406761pjb.43.2022.12.28.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 03:29:12 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [[meta-ti][master/dunfell][PATCH]] conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
Date: Wed, 28 Dec 2022 16:59:06 +0530
Message-Id: <20221228112906.5301-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1672226954-302513-5503-176091-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245097 [from 
	cloudscan22-239.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Dec 2022 11:29:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15507

From: Sinthu Raja <sinthu.raja@ti.com>

AM68 Starter Kit is a low cost, small form factor board designed for
TI's AM68/J721S2 SoC[1] which is optimized to provide best in class performance
for industrial applications. Add DTB entry for the same.

AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connectors.
Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.

[1]:http://www.ti.com/lit/zip/spruj28

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 conf/machine/j721s2-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 6377c459..abdd9e03 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am68-sk-base-board.dtb \
+    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
+    ti/k3-am68-sk-rpi-cam-imx219.dtbo \
+    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
-- 
2.36.1


