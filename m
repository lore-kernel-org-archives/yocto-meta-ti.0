Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB550C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 08:21:20 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.9429.1675930875249836838
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 00:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=kLI2LNbM;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound16-199.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 09 Feb 2023 08:21:12 +0000
Received: by mail-pl1-f198.google.com with SMTP id y15-20020a1709029b8f00b00198e0564d73so925112plp.22
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 00:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hi7uNrecJKTYJ3H7UFQ6ePz3hllP7l+6MVnZ2xZ5soM=;
        b=kLI2LNbMU/a4S6hvUJ2kUQTtDipOQ/lS3lIz0fWxidM1Xz9bbtfQJXQ8W99iSQFDX8
         qEI+5mSzNI5cErd8YVm4R9G2nwK5cIROiu9HyCgZI+4ykueGinf6T77yxpl/EEzAk8hQ
         h15T00xYZBkFQxX1p4Xk3wo9eDzt15LeqMwcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi7uNrecJKTYJ3H7UFQ6ePz3hllP7l+6MVnZ2xZ5soM=;
        b=Qut9NV1NFutWjDVnjKvS3Bi0F89XQLkv32OSsWJ2/YXanA35kCn4+hCY3VepKt+7vJ
         DYHtr58CZQq8J4HkpYV1lalU0LHSsYT7i51IJQuXItOFmtvREwG9BT5kuSuFnqOcYjFA
         E/UdSQCJCOxz3xKoxIh+JJGyrelidonSked/D2VR9ojpn1AfeTCQDwY2mRQy1WJTvoAW
         8y29i0VN3iAdrCNOQ123YmoW9C/MX5HrXuAoXiEo/UE2vAt9Gz/8/8N3y0s58iTvEqvf
         jBQaZ1gOUoXYbocVywp2F9QQf2wau+9YxMwbGL6s+Rqhz2jC7zKuRO23BOKDde3he1KB
         85pQ==
X-Gm-Message-State: AO0yUKV9wB3zUMcDIvbYFausjgOegEusrejqLwe+1ZYbUiXZ7Mdjw/OA
	P9opfw+p89cXBaNHzDH6WVlqa/fhZfdsqzbFaUirEj5FL6UoM3vCJxcOMuYQuCdZLTKWmAg1O9e
	tSCimgx3z1gcJ1henMVUxdxZBp7TdKlOSpbncLtsuV1XA50IbCTq+MMIfRV4YiEU=
X-Received: by 2002:a05:6a20:e483:b0:bf:2877:9335 with SMTP id ni3-20020a056a20e48300b000bf28779335mr7757810pzb.2.1675930869510;
        Thu, 09 Feb 2023 00:21:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8sRmmAJaSG2akvIr6B0nlyXwBC4r4wrNvlHvICqIUYRbe0MKBaxDBJJHws6oW2vh440L+FRg==
X-Received: by 2002:a05:6a20:e483:b0:bf:2877:9335 with SMTP id ni3-20020a056a20e48300b000bf28779335mr7757797pzb.2.1675930869108;
        Thu, 09 Feb 2023 00:21:09 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id p24-20020a62ab18000000b005a7f8a326a3sm800560pff.50.2023.02.09.00.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:21:08 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH V2] conf: machine: k3: Add DTB and DTBO load address for FIT image
Date: Thu,  9 Feb 2023 13:50:57 +0530
Message-Id: <20230209082057.7744-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675930871-304295-5391-585-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246022 [from 
	cloudscan18-102.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 08:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15768

From: Sinthu Raja <sinthu.raja@ti.com>

K3 platforms include the fit image-based kernel as the default. The fit
image loads the kernel and DTB. The DTB/DTBOs, however, are added to the
fit image, but the load address is not included in the image section of
each DTB/DTBO, for non-HS platforms. This load address is determined by
the LOADADDRESS macros in the kernel-fitmage class.

Hence, in K3, include the DTB/DTBOs load address and offset macros, which
will be used by all K3 platforms.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Hi,
Build tested locally and validated the fitImage on AM68 SK.

Changes in V2:
=============
Address review comment:
- Move the change to k3.inc as the fit image is included as default
  image across all platforms

V1: https://lists.yoctoproject.org/g/meta-ti/message/15754
 
 conf/machine/include/k3.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 81139571..96f7dbd5 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -21,6 +21,9 @@ KERNEL_CLASSES += "kernel-fitimage"
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
-- 
2.36.1


