Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FDDC43217
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 13:46:55 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6393.1665409612236189994
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OaFNITV/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29ADkpm5012709
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 08:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665409611;
	bh=WRHmuctUhiC8N0veuAG5HA1UaKFtZukatNOi6zuy1/0=;
	h=From:To:CC:Subject:Date;
	b=OaFNITV/EOn6aFqC3yuRoPQCgT5BEP7Mf27sgJS6F88I8PD46NxuW8FhNFrhB0Dsz
	 KqYDZQ0ttJ5dY0OQXLAXRMiPLIIHl5fnLnbX6sxewsck/o9Skm6QTZtM3FugrGz4pO
	 nS7WhIpuiNIYuZF7fWDYGga41g6AHKhnpvcuNZ+0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29ADkpHt028662
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 08:46:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 08:46:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 08:46:51 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29ADko0H116523;
	Mon, 10 Oct 2022 08:46:50 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH 0/4] TRNG support for J721S2 and J784S4
Date: Mon, 10 Oct 2022 19:16:45 +0530
Message-ID: <20221010134649.20977-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 13:46:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15118

This series enable the OP-TEE TRNG for J721S2 and J784S4 platform.
MCU SA3UL support has been added to OP-TEE upstream for J784S4[0].
The same flavour can be used for J721S2 in OP-TEE.

[0]: https://github.com/OP-TEE/optee_os/pull/5572

Jayesh Choudhary (4):
  optee-os: Update SRCREV for OP-TEE TRNG in J784S4
  conf: machine: j784s4: Add OP-TEE flavour
  conf: machine: j721s2: Add OP-TEE flavour
  optee-os: Enable TRNG driver as OP-TEE support is added

 conf/machine/j721s2-evm.conf               | 1 +
 conf/machine/j784s4-evm.conf               | 1 +
 recipes-security/optee/optee-os_%.bbappend | 4 +---
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1


