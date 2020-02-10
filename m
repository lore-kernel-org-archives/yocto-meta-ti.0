Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.23373.1581347978224954101
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 07:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WKR2NdLd;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDDCEE01446; Mon, 10 Feb 2020 07:19:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A93FE0085D
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2020 07:19:36 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AFJaNa014669;
	Mon, 10 Feb 2020 09:19:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581347976;
	bh=RUZuexAhBoL0FN+YaOPg56qgRyn27yGEMwUc9R5C0lE=;
	h=From:To:CC:Subject:Date;
	b=WKR2NdLdM5KFnRzwqnl5yPFpMRwlUWbATIr3cKO5W3p3GCsoSa1J+X+CiKYyaVDUi
	 L3z9cU0AUbtgSyiR49CPq7m7e3qH3xQdtUUcvvOmWmPubopIzJpYjnjX2y3s0IYj+P
	 u6Ksn9f4+jjClna63j8/Lr3R998e8feHONGIRpDM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AFJZGl075071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2020 09:19:35 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 09:19:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 09:19:35 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AFJXwa039654;
	Mon, 10 Feb 2020 09:19:34 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denis@denix.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus/master][PATCH] recipes-kernel: jailhouse: Update to 0.12 version
Date: Mon, 10 Feb 2020 20:48:00 +0530
Message-ID: <20200210151800.17737-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 4186dc3a..bdbcb820 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
 
-PV = "0.10+git${SRCPV}"
-SRCREV = "b3a68ac89d7ed955546eae91954b184ec1583ce3"
-BRANCH = "ti-jailhouse-0.10"
+PV = "0.12+git${SRCPV}"
+SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
+BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
     git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
-- 
2.17.1

