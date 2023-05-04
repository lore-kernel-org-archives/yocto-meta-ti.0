Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8942DC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 12:37:56 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.48559.1683203871577757253
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 May 2023 05:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=hQRsw4GW;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1683203869; x=1685795869;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HYmv3XtTh+WKaEf8ZDmqQDTPzmCc77vhc++2Xi+jQI0=;
	b=hQRsw4GW/MuHvMcR7b+qz7vXeEGuA2ZYNNYacVLh2p5sEmKYPsczj2iuCMSVBLT8
	kxILWJUe5pT2B1Mu0selO5Mr32nIRzLoOS7WauwZbKiGaYs9pceHyphjozlChmmE
	W2Zli/bweKwe83+Th3uqN+qNxvQNdc0IsjW/oZ8Vvcc=;
X-AuditID: ac14000a-917fe70000007ecb-e4-6453a71db519
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DE.EC.32459.D17A3546; Thu,  4 May 2023 14:37:49 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 4 May
 2023 14:37:48 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-ti@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH kirkstone+ 1/2] conf: machine: include: k3: Select correct WKS file
Date: Thu, 4 May 2023 05:37:35 -0700
Message-ID: <20230504123736.1475746-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWyRpKBR1d2eXCKwYr5PBZzv9xic2D0mHnq
	EXMAYxSXTUpqTmZZapG+XQJXxpv7fUwFkzkqWjsb2RoYu9m7GDk5JARMJKbeambuYuTiEBJY
	wiRx981bRgjnPqPEhXd/WUCq2AS0JO5smcsMYosIqEhM3DaPtYuRg4NZQEOi/RkTSFhYIFji
	9vZHYDYLUMn5KTPBFvAKWEksbHjPCLFMXmLmpe9QcUGJkzOfgI1nBoo3b53NDGFLSBx88QLM
	FhJQkJi9bTJc77Rzr5kh7FCJrV+2M01gFJiFZNQsJKNmIRm1gJF5FaNQbmZydmpRZrZeQUZl
	SWqyXkrqJkZQ8IkwcO1g7JvjcYiRiYPxEKMEB7OSCO+HQr8UId6UxMqq1KL8+KLSnNTiQ4zS
	HCxK4rz3e5gShQTSE0tSs1NTC1KLYLJMHJxSDYw1fw/qnb6Y+0ozMTXk+7SbLMeu8hyc+9eN
	1WVxf3f02XjvN112/9qL7ur6cHBsyeO8m6HGvD7WxnDjhs9rpvy5rc6Z2vTgkvvr3SxPDQUb
	9Dyc06beP6b7cFPW++yZWbP0NzNaqWt6l0v7bLggvfyA7FeDMkeJf7eM1/+LmsF0w/zvzPvK
	00WUWIozEg21mIuKEwFoWL/rLAIAAA==
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 May 2023 12:37:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16482

Select the correct WKS file according to the MACHINE_FEATURE efi.

Right now, the sdimage-2part-efi.wks is set by default. Switch to the
sdimage-2part.wks file, if efi was removed from MACHINE_FEATURES to allow
non-efi boot methods.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 31da2ca9..fff15505 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -50,7 +50,8 @@ IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 EFI_PROVIDER ?= "grub-efi"
 MACHINE_FEATURES += "efi"
 
-WKS_FILE ?= "sdimage-2part-efi.wks"
+WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks", "sdimage-2part.wks", d)}"
+
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
 
-- 
2.25.1


