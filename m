Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BE6C7EE24
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 18:51:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.41553.1683658261605843978
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 May 2023 11:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LV4UtlkW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 349IoxOA065792;
	Tue, 9 May 2023 13:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683658259;
	bh=P3HZKPVGVMbzinx5qAMhRSUavWN6SAER+q+Wmy0fG6U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LV4UtlkWLgrPvmNFCeUeJAJR63nJzioDYB6KfX84w8cwiC05AG8l6lFW7QF4bADkf
	 ix/lVUKXysmWKcLeZkmYQzIT7gP1hP9l4Gj9AEZ93C1tt5kH2SwZGvXG8aLi5bbYNn
	 k/pLhFVSJiLECmt6lfDIPzGkdOGKUyILYnGVJgTY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 349IoxDT052893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 May 2023 13:50:59 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 13:50:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 13:50:59 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 349Iox83080666;
	Tue, 9 May 2023 13:50:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pwSQM-0002l4-WD; Tue, 09 May 2023 13:50:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] conf: machine: j784s4: Add AM69 SK dtbs to KERNEL_DEVICETREE_PREFIX
Date: Tue, 9 May 2023 13:50:58 -0500
Message-ID: <20230509185058.10560-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509185058.10560-1-reatmon@ti.com>
References: <20230509185058.10560-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 May 2023 18:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16505

Add in missing am69 based dtbs that were added in dunfell at the end of
the 8.6 release cycle.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 1 +
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index f0d04a89..4fe64d88 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -10,6 +10,7 @@ OPTEE_K3_USART = "0x8"
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j784s4 \
     ti/k3-j7200-mcspi-loopback \
+    ti/k3-am69-sk \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 89803598..815731f8 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -11,6 +11,7 @@ OPTEE_K3_USART = "0x8"
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j784s4 \
     ti/k3-j7200-mcspi-loopback \
+    ti/k3-am69-sk \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


