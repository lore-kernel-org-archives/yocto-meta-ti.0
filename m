Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F8FC7EE39
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:17:21 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.21656.1750871831328617266
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 10:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UVdDnSYn;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHHAU31514293
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750871830;
	bh=jmYwNju9Ykg+oaR9jyD7gY0bPsY5UISGLh9X6WGEGL8=;
	h=From:To:CC:Subject:Date;
	b=UVdDnSYnFb+jy4uokXcJy2svy1oG4bhpLpPnqinHJkoghZTlEZRV27yC4t+qwjhQx
	 e6t/6u3LWfwE/myt/JKMmf134o8CYdCOFcEhjkpLTeZgulBsFgXd7T77khEG/tHtXQ
	 9ohR8xqO+2PhJIfW+wHkUCaagNJNfcFQjQ1zZb+k=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHHAlq2773668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:17:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:17:10 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHH9fg3748835;
	Wed, 25 Jun 2025 12:17:10 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 0/4] Add support for AM62x SIP
Date: Wed, 25 Jun 2025 22:46:20 +0530
Message-ID: <20250625171626.2863841-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 17:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18670

Hi all,

This patch series adds support for AM62x SIP to meta-ti following the updates to
u-boot and kernel, the following set of changes were made to the build process:

1. PRELOADED_BL33_BASE and BL32_BASE were modified for ATF build
2. For OPTEE build, CFG_TZDRAM_START was modified
3. SiP specific DTBs were used instead of am62x's

Regards,
Anshul

---
Depends on:
40371d7b1bf0@ti-u-boot-2025.01-next
12575e5752ca@ti-linux-6.12.y-cicd
---
Anshul Dalal (4):
  conf: machine: am62xxsip: update u-boot defconfig to am6254xxl
  meta-ti-bsp: tfa: add build flags for am62xxsip-evm
  meta-ti-bsp: optee: add build flags for am62xxsip-evm
  conf: machine: am62xxsip: update kernel dtbs

 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf   |  4 +++-
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf        | 14 ++++++++++++--
 .../trusted-firmware-a/trusted-firmware-a-ti.inc   |  1 +
 .../optee/optee-os-ti-overrides.inc                |  1 +
 4 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.49.0


