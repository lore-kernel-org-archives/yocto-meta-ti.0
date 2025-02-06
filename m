Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9734C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:40:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.42559.1738852835546249377
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 06:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wTWxzlzS;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516EeWYf2818271
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Feb 2025 08:40:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738852832;
	bh=r8gsjDmV3ydNdgIKlN6TWvW7YdhRfEYRMOjkXQ4/GcA=;
	h=From:To:CC:Subject:Date;
	b=wTWxzlzSTflYsNH1EKFP9EKS/mKHQSmnQRYUxtBb3Wz1td/vs16UXYIzejmn8wNgl
	 GtGFrABcLwUpjLy+5XdMKYjuwpgpwa2UKZQ27LyvXLF2bQ8Sc+6/nzT3/HzQn0110u
	 PItQCb+77HQNGAq7jrwcx7ollKDrrBmbBiek04Vk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516EeWav041299;
	Thu, 6 Feb 2025 08:40:32 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:40:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:40:31 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516EeVOJ070580;
	Thu, 6 Feb 2025 08:40:31 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v3 0/5] Upgrade TFA, OPTEE-OS & enable AM62L support
Date: Thu, 6 Feb 2025 20:10:16 +0530
Message-ID: <20250206144021.3007831-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 14:40:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18280

This series is intended only for master.
It bumps up TFA to v2.12+ & OPTEE-OS to v4.5.0+
It also aims to enable platform support for AM62L in meta-ti-bsp

Link to AM62L TRM: https://www.ti.com/lit/pdf/sprujb4

Changes in v3:

* Add License-Update tag for "trusted-firmware-a: Switch TFA to TI fork"

Changes in v2:

* Upgrade optee-os to v4.5.0+ & drop Add-initial-support-for-AM62Lx-SoC.patch
* Split TFA upgrade to v2.12 & switch to Github TI fork into 2 commits
* Fix indentation for AM62L specific newly added changes in u-boot-ti.inc by using OE-Core policy
* Set KERNEL_DEVICETREE to empty
* Drop SERIAL_CONSOLES from am62lxx.inc as k3.inc already has it defined

Chirag Shilwant (5):
  recipes-security: optee: Update to v4.5.0+
  trusted-firmware-a: Update to v2.12 release tag
  trusted-firmware-a: Switch TFA to TI fork
  meta-ti-bsp: Add Support for AM62L
  conf: machine: am62lxx-evm: Add logic to generate UBI filesystem
    images

 meta-ti-bsp/conf/machine/am62lxx-evm.conf     | 19 +++++++++++++++++
 meta-ti-bsp/conf/machine/include/am62lxx.inc  | 12 +++++++++++
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  2 ++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  6 ++++++
 .../trusted-firmware-a-ti.inc                 | 11 ++++++----
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 21 +++++++++++++++++++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 .../optee/optee-os-ti-version.inc             |  4 ++--
 8 files changed, 70 insertions(+), 6 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc

-- 
2.34.1


