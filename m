Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB92BC3ABC0
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 09:10:33 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.71767.1746522629251954594
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 02:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BkO/kqFW;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5469AQem1008485
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 04:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746522626;
	bh=xhGI+jqJfltnU4Fkd1KVsM18aNyVN8xolwOtd0accHg=;
	h=From:To:CC:Subject:Date;
	b=BkO/kqFWRQr198lH4FXIDq6PGCkAGAw4pRFuHiV5c1zRHVrqRvXf4yloBOvcl9TAR
	 6kT9VBX4C32qSHZuJ3kxZZ+X8QThXDPCtwWCcqNhYCnIngzKSZneEGm/kC8HfLxWvE
	 LwLeScIEfRnKwQU5BfRbDawd0g9P3lDv4alypK7E=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5469APMg097635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 04:10:25 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 04:10:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 04:10:25 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5469AOsW128957;
	Tue, 6 May 2025 04:10:25 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 0/1] Add DM_FIRMWARE override for AM62P display cluster
Date: Tue, 6 May 2025 14:40:14 +0530
Message-ID: <20250506091015.4049616-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 09:10:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18532

This patch adds the logic to pick "dss_display_share.wkup-r5f0_0.release.strip.out"
DM firmware for AM62P Display cluster usecase in meta-ti-bsp.

Until now this logic was maintained in meta-tisdk layer [0]
as binman had issues in overriding the custom DM firmware & additional
hack of passing `BINMAN_ALLOW_MISSING=1` was needed to bypass the same [1]

With [2], the DM firmware selection logic is now fixed in ti-u-boot.
Hence, the DM firmware selection logic can now be maintained in meta-ti-bsp.

The firmware selection logic is tied to DISPLAY_CLUSTER_ENABLE. Hence, it
doesn't affect any users who are using the default "ipc_echo_testb_mcu1_0_release_strip.xer5f"
firmware shipped with tisdk-default-image.

We already have references of DISPLAY_CLUSTER_ENABLE in meta-ti-bsp for AM62P [3]
& DM firmware selection logic was the only piece carried in meta-tisdk until now.

[0]: https://github.com/TexasInstruments/meta-tisdk/blob/11.00.09.04/meta-ti-foundational/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bbappend

[1]: https://github.com/TexasInstruments/meta-tisdk/blob/11.00.09.04/meta-ti-foundational/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bbappend#L12

[2]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2025.01&id=628efa2d7de9f2b2e44da7012f54c11da565bee2

[3]: https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/conf/machine/am62pxx-evm.conf?h=11.00.12#n33

Chirag Shilwant (1):
  recipes-bsp: Add DM_FIRMWARE override for am62pxx display cluster

 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1


