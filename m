Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.317.1634587071928769199
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 12:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WgS6CNF0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IJvoRh012142;
	Mon, 18 Oct 2021 14:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634587070;
	bh=wA4D8nWfiCyPR44s7WKeb26XKuMaKPw45EC873mbr/4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WgS6CNF0496NCTAob9CWPv3nHWIKk3uAvZoZ2dz6aK4Nka2i0pH+cp4ia0cTzbT9i
	 kKFks2d2oBnPP4dXztprOVxQb82Pgr2rs7jov+EUo8KZhzsyNKE38G4QGoGyX/coo6
	 lAohXPSTqSHD5i6RO0T69wcmzAc7fu92a1Pd+jwI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IJvo4Q078903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 14:57:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 14:57:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 14:57:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IJvoh6064506;
	Mon, 18 Oct 2021 14:57:50 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][Patch 2/2] linux-ti-staging-rt: Update SRCREV to 5.10.65
Date: Mon, 18 Oct 2021 19:57:49 +0000
Message-ID: <20211018195749.43313-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211018195749.43313-1-yogeshs@ti.com>
References: <20211018195749.43313-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update SRCREV to 5.10.65

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 91692506..a5fd6957 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "c0d9886f48dda1788995c4e0d6a7286d177df2f1"
-PV = "5.10.59+git${SRCPV}"
+SRCREV = "890b86772cff397e32c66ea6528fe8702d7e44a5"
+PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

