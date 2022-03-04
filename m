Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.2504.1646431200763883575
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 14:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=htqXgJmZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224LxxJV024625;
	Fri, 4 Mar 2022 15:59:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646431199;
	bh=wkuzULhWyFNcUV3J9pGPlAfHFAXGmzVB86T91Y/rYng=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=htqXgJmZBQQFW/lfGgd3QgkkRQ+RhePaKfKxM3Bg+ru69wtwBqzE8ghzLimn47ZMQ
	 NgPCRc3kbRB7zxwa2f2Lua60u2dCrn9vgPqyH88DheH8Ly2WKdUKtoo34rxtxVwn5J
	 a0Q5kWAbahUPX6yMRbmcWPjuVMkIPEfLzYsCZqSQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224LxxYg013886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 15:59:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 15:59:58 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224Lxwf0031088;
	Fri, 4 Mar 2022 15:59:58 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nQFxu-00031K-J1; Fri, 04 Mar 2022 15:59:58 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] linux-ti-staging: Bump to 08.02.00.005 release
Date: Fri, 4 Mar 2022 15:59:55 -0600
Message-ID: <20220304215958.11568-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220304215958.11568-1-reatmon@ti.com>
References: <20220304215958.11568-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux version for 08.02.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 2ff3fb12..9eb5a306 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "5a43918e31d3b89955ce1f8e2cf155a6deb7432e"
+SRCREV = "7a7a3af903da2b2d551d058f8262a66e6b42b6b1"
 PV = "5.10.100+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

