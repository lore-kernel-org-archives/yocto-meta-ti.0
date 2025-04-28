Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6D8C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.48670.1745847721558586735
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 06:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ir1ZWf8f;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SDfwGQ3407561
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 08:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745847718;
	bh=lf8SGIc9Lswvpe97vhNBzbW+ut0YcQ7UAEl83WU2rF4=;
	h=From:To:CC:Subject:Date;
	b=ir1ZWf8fj4em2fT24ui5HD8R1VHusCrqsgxlYg1yVlJc09zRCrGV+Dxl0Qy66mSiS
	 l5cIuLVis/ZsIw1GONP1Lyq069ALvHdvx3FwxZ5WITEYiSigecWC+dNzbSO6hfUooP
	 Yzl+fST04v4TMdrEAz5LqlizHvnIOjbWEFzQM06c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SDfwkM122251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 08:41:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 08:41:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 08:41:58 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SDfvCL018519;
	Mon, 28 Apr 2025 08:41:57 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 0/2] Add C7x IPC & DM FW overides for am62axx
Date: Mon, 28 Apr 2025 19:11:50 +0530
Message-ID: <20250428134152.1921752-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Apr 2025 13:42:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18518

The default experience of AM62A for TI is the EdgeAI SDK for which
EdgeAI C7x IPC & DM R5 firmwares for am62axx were earlier maintained
at psdk_fw with different names [0]

There was a internal discussion which led to a conclusion that
ti-linux-firmware should be a single placeholder for all firmwares
which are shipped in TI SDK.

[1] & [2] adds EdgeAI C7x IPC & EdgeAI DM R5 firmware in ti-linux-firmware
Hence, this patch series handles the meta-ti update to ensure that cicd
builds [3] now picks EdgeAI firmwares by default for am62axx.

[0]: https://git.ti.com/cgit/processor-sdk/psdk_fw/log/?h=main

[1]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=1e5d64d9385d6472d29e11ac7021765004ddff27

[2]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=eee26bfeb6469af30e5309ba8859e9b65670fcc3

[3]: https://software-dl.ti.com/cicd-report/linux/index.html?section=platform&platform=am62axx

Chirag Shilwant (2):
  recipes-ti: ti-rtos-firmware: Add C7X_1_FW override for am62axx
  recipes-bsp: Add DM_FIRMWARE override for am62axx

 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb           | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc           | 1 +
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


