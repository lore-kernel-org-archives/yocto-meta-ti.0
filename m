Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEBCC7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:55:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.332.1684436125055549031
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 11:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v9O6L9S5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IItNgL067938;
	Thu, 18 May 2023 13:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684436123;
	bh=q6lq8hIY6sTF1YUcCe/QQnptNGQha36FGhXoC5bEgqs=;
	h=From:To:Subject:Date;
	b=v9O6L9S5nF+FXpvZv0t6dqMcAjZYIKA1vyWU9nfLyHt12ZY5PBwUEwzibrAi1qmsX
	 MLX6wq2Bx3ZCP3rNyEl4YzMRNRW6MMOCp3K4y1KlWNizayZN3zYejsHndOykRgEEa2
	 q2T6L3AqU9aWzTcVBQUnP0YvyLb5Ptjnxc7IuJx0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IItN5K011413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 13:55:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 13:55:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 13:55:23 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IItNMW017448;
	Thu, 18 May 2023 13:55:23 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pzimZ-0008E2-BQ; Thu, 18 May 2023 13:55:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] ti-kernel: Apply vendored dtb flags
Date: Thu, 18 May 2023 13:55:23 -0500
Message-ID: <20230518185523.31515-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 18:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16568

Set the variables needed to put the DTBs into the same vendored
directory structure as they are in the kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index a7eb476e..6edcd6d8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -7,3 +7,9 @@ def get_extra_dtc_args(d):
         return ""
 
 EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
+
+# Tell the kernel class to install the DTBs in the same directory structure as
+# the kernel.
+KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
+KERNEL_DTBVENDORED = "1"
+
-- 
2.17.1


