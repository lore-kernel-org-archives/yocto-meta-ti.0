Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4D2C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 17:21:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.471.1665422457337722415
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 10:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OP/7zpy4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AHKq9D061786;
	Mon, 10 Oct 2022 12:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665422452;
	bh=wIqGwiVb9vyuLpXSl2+E1sVxkwXa/O5T7VBqUT6VCuY=;
	h=From:To:Subject:Date;
	b=OP/7zpy4xwFhKcYDMRpMr3/B3tcjwJEPMKOrtEQJPOA3AguZ7ooIFq6e6PD8YJjwb
	 KNgLcdo7feg79/DR/GuJQ0JOQ+kOc9qq87RNwR47BtZbIEu5H0Qsq5Ll7sSdlg9aXQ
	 rAJfBg/2lfiZeZ37Q/zjxls3USMyBMGBZ3RtT0Zk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AHKqON024093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Oct 2022 12:20:52 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 12:20:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 12:20:51 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AHKpGS049961;
	Mon, 10 Oct 2022 12:20:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ohwSR-0006oC-Fe; Mon, 10 Oct 2022 12:20:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] j721s2 and j784s4: Correct serial
 console device
Date: Mon, 10 Oct 2022 12:20:51 -0500
Message-ID: <20221010172051.26132-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 17:21:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15133

Serial console in J721S2/J784S4 EVM config was set to ttyS10.  It should be ttyS2.
This caused sysv based systems (eg, tiny) to apparently hang because of no login prompt.
This didn't show up as a problem on systemd systems (eg, default) because systemd will
automatically setup a serial tty with the console option passed in on the kernel command line
(using console=...), which U-Boot correctly passes in as ttyS2 for J721S2/J784S4.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/j721s2-evm.conf | 2 +-
 conf/machine/j784s4-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index ba5e8def..7fe1fb0e 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/j7.inc
 
 MACHINE_FEATURES += "gpu"
 
-SERIAL_CONSOLES = "115200;ttyS10"
+SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index a8ad25f6..278b393c 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/j7.inc
 
 MACHINE_FEATURES += "gpu"
 
-SERIAL_CONSOLES = "115200;ttyS10"
+SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
-- 
2.17.1


