Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.6118.1580769796480219132
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LKjwOlra;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C953DE016A8; Mon,  3 Feb 2020 14:43:15 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A6C3E01612
	for <meta-ti@yoctoproject.org>; Mon,  3 Feb 2020 14:43:12 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 013MhCVZ094689
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580769792;
	bh=zl38v37/DcEfmEt3MgPi0NHbYzTXxu9fhv/CeuXxfYw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LKjwOlrah29yy6MAJkc4y/lT7b+iLwTnsbVWg/X9hHDKV2Cjj1WHkZWhaeau2nfVw
	 569vATFjHUMSMH2RGEoqnGJz6vkw1Grz4Ic7guTWOIRKyRMCmvhgDsdncnjugTXj6J
	 ok9rLxTn8jF0YqAzTzbaleyYFvrOY9+ITw0Bsiyo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 013MhCiK053398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 3 Feb
 2020 16:43:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 3 Feb 2020 16:43:11 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 013MhB1F023888
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:11 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 1/2] ti-pdk-fetch: SRCREV udpate to 2020.2.3
Date: Mon, 3 Feb 2020 17:43:08 -0500
Message-ID: <20200203224309.19843-2-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7108d001..a128e490 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "5ddf121a09af4ac58a18103848d4ab8e741e23d6"
+TI_PDK_SRCREV ?= "5f53b1cdb709cf5615a4a1d6f51a5365d64e5bfc"
 
-TI_PDK_VERSION ?= "2020.1.22"
+TI_PDK_VERSION ?= "2020.2.3"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.17.1

