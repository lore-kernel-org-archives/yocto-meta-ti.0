Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C461AC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:21:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1501.1667812852886957312
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 01:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gLvOzqkg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A79KpcE051983
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 03:20:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667812851;
	bh=hSbFcgjILzSo3uiUnQqZ2GyVbmYF7/rMD2W5rakU5zA=;
	h=From:To:CC:Subject:Date;
	b=gLvOzqkgF2+LqHWICgwasoqwcMeRrWdF3tW//JQxZ8N7toqZJscw/qFSCbfMCQ6L3
	 q5LQJ5Yxa1Ze99ky9HgOw9HE8/pSfgT6YCZDVUAtz+M6EGfuzxebqdXsfk0oVjxhGu
	 gbEhud8RRCCC/5WawD+KTHYXnBjCwu/evnB65VBk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A79KppG059559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 03:20:51 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 7 Nov
 2022 03:20:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 7 Nov 2022 03:20:51 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A79KnXI049504;
	Mon, 7 Nov 2022 03:20:50 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v4 0/6] J784S4 HS Support
Date: Mon, 7 Nov 2022 14:50:42 +0530
Message-ID: <20221107092048.555881-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 09:21:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15324

This series adds support for J784S4 HS EVM support.

Depends on uboot series [0]

[0]: https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/list/?series=3121

v4:
Removed RFC tag

v3:
split ahp HS firmware list into two

v2:
remove the unnecessary variables for UBOOT init

Manorit Chawdhry (6):
  conf: machine: Add J784S4 hs platform
  ti-rtos-firmware: Add J784S4 High Security support
  j784s4-hs: changes to support new hs platform
  ti-graphics: Add j784s4-hs-evm as a compatible machine
  cnm-wave-fw: add compatible for j784s4-hs-evm
  cadence-mhdp-fw: add compatible for j784s4-hs-evm

 conf/machine/j784s4-hs-evm-k3r5.conf          |  11 ++
 conf/machine/j784s4-hs-evm.conf               |  11 ++
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   2 +-
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |   2 +-
 .../ti-img-rogue-driver_1.15.6133109.bb       |   3 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |   1 +
 .../trusted-firmware-a_%.bbappend             |   4 +
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |   3 +-
 recipes-kernel/linux/kernel-rdepends.inc      |   2 +
 recipes-security/optee/optee-os_%.bbappend    |   4 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 138 ++++++++++++++++++
 11 files changed, 177 insertions(+), 4 deletions(-)
 create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j784s4-hs-evm.conf

-- 
2.34.1


