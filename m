Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1129.1586386341978089877
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 15:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=arz6IUXt;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3964E01991; Wed,  8 Apr 2020 15:52:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9C08E0194A
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2020 15:52:20 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 038MqKMI082982
	for <meta-ti@yoctoproject.org>; Wed, 8 Apr 2020 17:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586386340;
	bh=6T9pCr7mb0c0da3yXONpt08S5rMtaqQgZvC2NkpHU/w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=arz6IUXtMYNsFYHcVOPAXQRy1CY5qHmvo6qbw3bUXTnFQaGP5oI3lug/+dNyUJUWQ
	 wKD6cB5pMWNkKV99ORO5O77osndYWWzAH60puMOByFEKPdxOYMd3uXhhOygprQQ3Xk
	 69Ugmmj6GprcKy4oAkl7gT7p2Vm+OcO4pZ5Zx7ys=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 038MqKYV059081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 8 Apr 2020 17:52:20 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Apr
 2020 17:52:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Apr 2020 17:52:19 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 038MqE8L018017
	for <meta-ti@yoctoproject.org>; Wed, 8 Apr 2020 17:52:19 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/master][PATCH v2 1/1] pm-lld-rtos:SRCREV update to 1.0.8.23A
Date: Wed, 8 Apr 2020 18:52:13 -0400
Message-ID: <20200408225213.37665-2-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408225213.37665-1-m-radhakrishnan2@ti.com>
References: <20200408225213.37665-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 5db670e3..25fcb65e 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -20,8 +20,8 @@ PM_LLD_GIT_BRANCH_k2g = "int_pm_am335x"
 
 PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.23"
-PM_LLD_SRCREV = "7c064b93a0ae648441991abb5c71b99d2c209eeb"
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.23A"
+PM_LLD_SRCREV = "59abc6ffb890d24b82de0248d204ad10c1bfc2af"
 
 # Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05C"
 PM_LLD_SRCREV_ti33x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
@@ -32,7 +32,7 @@ BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.08.00.23"
+PV = "01.08.00.23A"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-- 
2.17.1

