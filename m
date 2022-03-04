Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.2497.1646431202126934517
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 14:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=j+SCPrg5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224LxxGA010628;
	Fri, 4 Mar 2022 15:59:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646431199;
	bh=ehV2NhdgDTMR58Tmj1Qz/upx89dZAbJJnBX7JdLd8RE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=j+SCPrg5BsPgzNMwsam5vqIipuvn9EmdksGSZiwY7dnnME3HFyA5qQD5sSfZZX5aN
	 SYg9ow0T0LDDtpx9hzEJNQJCE1/RSSZaUr8X4HaECijYdeEDFlq6lx7LjxxdMxaoSH
	 HJqBCY1BIn8k/kLLQsLmwiJx94m9FB5+//yRJgy4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224Lxxsk070248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 15:59:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 15:59:58 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224Lxwed113235;
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nQFxu-00031Y-SF; Fri, 04 Mar 2022 15:59:58 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] u-boot-ti-staging: Bump to 08.02.00.005 release
Date: Fri, 4 Mar 2022 15:59:57 -0600
Message-ID: <20220304215958.11568-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220304215958.11568-1-reatmon@ti.com>
References: <20220304215958.11568-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the u-boot version for 08.02.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 3cc3bc0c..2c8fa2bc 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r20"
+PR = "r21"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "0fc56d453ecf89632cfc89eec0a979f557b7d58a"
+SRCREV = "993a48448c6458b2a5a6f612ba9a383a05183a4f"
-- 
2.17.1

