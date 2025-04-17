Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E31C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:36:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.6460.1744889796058464146
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 04:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I11xyfSH;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HBaY4f615081
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 06:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744889795;
	bh=JoXUSLeNXmTTARER2KsLfqV8EI9kmWFIS3O5R2+dXhc=;
	h=From:To:CC:Subject:Date;
	b=I11xyfSHMckflF0BLI4ZFW/CkamC8i2Chp8Kq6Ke8t0oapD7DKTMIN0My4eBCEG18
	 QbfXweUP+gphM6Q2/xuWh3M25zxkfpDrLzwRPMve7LgAj9JEjniozFgGuPtW60WYxP
	 M3kL0pLErRgaPxMwlz5gx1hHHP4NodgyLkaD9m+Q=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HBaYmR025058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 06:36:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 06:36:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 06:36:34 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HBaXIg102661;
	Thu, 17 Apr 2025 06:36:34 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v2 0/3] add support for falcon mode builds
Date: Thu, 17 Apr 2025 17:06:10 +0530
Message-ID: <20250417113614.1780603-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 11:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18479

Falcon mode[1] in u-boot enables us to bypass proper u-boot when booting hence
reducing boot time.

This patch set adds support for falcon mode on am62 evms depending on the
`ti-falcon` distro override which can be added by appending to local.conf with
the follows:

  DISTROOVERRIDES:append = ":ti-falcon"

Build process remains un-changed if the override is not present.

The override enables the usage of the falcon config fragment during r5 build
process as well as deploying the associated tispl_falcon.bin to rootfs's boot
directory.

For secure boot since the R5 core is slower compared to A53 cores,
authenticating as well as decompressing the signed fitImage from oe-core takes
multiple seconds, therefore we opt for using legacyhs-fitimage instead which
allows the authentication to be deferred to tifs.

[1]:
https://docs.u-boot.org/en/latest/develop/falcon.html

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v2:
 * Add cover letter describing the patch set
 * Add default empty string for 'FALCON_INCLUDE' preventing recipie parsing
   error when ti-falcon is not set
v1:
https://lore.kernel.org/yocto-meta-ti/20250415093645.435281-1-anshuld@ti.com/

Anshul Dalal (3):
  am62: apply u-boot config fragment on ti-falcon
  bsp: conf: machine: add ti-falcon.inc
  bsp: u-boot: deploy tispl_falcon.bin to rootfs

 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   |  2 ++
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   |  2 ++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    |  2 ++
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf |  2 ++
 meta-ti-bsp/conf/machine/include/k3.inc          |  5 +++++
 meta-ti-bsp/conf/machine/include/ti-falcon.inc   |  6 ++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc     | 11 +++++++++++
 7 files changed, 30 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc


