Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5974.1623110576237211209
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 17:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eY7aM4ND;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15802tsk047638;
	Mon, 7 Jun 2021 19:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623110575;
	bh=NrvdsfRRUUex2L99jrHbayd7wNtF4vxpLe5FaWxUdkQ=;
	h=From:To:CC:Subject:Date;
	b=eY7aM4NDT4I0mQtdksxG4JUcDIDo4flBd5D24sBtHLWZpmBlHZe0g362tEiDR27MJ
	 GTcLb5JcVDhLUtzH+X+z84e9tjeZ9t0qZWQ2y3XDg7Hu0ULcGA3DFaatSE8DiQmUxO
	 1fqiD32J7lI75eoBue0g0ILSbvqjDBYPTMxldeN4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15802tTX005420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Jun 2021 19:02:55 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 19:02:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 19:02:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15802suO115497;
	Mon, 7 Jun 2021 19:02:54 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Mon, 7 Jun 2021 19:02:51 -0500
Message-ID: <20210608000254.12042-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update to the latest commit of ti-u-boot-2021.01

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 437f6eba..4c3f0a47 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r6"
+PR = "r7"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "a6e78929575b6969c15ced9685441fc430ee9510"
+SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"
-- 
2.17.1

