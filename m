Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2C2CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:50:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.32013.1759751416762642359
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 04:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GHUDvWAl;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596BoFhI4051219;
	Mon, 6 Oct 2025 06:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759751415;
	bh=Lyu8htIr+e7I3qSMc6vguoCG7aAyiBBrrq9Gk3HXh8Q=;
	h=From:To:CC:Subject:Date;
	b=GHUDvWAlSR2chqhF1wk4nqdipvkLWwtAGNnWCK+C6DLzYn3dj+cL+72rYoxH1GHRT
	 Cgr7ueW72Xcz3nbFdNRcLZoi7TFLfD7tfBM9MMSGvTpDWB3cwaFlPa1ESuaRYtL8bG
	 D6M6czDI3Cbm/+BJ92b2IVt/wXnT0IdjZENAX/so=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596BoF6U2819203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 06:50:15 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 06:50:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 06:50:15 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596BoAwN3371433;
	Mon, 6 Oct 2025 06:50:11 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v4 0/4] Add recipes to build initramfs image
Date: Mon, 6 Oct 2025 17:20:06 +0530
Message-ID: <20251006115010.1530509-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Oct 2025 11:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19105

The series aims to add a new recipe which will package boot
essential and some other modules in image which can later be
used in the boot process of all K3 platforms. This will result
in the addition of ~20MB initramfs image in the bootflow.

The motivation behind the work is to probe modules(in boot time)
which could not be built in the upstream Linux kernel
image, as using it as inbuilt drivers will increase the
kernel image size, which is undesirable by the upstream folks.

Hence, build those drivers as modules and package it inside
initramfs and later get it probed through initramfs-udev(device manager).

The series will introduce an additional 20MB initramfs image in the
bootflow of all K3 platforms regardless of whether any platform chooses
to add modules to it or not, so as to keep the bootflow for all devices
uniform. Hence, the build/packaging of initrd image is being triggered
in k3.inc.

Boot tests for am64xx:
[0] https://gist.github.com/Jamm02/0abbba19ff27272a9945dd7f3035b603

Changes since V3:
- Move initramfs build from k3.inc to ti-soc.inc so that legacy
platforms like am57 also includes the initramfs image.
- Change BUILD_CORE_INITRD_IMAGE -> BUILD_CORE_INITRAMFS_IMAGE

Link to V2: https://lists.yoctoproject.org/g/meta-ti/message/19043

Link to V1: https://lists.yoctoproject.org/g/meta-ti/topic/115128108


Moteen Shah (4):
  meta-ti-bsp: conf: machine: include: Add common module variable for TI
    Initramfs image
  recipes-ti: initramfs: Make minimal initramfs image
  meta-ti-bsp: wic: Add initramfs path to to grub config
  meta-ti-bsp: conf: machine: include: Build initramfs for all TI
    SoC's

 meta-ti-bsp/conf/machine/include/am62axx.inc  |  3 ++
 meta-ti-bsp/conf/machine/include/j721e.inc    |  3 ++
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  3 ++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   | 10 ++++++
 .../packagegroup-ti-core-initramfs.bb         | 15 +++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++++++++++++
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in      |  2 +-
 7 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

-- 
2.34.1


