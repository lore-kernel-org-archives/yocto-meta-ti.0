Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64005C25B0E
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:57:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8271.1660233445508181159
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 08:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cCw9nr63;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27BFvOjO103198
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 10:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660233444;
	bh=zEhf3OJnccRmHwLdykjTdpws7b7L/5sUr9sZvg8vACY=;
	h=From:To:CC:Subject:Date;
	b=cCw9nr63KVVivkR4Axdkl6v+N3i1vgfBtxRUlZ+Yl4N9qXYN1VhvoKmrQUr9OeV9p
	 EC70QfZOSsMD4drejCWc8UDyk3uLGeXWPwKzEvoBGOfzUKXsHyOYHq9sK/3v5GrHoc
	 JhLfhP/+B3z/w+sJPO6f0KTDqOTE7HIcjqySitMc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27BFvO6U008774
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 10:57:24 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 10:57:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 10:57:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27BFvOOP075705;
	Thu, 11 Aug 2022 10:57:24 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>
Subject: [dunfell/master PATCHv2] trusted-firmware-a: upgrade to v2.7
Date: Thu, 11 Aug 2022 10:57:24 -0500
Message-ID: <20220811155724.10175-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 15:57:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14950

upgrade arm-trusted-firmare to v2.7

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---

*Changes from v1: removed linux-fw recipe update, that was a mistake.

 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 9645137e..4dd13952 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,6 @@
 PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
+SRCREV_tfa_k3 = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1


