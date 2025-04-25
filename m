Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8DFC369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:26:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.9185.1745594799274497769
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 08:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A6jt8PEZ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQbVl2822652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 10:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745594797;
	bh=aZRD+Mn94jZjA23AtNuHAU1ulmy87ozGYoueLF/iBys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A6jt8PEZbwr9rOKjKbtdbI9YeTcJHcYTmvP1WU6A58BH+sbg7g5jX9IDfTXPP5Xg4
	 LG1E9S+eS1xWLnvU++DOiD79gQEfnkx1Qs+pjREZEZuqvS4+bfrR0T06K8zr31v0Yj
	 N8kIbpXv4Jvky2oOgzWoMUeBSkVmxhF8y99c520k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQbGm017986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 10:26:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 10:26:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 10:26:37 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PFQaZt105755;
	Fri, 25 Apr 2025 10:26:37 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <vigneshr@ti.com>
Subject: [PATCH v3 4/4] bsp: tfa: add build flags for ti-falcon
Date: Fri, 25 Apr 2025 20:56:10 +0530
Message-ID: <20250425152613.2470204-5-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425152613.2470204-1-anshuld@ti.com>
References: <20250425152613.2470204-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18510

In falcon mode, ATF jumps straight to the linux kernel which requires a
2MiB aligned load address. Hence this patch changes the ATF jump address
(PRELOADED_BL33_BASE) to a 2MiB aligned value 0x82000000 and the DTB
address (K3_HW_CONFIG_BASE) to 0x88000000.

These values are chosen to be consistent with the addresses used by
u-boot when booting in the normal flow.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 9541d605..9387d7f4 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -19,3 +19,4 @@ TFA_SPD:am62lxx = ""
 
 EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
+EXTRA_OEMAKE:append:ti-falcon = " PRELOADED_BL33_BASE=0x82000000 K3_HW_CONFIG_BASE=0x88000000"

