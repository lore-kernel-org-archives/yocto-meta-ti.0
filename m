Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE194ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 08:55:18 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5285.1662972914802768179
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 01:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mh6fe7+W;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28C8tDqt117461
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 03:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662972913;
	bh=JG5SbpzL4jO4/An8Di89hwrGFa9cbLOWQab/ZY2f0xs=;
	h=From:To:CC:Subject:Date;
	b=mh6fe7+WCZchGCKO4KkG5mgjW01NMXZ2QtZLRIUsfeLeLXOmJa5fSf76dT+kAjPh5
	 IpttQgx3Z0IWBV+4f+Y/rqekOBhP1NW7q8TfiOXZCc6iYVH5whQG5NlGqmZgks/YDI
	 /fTAa6Q05cntMdKY4xkBEzedMAWhdqghnTRYgiBo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28C8tDxR015201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 03:55:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 12
 Sep 2022 03:55:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 12 Sep 2022 03:55:13 -0500
Received: from uda0497581.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28C8tBVt101532;
	Mon, 12 Sep 2022 03:55:11 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 0/3] Authentication of firmware images
Date: Mon, 12 Sep 2022 14:25:07 +0530
Message-ID: <20220912085510.763246-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 08:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15020

This patch series adds support for authentication of remoteproc firmware
images in uboot secure boot flow for K3 HS devices. Loading secure
firmwares require them to be present in rootfs. Adds secure firmware
binaries in rootfs.

The original binaries are NOT being replaced to keep compatibility with
Kernel remoteproc subsystem.

Uboot patch has been posted:
https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/list/?series=2830

Implements: LCPD-28882: Integrate secure firmware binaries in yocto

v2:
- remove j7-hs-evm PLAT_SFX
- fix formatting

Manorit Chawdhry (3):
  ti-rtos-firmware: j721e-hs-evm: add secure firmware images
  ti-rtos-firmware: j7200-hs-evm: add secure firmware images
  ti-rtos-firmware: j721s2-hs-evm: add secure firmware images

 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 151 ++++++++++++++++++++-
 1 file changed, 150 insertions(+), 1 deletion(-)

-- 
2.34.1


