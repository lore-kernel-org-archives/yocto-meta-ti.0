Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.5594.1587041362706948336
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 05:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l4NqdImt;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91866E01964; Thu, 16 Apr 2020 05:49:22 -0700 (PDT)
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
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DB89E01964
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 05:49:21 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnL7n028502
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587041361;
	bh=Nl9acchBgsS0hY+bFpd2opm89KzaEAy92EfLcEAFznM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l4NqdImtSW2qomypvjwOSnaayeemqNknq88Mo0OPS+XfhEMVkTvTBZCGN1vRbrw2i
	 1FlP5a6HnhjpMhorpG7KhtiKSmYTjjkKAL4MzT9sgE7/C/iX75GxUW1xiyxqdYr3lk
	 g2a4dtCEEcRMK21cd9j03aJKOFblVEnAAw2nxoxw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnLKc120065
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 07:49:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 07:49:21 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnKQd127342
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:20 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/thud/master][PATCH 1/3] ti-pdk:SRCREV update to 2020.4.16
Date: Thu, 16 Apr 2020 08:49:15 -0400
Message-ID: <20200416124917.45057-2-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
References: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index e30dda75..b4bd8b73 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "11ae319266ff2efbcf31f82b714a06435abf7782"
+TI_PDK_SRCREV ?= "b0453bdbc0928cfa4362ded5b5dbb9cd66e42afe"
 
-TI_PDK_VERSION ?= "2020.4.13"
+TI_PDK_VERSION ?= "2020.4.16"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.17.1

