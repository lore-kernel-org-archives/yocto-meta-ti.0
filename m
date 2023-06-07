Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79199C7EE25
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 23:09:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.622.1686179370970209880
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 16:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xv0lO58X;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: bb@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357N9Q0J057482;
	Wed, 7 Jun 2023 18:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686179366;
	bh=X73ga4lKGIyyU7JE4JnYfzmNiu1jiXMVIilnTnAuiYI=;
	h=From:To:CC:Subject:Date;
	b=xv0lO58XW2cEyWRbtmxdPTzWzsPbQk+yKvw6eVZ4nqDLOiQdSrm6J4KrBCxrm/1Ji
	 BGTJjPLI4R0Ml+D4RKWVFxeQ1ay/gGd8HYuPOBFU0JwmqM5fn0ndMcpCXHglW7ncCQ
	 rf87ZrZ6Cv96I/R8SHL1Lz387kbT1laLI7ZdyXwY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357N9Qoa013030
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 18:09:26 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 18:09:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 18:09:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357N9QUB014534;
	Wed, 7 Jun 2023 18:09:26 -0500
From: Bryan Brattlof <bb@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, Meta-TI <meta-ti@lists.yoctoproject.org>,
        Bryan
 Brattlof <bb@ti.com>
Subject: [meta-ti kirkstone/master PATCH v2] ti-kernel: Apply RT fragments to RT kernel config
Date: Wed, 7 Jun 2023 18:09:24 -0500
Message-ID: <20230607230924.2889679-1-bb@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225; i=bb@ti.com; h=from:subject; bh=qccO0jR2LapzE7ZWRzjUAzGfiAeqLJV0ZU0u9QvRgbM=; b=owNCWmg5MUFZJlNZxEWLhAAAav///v/713/9n9b2K+9Hvpb/vr/7/9367kevy7/97/vzh/8wA RjZSGgAAAAMgDQNGgA0GhoAAHqAaBkAAMT1A2oGg0AA9IDTEM1GgNqA0z1TRD1GgGgaA0AaBoBp kBoaA0BoYgAGRo2p6gBpoAANDQMgM1GmQANA0GTQ0PQGSGIeoxAGjIANNAGgaaNDQAZA00AGIGm jQyMQZAAAAaNMmjTQ9QAzUNAAASJfAaE2LQz4pwGoBu5MOlQ7xsGDWFLuO01ji8uoCL3LhCEuyi A0uQNRVk2o+gZCP0scTAmcCb+x+P2hwFHLoT5YuAlmiVj/KxSsr3nGTNtYStsUX3DTnKq7wX/Ji d8mA8EkbcwtRui1UJ4mILa2L8yGFRXihZwsdD2imeHhdWKt0acgTXYkzgmmK7GKliP18IXAzEa1 9k9KLvcoD8GIQ4vxpVQS44EfsHMVBg89xaM0h6aVj/gh0KJtF1X/X6QTXwgMU9GsixURzYQeaTI GOBFVfD1JUwytEHvfacQf9PgIDJUaQn8qgwsbmQxCdMTEwVA/Ijte8RQ8rfxC7R6kIz7fTUGqFa c7E97YwOpLrSpD0X7EAj8nFt3wMFpt/CrVQggh5nBxyC8CJfUC4Uv0f1jl8WLUzZo+QDurNAwGN ncAACxdVA/l3+LuSKcKEhiIsXCA
X-Developer-Key: i=bb@ti.com; a=openpgp; fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Jun 2023 23:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16692

Apply the ti_rt.config fragment to all the linux-ti-staging-rt-6.1
defconfigs so we can properly build the RT kernel for our devices.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---

Changes since v1:[0]
- applied rt fragment to all devices, not just K3

[0] https://lists.yoctoproject.org/g/meta-ti/message/16646

 .../recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig      | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig   | 2 +-
 .../linux/linux-ti-staging-rt-6.1/omapl138/defconfig            | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
index 24b53cf7aecb5..43089dc87d0bf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
index ef1d3efd50118..47d78664bdd1d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=defconfig
-config-fragment=kernel/configs/ti_arm64_prune.config
+config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
index 099493af19a0d..2c829c0ba3c22 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
@@ -1 +1,2 @@
 use-kernel-config=davinci_all_defconfig
+config-fragment=kernel/configs/ti_rt.config

base-commit: 02fb90c7972aa53ad6c3599a161ec62fd91d1efa
-- 
2.40.1


