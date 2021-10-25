Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3581.1635197502773846543
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 14:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FIvPBOEM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVfcM060840;
	Mon, 25 Oct 2021 16:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635197501;
	bh=sHHbTvLad9lQ5R4Kzamxd9c8RhTLoZ/g3LAFljrBo1s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FIvPBOEMgZljEK0n+bJWkKN54kLG+h9cLBON/Jjtsg/Dsop3dooKKSHJWNQDL+BgU
	 IoaK7FwJzNASNr3AKLox8gLsyuGDGEo7oa4xUlX8+/zvIuin3dEbgU/12ZJQTAIxfN
	 wg+v5SzcbcsMf6EyZzKbiyuvSb04pAsDQTA9+WBo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19PLVfZ0042272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Oct 2021 16:31:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Oct 2021 16:31:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Oct 2021 16:31:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVeAn031235;
	Mon, 25 Oct 2021 16:31:41 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging-rt: Bump to 08.01.00.001 release
Date: Mon, 25 Oct 2021 21:31:39 +0000
Message-ID: <20211025213140.17826-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025213140.17826-1-yogeshs@ti.com>
References: <20211025213140.17826-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux-rt version for 08.01.00.001

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 8a1f3812..166f40da 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "6f4d81d846c7c548ccc05498c4ad824f31dd6fc0"
+SRCREV = "b9f28fcb222bc4508077366b05ad5d44984087b0"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

