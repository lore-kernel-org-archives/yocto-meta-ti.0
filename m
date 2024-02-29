Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F573C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 08:12:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19729.1709194338474749225
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 00:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DPbdYsR5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41T8CHkq081736;
	Thu, 29 Feb 2024 02:12:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709194337;
	bh=EiS70984wzi2S+xuimk6gwDCeATJK4ehQMSjGzTS5nc=;
	h=From:To:CC:Subject:Date;
	b=DPbdYsR5B8Nb1FAikpuHFtqgPLKhfvK7ECOxfd04Y291MVNs4QjabPzl8xXcOwNIz
	 3psk7/4RNLr7bD4/kATRMtLIOLh4p2EdyCpeynuOd/HFyUEBlkHuqOfD3v44LUq3ad
	 pqPGIMAl733GzQaXgH7Hfmi7JZ+RJ4q7D+nageJs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41T8CHbF102258
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Feb 2024 02:12:17 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Feb 2024 02:12:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Feb 2024 02:12:16 -0600
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.217])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41T8CG8J116912;
	Thu, 29 Feb 2024 02:12:16 -0600
From: Jai Luthra <j-luthra@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
        Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH] conf: machine: am62axx: Pick overlays for V3Link cameras
Date: Thu, 29 Feb 2024 13:42:01 +0530
Message-ID: <20240229081201.3850832-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=j-luthra@ti.com; h=from:subject; bh=zn/7kiU/zWgTYx4MNhu8jCg8BnbR8pwY1HyWU+Evhzc=; b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBl4DvmS8hkga9+2271DfkL2thbLuhPVI+sS3Xd7 HJADOxGUwqJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZeA75gAKCRBD3pH5JJpx RTXNEACBxHD4FngtmK1Anh4z04GtwABEaXWw0JlN7RjwykAXM3O8Zezpd3scNPYnfX85rB5/IK9 4C97aAMc68iROv1bPLp5kK58giABVnqS3OTx/wBtwKxZJw4XQfUQoDbrZKCET0IkH/PZXdeyLU7 UsI9gtboFUmTLMJpldG5E3hQX+/XkzcMmtJn7y/LsNvulnc2bGjC5b058sz061ZlmTdZ7Jjs464 v1z3Vcc69QXiP8zoZ+qzViQZlgJr/Ziijz7jFvyF4YykJbtY5NCStH2y7QMnR77LFynFX/e9dIG AGuHNLbuqIicR5e8uNDwoZY3Ej1vKLv1OYZ2h7cAABj2LWp8Gxe70jm7ROb4MsBLkafGjqubvNH OTgV4cmCj5G+7qqP2YR30JalKv6ooS2bhd7y1YaIqDVp0hiBwdoolGE/1pCw+a8xzlowYFiyI0c GrUL08TW00vjPif56833/7ztA/OWMgyRm+MMx896zaOLtkNLP4TxIDgFtQWKcNhgtJ2mLmQnTnI qeFcxFFWDcrBFY376vBm+WKOvaFWhe7TdMyNMMf/FGwItQD6OeEzilC+c6AE82qB5aDyaMD8Zs7 oZ4H++cQvOLqNxVQsfYPtG/iePTIBc1/yZqbp5IpvkUCEjUt5s2ycihFBBWkFRN9sg67EAO+wct iXcwdDte2lNIg+Q==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp; fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Feb 2024 08:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17497

The new V3Link camera fusion board [1] comes with a CSI to FPDLink
serializer board, which allows interfacing multiple 22-pin FFC
compatible sensors with SK-AM62A.

Currently overlays for interfacing IMX219 sensor with V3Link are built
as part of the TI linux kernel, so pick these in the BSP filesystem.

[1]: https://www.arducam.com/fpd-link-3-cameras/

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 22f61401..238718d0 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62a7 \
     ti/k3-am62x-sk \
     ti/k3-fpdlink \
+    ti/k3-v3link \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.43.0


