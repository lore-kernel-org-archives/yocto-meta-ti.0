Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2166.1578342161271197982
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 12:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XixS+jGu;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D079BE01486; Mon,  6 Jan 2020 12:22:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D2DBE013C9
	for <meta-ti@yoctoproject.org>; Mon,  6 Jan 2020 12:22:39 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006KMcXY070262
	for <meta-ti@yoctoproject.org>; Mon, 6 Jan 2020 14:22:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578342158;
	bh=fsRYfTvcvcZrFnZTkF0Nm+LNdsaiH47qn5pM1mCCBhs=;
	h=From:To:Subject:Date;
	b=XixS+jGupDp3DvUgFfx/obSdjBSOY2zyWTLTH3qYBb+qccePY1VSiZYXb9UwuqmTE
	 fFdV3pGvCectY+79B3KP3RiKfr823UJm/LEgNgS5IIzgq/zbsA6Q/nyxNT69I6J0Dk
	 a9t5EekApoY3KZK0j/tvmiKRKh/pRmRPYMYTc0es=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006KMcLh026877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 6 Jan 2020 14:22:38 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 14:22:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 14:22:38 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006KMcmt053185
	for <meta-ti@yoctoproject.org>; Mon, 6 Jan 2020 14:22:38 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH] ti-pdk-fetch: SRCREV update
Date: Mon, 6 Jan 2020 15:22:36 -0500
Message-ID: <1578342156-39548-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

---
 classes/ti-pdk-fetch.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 117e54f..0a4b1e5 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
-TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
+TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.03.00"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "2357d1436f1b2c3b5f1d0c9c94e045d33b63f3fe"
+TI_PDK_SRCREV ?= "6cc30b07b7463702625cbc77ddced480c3403de1"
 
-TI_PDK_VERSION ?= "2019.12.2"
+TI_PDK_VERSION ?= "2020.1.6"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
1.9.1

