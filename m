Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08A7C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:00:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.89963.1754060441679247201
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 08:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vK38HF9k;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571F0e1f3755486;
	Fri, 1 Aug 2025 10:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754060440;
	bh=hD6p6dY99Wx/DdwPipTZrzny2TJDZqPjHJe/lgFg5aQ=;
	h=From:To:CC:Subject:Date;
	b=vK38HF9kkPr8BnQqeyMXE+io2rIkwHXKfdRMlJWcZbT/y8sSRy6pdT8yfZLQKMKJz
	 1Pw2E8HdvvGqe6q8PoJW+6JA0EtGCcEZi4aWhAhAr6uAqmzSESR6dgg/AuxenmMCCq
	 ZnGI3E5IvmLUFGTVQYhkL2NCu5gEpu2uoMwidRyE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571F0ekb621641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 10:00:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 10:00:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 10:00:40 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571F0bWQ256132;
	Fri, 1 Aug 2025 10:00:38 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 0/5] Add recipe to package prebuilt messageQ FW
Date: Fri, 1 Aug 2025 20:30:32 +0530
Message-ID: <20250801150037.2650736-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 15:00:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18878

Add recipe to package pre-built messageQ IPC firmware for AM57xx SoCs
in root and boot partition. This removes dependency on meta-ti-extras
layer. As discussed here:
https://lore.kernel.org/all/20250315020224.3100249-1-denis@denix.org/

Note: The firmware PR is not yet merged into ti-linux-firmware repo yet

Beleswar Padhi (5):
  Revert "ti-ipc-examples: Remove DSP/BIOS IPC examples"
  ti-rtos-messageq-test-fw: Add a recipe to package prebuilt IPC
    firmware
  conf: omap-a15.inc: Update package for wic dependency
  meta-ti-extras: ti-ipc-rtos: Remove deploy task
  ti-ipc.inc: Bump SRCREV to latest for ipcdev project

 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../ti-rtos-messageq-test-fw_git.bb           | 67 +++++++++++++++++++
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc         |  4 +-
 ...Mgr-sys_errlist-has-been-deprecated-.patch | 40 +++++++++++
 .../ipc/ti-ipc-examples-linux_git.bb          | 49 ++++++++++++++
 .../recipes-ti/ipc/ti-ipc-examples.inc        | 31 +++++++++
 .../recipes-ti/ipc/ti-ipc-examples_git.bb     | 44 ++++++++++++
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 12 ----
 9 files changed, 235 insertions(+), 15 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb

-- 
2.34.1


