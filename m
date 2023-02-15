Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC6DC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2558.1676489638562249911
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O1XN7D6N;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXuet097977;
	Wed, 15 Feb 2023 13:33:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489636;
	bh=JRhKAa1vriU3uM+ew9ygG7YqAftaiZ7RluOWTUfS9Ag=;
	h=From:To:CC:Subject:Date;
	b=O1XN7D6NrRU0zg1jU70AmGtGuJwOVGP8kNPSJwQnRj+xNSgXB9GcbpOV8UcAN2EFC
	 0UyAdFsnbBmzAOtYjFGqwKIq9Xfwj57KDvbRJS1WjngINN+9tHEfBxrrHjmBj9m7wj
	 kbYlU6K+4hl/aVkEvU+ysoPit6RFS3+1k51rOHew=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXtYG050841
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:56 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:55 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6d014221;
	Wed, 15 Feb 2023 13:33:55 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 00/15] ti-rtos-firmware and secdev
Date: Wed, 15 Feb 2023 13:33:40 -0600
Message-ID: <20230215193355.9676-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15856

Hello all,

This is a combined series that replaces my previous ones on
ti-rtos-firmware and SECDEV. There is now a small dependency
between them so I have merged them here.

Big change is in the SECDEV series which now uses a new bbclass
to combine the SECDEV env setup in one spot. We also remove
the ti-path.inc usage.

Thanks,
Andrew

Andrew Davis (15):
  meta-ti-bsp: Add helper class for TI Security Development Tools
  trusted-firmware-a: Use new ti-secdev class to sign the images
  optee-os: Use new ti-secdev class to sign the images
  u-boot-ti: Use new ti-secdev class to sign the images
  ti-rtos-firmware: Use new ti-secdev class to sign the images
  ti-sci-fw: Use new ti-secdev class to sign the images
  conf: machine: k3: Remove unneeded TI_SECURE_DEV_PKG_K3 assignments
  ti-k3-secdev: Remove inclusion of ti-paths.inc
  ti-rtos-firmware: Remove unneeded per-machine TARGET defines
  ti-rtos-firmware: Fix name for AM64x and AM62x firmware
  ti-rtos-firmware: Do not break the source directory by renaming files
  ti-rtos-firmware: Use defines to set firmware names
  ti-rtos-firmware: Use a table instead of a list of copy commands
  ti-rtos-firmware: Fix use of base_libdir with nonarch_base_libdir
  ti-rtos-firmware: Deploy secure firmware unconditionally

 .../classes/kernel-fitimage-legacyhs.bbclass  |   4 +-
 meta-ti-bsp/classes/ti-secdev.bbclass         |  21 +
 meta-ti-bsp/conf/machine/am335x-hs-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/am437x-hs-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/am57xx-hs-evm.conf   |   2 -
 .../conf/machine/beaglebone-ai64-k3r5.conf    |   2 -
 meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/include/k3.inc       |   2 -
 meta-ti-bsp/conf/machine/include/k3r5.inc     |   2 -
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |   8 +-
 .../trusted-firmware-a_%.bbappend             |  39 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   3 +-
 .../optee/optee-os_3.16%.bbappend             |  43 +-
 .../recipes-ti/secdev/ti-k3-secdev_git.bb     |   5 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 695 ++++++------------
 .../recipes-ti/includes/ti-paths.inc          |   2 -
 16 files changed, 269 insertions(+), 565 deletions(-)
 create mode 100644 meta-ti-bsp/classes/ti-secdev.bbclass

-- 
2.39.1


