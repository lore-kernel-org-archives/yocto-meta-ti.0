Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533DFC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 19:55:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2944.1717444523465608023
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 12:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zHd0QPUq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453JtKwh019916;
	Mon, 3 Jun 2024 14:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717444520;
	bh=glHh64ofxEvjLMLcwZzsOqBeakkL04FKgZekhmX/DGQ=;
	h=From:To:CC:Subject:Date;
	b=zHd0QPUqT5hyDNhb2VcrFspeJRoNpysOmMj4D+tXWFoJzusziBT86LzWVyft5ju6o
	 6W93ZUuZKBPdadrhHTXchG3ITN1II3CYoGIVO2xc5tAWD6sky/KFwFfVQoN7x4ls/t
	 jCw0GgyDLy8di3wd1npY41KGvstu/Z2eN1yn0jBI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453JtKht069190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 14:55:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 14:55:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 14:55:20 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453JtJsw101735;
	Mon, 3 Jun 2024 14:55:19 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] gitignore: lift some sane defaults from others
Date: Mon, 3 Jun 2024 14:55:15 -0500
Message-ID: <20240603195515.1089534-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Jun 2024 19:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17691

From: Randolph Sapp <rs@ti.com>

Lift the common parts of the top level gitignore from oe-core and
meta-openembedded. This masks out temporary python files, intermediate
artifacts, and patches at the root of the project.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .gitignore | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..c01df45e
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,7 @@
+*.pyc
+*.pyo
+/*.patch
+*.swp
+*.orig
+*.rej
+*~
-- 
2.45.1


