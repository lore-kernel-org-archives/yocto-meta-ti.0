Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390BDCAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 09:38:46 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.12384.1758274718081811919
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 02:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M3qYaA2G;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J9caPk215946;
	Fri, 19 Sep 2025 04:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758274716;
	bh=EwCGDb3RA51YKy5L6H7MxN48jQg7vYweJojW8vzpKR4=;
	h=From:To:CC:Subject:Date;
	b=M3qYaA2G3sxeRgU+SM3F98rqeWNOiVDOIiNG1gZXqRZ3l+hDv5sfVP3feRLivbzDB
	 pBVzwLLt4ZHy0OdNI1XazghsCYxseONsvIOzRlNWKan8YCBgKVZU6qsETFWpjS2uJu
	 wABnrZitzq8jhIfbNgXKVqMPmejA615/booy8vfg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J9ca192805461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 19 Sep 2025 04:38:36 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 04:38:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 04:38:36 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J9cWHg2367778;
	Fri, 19 Sep 2025 04:38:32 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH 0/4 v2]Add recipes to build initramfs image
Date: Fri, 19 Sep 2025 15:08:27 +0530
Message-ID: <20250919093831.20609-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Sep 2025 09:38:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19043

The series aims to add a new recipe which will package
boot essential and some other modules in image which
can later be used in the boot process of all K3 platforms.

The motivation behind the work is to probe modules(in boot time)
which could not be built in the upstream Linux kernel image, as
using it as inbuilt drivers will increase the kernel image size,
which is undesirable by the upstream folks.

Hence, build those drivers as modules and package it inside initramfs           
and later get it probed through initramfs-udev(device manager). 

The series will introduce an additional 20MB image in the bootflow.
If in case GRUB is not able to find this initrd image, it won't
result in a hard failure unless the modules packaged inside the
initrd were boot essential to begin with, in which case the boot
process will halt[0] or might run into kernel panic.

Furthermore, this series adds the initrd image for all K3 platforms
regardless of whether any platform chooses to add modules to
it or not, so as to keep the bootflow for all K3 devices uniform.
Hence, the build/packaging of initrd image is being triggered
in k3.inc.

Boot tests:
[0]Without initrd am62axx: http://serenity.dal.design.ti.com:7777/dejagozune.yaml
[1]With initrd including TPS6594_I2C module: http://serenity.dal.design.ti.com:7777/rarupuwalo.yaml
[2]J721e: http://serenity.dal.design.ti.com:7777/ovicodemud.yaml

Changes since V1: 
Link: https://lists.yoctoproject.org/g/meta-ti/topic/115128108

- Switch to a platform defined module variable instead of having a central one.
- Package initrd.cpio.xz(20 MB) instead of initrd.cpio (90 MB).
- Build the inird image and package it in boot partition only if mainline or
mainline next of the Linux kernel is being built.

Moteen Shah (4):
  meta-ti-bsp: conf: machine: include: Add common module variable for
    initrd
  recipes-ti: initrd: Make minimal initrd image
  meta-ti-bsp: wic: Add a new GRUB config for TI platforms
  meta-ti-bsp: conf: machine: include: Build initrd for all K3 platforms

 meta-ti-bsp/conf/machine/include/am62axx.inc  |  3 ++
 meta-ti-bsp/conf/machine/include/j721e.inc    |  3 ++
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  3 ++
 meta-ti-bsp/conf/machine/include/k3.inc       |  8 ++-
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  2 +
 .../initrd/packagegroup-ti-initrd.bb          |  5 ++
 .../recipes-ti/initrd/ti-initrd-image.bb      | 50 +++++++++++++++++++
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in      |  2 +-
 meta-ti-bsp/wic/ti-grub.cfg                   |  9 ++++
 9 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg

-- 
2.34.1


