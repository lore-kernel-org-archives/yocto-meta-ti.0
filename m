Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BE7C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:34:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3407.1719477280619183106
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 01:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W4jA43na;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vaishnav.a@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45R8YaP2034414;
	Thu, 27 Jun 2024 03:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719477276;
	bh=yniH2DqK2UxPxUBEc3/dEGYYet/NOteydtxzu819QIw=;
	h=From:To:CC:Subject:Date;
	b=W4jA43nanwWn0XNdwmUWSZGot68O54vJHlrUOFdqIf3I+QePowTo+s9tlvxSRRv+n
	 3QYx4e4URmN0Gy4WaO3HZdlaMfIsP3YuUqwv8x04kTVuP5cOYG6nCLltRmcqSlZRbq
	 VDcVsOpV4dxjWGleiWZbauwNnfYPDp+nyWfCf+M0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45R8YaZ3097119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 03:34:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 03:34:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 03:34:35 -0500
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45R8YWse034736;
	Thu, 27 Jun 2024 03:34:33 -0500
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <m-chawdhry@ti.com>,
        <j-luthra@ti.com>, <r-ravikumar@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][scarthgap][PATCH 0/3] conf: machine: j784s4/am68/am69 : Pick reused CSI overlays
Date: Thu, 27 Jun 2024 14:04:28 +0530
Message-ID: <20240627083431.1096889-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jun 2024 08:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17809

CSI2 connectivity of J721E SK, AM68 SK and AM69 SK is similar and
the camera overlays can be reused, this series adds the necessary
changes to pick the reused overlays across these platforms.

Thanks and Regards,
Vaishnav

Vaishnav Achath (3):
  conf: machine: j784s4-evm: Pick overlays for CSI2 and FPD-Link
  conf: machine: am68-sk: Pick overlays for IMX219 and FPD-Link
  conf: machine: am69-sk: Pick overlays for IMX219 and FPD-Link

 meta-ti-bsp/conf/machine/am68-sk.conf    | 2 ++
 meta-ti-bsp/conf/machine/am69-sk.conf    | 3 +++
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 ++
 3 files changed, 7 insertions(+)

-- 
2.34.1


