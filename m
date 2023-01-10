Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F0CC6379F
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 07:39:04 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.98690.1673336338123878866
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 23:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=TPY6vMDI;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197]) by mx-outbound19-242.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 10 Jan 2023 07:38:52 +0000
Received: by mail-pl1-f197.google.com with SMTP id z10-20020a170902ccca00b001898329db72so7992660ple.21
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Jan 2023 23:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Opbq65tp2K5IR/Sr2g5SW9eGAB3boa6EXsNxMSGKgR4=;
        b=TPY6vMDIn1MdTjxz+TcIzdIZpFKHrCRBxdJfnSg/kD3Y7uq7cf2g8C/yfFRhPRlIol
         Q5gP0tM3DW4TVzdBBAq2xfYL21PK65ure7h0YK4CYBc8e4bBfVfElzHek+RJ2mYt1tdi
         zOWWQ/nrSEsguCStqxtxidbrGtIe6InFBzRm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Opbq65tp2K5IR/Sr2g5SW9eGAB3boa6EXsNxMSGKgR4=;
        b=4DgOZODQFVKuxzJsdmKnnK9YngvuT3YS3VUscIRyqmeh2LsBIPPowpEJ3C51PGsD8K
         LxNbiaXnwzHr9E0dfQuK3bbTFLlWFiWjPTzmXJZhufpKNUfqDncpIzYCujv4/IYakP2D
         D+UqYE8fEfA7JuaSk9rzww1YJu+Jjdwip+oX+z47zMp9L50dOOUhDawRpbJfgo6DEef5
         31KEhvzEhEY9S/iXLMbv0rGUyh5Gr4mHuN7Ssj/2Fl1ryhoBftsNb5tiUKFkDlyARlXD
         /Ry6aB41vq5qalgEM15iQLVVuDiN427LPxqidH4SNGIQVwutCd06IRHa7CM9Je8jNVa5
         nPfA==
X-Gm-Message-State: AFqh2krn7CxbSEGVJVpCR28whcJCFkzYdMLZyu3iEuRiVTfD8Et8OQVR
	eGmVWjhLsF0kyeH48ZqE48Mej4KLbbUaqcpD7Ixj3j+jgK04QE/IRd5xrvpI3UZB0YBCcqTBm3M
	4U7Q7Hum16y9wq0xliMWHOCwn/6aj7oUNO1UjAgELfm3O7xkk896R/RAqc63PoIo=
X-Received: by 2002:a17:903:54d:b0:190:fbbd:277d with SMTP id jo13-20020a170903054d00b00190fbbd277dmr66777451plb.17.1673336331643;
        Mon, 09 Jan 2023 23:38:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsT6E2zB5er0UwNYWfNAnwDescMn25PN1lXuJm2BNGuuEJGzPfHZPrng7IAyMnT1tIy1iFulg==
X-Received: by 2002:a17:903:54d:b0:190:fbbd:277d with SMTP id jo13-20020a170903054d00b00190fbbd277dmr66777439plb.17.1673336331228;
        Mon, 09 Jan 2023 23:38:51 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id ij30-20020a170902ab5e00b00192721d4f2dsm7388256plb.82.2023.01.09.23.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 23:38:50 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
Date: Tue, 10 Jan 2023 13:08:43 +0530
Message-Id: <20230110073843.4452-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1673336332-305106-5385-1274-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.214.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245368 [from 
	cloudscan21-183.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jan 2023 07:39:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15544

From: Sinthu Raja <sinthu.raja@ti.com>

AM68 Starter Kit is a low cost, small form factor board designed for
TI's AM68/J721S2 SoC[1] which is optimized to provide best in class performance
for industrial applications. Add DTB entry for the same.

AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connectors.
Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.

[1]:http://www.ti.com/lit/zip/spruj28

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V2:
============
Address review comments:
- Update RPi camera overlay file name to k3-am68-sk-bb-rpi-cam-imx219.dtbo.

V1: https://lists.yoctoproject.org/g/meta-ti/message/15507

 conf/machine/j721s2-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 6377c459..1ed693c5 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am68-sk-base-board.dtb \
+    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
+    ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
+    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
-- 
2.36.1


