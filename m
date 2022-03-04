Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2507.1646431202127094206
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 14:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=htYynnlx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224Lxxrx010624;
	Fri, 4 Mar 2022 15:59:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646431199;
	bh=gCoJ5wxi860tLcWEDTL4+Uk9YlEaanh8lkdnSrn2dvI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=htYynnlxqyxjQ4W0xPA5hNSvLS2i8du+jR4G9T7a2icxEoQfX0kV5HsUP4ujo70dE
	 5lKd3nOsA+NR3bTjd5UABPNRC6p6IRYkHrfREvjCXnBkD9xJjanyL/of6fJ2dIq4M0
	 fKKh7gj0E9M5ac1n1E6/9vRSRcY2+WsRTW4E4f6k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224LxxQA056642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 15:59:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 15:59:58 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224Lxwfi063421;
	Fri, 4 Mar 2022 15:59:58 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nQFxu-00031R-O8; Fri, 04 Mar 2022 15:59:58 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging-rt: Bump to 08.02.00.005 release
Date: Fri, 4 Mar 2022 15:59:56 -0600
Message-ID: <20220304215958.11568-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220304215958.11568-1-reatmon@ti.com>
References: <20220304215958.11568-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux rt version for 08.02.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 1e590be0..05fe4d12 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "8844ac0db67cf31b83b1b1b125baf1e637ef38d0"
+SRCREV = "204ec708dc86f4334f585f04835527570be1c4eb"
 PV = "5.10.100+git${SRCPV}"
-- 
2.17.1

