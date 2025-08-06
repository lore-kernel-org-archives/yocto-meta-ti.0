Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40024C87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:04:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.30788.1754499887450640247
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rxsXCJkS;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576H4jbn127416;
	Wed, 6 Aug 2025 12:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754499886;
	bh=Ph5AXiXTclFxVlDjP+W0wIvp59zyD4WNAzZhmeTjLdQ=;
	h=From:To:CC:Subject:Date;
	b=rxsXCJkSFw6nrWOBsFx4ZD2CJcbzJ+QpVS6YlQonexej7vlDG2y8xNi1YSQt+N3PD
	 WQfQ/u+HMNy4oSHHRsx/kl8hvDqnDsbZajenCFRT6KFSQST4C4yPt+skZ5/Vp9qxY5
	 EYgzSDZCJkZe/AMr+8Ua13cgQ9cFaeGBzK++HTYM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576H4j2U271469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:04:45 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:04:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:04:45 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576H4gP43869168;
	Wed, 6 Aug 2025 12:04:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2 0/5] Add recipe to package MessageQ Application and Firmware
Date: Wed, 6 Aug 2025 22:34:37 +0530
Message-ID: <20250806170442.243461-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18896

The MessageQ IPC Application and Firmwares share the same source repository. The
pre-built MessageQ firmwares are available in ti-linux-firmware repository. Add
a recipe to package the firmwares in root and boot partition for AM57xx SoCs.
Also, add a recipe to build _ONLY_ the application (app_host) from source and
package it in rootfs.

This removes dependency on meta-ti-extras layer. As discussed here[0]

v2: Changelog:
1. Build only the application host, not the firmwares in PATCH 01.
2. Bump ALTERNATE_PRIORITY to 30 for ti-rtos-messageq-test-fw package to
override symlinks from ti-ipc-rtos package in PATCH 02.

Link to v1:
https://lore.kernel.org/all/20250801150037.2650736-1-b-padhi@ti.com/

Note:
1. Currently, there is a dependency on XDS tools even to build the app_host.
This is because of the way files are organized in the source repository[1].
There is no separate folder for separate OS'es. All are put together under one
directory, and 'xs' is used to pick and zip the appropriate files according to
the HOSTOS. Unless that cleanup happens, this dependency will exist. Or is there
a way?
2. The firmware PR is not yet merged into ti-linux-firmware repo yet

[0]: https://lore.kernel.org/all/20250315020224.3100249-1-denis@denix.org/
[1]: https://git.ti.com/cgit/ipc/ipc-examples/tree/src/examples/templates/ex02_messageq/host 
[2]: https://git.ti.com/cgit/ipc/ipc-examples/tree/src/examples/templates/makefile#n265

Thanks,
Beleswar

Beleswar Padhi (5):
  ti-ipc-examples-linux: Add a recipe to build messageq app_host
  ti-rtos-messageq-test-fw: Add a recipe to package prebuilt IPC
    firmware
  conf: omap-a15.inc: Update package for wic dependency
  meta-ti-extras: ti-ipc-rtos: Remove deploy task
  ti-ipc.inc: Bump SRCREV to latest for ipcdev project

 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../ti-rtos-messageq-test-fw_git.bb           | 67 ++++++++++++++++++
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc         |  4 +-
 .../ipc/ti-ipc-examples-linux_git.bb          | 68 +++++++++++++++++++
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 12 ----
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb

-- 
2.34.1


