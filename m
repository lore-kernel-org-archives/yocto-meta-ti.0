Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F6C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 18:51:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.41554.1683658261609728402
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 May 2023 11:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mJU9wJcm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 349IoxDL025073;
	Tue, 9 May 2023 13:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683658259;
	bh=OEEozlnT/QADLj9myPoKvfW1rIt0fksxEsUGVNAPWIM=;
	h=From:To:Subject:Date;
	b=mJU9wJcmg0P/6iRSeDiSqwqcKq+7fPcJMZe4QCghV5sBLo5M+QXzjO2dg0u9efMqp
	 SZWPQAvTpZOvq7086FYaUgjaznBXaimG0WrjSdfflYxSkreuc4AlHddL1RWkXwAFg9
	 VdsfDKe529p4MOTUcuLj/4n1SM2B++fKJUiVnSxQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 349IoxMX046552
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 May 2023 13:50:59 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 13:50:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 13:50:58 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 349IoxeG092848;
	Tue, 9 May 2023 13:50:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pwSQM-0002l2-Sa; Tue, 09 May 2023 13:50:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] conf: machine: j721s2: Add AM68 SK dtbs to KERNEL_DEVICETREE_PREFIX
Date: Tue, 9 May 2023 13:50:57 -0500
Message-ID: <20230509185058.10560-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 May 2023 18:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16504

Add in missing am68 based dtbs that were added in dunfell at the end of
the 8.6 release cycle.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 1 +
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 2a128411..bdea7c44 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -10,6 +10,7 @@ OPTEE_K3_USART = "0x8"
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721s2 \
     ti/k3-j7200-mcspi-loopback \
+    ti/k3-am68-sk \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 2ee1d949..190810ce 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -10,6 +10,7 @@ OPTEE_K3_USART = "0x8"
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721s2 \
     ti/k3-j7200-mcspi-loopback \
+    ti/k3-am68-sk \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


