Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.417.1644248392659741772
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 07:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GAa6WHiw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217FdpaH085045;
	Mon, 7 Feb 2022 09:39:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644248391;
	bh=xOs+7BUvTE1S5uK2r5gkk8byV3upv44t0PojNWNgorU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GAa6WHiw7bOGVd+nPGLcpYKOqtGfxvmcWmiNRC453bJfPQOR8Qs5m/GAlyg/sS1de
	 kGTwdjP640qtjTE+WkC/JGVyvXV5fdxm5kMiHiNat4cKSJDvLIWRXs+YD9SiIVWBwz
	 4H7/0ZZjk7ikdYYJ7BziPmg0NNBH4hYGhKJiRMMg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217Fdp2p021796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 09:39:51 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 09:39:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 09:39:50 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217Fdoj9003947;
	Mon, 7 Feb 2022 09:39:50 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nH67K-0005oC-Jq; Mon, 07 Feb 2022 09:39:50 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] u-boot-ti-staging: Bump to 08.02.00.001 release
Date: Mon, 7 Feb 2022 09:39:50 -0600
Message-ID: <20220207153950.22274-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207153950.22274-1-reatmon@ti.com>
References: <20220207153950.22274-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the u-boot version for 08.02.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index d304df87..a7e21b7c 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r16"
+PR = "r17"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "15769936a559b1840f50b83f94ee0c636b245001"
+SRCREV = "eadf5af36c6e0097a162f81308b64cc0b796b6b5"
-- 
2.17.1

