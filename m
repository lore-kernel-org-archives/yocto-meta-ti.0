Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCEBE7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 18:31:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.18956.1733423469109609313
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 10:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X78HLoOv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B5IV8Ww018299
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 12:31:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733423468;
	bh=LB003AfdFsiThGAizK7hElZLIVC/b15EPvRGP8BDxsI=;
	h=From:To:CC:Subject:Date;
	b=X78HLoOv+cucs2pjBE0JmZVVlBa39W2xooZT2OkoGoD9Z1lRy3kS6biT71Y0SfTWT
	 36axoe1nOEkLTooQ14IrqL7TgAT9zVoHKOWRkoJ5kWfp2RAhBF3zZpkUJ7ZQObeDOd
	 /yFwkng1tn2LJE3gWDbdLiEE5LAN49g2l02k8Gro=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5IV8HL122563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 12:31:08 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 12:31:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 12:31:08 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5IV6ni101183;
	Thu, 5 Dec 2024 12:31:06 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/2] omap-a15: Add dra7-ipu1-fw to boot
Date: Thu, 5 Dec 2024 23:35:46 +0530
Message-ID: <20241205183103.3411587-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Dec 2024 18:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18081

The firmware is required for early boot of the remoteproc from SPL stage
of the bootloader. Copy the ipc firmware into the boot partition of the
wic images, where the bootloader expects it to be.

For this, add a deploy task for the firmware binary and also include the
file in IMAGE_BOOT_FILES for omap-a15.

Aniket Limaye (2):
  meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
  conf: machine: omap-a15.inc: include ipu1 firmware in the boot
    partition

 meta-ti-bsp/conf/machine/include/omap-a15.inc    |  3 ++-
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.47.0


