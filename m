Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EC0C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 12:05:23 +0000 (UTC)
Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.71888.1674734718213087952
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 04:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=VvSQHngS;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound47-208.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 26 Jan 2023 12:05:13 +0000
Received: by mail-pl1-f198.google.com with SMTP id x10-20020a170902ec8a00b001949f64986bso1002828plg.12
        for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5IuVvWZrLNR3bFTjfCdu8AKsyawSbmmCqASCe4CBtY=;
        b=VvSQHngSarIh4QoKyv/6dh0rHnsmfOUvPE8u97T/+KLhVFFjdFc7ggJDP7ThZH05LT
         EttNUn2Spn31wCGoDKmuXD1brUr1x2ADlLy+32l59iZRzq3mn7eEvsH9aedwWoG7DC+P
         Bo03O+tq99MSbNZzqjQvdTSN1DeJJH5xF/E1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5IuVvWZrLNR3bFTjfCdu8AKsyawSbmmCqASCe4CBtY=;
        b=RgnwhOLukAU0WGWxW8W2SpFsPvc1r54IUEfYw/+INPMTlyrwE7HSfufHBYhxlAwC9G
         4WkvcNn+puOy1HKnVZCMhCaAfTth6m25SWx2QvH9P5vFJV/iKy733QyJrCXFfOSbkX+k
         eluGbfgFge/gk+uDwnZPWZxL8uXX64F7BeIsyAVK+t2wk/2kqrycQM+CpHhO/DBpWl6d
         s66+ZXJzQDQxhCJG3OCd+IY0/jXR+XwHlkBeMKmMfvW8dBIrhzJSIF8q+GSwP71FIpgz
         dmtVMyQD1VTKgHdKItW987QsCREmuV9m2gtxvd1XEvOLrei8ST5g1sB5uIJWHKeRZIbT
         70jA==
X-Gm-Message-State: AFqh2kruIq6Y65Ffdhs0G2zxQcZrVqps3+J5iMl5Myp6rJoo1HCFO7oY
	xK/tpEdUMuyrcOm5iP4mbdgYOIB8B9rAiBABGsGbosLIHrXJSlB7cTOPyOcq5vlK1qmMmPSrcy8
	3JtZgcgqLxlXkp1Pz6wdZ7tavbFj0/Dvkp7m+D8thXue8pLdP3I9Shd4ZfdCwnGw=
X-Received: by 2002:a17:902:d703:b0:194:5ff8:5d6c with SMTP id w3-20020a170902d70300b001945ff85d6cmr35233114ply.15.1674734712578;
        Thu, 26 Jan 2023 04:05:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8fmyGyxXHBv6La+m1gQ0+7hkcg+ZpgLVFE/jxdFKHjavov9red2pyESRb1XIEVi3Nof5Sog==
X-Received: by 2002:a17:902:d703:b0:194:5ff8:5d6c with SMTP id w3-20020a170902d70300b001945ff85d6cmr35233087ply.15.1674734712234;
        Thu, 26 Jan 2023 04:05:12 -0800 (PST)
Received: from localhost.localdomain ([49.207.202.116])
        by smtp.gmail.com with ESMTPSA id c8-20020a170902d48800b001960706141fsm866765plg.149.2023.01.26.04.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 04:05:11 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Fix DTB overlay extension for OV5640
Date: Thu, 26 Jan 2023 17:35:04 +0530
Message-Id: <20230126120504.11845-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1674734713-312240-5404-871-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245719 [from 
	cloudscan8-218.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_SC0_SA085b, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15674

From: Sinthu Raja <sinthu.raja@ti.com>

The extension for OV5640 overlay is incorrect. Therefore, update the
correct extension to build the overlay with .dtbo

Fixes: f67e9805 ("conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V2:
=============
Address review comments
- Update $Subject, remove the master branch entry from the subject.

V1: https://patchwork.yoctoproject.org/project/ti/patch/20230125080136.8308-1-sinthu.raja@ti.com/

 conf/machine/j721s2-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 1ed693c5..9fce4d59 100644
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


