Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1125.1586211573827020893
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 15:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Tk3o3Asm;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5417FE0197A; Mon,  6 Apr 2020 15:19:33 -0700 (PDT)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D9C8E01974
	for <meta-ti@yoctoproject.org>; Mon,  6 Apr 2020 15:19:32 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 036MJVsd042384
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586211571;
	bh=wPLV7xVzRG+a+ikykavJbAibd8KKrhsVbUPhJB4hGnY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Tk3o3AsmNTP6/GS7olt+S/set+tUbnSq/ZPPsNLrb/A8FbNeIhZm60Eta8MlSxJJs
	 BYSy6MpYZW4yiFiowEmta8paCA19IINUP7er9gkrnCgjgYkJcOXkzoQjfyV/g5qOu1
	 RsTRPxSKCS5RNhNvOd11LxGnGAenhJco3tMBph88=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036MJV8n011279
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Apr
 2020 17:19:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Apr 2020 17:19:31 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036MJVBU017306
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:31 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/master][PATCH 1/5] ti-pdk:SRCREV update to 2020.4.5
Date: Mon, 6 Apr 2020 18:19:24 -0400
Message-ID: <20200406221928.23776-2-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406221928.23776-1-m-radhakrishnan2@ti.com>
References: <20200406221928.23776-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 6c1e9197..7376cbf4 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "773b514be5d5c40d6aa8c8ffa94a312185fcae4a"
+TI_PDK_SRCREV ?= "b31ee7a5f4858bce6b62d72e9af023e77f917f5e"
 
-TI_PDK_VERSION ?= "2020.4.2"
+TI_PDK_VERSION ?= "2020.4.5"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.17.1

