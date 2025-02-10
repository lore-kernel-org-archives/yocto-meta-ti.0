Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618CDC0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:02:59 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.48239.1739185372540068684
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 03:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RhbGNA93;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-dutta@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AB2p193485082
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 05:02:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739185371;
	bh=2rgwr1c5a/4NcO5EDK4ZGL27OUWNL43KP/dHmkL69ac=;
	h=From:To:CC:Subject:Date;
	b=RhbGNA93lpk4SyNeDxYFfgxO+7dLDIbwVFXprfWMVNAlf7S7ZZR9tKW7ldwOIup7X
	 Xyfh/2lqeU2MqZnrRk/c7fyyZHFTzOIwsYT2aDE+oCd8JXyFCVaujYLsuEx5SUXQa7
	 lhy3yXJYd+0CWzRnRCl6KkDTJau787IqkyxiQnME=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AB2pgI089947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 05:02:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 05:02:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 05:02:50 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AB2m3Y022170;
	Mon, 10 Feb 2025 05:02:49 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <c-shilwant@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH v3] conf: machine: j722s: Add overlay to KERNEL_DEVICETREE_PREFIX
Date: Mon, 10 Feb 2025 16:32:47 +0530
Message-ID: <20250210110247.6520-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2025 11:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18294

Add the overlay "k3-am625-sk-mcspi-loopback.dtso" to the j722s
configuration so that SPI loopback tests can be carried out
successfully.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

v3: Changelog:
1) Correction in changes

Link to v2: https://lore.kernel.org/all/20250210080101.75507-1-a-dutta@ti.com/

v2: Changelog:
1) Added the correct branch
2) Added the correct overlay with test results

Link to v1: https://lore.kernel.org/all/20250205073251.42414-1-a-dutta@ti.com/

Test_link: https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948

 meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 2af0981e..52a6cfbd 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j722s \
     ti/k3-fpdlink \
+    ti/k3-am625-sk-mcspi-loopback \
     ti/k3-v3link \
 "
 
-- 
2.34.1


