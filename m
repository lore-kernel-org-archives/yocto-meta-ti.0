Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B48C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:55:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10155.1721289338567333266
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 00:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dW7AU+JV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I7tbiC047569
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721289338;
	bh=uTUa6CeWP2xTn1VtKPexf1b9/C71LXBpfzEPY+gFRWg=;
	h=From:To:CC:Subject:Date;
	b=dW7AU+JVjv7W0YotjBGsspIH6Stf1EGLNIImihGHFTkQj7tZGcqdeAVvkugh6bb7w
	 cQG1tliQCR0MHtpvr0EqR4/2OnSkGaRa3sKAHaDvh9GWguDWXyf7UgsrPlV115Fygd
	 Yxn1ge5rrD2zUi327+7jqS3g13bek3vpwwcr2Yj4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I7tbN1110814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:55:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 02:55:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 02:55:37 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I7tY0M086409;
	Thu, 18 Jul 2024 02:55:35 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 0/3] J742S2 support
Date: Thu, 18 Jul 2024 13:25:23 +0530
Message-ID: <20240718075526.1427615-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 07:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17882

This series add support for j742s2-evm as a yocto machine configuration

Changes in v2:
- Removed ti-eth from MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS since we do
  not have ti-eth fw for j742s2
- Use the new BSP support framework instead of setting GPU driver
  explicitly

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


