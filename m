Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B939EE95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 07:09:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.55937.1696835372075582998
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 00:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=N5klQhs1;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39979Vkg093886
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 02:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696835371;
	bh=pepNS0pmLI7OcsfUajqh0P3BxqrEvOI/PZ3JzXoMUAA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N5klQhs1q/SxMJV/cNQrWKaLy8iRP9a2ADUQqMsLchqJq6hYyPl3ApBXe+FnbU42x
	 qdVHYwyITLKBGRggryqDTo9LlgrmryJZ5TJaUIPGMVbfxnSajSw54n1YUVAsBAZUg3
	 bEF4xHEh8ruryK+OETJTSr+BUR4B+ReE1UkpNORs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39979VKx070330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 02:09:31 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 02:09:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 02:09:31 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39979Q0e125024;
	Mon, 9 Oct 2023 02:09:29 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>, <r-gunasekaran@ti.com>
Subject: [kirkstone][PATCH v3 1/2] preuth-fw: Remove packaging of PRU-ICSSM firmwares
Date: Mon, 9 Oct 2023 12:39:25 +0530
Message-ID: <20231009070926.21629-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231009070926.21629-1-r-gunasekaran@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 07:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17073

PRU-ICSS on AM33x, AM43x, supports different ethernet modes such
as Ethernet, HSR and PRP by means of different firmwares and the
driver loads one of the these firmware. The PRU-ICSS linux driver
may not be available for all kernel versions.

So add an .inc file that avoids the packaging of such firmwares
in the SDK, so that it can be referenced by kernel recipes that
don't support PRU-ICSS.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc

diff --git a/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
new file mode 100644
index 00000000..6698c9ed
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
@@ -0,0 +1,3 @@
+# Do not package firmwares for kernels that don't support PRUETH
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
-- 
2.17.1


