Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3119AC3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 22:15:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.35598.1722809710929118267
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 15:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=l2ld2H2D;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 474MF9AI072932;
	Sun, 4 Aug 2024 17:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722809709;
	bh=8QeNuuyAlHAblCuJS3MuGiWQWfSFqKFyOtdNPb6J+LM=;
	h=From:To:Subject:Date;
	b=l2ld2H2DFObQ7sQEfOaEU2lFxWv4CSEGOy0XYPwxVwCMfUowhC0BDgDRMgKsez076
	 DiV/Hv2FjTNDyMvVyn9qLMvXPeNXwhOFBBgo04jNnedZ64D+t5YnCDdnKKi06zxuxX
	 R3fzjoqKEy/siWftNnGTCWX3TGO1aEfMaF63yYyQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 474MF93H066709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 Aug 2024 17:15:09 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 4
 Aug 2024 17:15:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 4 Aug 2024 17:15:09 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 474MF9Wk102424;
	Sun, 4 Aug 2024 17:15:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sajVN-0000u6-H7; Sun, 04 Aug 2024 17:15:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: omapl138-lcdk: Update KERNEL_DEVICETREE
Date: Sun, 4 Aug 2024 17:15:09 -0500
Message-ID: <20240804221509.3434-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 04 Aug 2024 22:15:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17921

Update the entry for KERNEL_DEVICETREE to match what is in the 6.10
kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
index fdbaffae..458caaff 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -21,6 +21,6 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
-    da850-evm.dtb \
-    da850-lcdk.dtb \
+    ti/davinci/da850-evm.dtb \
+    ti/davinci/da850-lcdk.dtb \
 "
-- 
2.17.1


