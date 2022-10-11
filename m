Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EFAC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 09:18:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.5074.1665479922849659513
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 02:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xHxjp0mJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29B9IgRH103590
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665479922;
	bh=BZxLwrx1j0NF0xKKq7rcmxyctE7Q9kauJ4ZjDJSWBHI=;
	h=From:To:CC:Subject:Date;
	b=xHxjp0mJYqcEt5J2h/BuUtVSD0uV2wPXvpcdPAm4n5RjL9lN4krX7d2/fOSvtOWpg
	 1EdfL/k3QAXhau2jlY7GSxuryZXy4wYbvsbkvlINSFuPfEFv8LFkpAqLEknebv8UpY
	 /7ALliO2QVmqGeKUrbgYZ3ZypDj5wRqfEBMKBb0w=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29B9IfAR049264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:41 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 04:18:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 04:18:41 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29B9IdG4015392;
	Tue, 11 Oct 2022 04:18:40 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH 0/6] J784S4 HS Support
Date: Tue, 11 Oct 2022 14:48:33 +0530
Message-ID: <20221011091839.1337077-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15138

This series adds support for J784S4 HS EVM support.

Uboot patches are currently under review [0] and the HS firmware for AHP is still not
public so the compilation will fail. Patch sent after fixing these things locally
for compilation to pass.

[0]: https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/list/?series=2996

Manorit Chawdhry (6):
  conf: machine: Add J784S4 hs platform
  ti-rtos-firmware: Add J784S4 High Security support
  j784s4-hs: changes to support new hs platform
  ti-graphics: Add j784s4-hs-evm as a compatible machine
  cnm-wave-fw: add compatible for j784s4-hs-evm
  cadence-mhdp-fw: add compatible for j784s4-hs-evm

 conf/machine/j784s4-hs-evm-k3r5.conf          |  11 ++
 conf/machine/j784s4-hs-evm.conf               |  19 +++
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   2 +-
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |   3 +-
 .../ti-img-rogue-driver_1.15.6133109.bb       |   4 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |   1 +
 .../trusted-firmware-a_%.bbappend             |   4 +
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |   3 +-
 recipes-kernel/linux/kernel-rdepends.inc      |   2 +
 recipes-security/optee/optee-os_%.bbappend    |   5 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 135 ++++++++++++++++++
 11 files changed, 185 insertions(+), 4 deletions(-)
 create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j784s4-hs-evm.conf

-- 
2.34.1


