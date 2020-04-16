Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.5486.1587041363061370000
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 05:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EvXpgLJO;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7446E019AC; Thu, 16 Apr 2020 05:49:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 255E6E01966
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 05:49:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnLUW052415
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587041361;
	bh=W5krSEW9CrLAs76jT0MfTxAeNKjQ2FuPibtlRTrFm0c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EvXpgLJOEDxLEgwVX/BNViEPKlB6QWovYr5nyC6AdU/kJr5CzBr7kqEhN1oynBr3G
	 3079Q6WRrCTSW0H4F3AW9F0HsYc/+qU3KqidllhN17uaLwI15/umS8WdCKWY6z1KXe
	 TFr4zNUzQnLkuzfQavGhD0+T0GDEntp3NCabyOlg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03GCnLXa057229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 07:49:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 07:49:21 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnKQe127342
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/thud/master][PATCH 2/3] cmb-addon-rtos: SRCREV update to 01.01.00.03A
Date: Thu, 16 Apr 2020 08:49:16 -0400
Message-ID: <20200416124917.45057-3-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
References: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
index a10c4862..38f9a43e 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -14,11 +14,11 @@ CMB_ADDON_GIT_PROTOCOL = "git"
 CMB_ADDON_GIT_BRANCH = "master"
 CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
 
-# Below commit ID corresponds to "DEV.CMB.01.01.00.03"
-CMB_ADDON_SRCREV = "4b16dd77eb929708a5134714c3194fc5b5bc1808"
+# Below commit ID corresponds to "DEV.CMB.01.01.00.03A"
+CMB_ADDON_SRCREV = "3655aad07f17d3a167ec7dcecb52450c1d2fe8be"
 
 SRCREV = "${CMB_ADDON_SRCREV}"
-PV = "01.01.00.03"
+PV = "01.01.00.03A"
 PR = "r0"
 
 BRANCH = "${CMB_ADDON_GIT_BRANCH}"
-- 
2.17.1

