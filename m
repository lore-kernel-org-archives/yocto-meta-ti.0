Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549D6CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 05:29:00 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.8797.1760506139813169706
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 22:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MVt9wJ1q;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5SwY91240232
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 00:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506138;
	bh=9N3QCGbJBx11izt3VkCjJaWcQrPdnLloBVFl+rXI5Dk=;
	h=From:To:CC:Subject:Date;
	b=MVt9wJ1qDmDoP1dQaxxbs/dsELSymI4yuYbPDuePX+sZ0e4JSyqHRNKyS3UtQoSRJ
	 WiPEUXN4yIhsgOwrnyKCX0K80qbsxLlcJuv5IjmX6UdavnELwPLU72kknI66vXGuO8
	 g5OQ5A9zZcGrKcixVDjTik6LqnLb9LihYyuOOUOs=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5SvHp581884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 00:28:57 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 00:28:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:28:57 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5SuSq1388630;
	Wed, 15 Oct 2025 00:28:57 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
        <jm@ti.com>
Subject: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Add overlay for EQEP
Date: Wed, 15 Oct 2025 10:58:36 +0530
Message-ID: <20251015052836.1579479-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 05:29:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19124

Add overlay for eqep for am62dxx-evm by adding prefix string in
KERNEL_DEVICETREE_PREFIX.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/paresh-bhagat12/f8513c05abeb0585abcc30cfefd6a40a

 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index 1e41c53c..477eebf5 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/am62dxx.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62d2 \
     ti/k3-am62a7-sk-edgeai \
+    ti/k3-am62x-sk-eqep \
 "
 
 KERNEL_DEVICETREE = ""
-- 
2.34.1


