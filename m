Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979F3C6379F
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:19:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13587.1676463588099880095
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oarNhm9E;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vaishnav.a@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJleI102541
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676463587;
	bh=ExOq5fWGOtB2AY/cqOx42de0KKi3InlqFwysqHiqzJo=;
	h=From:To:CC:Subject:Date;
	b=oarNhm9ELlbD+wJmaqFBjxilx3lsbjo71ImF4L6xcDnaKaR0zBiKTV+IwyPsfYK3W
	 PmnUQmdZEjeQ+my67lZ1r6dClqM7/uCufsh/C70O3u3Svi6IUm+XP+QkLhuanjvCaT
	 47lCbVwtO7Q6nHdR3vooD2juHXaMkwrXrFdRFpjQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FCJlXe015690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:47 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 06:19:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 06:19:46 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJjae022482;
	Wed, 15 Feb 2023 06:19:46 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <m-chawdhry@ti.com>, <j-choudhary@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/4] conf: machine: j7200-evm: Add MCSPI loopback overlay for J7200
Date: Wed, 15 Feb 2023 17:49:42 +0530
Message-ID: <20230215121945.3631-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15851

Add the MCSPI loopback overlay file for J7200 EVM which helps
users to enable MCU-MAIN MCSPI loopback applications.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j7200-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index c8a03a7b..3fa9447b 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
+    ti/k3-j7200-mcspi-loopback.dtbo \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
-- 
2.17.1


