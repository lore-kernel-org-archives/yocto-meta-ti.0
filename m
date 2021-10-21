Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2103.1634841475764449960
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 11:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tKAQH71w;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19LIbr2p060586;
	Thu, 21 Oct 2021 13:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634841473;
	bh=oEggO1SsasJ1A96SOfBZNV9pcJaHMt1b1sNhzBLE/nY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tKAQH71wnHXtowZW1VLEAXfbAAlbovOWziL+IPXVxNNe+qomx+t0dvgI4fKZR96wp
	 IQ9Lf5/6sNjQzMibTkyeJeaOHvFxHREd+ITs1Ku4NAG34p81DhbYe9lm7ibzgW4E7y
	 d137BzaqOyaMGOGL03Ttny3jt1gUmGDxdKjh4IKg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19LIbr3Q102538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Oct 2021 13:37:53 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Oct 2021 13:37:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Oct 2021 13:37:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19LIbrnI106581;
	Thu, 21 Oct 2021 13:37:53 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/2] linux-ti-staging-rt: Bump linux rt version to latest
Date: Thu, 21 Oct 2021 18:37:53 +0000
Message-ID: <20211021183753.22872-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211021183753.22872-1-yogeshs@ti.com>
References: <20211021183753.22872-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

To merge j7 dtb name change patch need to bump the linux and linux rt
before the point release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index a5fd6957..8a1f3812 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "890b86772cff397e32c66ea6528fe8702d7e44a5"
+SRCREV = "6f4d81d846c7c548ccc05498c4ad824f31dd6fc0"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

