Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5870CC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 07:33:06 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6838.1738740775862428934
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 23:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f+NFjnGu;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-dutta@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5157Wseg3311042
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 01:32:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738740774;
	bh=dwvaAIZPivJEdOmDtr0YZ0TMg58o6JWTumkwCDccdfk=;
	h=From:To:CC:Subject:Date;
	b=f+NFjnGuIHPoSrPUWwMg0qFQJqRfjA2EGQemLLpGjTWMhhWiBDpoqfNpjMxE0RvNo
	 6VBr6FJhIVKkv4Hvdk0BF4acooLxbZDG1pXPIpo576eGYKZMkLzoyrrQBFgLmFBKks
	 v0UMMSfji05KY/+HrJyBPZHDshbHyTkEV6pBU4/4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5157Ws5H072227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 01:32:54 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 01:32:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 01:32:54 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5157Wppo033271;
	Wed, 5 Feb 2025 01:32:52 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-dutta@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [PATCH] conf: machine: j722s: Add overlay to KERNEL_DEVICETREE_PREFIX
Date: Wed, 5 Feb 2025 13:02:51 +0530
Message-ID: <20250205073251.42414-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 07:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18269

Add the overlay "k3-j7200-evm-mcspi-loopback.dtso" to the j722s
configuration so that SPI loopback tests can be carried out
successfully.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 2af0981e..8f42866c 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j722s \
     ti/k3-fpdlink \
+    ti/k3-j7200-evm-mcspi-loopback \
     ti/k3-v3link \
 "
 
-- 
2.34.1


