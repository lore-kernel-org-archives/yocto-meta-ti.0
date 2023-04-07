Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BD3C77B6F
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:51:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5239.1680868276818163710
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 04:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PvYYsewq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: u-kumar1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 337BpG9O071159
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680868276;
	bh=OS/DOSwaLr0edYafECFKsLaN9prO42iQGO4XoTmnKRo=;
	h=From:To:CC:Subject:Date;
	b=PvYYsewqUF5n8TzM2u8klBHlfW2UxMxFJpSPgwBP+UY8SJ9Suddh6qV9pEOb5IriE
	 Tb0sz3lPVdiDwAyQ36JYi3kdKO3j+kVgTbeh/zhM2Ah0DQ3UJwqaNItD4Mkxgg3OyR
	 5yzqsD3WqJQvL/ljzPbPWSMql7ZUPUQE310KP0BM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 337BpGpm125639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:16 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 7
 Apr 2023 06:51:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 7 Apr 2023 06:51:15 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 337BpDVa035857;
	Fri, 7 Apr 2023 06:51:14 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH 0/4, kirkstone/wip] conf update for J7200 and J721S2
Date: Fri, 7 Apr 2023 17:21:03 +0530
Message-ID: <20230407115107.839204-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 11:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16320

In u-boot 2023.04, has one SPL_BUILD target GP and HS EVM as
tispl.bin_HS for J7200 and J721S2 EVM.
Also defconfigs are merged into one defconfig.

This patch updates build target and defconfig for
J7200 and J721S2 platforms to align with u-boot 2023.04.


Udit Kumar (4):
  meta-ti-bsp: conf: machine: j7200: Update SPL_BINARY taret
  meta-ti-bsp: conf: machine: j7200: Update def config for hs EVM
  meta-ti-bsp: conf: machine: j721s2: Update SPL_BINARY target
  meta-ti-bsp: conf: machine: j7200: Update def config for hs EVM

 meta-ti-bsp/conf/machine/j7200-evm.conf          | 2 ++
 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf  | 2 +-
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf       | 2 +-
 meta-ti-bsp/conf/machine/j721s2-evm.conf         | 2 ++
 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      | 2 +-
 6 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


