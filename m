Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD411C4321E
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 05:26:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.6379.1666243559978476404
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 22:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g9t51+kN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29K5PwSd129224
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666243558;
	bh=I7xeWWz7N4GtPC4S1DM2ITXrEQyzIMwfrBgGq0fGGtY=;
	h=From:To:CC:Subject:Date;
	b=g9t51+kNJlLvwfk4DqFcMg1uV+r+a8lnR//Dnd1QycLkxBstxqf8OwLdUqe0L3VXA
	 ZqeXlXWYCTW4pMYNgD6d/DfK0aPCgGulbqb476EIlNE2V35SygWY+iKmHQr/sJgoIi
	 80ws8araKWCWjlwBpd9k3t6/YenqGdoVZqJSrFQM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29K5Pw68052363
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:25:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 20
 Oct 2022 00:25:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 20 Oct 2022 00:25:58 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29K5PuEt120845;
	Thu, 20 Oct 2022 00:25:56 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH v3 0/6] J784S4 HS Support
Date: Thu, 20 Oct 2022 10:55:49 +0530
Message-ID: <20221020052555.1895586-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 05:26:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15184

This series adds support for J784S4 HS EVM support.

Uboot patches are currently under review [0] and the HS firmware for AHP is still not
public so the compilation will fail. Patch sent after fixing these things locally
for compilation to pass.

[0]: https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/list/?series=3021

v2:
remove the unnecessary variables for UBOOT init

v3:
split ahp HS firmware list into two

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
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |   3 +-
 .../ti-img-rogue-driver_1.15.6133109.bb       |   4 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |   1 +
 .../trusted-firmware-a_%.bbappend             |   4 +
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |   3 +-
 recipes-kernel/linux/kernel-rdepends.inc      |   2 +
 recipes-security/optee/optee-os_%.bbappend    |   5 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 138 ++++++++++++++++++
 11 files changed, 180 insertions(+), 4 deletions(-)
 create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j784s4-hs-evm.conf

-- 
2.34.1


