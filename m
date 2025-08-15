Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34750CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 14:58:06 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.13884.1755269882241780684
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 07:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cdgx+B++;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-brnich@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FEw1Yl2176540
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 Aug 2025 09:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755269881;
	bh=BNlxWFkVAZqRO4OIxKbSQVdD1JKRbtGqkp2xk+sRMV4=;
	h=From:To:CC:Subject:Date;
	b=Cdgx+B++enljHkaEazKfidxf5Lp7a4OEAUFs+LNrsaCPZkF47hQHaIqrPln+ohNYA
	 Te9yfJvqXuMuzjBEZEd+GSidaMfuutJn8hdK+j78/mhSH1Ujrs8XEZ5tlI1Q/iSlVX
	 Am7LNDDgA3LBcfE9eAz4Z5yGDh6v1+UJpMHTqh/Q=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FEw1Kj2663398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 Aug 2025 09:58:01 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 09:58:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 09:58:00 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FEw1O51445015;
	Fri, 15 Aug 2025 09:58:01 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
Date: Fri, 15 Aug 2025 09:57:57 -0500
Message-ID: <20250815145757.3244444-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Aug 2025 14:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18928

V4L2 has updated fh_add/delete to take another parameter in linux_next.
The update has been made in out-of-tree module to fix build failure.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
index e5cd0d49..f73f59fa 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -14,7 +14,7 @@ BRANCH = "scarthgap/k${PV}"
 
 SRC_URI = "git://git.ti.com/git/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
 
-SRCREV = "038d9263c67900ea4eff631820b088a3dc3a6ad5"
+SRCREV = "0bcbb20af32ea13275b452f0e84f5a49966d0bf6"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 
-- 
2.34.1


