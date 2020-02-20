Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.541.1582225717350677572
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o9mimoDx;
 spf=permerror, err=parse error for token &{10 18 app.sgizmo.com}: SPF record not found (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34ADEE016E9; Thu, 20 Feb 2020 11:08:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18E06E016B6
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 11:08:34 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8Yft127972
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582225714;
	bh=4dNPMMhBN1WNQ/nV77kCExIt7f7MRMcOubHNCOuScaI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o9mimoDxi6TVIs47ferdb46G5yNJM1wCU6ViQJ/1pOHWrXvIWjJcVq1Kdr2AO16Kf
	 k4ZmaYg6caJ59bv1v9c/n/w5/uoZ0oh7/hm4nYymn81W43a04LtdMHD6X7DVIJ3MEv
	 tBtav1z0TMGKBPoy30XXddrvK+QuLCnosJReNfOM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJ8YKK084801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:34 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 13:08:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 13:08:34 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8Xpt074493;
	Thu, 20 Feb 2020 13:08:34 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 4/4] layer.conf: drop ti-ipc from SIGGEN_EXCLUDERECIPES_ABISAFE for now
Date: Thu, 20 Feb 2020 18:47:22 +0000
Message-ID: <20200220184722.25828-4-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220184722.25828-1-denys@ti.com>
References: <20200220184722.25828-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 824443d4..d82b2384 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -17,8 +17,6 @@ LAYERDEPENDS_meta-ti = "core"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \
-    ti-ipc \
-    ti-ipc-rtos \
     cmem-mod \
     hplib-mod \
     gdbserverproxy-module-drv \
-- 
2.17.1

