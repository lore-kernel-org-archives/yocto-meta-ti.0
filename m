Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332FEC7EE43
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:29:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14813.1686320945237495161
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I1mA7jXt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359ET3nk045937;
	Fri, 9 Jun 2023 09:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686320943;
	bh=0HseVzCQsec4uS3r0Z73+HWQNUIQW3taD1MYf6Tq5K4=;
	h=From:To:CC:Subject:Date;
	b=I1mA7jXtorP8BAvGoF2fyqmwRC0tBOUDI0JNfwtJU9CkDXeVI5e9pz1RioT98XIS+
	 LOVO9KkD/K+FFfn/RDvYfAzxPMn4j71bqeDB/Dai7ILTa60xA3l1E0edwHbqZLI717
	 6JR9zEDcAo7dSxlzFylDTO00zbGCp304ZNvYJMjw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359ET3lr040539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:29:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:29:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:29:03 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359ET220077571;
	Fri, 9 Jun 2023 09:29:02 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH 0/2] Early splash screen on AM62x
Date: Fri, 9 Jun 2023 19:58:59 +0530
Message-ID: <20230609142901.2958733-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16700

This series is to enable out-of-box early splash screen on AM62x devices
with wic images compiled using meta-ti.

With this, u-boot SPL or u-boot proper can load TI logo from boot partition
and display it while board is being booted.

Devarsh Thakkar (2):
  u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for
    AM62x
  conf: machine: am62xx: Add TI logo as image boot file

 meta-ti-bsp/conf/machine/include/am62xx.inc              | 3 +++
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
 2 files changed, 12 insertions(+)

-- 
2.34.1


