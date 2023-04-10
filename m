Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D28C77B71
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:06:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.39912.1681117610722548731
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 02:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BtbUPeCn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33A96ow4031856
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 04:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681117610;
	bh=qD6Q24ZDf6ARTfmG3yqGRkEhaA3ERUeKqclaV8bPxoQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BtbUPeCnr73llvkCxmxPW3Pcy+KtSvcXmlHJi5jKNXi/+3XxuwuhaBfaTwZZzUxie
	 EOJvAWlyBmzdX25ujusR66RQ/3hq/iHjDaVSiNxa5VA0HmsESFTfgtcdd3HCBK//lk
	 EjL5Jdk0k00f8JkX2uUFJRJt20ViFVpQqWohLWm8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33A96nTh032321
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 04:06:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 04:06:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 04:06:49 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33A96lXl023313;
	Mon, 10 Apr 2023 04:06:48 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v2 0/2 kirkstone/wip] defconf update for J7200 and J721S2
Date: Mon, 10 Apr 2023 14:36:43 +0530
Message-ID: <20230410090645.335745-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407115107.839204-1-u-kumar1@ti.com>
References: <20230407115107.839204-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 09:06:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16333

In u-boot 2023.04, HS and GP defconfig merged into one.

This patch updates defconfig for J7200 and J721S2 HS
platforms to align with u-boot 2023.04.

v1->v2 : Change only defconfig, build target to managed by u-boot


Udit Kumar (2):
  meta-ti-bsp: conf: machine: j7200: Update def config
  meta-ti-bsp: conf: machine: j721s2: Update def config

 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf  | 2 +-
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf       | 2 +-
 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1


