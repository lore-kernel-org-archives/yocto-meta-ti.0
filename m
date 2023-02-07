Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25406C64EC4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 15:13:22 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.85938.1675782795747702688
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 07:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Orzdf+Gv;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound17-174.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 07 Feb 2023 15:13:11 +0000
Received: by mail-pl1-f198.google.com with SMTP id b5-20020a170902d50500b00198f3be5233so4988512plg.16
        for <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 07:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gngkJ8tYRccPcOSCkk8xhB5HSuJa1bQ95aDfWKZyXKw=;
        b=Orzdf+GvgAftmCg7Jq6Xfitz6k5DhBC6aoTjJPBaxgLH8/Eq3K+Mjo3iHcyg0V/Ogt
         4yjIj7eW11BNvl/udEl6qWv3BDfrY1y4Rp1EgZaprxy3ok/l6QJL+t8Hld2m74yDkwwE
         IftMnfdjv1rToQcNozBx1x64kza4WGMQqmpKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gngkJ8tYRccPcOSCkk8xhB5HSuJa1bQ95aDfWKZyXKw=;
        b=q9m2KavbsV61OtD3lmpn3FxfWhTicEu3HXXd8A4g6UFzJ1vtpBQnfzgX4CIN+UEtsA
         mI+vKCplA01h232pFKtTlVSYh7kczTi0PbWU0TRT0BM1VUFH4qHzWp4E9iLRqZ4RDNaO
         TBZuf2ZCobuj5+SKwV+xqTrWvI5wY7l9adh4D4ZsC3RrjOELDXxSwpE7uJ5+v3FdDg9i
         KJJ0KY+0ky/MrKugQhgnCJct5i0sY4wdk5kCJVIYsMkS7X9EdyqUucPl89cST1iS4beJ
         LLGL2m/skUj7t/xpc+IpdBBCsZMLiIo6a90yswkui50PLPUYFUMAdNhxC8Yu9mpOHlNB
         p2/g==
X-Gm-Message-State: AO0yUKWc625Z1Mf9Bs6bxIT4kf5mVa39rtBuqgV6zImJhWS0Gody8PEP
	D0p7HiYx8t3VUZol0jMGuUsUPptm7K75OPtFPCAVsc45RREOkEKDSti8ZNySCMRduvM0ZyRCxOi
	kMEvNAVRKi/e+VMGZNol/PZCqw08yhUZ/R4Z8VmmFRGl5c8bk8xy1iA9+T2vnmzs=
X-Received: by 2002:a17:903:2291:b0:199:1458:6c68 with SMTP id b17-20020a170903229100b0019914586c68mr3703773plh.57.1675782789933;
        Tue, 07 Feb 2023 07:13:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+KBPX3H0XpNhBvlX43523kX9C/fjciyiZ8NrlMN5LfBK8y+DhsrEM+TLRvPLVaCrdx2PVLIg==
X-Received: by 2002:a17:903:2291:b0:199:1458:6c68 with SMTP id b17-20020a170903229100b0019914586c68mr3703739plh.57.1675782789567;
        Tue, 07 Feb 2023 07:13:09 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id d22-20020a170902aa9600b001965f761e6dsm9050543plr.182.2023.02.07.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:13:08 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm overlay for am68-sk
Date: Tue,  7 Feb 2023 20:43:00 +0530
Message-Id: <20230207151300.3223-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675782790-304526-5486-8475-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245982 [from 
	cloudscan23-146.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 15:13:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15734

From: Sinthu Raja <sinthu.raja@ti.com>

The AM68 SK has PWM output pins connected to its RPi headers. Add
overlay file to enable PWM pins.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in v2:
==============
Address review comment:
 - Remove extra space

v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
 
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 7c120dcc..f1127ed5 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
     ti/k3-am68-sk-fpdlink-fusion.dtbo \
+    ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-- 
2.36.1


