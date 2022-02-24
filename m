Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.693.1645744161849908723
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 15:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=picKX9qg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9Kf1017048;
	Thu, 24 Feb 2022 17:09:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645744160;
	bh=3SLhSln7YO8FZi6mbg1562pgf6IH4su+51SqiVH7Ybw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=picKX9qgsccnXTJInKwpkrXQ4EOm9bPjSGe3KfgBYaQ7iNpzeiBF7UEgbSnfQfQYN
	 6GrzIv37m8LtzsfCvWr2db5PewEJAL4Y2/oVQ6D2SthwuD9wEtE8gen1tImfHPXoEb
	 EMtKIwqIOAdrFkmqz/9eZ29MGK5AHKLVD55we4c0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21ON9Kkd105986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 17:09:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 17:09:20 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9K2B019231;
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nNNEe-0004kf-7A; Thu, 24 Feb 2022 17:09:20 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] u-boot-ti-staging: Bump to 08.02.00.004 release
Date: Thu, 24 Feb 2022 17:09:19 -0600
Message-ID: <20220224230919.18203-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224230919.18203-1-reatmon@ti.com>
References: <20220224230919.18203-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the u-boot version for 08.02.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 701b802a..3cc3bc0c 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r19"
+PR = "r20"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "bd58b61277a189ee49e0d6e9fd03d52996685d98"
+SRCREV = "0fc56d453ecf89632cfc89eec0a979f557b7d58a"
-- 
2.17.1

