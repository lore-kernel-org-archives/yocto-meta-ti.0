Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7980C7EE39
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:52:31 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.4560.1750931548538469846
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=s0C6Rvai;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q9qRuj2384014
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750931547;
	bh=xH3qY/SPz2kW4ux4Q2qe6zSQlMNnM0ptFeAjj+iK/F0=;
	h=From:To:CC:Subject:Date;
	b=s0C6RvaiXFRlxPszsKQtXsxYQ67KKMLklPeACXxHFaMRpIxQ8YfW7g9Y/LhBkIl9K
	 IyZ2wD8jXYXoYk9tQ2DrzwYwgFOWKwlMUhQbDNtNH1dVDPhuI9/Sa0kW/xl+zDBSmx
	 L/zoH1Z4MMShKWe3K2QH4FyeZezfOp/XR85+4r2Q=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q9qRcx1870129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:27 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 04:52:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 04:52:26 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q9qQsI802125;
	Thu, 26 Jun 2025 04:52:26 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 0/4] Add support for AM62x SIP
Date: Thu, 26 Jun 2025 15:21:39 +0530
Message-ID: <20250626095144.952261-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18687

Hi all,

This patch series adds support for AM62x SIP to meta-ti following the updates to
u-boot and kernel, the following set of changes were made to the build process:

1. The u-boot defconfigs are renamed from am62sip_* to am6254xxl_*
2. PRELOADED_BL33_BASE and BL32_BASE were modified for ATF build
3. For OPTEE build, CFG_TZDRAM_START was modified
4. SiP specific DTB was used instead of am62x's as fitImage's default

Regards,
Anshul
---
Depends on:
afcd8c5ef0bf@ti-u-boot-2025.01-next
12575e5752ca@ti-linux-6.12.y-cicd
---
Changes in v2:
 - Keep KERNEL_DEVICE_TREE the same between SiP and am62x
 - Modify ATF's PRELOADED_BL33_BASE to match updated SPL_TEXT_BASE from u-boot
 - Set updated addresses for ATF/OPTEE in machine config instead of recipes

v1: https://lore.kernel.org/yocto-meta-ti/20250625171626.2863841-1-anshuld@ti.com/
---
Anshul Dalal (4):
  conf: machine: am62xxsip: update u-boot defconfig to am6254xxl
  meta-ti-bsp: tfa: add build flags for am62xxsip-evm
  meta-ti-bsp: optee: add build flags for am62xxsip-evm
  conf: machine: am62xxsip: update kernel dtbs

 .../conf/machine/am62xxsip-evm-k3r5.conf      |  4 +++-
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf   | 20 ++++++++++++++++---
 .../trusted-firmware-a-ti.inc                 |  2 ++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 4 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.49.0


