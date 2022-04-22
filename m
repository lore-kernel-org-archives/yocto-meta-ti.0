Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658F0C5AC78
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.10578.1650643036012753009
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 08:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ew339FIR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23MFvEN6097009;
	Fri, 22 Apr 2022 10:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650643034;
	bh=7Mdh8KrC2KxIRkHPzZx1xWesUJtwkJLqgeTJOXWzeSw=;
	h=From:To:Subject:Date;
	b=Ew339FIR9eeDz2hPSBTDQpjVJwkVAKQbjkvT3uEwjtB+7JzxIhX8WDl6BSBakhWPr
	 QHL8OKdLkDIYF5Y4svxx6ZZWuRuKP9acICm8A4Tw3pGvzNaTDwEwO1MCW2+r9shTF4
	 7byt0lqVncCl6EtKQXVxMe9AjDTWEiP812BsLUKY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23MFvE9D039748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Apr 2022 10:57:14 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 10:57:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 10:57:14 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23MFvDUG046540;
	Fri, 22 Apr 2022 10:57:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nhvej-0003bs-Jf; Fri, 22 Apr 2022 10:57:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] conf: machine: am62xx Add missing
 dtbo file
Date: Fri, 22 Apr 2022 10:57:13 -0500
Message-ID: <20220422155713.12925-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14615

Add missing k3-am625-sk-csi2-ov5640.dtb required for the camera overlay.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/am62xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index eb1563f8..44f46d78 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -8,6 +8,7 @@ MACHINE_FEATURES += "gpu"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
+    ti/k3-am625-sk-csi2-ov5640.dtb \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-- 
2.17.1


