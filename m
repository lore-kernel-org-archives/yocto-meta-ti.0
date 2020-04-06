Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1074.1586211584311972358
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 15:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GcieAbRp;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E6FEE01976; Mon,  6 Apr 2020 15:19:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D48D0E01972
	for <meta-ti@yoctoproject.org>; Mon,  6 Apr 2020 15:19:32 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 036MJWWb089122
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586211572;
	bh=6k1Evvposkl2yW/b/7HINCVaBSJfrSBqrArmF9FeScE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GcieAbRphnGM6PcbI3+U+I/SW+5EXv9Dg/EcWzKw5ze58RkJ9jVksqvbd1dTUAzb9
	 MTwwRvOXLQq7Z8I8navrm6N70IGBCru6wRBZst88FbfN1Y5wzbQeZUmgwAB+u5ZpQn
	 1TFPadO+XXEqGpwT2erNGBfa1yK2nkiZJAXV0RlQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036MJWHg011292
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Apr
 2020 17:19:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Apr 2020 17:19:32 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036MJVBY017306
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:32 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/master][PATCH 5/5] starterware-inc: SRCREV update to 02.01.01.12A
Date: Mon, 6 Apr 2020 18:19:28 -0400
Message-ID: <20200406221928.23776-6-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406221928.23776-1-m-radhakrishnan2@ti.com>
References: <20200406221928.23776-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/starterware/starterware.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
index ae098211..82b012ad 100644
--- a/recipes-bsp/starterware/starterware.inc
+++ b/recipes-bsp/starterware/starterware.inc
@@ -8,14 +8,14 @@ STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
 STARTERWARE_GIT_PROTOCOL = "git"
 STARTERWARE_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.12"
-STARTERWARE_SRCREV = "7f418b7471ca11ba4c6d91b4a7eb992a1dd55d7d"
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.12A"
+STARTERWARE_SRCREV = "49a4d4cd4c72bacee738d44b8e72e7f59aa948cd"
 
 BRANCH = "${STARTERWARE_GIT_BRANCH}"
 SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${STARTERWARE_SRCREV}"
-PV = "02.01.01.12"
+PV = "02.01.01.12A"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

