Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CA8C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:29:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15886.1710430145916501622
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 08:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AYJBHwPE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42EFT4f5067627
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710430144;
	bh=8hbC+/d8pGnAVkqnmSaFy+PxGQZ6ErwshvyqvOP8GOM=;
	h=From:To:CC:Subject:Date;
	b=AYJBHwPExzO/ZRLEBNa4Fm82HmffzobgJwtcYKgtGkQs1/6WToSSYXFIX20HdHN2/
	 YMCtQ7MgmsgF6VW3olOe57U5OAOQdgE35HBlnxOsAV8lbRkNSdd8SYVHXLxlm3nIl2
	 KDLH/p/K47gRviYlXb9KcBBl5FLN1geLXP2UFmcA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42EFT4hm053698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:29:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 10:29:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 10:29:04 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42EFT2O5081019;
	Thu, 14 Mar 2024 10:29:03 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <n-francis@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/2] Add support for newly added SR-version and HSFS/HSSE combinations 
Date: Thu, 14 Mar 2024 20:58:53 +0530
Message-ID: <20240314152855.499510-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 15:29:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17527

Below commits in ti-u-boot added support for some more combinations of the bootloader binaries, through the binman based
u-boot builds. Add support in yocto to package them in the built wic images.

j721e:
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2023.04-next&id=5e206ba8dbcfb348ae2566887d2746ea60e3fdf8
j7200:
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2023.04-next&id=3760cb997fa9022a380818799ceafb0d24778d7c

Aniket Limaye (2):
  conf: machine: j721e: Add support for HSSE2.0 and HSFS1.1
  conf: machine: j7200: Add support for HSSE1.0 and HSFS1.0

 meta-ti-bsp/conf/machine/include/j7200.inc |  6 ++++++
 meta-ti-bsp/conf/machine/include/j721e.inc | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.34.1


