Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32877CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:39:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.25147.1697715582192446780
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 04:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OQCklJ1x;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-mantena@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JBdfSV023225
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 06:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697715581;
	bh=7iZzmtqhrXGXhFfg0RF8jgenzqPZIY340gRFvyq3vPY=;
	h=From:To:CC:Subject:Date;
	b=OQCklJ1xelM86OGgCx6OKMdN+bx2w7HpHRI2b7N/a7yPWHEXyoFZB640Hf74/+9NB
	 Zqg8C18sDnxqsvIlnQGPLbm3oIBdJwofF3m9ZO5NrRcmKZAXgiCTc7vSCQUQzoV2iz
	 6VOkymDLF3s2ZytkgnRkGtKxedgChYzNBOdFgNHA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JBdfBp074320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 06:39:41 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 06:39:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 06:39:40 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JBdeSY111098;
	Thu, 19 Oct 2023 06:39:40 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/1] Update BBAI64 aarch64 target version
Date: Thu, 19 Oct 2023 17:09:37 +0530
Message-ID: <20231019113938.1657179-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.33.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 11:39:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17140

The following patch is to update the kernel version of linux-bb.org from 5.10 to 6.1 
and is verified on BBAI64 board for successful booting of kernel.
The existing dtbs are added to the machine conf file. Further addition
of dtb overlays to the tree requires them to be added to the machine conf
file. I am not working on adding the overlays of BBAI64 to the kernel.


Prasanth Babu Mantena (1):
  linux-bb.org: update to 6.1.46 for aarch64 targets

 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 72 ++++++-------------
 .../recipes-kernel/linux/linux-bb.org_git.bb  |  8 +--
 2 files changed, 24 insertions(+), 56 deletions(-)

-- 
2.33.3


