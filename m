Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DD2CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:25:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1087.1761251143692022080
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 13:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XyIdAT2J;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: jm@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NKPgAA616590;
	Thu, 23 Oct 2025 15:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761251142;
	bh=L5gG2goABxDaxgKjsSS/25yjOm5uFfw+2AeelMy2aY4=;
	h=From:To:CC:Subject:Date;
	b=XyIdAT2JXBha8RYRKKOBroGgAAHnVKmHQCT5Eu72wJ7QFh3xlYpFpSmN5H1Iz4GKQ
	 Htmy/4NNhITDkMqJGZK2N/6PoaD1dsZuKXGyQOIP49XLwvAsOoDBAjNvIXvcVfbGjQ
	 qcMeTbiehwf0ovWdoLL6lQiq+VgBJ5PsjquWw2uQ=
Received: from DFLE211.ent.ti.com (dfle211.ent.ti.com [10.64.6.69])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NKPg0S3379498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 15:25:42 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 15:25:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 15:25:42 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NKPgiO3426753;
	Thu, 23 Oct 2025 15:25:42 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH v2] conf: machine: Include MCSPI overlay for am62p and am62 LP
Date: Thu, 23 Oct 2025 15:25:42 -0500
Message-ID: <20251023202542.1162172-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 20:25:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19160

MCSPI overlay can be used for all am62* SK boards as well as
am62p SK, so include the overlay for am62p and am62 LP SK builds
since it is not included in the default configuration.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index a923d3e9..1202450a 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62x-sk-csi2 \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
+    ti/k3-am62x-sk-mcspi-loopback \
     ti/k3-v3link \
 "
 
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 78bca1ab..e1184199 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
     ti/k3-am62x-sk-mcan \
+    ti/k3-am62x-sk-mcspi-loopback \
     ti/k3-am62x-sk-pwm \
 "
 
-- 
2.34.1


