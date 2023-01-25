Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB677C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 08:02:04 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web10.40453.1674633718274360823
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 00:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=biJcoZhR;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69]) by mx-outbound42-186.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 25 Jan 2023 08:01:46 +0000
Received: by mail-pj1-f69.google.com with SMTP id z21-20020a17090a8b9500b0022a9ee8ddf2so6098037pjn.8
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 00:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyi6OaFztpJPrq7jrmNbf1QSCwRaxicBhnu7nJPCH4Y=;
        b=biJcoZhRUVIbIZnY/fdK2quJ7aiIVTbcwyDzkJurXsaUz3n9wmTzAysjr5R/7t7p5z
         kkYmCtiYnVRgXSF4TZC0IFwMXBFuk3caxtKz6rgf1lfeYbWSW165xmgiSsP1dDphrON5
         zBB18zpTq6O6B0/2MponQPLlmlOZj5xZJV4mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fyi6OaFztpJPrq7jrmNbf1QSCwRaxicBhnu7nJPCH4Y=;
        b=2JZjvEy/a64SKOcci7ZNGK20d464BxKxQFfimsyGGQl94gEuh6SRG4YS9dFXd5rEif
         my+HE92TJ1AM2ozMquW8ISBar8yNGnh6QIgJvaE6CfSEenwZR6NuoTBzBbESxAMabbKZ
         dZxzo0sssd7Uw5N/YrVxmE1d1NwheRIBW0VwmWl+dk+1Dca0H2V13eR8m6BJiLoUl8H0
         +ApC2aQ61c+KfSAzSLot3veuC1n4WMbIR1NfO8tqdpoTn2aw0OrlWnLS39wqPZEH5+KO
         IdMHTENcN1WebMe+fWIsduUpD6aStGC6pyo/p0hnQxz4dBzFYMUPMsATNR/n+q2WU5oB
         lrxw==
X-Gm-Message-State: AFqh2kq1LDDyvBf7lWzPewksTUwxKJxeZ3pRKxwud4CYDkMZSrM/8Yef
	OMX0ShOGo/8sSB2RP+tEOqFlzJODcS+W66UyOuLWf3QB7R6QXNFrKCBnyEQ/HHnY+xtGV6UnJIr
	eYl6Eh8wUH3tnYetxrX0zrSxQscyNu3U4fWP2ByCc52xg9KOAgybiwq/v7lDRLXM=
X-Received: by 2002:a17:902:8208:b0:193:f76:aed4 with SMTP id x8-20020a170902820800b001930f76aed4mr29163367pln.1.1674633705225;
        Wed, 25 Jan 2023 00:01:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsqW7c4w81vxBuxrsv4cjzuZrvMK1gj324TpVo6Xt4GCQ7dIJMndWCVark/CNenfQFNPsStFA==
X-Received: by 2002:a17:902:8208:b0:193:f76:aed4 with SMTP id x8-20020a170902820800b001930f76aed4mr29163349pln.1.1674633704704;
        Wed, 25 Jan 2023 00:01:44 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709029a0800b00194799b084esm2970921plp.10.2023.01.25.00.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:01:44 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][master/dunfell][PATCH] conf: machine: j721s2: Fix DTB overlay extension for OV5640
Date: Wed, 25 Jan 2023 13:31:36 +0530
Message-Id: <20230125080136.8308-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1674633705-310938-5631-435-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245695 [from 
	cloudscan13-19.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 08:02:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15650

From: Sinthu Raja <sinthu.raja@ti.com>

The extension for the OV5640 overlay is incorrect. Therefore, update the
correct extension to build the overlay as .dtbo

Fixes: f67e9805 ("conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 conf/machine/j721s2-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 8d3f8db8..488a1140 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -14,7 +14,7 @@ OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am68-sk-base-board.dtb \
-    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
+    ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
-- 
2.36.1


