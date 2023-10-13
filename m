Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6E5CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 13:46:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.38755.1697204796776798955
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 06:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SePbdCOp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39DDka5B014785
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697204796;
	bh=7S9J3zsr2ujBRPhhMyXnB4khY35+PQL4j7Grz+AJESo=;
	h=From:To:CC:Subject:Date;
	b=SePbdCOp4utm2kL80johhvKXj66kLT408HVoNNcobO9mWbVrlXWfBPQvmE62Rw6/C
	 VgdlCyCG95pRX9EdkGVU/1J+Ijzb4uZha8ltC8+xuJ7lMweCVQ2YSXmPVckOSJLxVy
	 65yGqZXQD+pvmWvuvZrb2meqZdFkm6rbv3z50OhE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39DDkaHI086603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:46:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 08:46:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 08:46:36 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39DDkXef107108;
	Fri, 13 Oct 2023 08:46:34 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 0/2] ti-eth-fw: Fix softlinks and lower the priority
Date: Fri, 13 Oct 2023 19:16:10 +0530
Message-ID: <20231013134612.35960-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 13:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17106

Fix the softlinks for j784s4... Use main-r5f0_0 instead of mcu-r5f0_0
Reduce priority of ti-eth-fw to update the softlinks to point to ti-ipc
firmware binaries instead.

Aniket Limaye (2):
  ti-eth-fw: Fix firmware alternative names for j784s4
  ti-eth-fw: Reduce priority for softlinks to 5.

---
v1:
   https://lists.yoctoproject.org/g/meta-ti/message/17093
   https://lists.yoctoproject.org/g/meta-ti/message/17094

Changes since v1:
   Do not remove eth-fw entirely. Just update defaults for softlinks

 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1


