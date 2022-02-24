Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.722.1645744164716169496
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 15:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VvFCepOb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9KiW020670;
	Thu, 24 Feb 2022 17:09:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645744160;
	bh=Cp7sePYMEr01qSX+KVwLMek8T46NUOePXCzn04lC/OI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VvFCepObKDgcktmFp5lT7sCUlxk+Nb3Eva+Pgp3+Pwo5TxVoYjs56n0X6MOM+cZW1
	 kvGfVXFjjEfksUwChjWHACQSWX6IBmtpgjbFG4wMOhVcXZDlcW5RX9q3joaYxioSvs
	 JtNzxDeMJQkJdGApcsmZ6JqKe3e0qY8WsDp+HOa4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21ON9KwQ128066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 17:09:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 17:09:19 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9KUm083427;
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nNNEd-0004kQ-Uf; Thu, 24 Feb 2022 17:09:20 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] linux-ti-staging: Bump to 08.02.00.004 release
Date: Thu, 24 Feb 2022 17:09:17 -0600
Message-ID: <20220224230919.18203-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224230919.18203-1-reatmon@ti.com>
References: <20220224230919.18203-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux version for 08.02.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index cd7d9519..2ff3fb12 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "4a12bec7d3f438ce9407e4ba9b2ec883729558a5"
+SRCREV = "5a43918e31d3b89955ce1f8e2cf155a6deb7432e"
 PV = "5.10.100+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

