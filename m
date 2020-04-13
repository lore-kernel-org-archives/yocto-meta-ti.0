Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2014.1586806514544091738
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xThJSsKg;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1074BE019D9; Mon, 13 Apr 2020 12:35:14 -0700 (PDT)
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
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73D7AE018F2
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2020 12:35:12 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03DJZCq0040201
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2020 14:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586806512;
	bh=USdZ7xJ9VlzJqkBmC8x5VBP1QA7AgiFbPVowphFsm8M=;
	h=From:To:Subject:Date;
	b=xThJSsKgjOePAg37IWcrmgs5z/k0C61epgskhLs6ziSp6GLldRw1yYZ3Nr5qZR4sB
	 cn9EMIF3tZdTEcLAy+1B3BVI3NC2tigP/1jDkJueAvKCaZ9VdMl2e9ipaUdNIMaMRR
	 2rGNh33GgVhQJc22xOHpcg9Ukk/IDeBYyRmh9e7c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03DJZC8s033096
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2020 14:35:12 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Apr 2020 14:35:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Apr 2020 14:35:11 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03DJZBsw048610
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2020 14:35:11 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/thud/master][PATCH] ti-pdk: SRCREV update to 2020.4.13
Date: Mon, 13 Apr 2020 15:35:09 -0400
Message-ID: <20200413193509.17755-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7376cbf4..e30dda75 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "b31ee7a5f4858bce6b62d72e9af023e77f917f5e"
+TI_PDK_SRCREV ?= "11ae319266ff2efbcf31f82b714a06435abf7782"
 
-TI_PDK_VERSION ?= "2020.4.5"
+TI_PDK_VERSION ?= "2020.4.13"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.17.1

