Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7223DC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:12:27 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.9865.1738753940606550542
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 03:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bBxeFn5C;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCHqi3341916
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 5 Feb 2025 05:12:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738753937;
	bh=jN27xJd2m42WDGsoC1EOwZZoJEq1pKgCbv35TXsJWck=;
	h=From:To:CC:Subject:Date;
	b=bBxeFn5C+O4Ld99oqWJn8T8qSqEqK7UYfVoMTPdZrh8yMVEDNKqNYwa3cniwP1PPR
	 IgDEQ7DgM2jl3b1c2TwZANbIA1VwDZBYM6OBgANmL4FNR4ltBE9cFJ7zbqQBAmKkGL
	 S3CDgW30Ma4zr6R41CrqZwrGR2iwuXRjDBdTkZOg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCHSV117419;
	Wed, 5 Feb 2025 05:12:17 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:12:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:12:17 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCGDD012604;
	Wed, 5 Feb 2025 05:12:17 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 0/5] Upgrade TFA, OPTEE-OS & enable AM62L support
Date: Wed, 5 Feb 2025 16:42:06 +0530
Message-ID: <20250205111211.1847450-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 11:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18272

This series bumps up TFA to v2.12+ & OPTEE-OS to v4.5.0+
It also aims to enable platform support for AM62L in meta-ti-bsp
Link to AM62L TRM: https://www.ti.com/lit/pdf/sprujb4


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


