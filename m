Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC126CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:00:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.14454.1760529640104919591
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 05:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k+eDWeJc;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FC0b6i1310765;
	Wed, 15 Oct 2025 07:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760529637;
	bh=GmknYVeGWJQ9MCMgkHfLWCF0aZ+xycShxk60Cc08FBY=;
	h=From:To:CC:Subject:Date;
	b=k+eDWeJcr4Xm/RtBcSh9YMVFYjcWP6uVL6enVIrSTT9Ay6fTXdIjXyuqjPA6dsGQ6
	 aOsBnoAwPOOY2HkvikM8fx+j171x6L7CuvSdg8zaHO8UtyT8YqOQjcHFgF+aYCwrAf
	 IiwOEXlxv8ey/5t8f6cx4BhjodIcK26c/QAJL3oo=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FC0b4X385474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:00:37 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:00:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:00:36 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FC0W7J1859032;
	Wed, 15 Oct 2025 07:00:33 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v5 0/4] Add recipes to build initramfs image
Date: Wed, 15 Oct 2025 17:30:28 +0530
Message-ID: <20251015120032.288741-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 12:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19126

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

Bootlogs for J784s4: 
https://gist.github.com/Jamm02/8fc4c60b113a420ac0a0dee375228faf

Changes since V4:
- Save the initramfs file name in a variable instead of hardcoding it.
- Optionally include initrd inside .wks using a varible to avoid build
failures for non mainline builds.

Link to V4: https://lists.yoctoproject.org/g/meta-ti/message/19110
Link to V3: https://lists.yoctoproject.org/g/meta-ti/message/19083
Link to V2: https://lists.yoctoproject.org/g/meta-ti/message/19043
Link to V1: https://lists.yoctoproject.org/g/meta-ti/topic/115128108

Moteen Shah (4):
  meta-ti-bsp: conf: machine: include: Add common module variable for TI
    Initramfs image
  recipes-ti: initramfs: Make minimal initramfs image
  meta-ti-bsp: wic: Add initramfs path to to grub config
  meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoCs.

 meta-ti-bsp/conf/machine/include/am62axx.inc  |  3 ++
 meta-ti-bsp/conf/machine/include/j721e.inc    |  3 ++
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  3 ++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   | 18 ++++++++++
 .../packagegroup-ti-core-initramfs.bb         | 15 +++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++++++++++++
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in      |  2 +-
 7 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

-- 
2.34.1


