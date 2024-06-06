Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94C4C27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 16:14:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.18902.1717690449151549487
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 09:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TI1LUMds;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456GE7YM098180;
	Thu, 6 Jun 2024 11:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717690447;
	bh=fHLWDOFvVYInMF5Pl1uLku4lsl6xFPtuY9HpnCZqX+s=;
	h=From:To:CC:Subject:Date;
	b=TI1LUMdsx9LJ0e0K0YU3/v3MDNXTdlWJ2Y3OCu3S17+h8fl7pTvJE7ntOPZEVcbxV
	 5ktidx9pU1vZYcw1ufQNMhTKYlDb7oqzumAugER2vkl/rIDE7XqqVGY9Ajdn29mvv1
	 OWvtMNGOnYBU6bRg89Uhdqnu0cSOE1rOlBVta5Mg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456GE7Gq019372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 11:14:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 11:14:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 11:14:07 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456GE7lx051612;
	Thu, 6 Jun 2024 11:14:07 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCHv2] gitignore: lift some sane defaults from others
Date: Thu, 6 Jun 2024 11:14:05 -0500
Message-ID: <20240606161405.1375599-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jun 2024 16:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17703

From: Randolph Sapp <rs@ti.com>

Lift the common parts of the top level gitignore from oe-core and
meta-openembedded. This masks out temporary python files, intermediate
artifacts, and unclean patch leftovers (.orig, .rej, etc).

We're choosing to leave patches at the root of the project out of this
as maintainer preference.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .gitignore | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..ae174429
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,6 @@
+*.pyc
+*.pyo
+*.swp
+*.orig
+*.rej
+*~
-- 
2.45.1


