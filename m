Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16762.1587071098829640671
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 14:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EWSDPvf2;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66F98E019FC; Thu, 16 Apr 2020 14:04:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86730E019F8
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 14:04:56 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03GL4uB5089408
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 16:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587071096;
	bh=Qawo2oF1occ2Jnj6tV5KS9ux8Q9Kyf7gZ03Qf2eJ6zE=;
	h=From:To:Subject:Date;
	b=EWSDPvf2x52oGzSwNYHyvvog4i/7Mi0j8DLZCHfplP5GgOHS0te/0NRP8uw8Uwhdd
	 WqZZbzrn3wA0NKmI5YRJ2UZo6YsK4lLOciis57j3klFZti0gc/OZcamz83afWLmBkm
	 rSq5dRvww1bg1BJXpk6OUZr8LlvLJJOnaMu1JN+0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03GL4urL123896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 16:04:56 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 16:04:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 16:04:55 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GL4tPx005797
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 16:04:55 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/thud/master][PATCH] ti-pdk: SRCREV update
Date: Thu, 16 Apr 2020 17:04:54 -0400
Message-ID: <20200416210454.49016-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

---
 classes/ti-pdk-fetch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index b4bd8b73..7c3d2b07 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,7 +1,7 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "b0453bdbc0928cfa4362ded5b5dbb9cd66e42afe"
+TI_PDK_SRCREV ?= "9c04a8f4ac2ed95100ee50163b3189d28b9680f1"
 
 TI_PDK_VERSION ?= "2020.4.16"
 
-- 
2.17.1

