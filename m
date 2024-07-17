Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2D3C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:36:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15287.1721223405485701712
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 06:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Uy1PXtMa;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HDajNM026352
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 08:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721223405;
	bh=sdzxW4WWdt8u13wKTaksS6XwNfH6uduvcH6+ARKiIQs=;
	h=From:To:CC:Subject:Date;
	b=Uy1PXtMaHwwVY1Po6U1lpf9CLFdCdafkmggUg0UXGcX/2z8J3f88rHf5cspVgtdgg
	 BkuexziWGAdbRvNJZigshvBYt/xyii8vdI9NO1PKflHK9HFJyxBCSlDfAc8+CYcEvK
	 Ghrd35O5XXnagurDBYK0mdJc4Z8PEGtmOHJP7erk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HDajO3007054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 08:36:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 08:36:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 08:36:44 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HDaflB025857;
	Wed, 17 Jul 2024 08:36:42 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 0/3] J742S2 support
Date: Wed, 17 Jul 2024 19:06:11 +0530
Message-ID: <20240717133614.787998-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 13:36:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17873

This series adds support for j742s2-evm as a yocto machine configuration

Aniket Limaye (3):
  meta-ti-bsp: Add support for j742s2-evm
  meta-ti-bsp: powervr: Enable building for j742s2
  meta-ti-bsp: j742s2: add Rogue GPU driver to machine definition

 meta-ti-bsp/conf/machine/include/j742s2.inc   | 19 +++++++
 meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf | 11 ++++
 meta-ti-bsp/conf/machine/j742s2-evm.conf      | 22 +++++++
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |  2 +-
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
 .../ti-img-rogue-driver_24.1.6554834.bb       |  3 +-
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  5 ++
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  2 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 +
 .../ti-img-rogue-umlibs_24.1.6554834.bb       |  3 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 57 +++++++++++++++++++
 11 files changed, 124 insertions(+), 4 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/j742s2.inc
 create mode 100644 meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j742s2-evm.conf

-- 
2.34.1


