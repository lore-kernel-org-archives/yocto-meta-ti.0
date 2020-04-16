Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.5487.1587041363128324782
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 05:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iImSQaUG;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04A6FE01966; Thu, 16 Apr 2020 05:49:23 -0700 (PDT)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2688EE019A8
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 05:49:21 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnLnK052419
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587041361;
	bh=9wzYi+85qksk9IrbxeLF7aqaC5XrE24Zf6TklLQKzzk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iImSQaUGKy//ti1AGX1NvU3kCYycgyTYRJU/1Jq81sopQUJEGiMlFCtCsuvd1IN7e
	 sOQkjqLgP7dwBEzT0yK+2BWlyy4WSP8o0yo3tMgSF6sSTiWbCZude45dGTFUXR5WDQ
	 gBfV3WaExAafiauamN+ziZ11xlXpIixb86vUwdrU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnLkT120077
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 07:49:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 07:49:21 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnKQf127342
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/thud/master][PATCH 3/3] common-csl-ip: SRCREV update to 03.03.00.17B
Date: Thu, 16 Apr 2020 08:49:17 -0400
Message-ID: <20200416124917.45057-4-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
References: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 93bf7dfd..16c45e7a 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
 
-PV = "03.03.00.17A"
+PV = "03.03.00.17B"
 INC_PR = "r0"
 PE = "1"
 
@@ -13,8 +13,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.17A"
-CSL_SRCREV = "f85a9cfe2cc91362578ce50afa6b40b665cb6498"
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.17B"
+CSL_SRCREV = "a5a9200fe11575a4eff965d87cb968c5f3377e9f"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
2.17.1

