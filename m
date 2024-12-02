Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E65E69E8C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 19:49:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2183.1733168971561620527
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 11:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MQvpoVMR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2JnUv3019886;
	Mon, 2 Dec 2024 13:49:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168970;
	bh=mkD2yz/sxUOwhP++H9Xbm1p8yVjL5p+SiQ9si0Heuwg=;
	h=From:To:CC:Subject:Date;
	b=MQvpoVMR2cn4biJ7bj0fkzm4HX/cWfEK3wv2DzqSckgQCYC+Jb16BdbSiV55MvUeR
	 131WPjZiZNEsOYFOKNN9/fityvotFfUbQxTnQWPn06ayVuB+RJXR40ImPAjpMgxutG
	 p/JhZZVGeO3wCMlsULgLB2u6648lt4dSpfvf60G0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2JnUvJ023088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 13:49:30 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:49:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:49:29 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2JnTvo038432;
	Mon, 2 Dec 2024 13:49:29 -0600
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Judith Mendez
	<jm@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: am62xx-lp-evm: Add PWM overlay
Date: Mon, 2 Dec 2024 13:49:29 -0600
Message-ID: <20241202194929.67533-1-jm@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Dec 2024 19:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18076

Add the k3-am62x-sk-pwm.dtbo overlay for AM62 LP SK.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 51e99728..cd413afe 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -11,6 +11,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
     ti/k3-am62x-sk-mcan \
+    ti/k3-am62x-sk-pwm \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.47.1


