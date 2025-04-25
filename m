Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A5CC369D9
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:26:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.9184.1745594797711097269
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 08:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r+REKQww;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQWr62822632
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 10:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745594792;
	bh=+B/I7VYLwPbmhqwRqvPYeKi3MlT20/SBJ1leu5f/Hn0=;
	h=From:To:CC:Subject:Date;
	b=r+REKQwwGpFHOdRK3teSgVaIImFaVKwZ5QdInMPacfz32IzyXeHAKDWta2ZM9YQIY
	 Vu9aHstArz8GNWAOeQkHKX0Mmc9/05BVzOTNaxtXTm41eX4tsq5WyNrDUagIekzTt/
	 81JNGFDisjax/C0BelL1PM94nkDpwNAUs4b3+KOM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQW9v017946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 10:26:32 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 10:26:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 10:26:31 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PFQV8N105693;
	Fri, 25 Apr 2025 10:26:31 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <vigneshr@ti.com>
Subject: [PATCH v3 0/4] add support for falcon mode builds
Date: Fri, 25 Apr 2025 20:56:06 +0530
Message-ID: <20250425152613.2470204-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18507

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
Changes in v3:
 * Better handling of u-boot-ti-staging-falcon package for non ti-falcon builds
 * Add TFA build commands since upstream changes were rejected:
   https://lore.kernel.org/u-boot/20250417113013.mrlhl65farooaiq2@extradite/
v2:
https://lore.kernel.org/yocto-meta-ti/20250417113614.1780603-1-anshuld@ti.com/
Changes in v2:
 * Add cover letter describing the patch set
 * Add default empty string for 'FALCON_INCLUDE' preventing recipie parsing
   error when ti-falcon is not set
v1:
https://lore.kernel.org/yocto-meta-ti/20250415093645.435281-1-anshuld@ti.com/

Anshul Dalal (4):
  am62: apply u-boot config fragment on ti-falcon
  bsp: conf: machine: add ti-falcon.inc
  bsp: u-boot: deploy tispl_falcon.bin to rootfs
  bsp: tfa: add build flags for ti-falcon

 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf     |  2 ++
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf     |  2 ++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf      |  2 ++
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf   |  2 ++
 meta-ti-bsp/conf/machine/include/k3.inc            |  5 +++++
 meta-ti-bsp/conf/machine/include/ti-falcon.inc     |  6 ++++++
 .../trusted-firmware-a/trusted-firmware-a-ti.inc   |  1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       | 14 ++++++++++++++
 8 files changed, 34 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc


