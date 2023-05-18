Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8F7C7EE2A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:50:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.213.1684435819686198207
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 11:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P6olo2fj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IIoIH0060106;
	Thu, 18 May 2023 13:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684435818;
	bh=q6lq8hIY6sTF1YUcCe/QQnptNGQha36FGhXoC5bEgqs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=P6olo2fjUY3rPStelPGByBdJF9LEYDwf+Ily0CbuThLoorlUCtozq8aIsxR5esBb9
	 4s7ZHBqEX2L7cnMdZj3iPhmbH5Tqqq4BbODUQWRhJyswln/fdeYpaZEoQMmWvSuFDx
	 Aa6DV4qmMnwMnbdvZcGWpLvFrR5aOli+eOSvSdME=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IIoIo5078218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 13:50:18 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 13:50:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 13:50:18 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IIoI4R093613;
	Thu, 18 May 2023 13:50:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pzihe-0007Yn-6s; Thu, 18 May 2023 13:50:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] ti-kernel: Apply vendored dtb flags
Date: Thu, 18 May 2023 13:50:17 -0500
Message-ID: <20230518185018.29018-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518185018.29018-1-reatmon@ti.com>
References: <20230518185018.29018-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 18:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16563

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


