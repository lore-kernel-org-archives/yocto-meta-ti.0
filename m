Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.36982.1601909259631171515
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 07:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lhCsCUkh;
 spf=none, err=permanent DNS error (domain: swubn03, ip: 198.47.19.141, mailfrom: a0389345@swubn03)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095Elcee069110
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 09:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601909258;
	bh=/fwMl6/qRUdqeMGglb82IHXCvZI73MnDbVSffFsHd5U=;
	h=From:To:CC:Subject:Date;
	b=lhCsCUkhoC3bAUtH+O03yfMDwGeTAKkhR9JLv1DBbZdNu5AR2hLfhx7J10u0Jlsqd
	 Wd5mUJzj/6ZqZAnnNropCO5fdKqyRwubBzafVP8tRWhP8rGtWnMymT8VgVlf3eGXTC
	 gIiqpGJoSt8tEUEIP+peihmE5FqlUuwNHj/D3at0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095Elco3033731
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 09:47:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 09:47:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 09:47:38 -0500
Received: from swubn03 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095ElbqM110754;
	Mon, 5 Oct 2020 09:47:38 -0500
Received: from a0389345 by swubn03 with local (Exim 4.90_1)
	(envelope-from <a0389345@swubn03>)
	id 1kPRm5-0000Jm-0i; Mon, 05 Oct 2020 20:17:37 +0530
From: prao@ti.com
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>
CC: <nikhil.nd@ti.com>, <vigneshr@ti.com>, <shyam.jagannathan@ti.com>,
        <piyali_g@ti.com>, <l-weaver@ti.com>, Praveen Rao <prao@ti.com>
Subject: [meta-ti][master][patch][v2] ti-sci-fw: update imggen SRCREV to the latest
Date: Mon, 5 Oct 2020 20:16:11 +0530
Message-ID: <20201005144611.31380-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

Signed-off-by: Praveen Rao <prao@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 183ac8a7..7d278815 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -7,7 +7,7 @@ PV = "2020.07-rc3"
 
 SRCREV = "f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56"
+SRCREV_imggen = "09256d5c21e6281d224646c1d4163d4dd0925238"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

