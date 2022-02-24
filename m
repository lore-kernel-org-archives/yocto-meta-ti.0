Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.712.1645744161933037867
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 15:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gzAYos4e;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9KxX077920;
	Thu, 24 Feb 2022 17:09:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645744160;
	bh=viu/fugeVPIO6XANyJyCcZWDU8rYz92u1eydrQ6Wv6o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gzAYos4eFFWerLIsS3WhylbXwOtu4XY1fNbCFsITJjt0473tDfNng1TCdRUSwpvKz
	 MK0lqjXI9R1bazT2T+H/JqgQu6H89MowkwbOO58S5e3yO0itSTJSEl4GoH+ijSLcFZ
	 NAExEv8XGJE+JSCzg9HgLg3CAYv6mdabX9euGAMs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21ON9KVC018679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 17:09:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 17:09:20 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9K9L122117;
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nNNEe-0004kY-3D; Thu, 24 Feb 2022 17:09:20 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] linux-ti-staging-rt: Bump to 08.02.00.004 release
Date: Thu, 24 Feb 2022 17:09:18 -0600
Message-ID: <20220224230919.18203-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224230919.18203-1-reatmon@ti.com>
References: <20220224230919.18203-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux rt version for 08.02.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 1d43ea95..1e590be0 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "b975aee14750c395bf5251ba4042cb0be1afa206"
+SRCREV = "8844ac0db67cf31b83b1b1b125baf1e637ef38d0"
 PV = "5.10.100+git${SRCPV}"
-- 
2.17.1

