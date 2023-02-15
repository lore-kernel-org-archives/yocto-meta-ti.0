Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2E6C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 09:41:45 +0000 (UTC)
Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.11535.1676454102333769417
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 01:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=XibMas5k;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200]) by mx-outbound45-178.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 15 Feb 2023 09:41:39 +0000
Received: by mail-pg1-f200.google.com with SMTP id t17-20020a635f11000000b004fb9472bb16so3613468pgb.11
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 01:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9g+wYHNjGkz1AagnBjGv7iQC71qda3a0dgz4Qlt+d/U=;
        b=XibMas5kQ7vHeA7lAxpdawPgkNVVTBXphW9LawoEpZabJQq1aQGgkR1gFf0iT8vOTQ
         wFW+chAVYUAsQPwc6GKHyrbc2mc7/zmUysHqZrgKwWHZXnXOY7xA7eQHClaEustWzzUQ
         I1hLS7eGXkX04WjMNxBsg5lHZA98wqVVCmOqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g+wYHNjGkz1AagnBjGv7iQC71qda3a0dgz4Qlt+d/U=;
        b=tPyJZOs1Cm+hBmx5TcRqfhi6/2CXx2BAgxrO7uaAY/OJshTye45Ch0lnvGAP11UUXK
         xFgUCdGyGgUyNvcKtFb8fGuw1np2/tH8fwIHW7Q0dnU4Y0aVVVtNTo/Nwk6QQVXO07OI
         EaoSEu7elY0i9yjHteGtkW00VEpLwDvR8RPqe85KsIctG1buA4vGbEjmY2CfBejdz5SQ
         YFH5Xny2Gd149cAAHKHA7sUMjK3Z++cg3SrGaMQXRFWAsY7x41+anookylooKtHziUQT
         M3kAorlM8zstnIbeDLv/lvfTZOEy1pN8PhCspD/ZBpw5rwbzBkLv7AdFcgn92lowpFAl
         EU/w==
X-Gm-Message-State: AO0yUKU+CS+vNXvXyWYSaKlkrL9DUb6/3gZRWUcUjfW7Wkh3uOtClIKV
	RM4x5pwrFSjMyxwGmcBqEjk1vtlMns8WyanVr+ikgCtBhevWhogZbrJnysf4Hlk0MGCt3GXplzb
	ccNQnX0I3kTn2WdeHJXdkwNxF0/fNM2lxTkDSk+2SXB//nSoAWohsYoCKBZKHYl8=
X-Received: by 2002:a05:6a20:8f0c:b0:be:b137:9d1c with SMTP id b12-20020a056a208f0c00b000beb1379d1cmr1628788pzk.37.1676454098394;
        Wed, 15 Feb 2023 01:41:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+Kr56LaHdPajNkrWYnp0Rh6I+kNionOkgugq4eUR2O3FHu4nS7ZJI1nPxtrqCIXNSOs+8xeg==
X-Received: by 2002:a05:6a20:8f0c:b0:be:b137:9d1c with SMTP id b12-20020a056a208f0c00b000beb1379d1cmr1628766pzk.37.1676454098031;
        Wed, 15 Feb 2023 01:41:38 -0800 (PST)
Received: from localhost.localdomain ([119.82.126.226])
        by smtp.gmail.com with ESMTPSA id j134-20020a636e8c000000b004fbcff506c7sm2984083pgc.17.2023.02.15.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 01:41:37 -0800 (PST)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Dasnavis Sabiya <sabiya.d@ti.com>
Subject: [dunfell] conf: machine: j784s4: Add ehrpwm overlay for am69-sk
Date: Wed, 15 Feb 2023 15:11:32 +0530
Message-Id: <20230215094132.424755-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676454098-311698-5398-5838-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.215.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246164 [from 
	cloudscan15-222.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 09:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15850

From: Dasnavis Sabiya <sabiya.d@ti.com>

The AM69 SK has PWM output pins connected to its RPi header. Add
overlay file to enable PWM pins.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
---
 conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index e892f597..bd5b2411 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am69-sk-csi2-ov5640.dtbo \
     ti/k3-am69-sk-ddr-mem-carveout.dtbo \
     ti/k3-am69-sk-fpdlink-fusion.dtbo \
+    ti/k3-am69-sk-rpi-hdr-ehrpwm.dtbo \
     ti/k3-am69-sk-rpi-cam-imx219.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-- 
2.25.1


