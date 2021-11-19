Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.3103.1637288719396205392
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v3KfJAEr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2PIYm068384;
	Thu, 18 Nov 2021 20:25:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637288718;
	bh=YJL9IXxzBgY3COItWJ3bSl7Dd414d2H61Ys/qOFML+Q=;
	h=From:To:Subject:Date;
	b=v3KfJAErZvvlkQz9lltFYCUy1YTWALc/5fmbGXWSb1qYJXbuh/082Y+c0tKYOnEmU
	 j8lv0KqqxhEWTx/OUBfE0ScznNzNYD1OBwLTOWCMJqY58ZJ2SWfVxTpoZ3po4P6oaC
	 9gf70EvFz5758JNxw3LjiEqsd0fgLZFZ7sXZdcK8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJ2PICS107924
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 20:25:18 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 20:25:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 20:25:17 -0600
Received: from chasm (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2PHRc102323;
	Thu, 18 Nov 2021 20:25:17 -0600
Received: from reatmon by chasm with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mntaX-0005C9-Pv; Thu, 18 Nov 2021 20:25:17 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 3/4] linux-ti-staging-rt: Bump linux rt version for 08.01.00.005
Date: Thu, 18 Nov 2021 20:25:17 -0600
Message-ID: <20211119022517.19930-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump linux rt version to 08.01.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index d0c022f8..0dba981f 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "d3083b1688af8af4728478c759e56b2a22adf9e5"
+SRCREV = "0c67d996db8f3c9149598bc98657ae28fee22208"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

