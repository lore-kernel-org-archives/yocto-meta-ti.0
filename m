Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CE7C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 13:49:41 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web10.83544.1675777777118459700
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 05:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=JuPXF86c;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69]) by mx-outbound8-152.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 07 Feb 2023 13:49:33 +0000
Received: by mail-pj1-f69.google.com with SMTP id dt6-20020a17090afa4600b00230183006c3so6161127pjb.7
        for <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 05:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax65JHIRktmpO0jw8dInv1OPAd1mXkaerb+Fw0u+RHw=;
        b=JuPXF86cEZ3Tjj+1aeG8g6EnU9/UqNbZNbm86r+idRi4MZI5rPBMGOGCEX6zh4y80+
         5FjlXVO5BuPk2F36mCi48mO1Co2OzmEZAUUbKvMkCwto2xRSp3sBvPBs3InHerKSRdYl
         WwX1JoRhq60x6hPQrtaij4b08L7MDZtIeJEHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ax65JHIRktmpO0jw8dInv1OPAd1mXkaerb+Fw0u+RHw=;
        b=jJuxQbDVuRz4jBX9v3eEpKTYRp3Z+XsHhrxERWsUEEL8z9iwiAmHH45up9ijIW5Srx
         r4v33iZ8Grsp3y3AQ03iCeyvVY/cPdBybnrR2hzSbWSFNqIKw0Fyx3fLxC7M1Reh4NKw
         lNslE6/Ej3lEx/n8sa+K+wMGATZqWLNy15Vi/hTyP/Y7x/UTs/lYrrC6ZJQcj3SKKLvl
         Hhk067kpWltudot/37EJlUxd+0yBFf62Tlhd+37eW5+1F+rQG4gsntZ4u/CpkSOK/X6S
         1LmgYVROmz+4i2ZH5lIt5iiNY8ahSL9CQiWuYc60MoXereomBAVXTZO7ykNhKmYsPTHg
         cKaw==
X-Gm-Message-State: AO0yUKWGvyUXVpFeS132L0EbL32FId53tkE6c03u2yial+4pTyhKeEDc
	ktfkJKioi9dMv+rWmP/DiZmLrO252TQQ8STai/OuXGMtdXGS9XzZaNtoa2V40PwrpFSYY/to1ro
	HCPbka7cKGBO4KvPuU+H2KCTaIP4EvXNir4VYOApmgnUvBnODpaFWDqApYavlnMI=
X-Received: by 2002:a17:90b:3e8a:b0:22c:6f6a:2bca with SMTP id rj10-20020a17090b3e8a00b0022c6f6a2bcamr2712766pjb.43.1675777772735;
        Tue, 07 Feb 2023 05:49:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8H0UFuw3iG/HMOIy7KWnTQe4cFxCWjYDwb/jNd2u5npOV4VcWfvYsIm4XkxozTMREmDjpXjw==
X-Received: by 2002:a17:90b:3e8a:b0:22c:6f6a:2bca with SMTP id rj10-20020a17090b3e8a00b0022c6f6a2bcamr2712750pjb.43.1675777772420;
        Tue, 07 Feb 2023 05:49:32 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id u8-20020a63b548000000b004fb171df68fsm1206267pgo.7.2023.02.07.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:49:31 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: recipes-eatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add ehrpwm overlay for am68-sk
Date: Tue,  7 Feb 2023 19:19:26 +0530
Message-Id: <20230207134926.3800-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675777773-302200-5387-2625-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245981 [from 
	cloudscan11-84.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 13:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15730

From: Sinthu Raja <sinthu.raja@ti.com>

The AM68 SK has PWM output pins connected to its RPi headers. Add
overlay file to enable PWM pins.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 7c120dcc..7e0f1246 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
     ti/k3-am68-sk-fpdlink-fusion.dtbo \
+    ti/ k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-- 
2.36.1


