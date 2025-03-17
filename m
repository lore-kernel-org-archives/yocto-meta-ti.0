Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33691C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 16:31:21 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.57504.1742229076021785944
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 09:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SYzrx+w9;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-brnich@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HGVE182875346
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 11:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742229074;
	bh=veLiX5jcoQqn1Ql7sIoCoOBHh99QJDbLe9lgS+vd6CA=;
	h=From:To:CC:Subject:Date;
	b=SYzrx+w9EBNaBO9/K9whQIr4rrPv6QGfgp2ntWs23cqSfA08LzFtAUbKCKymtI0BD
	 3mtUy9hLiW8+pKiouy4yp7Gi7K4/goVrmDAPAh89QUJ5izJxLWRB6e8evgMGcGXkaw
	 xoqajwBsOtsLSInJ/SwDaMS97H5WtiarCPGb7icA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HGVEwh003651
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 11:31:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 11:31:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 11:31:14 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HGVEQF005567;
	Mon, 17 Mar 2025 11:31:14 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        Darren
 Etheridge <detheridge@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-ti][master/scarthgap][PATCH] ti-img-encode-decode: bump revision to fix build failure
Date: Mon, 17 Mar 2025 11:31:14 -0500
Message-ID: <20250317163114.696811-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 16:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18395

Out-of-tree module failing to build against linux-next as a result of
changes to platform driver remove function.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
index 20417704..9a3b6bfd 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -14,7 +14,7 @@ BRANCH = "scarthgap/k${PV}"
 
 SRC_URI = "git://git.ti.com/git/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
 
-SRCREV = "99d063aa0ef53633057042570411b84bd967624b"
+SRCREV = "038d9263c67900ea4eff631820b088a3dc3a6ad5"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 
-- 
2.34.1


