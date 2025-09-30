Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1293CCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 13:41:41 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.25673.1759239698076035667
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 06:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bWxDtkMb;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: m-shah@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UDfbAP2925077;
	Tue, 30 Sep 2025 08:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759239697;
	bh=CW3N/1qxA2OC5hPbJHxGYRYNhITyM7iw7FXK7RYta3s=;
	h=From:To:CC:Subject:Date;
	b=bWxDtkMb7eUql9Jocm4JFdwLwL3W5/taIwkcUYQ5N3loscJKclPa2RiK9wDp8N5Oz
	 ReYgt8qb06JdT260Wz0FtORrjPgNloRXhwspSLlcJQ9p4lKkN08YIzH+orfOICiXyF
	 c9o/YrLtcd58JczPZ/QUkWD4wlgd2ivCAvH+Sn34=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UDfaxb3954523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 08:41:36 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 08:41:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 08:41:36 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UDfWM82988223;
	Tue, 30 Sep 2025 08:41:32 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH 0/4 v3]Add recipes to build initramfs image
Date: Tue, 30 Sep 2025 19:11:27 +0530
Message-ID: <20250930134131.1149453-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 13:41:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19083

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

Boot tests for am62axx, am64xx, j721e:
[0]https://gist.github.com/Jamm02/17fd621af1612f42fdaf69d2d9884e70

Changes since V2:
Link: https://lists.yoctoproject.org/g/meta-ti/message/19043

- Changed initrd -> initramfs.
- Remove blanket change for grub.cfg and instead add the initramfs path only.
- Move utils and other includes to RDEPENDS instead of PACKAGE_INSTALL.

Changes since V1:
Link: https://lists.yoctoproject.org/g/meta-ti/topic/115128108

- Switch to a platform defined module variable instead of having a central one.
- Package initrd.cpio.xz(20 MB) instead of initrd.cpio (90 MB).
- Build the inird image and package it in boot partition only if mainline or
mainline next of the Linux kernel is being built.

Moteen Shah (4):
  meta-ti-bsp: conf: machine: include: Add common module variable for TI
    Initramfs image
  recipes-ti: initramfs: Make minimal initramfs image
  meta-ti-bsp: wic: Add initramfs path to to grub config
  meta-ti-bsp: conf: machine: include: Build initramfs for all K3
    platforms

 meta-ti-bsp/conf/machine/include/am62axx.inc  |  3 ++
 meta-ti-bsp/conf/machine/include/j721e.inc    |  3 ++
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  3 ++
 meta-ti-bsp/conf/machine/include/k3.inc       |  7 +++-
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  2 ++
 .../packagegroup-ti-core-initramfs.bb         | 15 +++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++++++++++++
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in      |  2 +-
 8 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

-- 
2.34.1


