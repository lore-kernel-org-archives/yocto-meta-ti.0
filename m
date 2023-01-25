Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F11C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 18:56:48 +0000 (UTC)
Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web11.54316.1674673002805536029
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 10:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=iph5roBH;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198]) by mx-outbound15-185.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 25 Jan 2023 18:56:39 +0000
Received: by mail-pg1-f198.google.com with SMTP id q130-20020a632a88000000b004a03cfb3ac6so8612172pgq.6
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 10:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBvsqCU3+CVfUO3fmQ54WIYqyZBosF/fhId5jG719ck=;
        b=iph5roBHUC2oKwSpdg1WQhR4X0R1WxfpXqoFcIXIE9m7WtWOJtZh+WblqrVjajJNNm
         KwRp5WlA8n6ukDB3X3SWQB0Gt+xwkzvsVTpPQZ/+sRpCILVBUu6yiS+7lcFRlnjFIWol
         7i5eCSA35xA6jjEw92OVKNKiBdShSSPgMiwPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBvsqCU3+CVfUO3fmQ54WIYqyZBosF/fhId5jG719ck=;
        b=fPXqMAXObvQlVqrAKPJp3PHlrqSQKbL9b7haR2trJOP6jNmUoIkwOkKeF/XExWymAM
         21iKtNDCM9pU8QlGn5swiKJZ3O11pde/O7Bx9k3q5+iMUjxHA2eoXS+pvW68Qoqlkpe2
         jWIAMGEw2CRAw9kvsZozud1qTIH8+zIKqsngpFWJzBECSfp9LoTCsLDi+8YERC4BSFYI
         NsOTPcgN3dUsyHQUxLyfxOsTgu0TJKmOSmaGLguajNPtbGhvMriSxRFxWI9C8I0rtJ91
         NoGXPT8Qask1JkDdOR0S0BQvE4i/2MybI/UavBnUaPLP1NnukIKn77wRtrdF11NYlDR0
         dZiQ==
X-Gm-Message-State: AFqh2kooGzOHpwwBD9YsS1ujzx46Ni0DDec59YdXtTl1Z84EVThbj1Wf
	V//5PKwl7MdabZlIrYgvtPz+Fzum+pZ8+dIiJPPMymU5JP+XmIHCfEbXIUMgcllG5zJyXOpqdO1
	T08xGQLeWiUvseHwBwkwjKahzglf4Wq701FnR/xz070ephlNE+9BJBzcBPVcaFiM=
X-Received: by 2002:a17:902:e88d:b0:195:f401:26b9 with SMTP id w13-20020a170902e88d00b00195f40126b9mr23054094plg.26.1674672998820;
        Wed, 25 Jan 2023 10:56:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspkF5vH9KEO281VW0sFpYJbDi59NNIFDkfSovHUyA6DLqdcXa+6Vq29nO1SqEh3MXEeZ4Paw==
X-Received: by 2002:a17:902:e88d:b0:195:f401:26b9 with SMTP id w13-20020a170902e88d00b00195f40126b9mr23054074plg.26.1674672998486;
        Wed, 25 Jan 2023 10:56:38 -0800 (PST)
Received: from LAP789U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902e75200b00194d14d8e54sm2233320plf.96.2023.01.25.10.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 10:56:38 -0800 (PST)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Dasnavis Sabiya <sabiya.d@ti.com>
Subject: [dunfell] conf: machine: j784s4: Add AM69 SK specific dtb and dtbo to KERNEL_DEVICETREE
Date: Thu, 26 Jan 2023 00:26:32 +0530
Message-Id: <20230125185632.448536-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1674672999-304025-5411-5579-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245705 [from 
	cloudscan16-238.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, NO_REAL_NAME, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 18:56:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15655

From: Dasnavis Sabiya <sabiya.d@ti.com>

AM69 Starter Kit is a single board designed based on TI's AM69 SOC
providing advanced system integration in automotive ADAS applications,
autonomous mobile robot and edge AI applications. Add support
for the same to include the board dtb file into the root filesystem.

Add DT overlays support for the following features on AM69 SK:
* Add DTBO entry to support OV5640 camera
* Add DTBO entry to support RPi(IMX219) camera
* Add DTBO entry for the DDR memory carveout.

[1]:https://www.ti.com/lit/zip/spruj52

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
---
 conf/machine/j784s4-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index 96acca13..24fa3356 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am69-sk.dtb \
+    ti/k3-am69-sk-csi2-ov5640.dtbo \
+    ti/k3-am69-sk-ddr-mem-carveout.dtbo \
+    ti/k3-am69-sk-rpi-cam-imx219.dtbo \
     ti/k3-j784s4-evm.dtb \
 "
 
-- 
2.25.1


