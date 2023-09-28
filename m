Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C6AE732C2
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 11:15:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11207.1695899728815655535
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 04:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SpeN/lxC;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38SBFSnP044468
	for <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 06:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695899728;
	bh=30ly3zMMKAp6DAE1be3KLtyE9pRoGYuPz7ynAHBgAwg=;
	h=From:To:CC:Subject:Date;
	b=SpeN/lxCzTlC42FHQUtE92KG+9TwyigMwWcsh3fLoHmDhBMzETTZgq7bGQsrkAzBS
	 UOIuTcAS5hp3E8B70jpKYWCsM9cvPwrpcI0VqkHulxZOqvkQFAQ+DSjgMmlB0ST/uq
	 N9nQR2uPqJHNiIu9rWG7LsmEfdY+48ygj1MUW2Rw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38SBFSSF070089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 06:15:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Sep 2023 06:15:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Sep 2023 06:15:27 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38SBFQ0v018145;
	Thu, 28 Sep 2023 06:15:26 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 0/2] ti-sci-fw add k3r5 as COMPATIBLE_MACHINE
Date: Thu, 28 Sep 2023 16:44:54 +0530
Message-ID: <20230928111456.420785-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 11:15:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17019

ti-sci-fw: only packages fw for r5f, so add k3r5 as COMPATIBLE_MACHINE
u-boot: remove ti-sci-fw from DEPENDS:k3. Only the r5f build should
depend on ti-sci-fw

Aniket Limaye (2):
  recipes-bsp: u-boot-ti.inc: Remove ti-sci-fw from DEPENDS for k3
    machine
  recipes-bsp:ti-sci-fw: Add k3r5 as COMPATIBLE_MACHINE

 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1


