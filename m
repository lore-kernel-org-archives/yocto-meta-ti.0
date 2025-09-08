Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF9CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 10:53:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10272.1757328801229341772
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 03:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hGtWrh6R;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ArKUt3850184
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757328800;
	bh=59LQQ8v9xR6SDvqsx+7GfurXBDWORxp7UprKdTrr0gI=;
	h=From:To:CC:Subject:Date;
	b=hGtWrh6RUX9IKdNBVM+7J8o+ij0Brc63d8T4OcO46lEC5XS08WOSgCf8XIUCuLhKy
	 WdD6n9IqaJzIK52LG4L9Uy0/BWRZOYvm42a6ddICSerRMl8JLEra/KBfEewxDGuIpI
	 9IFIDadHO6/CUGU8KdlIVE0VQs8k6wgOtoZy1d8c=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ArK3v2950454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:53:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 05:53:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 05:53:19 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ArGNd479541;
	Mon, 8 Sep 2025 05:53:17 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>
Subject: [master][PATCH 0/1] Add recipes to build initramfs image
Date: Mon, 8 Sep 2025 16:23:13 +0530
Message-ID: <20250908105315.19583-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Sep 2025 10:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18979

The series aims to add a new recipe which will package
boot essential and some other modules in image which
can later be used in the boot process of all K3 platforms. 

The motivation behind the work is to probe modules(in boot time)
which could not be built in the upstream Linux kernel image, as
using it as inbuilt drivers will increase the kernel image size, 
which is undesirable by the upstream folks.

Hence, build those drivers as modules and package it inside initramfs
and later get it probed through initramfs-udev(device manager).

Moteen Shah (2):
  recipes-ti: initrd: Make minimal initrd image
  meta-ti-bsp: wic: Add a new GRUB config for ti platforms

 .../initrd/packagegroup-ti-initrd.bb          |  5 ++
 .../recipes-ti/initrd/ti-initrd-image.bb      | 56 +++++++++++++++++++
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in      |  2 +-
 meta-ti-bsp/wic/ti-grub.cfg                   | 14 +++++
 4 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg

-- 
2.34.1


