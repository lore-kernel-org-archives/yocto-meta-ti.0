Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE825CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:24:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10512.1755599035346882820
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 03:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nr2VfaK+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JANrOk3292020;
	Tue, 19 Aug 2025 05:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755599034;
	bh=N2rcluqqNzFXyD9chn0Kfhf95MlfP+voBRmDZ+pYIJU=;
	h=From:To:CC:Subject:Date;
	b=nr2VfaK+QCMoLLoxSX2VCOGWcj0zPCpKSID3wVhrJO3Sg3q1Au6XkFKGctK38M4mN
	 rVSDe/Kfkf5avU2PvVfKBAlJ522mH8ba6BTKHYU2wmtDVskzREc2HpxgQQmt9ElUSD
	 Ts+Xx8coXjX9Qa7YIdshS3tw+LFb8utrcbCeInrw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JANrJs521847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:23:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:23:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:23:53 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JANpHI2850983;
	Tue, 19 Aug 2025 05:23:51 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v3 0/3] Add recipe to package MessageQ Application and Firmware
Date: Tue, 19 Aug 2025 15:53:47 +0530
Message-ID: <20250819102350.2915102-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 10:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18936

The MessageQ IPC Application and Firmwares share the same source repository. The
pre-built MessageQ firmwares are available in ti-linux-firmware repository. Add
a recipe to package the firmwares in root and boot partition for AM57xx SoCs.
Also, add a recipe to build _ONLY_ the application (app_host) from source and
package it in rootfs.

This removes dependency on meta-ti-extras layer. As discussed here[0]

v3: Changelog:
1. Squashed patches 2,3 and 4 from V2 into [PATCH v3 2/3] in v3.
2. Removed "INSANE_SKIP" from [PATCH v3 1/3]

Link to v2:
https://lore.kernel.org/all/20250806170442.243461-1-b-padhi@ti.com/

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

Beleswar Padhi (3):
  ti-ipc-examples-linux: Add a recipe to build messageq app_host
  ti-rtos-messageq-test-fw: Add a recipe to package prebuilt IPC
    firmware
  ti-ipc.inc: Bump SRCREV to latest for ipcdev project

 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../ti-rtos-messageq-test-fw_git.bb           | 67 +++++++++++++++++++
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc         |  4 +-
 .../ipc/ti-ipc-examples-linux_git.bb          | 65 ++++++++++++++++++
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 12 ----
 6 files changed, 136 insertions(+), 15 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb

-- 
2.34.1


