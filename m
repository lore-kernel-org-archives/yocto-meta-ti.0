Return-Path: <j-humphreys@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEC0C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 19:12:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.8427.1665169927329261937
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 12:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k15L9U8H;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-humphreys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 297JC3Cr026995;
	Fri, 7 Oct 2022 14:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665169923;
	bh=/xpvRAMAHIsQf095snlZOailrIfFv+cUBeyPgvhZGyA=;
	h=From:To:CC:Subject:Date;
	b=k15L9U8HcZ390Fb88SgHyyqlypi8PH6iGVnTuEw45eIl+Ev3qL1DaASVBVxhLDYbW
	 6FAWmiL87SJgxb4ctl0I5EJLW+YGyyPBdqFDIRZj16g+Ya03LKfvJAoC2QKfDu4HgK
	 BnOZW40oCXq0Fxh14OvITKuZKTUu/OPF+NZQZVm8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 297JC3MC024357
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Oct 2022 14:12:03 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 7 Oct
 2022 14:12:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 7 Oct 2022 14:12:02 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 297JC29C111546;
	Fri, 7 Oct 2022 14:12:02 -0500
From: Jonathan Humphreys <j-humphreys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>,
        Jonathan Humphreys
	<j-humphreys@ti.com>
Subject: [dunfell/master][PATCH] J721S2-evm: Correct serial console device
Date: Fri, 7 Oct 2022 14:11:15 -0500
Message-ID: <20221007191115.19762-1-j-humphreys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Oct 2022 19:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15116

Serial console in J721S2 EVM config was set to ttyS10.  It should be ttyS2.
This caused sysv based systems (eg, tiny) to apparently hang because of no login prompt.
This didn't show up as a problem on systemd systems (eg, default) because systemd will
automatically setup a serial tty with the console option passed in on the kernel command line
(using console=...), which U-Boot correctly passes in as ttyS2 for J721S2.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index a2c15f74..04f8e4fe 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/j721s2.inc
 
-SERIAL_CONSOLES = "115200;ttyS10"
+SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
-- 
2.17.1


