Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E13C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:31:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.7650.1665415861795878221
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ItHdC0DE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV0kP120404
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665415860;
	bh=TPrgB8bVNikHdLeA1JX4WCrJ1zw8v8+CtUSeT3dabW4=;
	h=From:To:CC:Subject:Date;
	b=ItHdC0DEBpv6SqjmQgMYZ0PwZnmS8Bn4ip7nl/mCfH/bYKLdLQkIcBcEDLM3sEvKr
	 MCnte7mlnxVmV2RkV0huzvIzVa4ip6IjgjC/V4XZybpShdbsfDDYRh/YgcEIS20Q4c
	 ku/hR4gDVaNCSAgbNAqUVwtvXRp9W1CIfhHzkVeQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFV0EC046653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:30:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:30:59 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFUxLa102961;
	Mon, 10 Oct 2022 10:30:59 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH v2 0/4] TRNG support for J721S2 and J784S4
Date: Mon, 10 Oct 2022 21:00:54 +0530
Message-ID: <20221010153058.28310-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15126

This series enable the OP-TEE TRNG for J721S2 and J784S4 platform.
MCU sa3ul support has been added to OP-TEE upstream for J784S4[0].
The same flavour can be used for J721S2 in OP-TEE.

[0]: https://github.com/OP-TEE/optee_os/pull/5572

Changelog v1->v2:
- Change the commit message for [PATCH 3/4] ('conf: machine: j721s2:
  Add OP-TEE flavour')

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


