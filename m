Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.337.1579731640156027874
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2020 14:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MPxyWXlO;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 099D8E015E7; Wed, 22 Jan 2020 14:20:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3D86E015E5
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 14:20:36 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKaPa034244
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579731636;
	bh=OKmzvHK9NZj96QsffLEMcJM/qETDcNJx0BCZrCOrYAw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MPxyWXlOMsjD+TJ0KduZUU0u6l0LX1uRY8pBaCleOD3svonU2iA1VQ6QvIMF5hx7l
	 FWPLclplWynenRroZGBHclN0e/HXOmXi3Q4zyUwNQsQB1otABkmC+qb9sJ/6HoeGx7
	 HsU0wQajepIC3le14sSeh+k4brp2/NdGR5Amuekw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MMKaJr051145
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:36 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 16:20:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 16:20:36 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKY4w061593
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:35 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 1/3] ti-pdk-fetch: SRCREV update of pdk repo to 2020.1.22
Date: Wed, 22 Jan 2020 17:20:29 -0500
Message-ID: <20200122222031.13896-2-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
References: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

---
 classes/ti-pdk-fetch.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 117e54fa..db9218d3 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
-TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
+TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "2357d1436f1b2c3b5f1d0c9c94e045d33b63f3fe"
+TI_PDK_SRCREV ?= "5ddf121a09af4ac58a18103848d4ab8e741e23d6"
 
-TI_PDK_VERSION ?= "2019.12.2"
+TI_PDK_VERSION ?= "2020.1.22"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.17.1

