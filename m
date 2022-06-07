Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DD7C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:35:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.11099.1654598132677658372
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iR0wdTyO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 257AZVHd128271
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654598131;
	bh=6oOOjQmTJGy6+AJAz1PcHbveTSV+Uc3UU0kiOFcPswo=;
	h=From:To:CC:Subject:Date;
	b=iR0wdTyOcmptRyuV1xuvyOrnkqRvTbbtOEIVHVQy3Krfv0Y1QW+Dqov/g9DLqYhNH
	 iS1Ot4dQoJuv38/6lCcVv6jX++uAox/IyFJaWQZJMiyXi88hyYfK+DQ/sMnN/WByMj
	 MGINIPRF9hS7FGlO9T44gd5MhLBikCJ/3g1TmMTc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 257AZVhO016800
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:31 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 05:35:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 05:35:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 257AZUeZ033784;
	Tue, 7 Jun 2022 05:35:30 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti] [dunfell PATCH v2 0/5] Add J721S2 HS platform support
Date: Tue, 7 Jun 2022 16:05:24 +0530
Message-ID: <20220607103529.13068-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14786

This series add the yocto configuration for J721S2 HS platform.

There is a dependancy of this series on u-boot j721s2-hs support on
ti-linux tree which is pending internal review.

Changes from v1:
- added compatible for cnm-wave-fw
- added compatibile for ti-graphics

Jayesh Choudhary (5):
  conf: machine: Add j721s2 hs platform
  ti-rtos-firmware: Add j721s2 hs support
  j721s2-hs: changes to support new hs platform
  ti-graphics: Add j721s2-hs-evm as a compatible machine
  cnm-wave-fw: add compatible for j721s2-hs-evm

 conf/machine/j721s2-hs-evm-k3r5.conf          | 13 ++++++
 conf/machine/j721s2-hs-evm.conf               | 22 +++++++++
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |  3 +-
 .../ti-img-rogue-driver_1.15.6133109.bb       |  4 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 18 ++++++++
 .../trusted-firmware-a_%.bbappend             |  8 ++++
 recipes-bsp/u-boot/u-boot-ti.inc              |  6 +++
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |  3 +-
 recipes-kernel/linux/kernel-rdepends.inc      |  1 +
 recipes-security/optee/optee-os_%.bbappend    |  4 ++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 46 +++++++++++++++++++
 11 files changed, 125 insertions(+), 3 deletions(-)
 create mode 100644 conf/machine/j721s2-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j721s2-hs-evm.conf

-- 
2.17.1


