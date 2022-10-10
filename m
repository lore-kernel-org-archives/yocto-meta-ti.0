Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F886C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 13:46:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.6394.1665409615006123800
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Isi9/euo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29ADksCL095234
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 08:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665409614;
	bh=kkRMGDaQ9UJiPlCGgbAM0ka0ZsmgNTOJATtvkdvD8+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Isi9/euo9LMuc09Sw+YfscM97e9q4nQiYIRG6hJs39oRL+2f5t/mraz1xVWSDw/8E
	 7Hop4EgoL3T/wVMPDsf2UZ0l/bGXKSs983Btc4Rnrucpq6oqO4hB1lVhs/UaHDEaCG
	 rQf/q3UV1gXmluT+eAhcLBGxruQFYaGlrTK5siyU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29ADksdA031785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 08:46:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 08:46:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 08:46:54 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29ADkrXs062262;
	Mon, 10 Oct 2022 08:46:53 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH 2/4] conf: machine: j784s4: Add OP-TEE
 flavour
Date: Mon, 10 Oct 2022 19:16:47 +0530
Message-ID: <20221010134649.20977-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010134649.20977-1-j-choudhary@ti.com>
References: <20221010134649.20977-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 13:46:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15120

Add the new OP-TEE flavour for J784S4 instead of default k3-j721e.
The TI-SCI ID for MCU domain sa2ul/sa3ul are not the same for
J721E and J784S4. So a new flavour is added in upstream OP-TEE.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index a8ad25f6..4696b07b 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -9,6 +9,7 @@ MACHINE_FEATURES += "gpu"
 SERIAL_CONSOLES = "115200;ttyS10"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
+OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


