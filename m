Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AB6C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 13:44:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.15734.1714484681429073608
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 06:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gcuWHRsJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UDieim043053;
	Tue, 30 Apr 2024 08:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714484680;
	bh=lRxhJE/5htq41U4GS712QqUTQKemmV4COj5jG2UbaTQ=;
	h=From:To:Subject:Date;
	b=gcuWHRsJXGXb325iAKyxdG+FLBOI+9y1f3XjNjfcwyzaFCgnT+ezJ4Ne1Xh3HTCmy
	 1lAUkv5+c99r1+Ui5aWX8hO5dqcKO0onIwAP7yvwIYCkrAmb2sibzvwAPbt/eTl/s2
	 jPu3YXZauoQtsXB0RWmjcZdAXYRrcEsAHYAfOwr0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UDieoD118469
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 08:44:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 08:44:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 08:44:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UDid2O075132;
	Tue, 30 Apr 2024 08:44:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s1nmh-0005JT-Ij; Tue, 30 Apr 2024 08:44:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: j784s4-evm: Add k3-am69-sk dtb back in
Date: Tue, 30 Apr 2024 08:44:39 -0500
Message-ID: <20240430134439.20384-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Apr 2024 13:44:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17612

Currently, the 6.1 kernel is the default.  Removing the k3-am69-sk dtb
file only applies to the 6.6 kernel.  Restoring this entry so that
current builds work until such time as the 6.1 kernel is removed from
the recipes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 6573e5c5..e451bf47 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -11,6 +11,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j784s4 \
     ti/k3-fpdlink \
     ti/k3-j7200-evm-mcspi-loopback \
+    ti/k3-am69-sk \
     ti/k3-v3link \
 "
 
-- 
2.17.1


