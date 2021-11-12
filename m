Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.11509.1636693781098283951
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 21:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jfQNt5S+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AC59deu014520;
	Thu, 11 Nov 2021 23:09:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636693779;
	bh=t+0fPnxHFxKCt92KuBbx7LLnbVAUvwq1xBNdCglWppI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jfQNt5S+ivDKIY8WqFFsPcMkeewBpOEOvxxcWJm8yfg44PY/uZhEB7ig4nXhxggSq
	 JvH6pAwTki2u87NKKz3F5pu4Pgjk0MiH+0un5T+rqtbonzKIOYo7l5/pYHDs71J2nb
	 4f1vqdVn/euEHJOJEvolXnAU36luBi2Z95PjVmpw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AC59dgq073514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Nov 2021 23:09:39 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 11
 Nov 2021 23:09:39 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 11 Nov 2021 23:09:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AC59dN3011566;
	Thu, 11 Nov 2021 23:09:39 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] linux-ti-staging-rt: Bump linux rt version for 08.01.00.003
Date: Fri, 12 Nov 2021 05:09:39 +0000
Message-ID: <20211112050939.35983-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112050939.35983-1-yogeshs@ti.com>
References: <20211112050939.35983-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump linux rt version to 08.01.00.003

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 3cb7bc24..d0c022f8 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "a5427455c650cb9d33e3d5f0b009a773370a5428"
+SRCREV = "d3083b1688af8af4728478c759e56b2a22adf9e5"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

