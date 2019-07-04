Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C9C4E00D35; Thu,  4 Jul 2019 06:18:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C1ACE00C37
	for <meta-ti@yoctoproject.org>; Thu,  4 Jul 2019 06:18:50 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x64DIni5129437
	for <meta-ti@yoctoproject.org>; Thu, 4 Jul 2019 08:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562246329;
	bh=5+7JxAbAzNIhwH8md4QTJ/Kcp1RCIak8V3jwA5PnpBg=;
	h=From:To:Subject:Date;
	b=FSfzdP+UH/PztL8xwMc1Xa32GPlufrWK2GOJE++Es5R97bS9DYrgjdTzdneLbfGWq
	K1j0oGKT4FACIXXz3e3y80CSzRPXwxmF3iIxHoVtLLxd4UpgXEb3eJaWqkyFNN5qhV
	jTEUXqIvLlVx65dbQGaW+2yeIJApXll5RSQfz67o=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x64DIni7011576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 4 Jul 2019 08:18:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 4 Jul 2019 08:18:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 4 Jul 2019 08:18:49 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x64DIn9o070859
	for <meta-ti@yoctoproject.org>; Thu, 4 Jul 2019 08:18:49 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 4 Jul 2019 09:18:46 -0400
Message-ID: <1562246326-21400-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] osal: SRCREV update to 01.00.00.15A
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2019 13:18:52 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index 96c1a64..8a086bb 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -9,12 +9,12 @@ OSAL_GIT_PROTOCOL = "git"
 OSAL_GIT_BRANCH = "master"
 OSAL_GIT_DESTSUFFIX = "git/ti/osal"
 
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.15"
-OSAL_SRCREV = "7cda1a688cf9a828ce76cb467a1a9cd46eda6299"
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.15A"
+OSAL_SRCREV = "600a4006e636614900518e12c2828a02c7306f36"
 
 BRANCH = "${OSAL_GIT_BRANCH}"
 SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${OSAL_SRCREV}"
-PV = "01.00.00.15"
+PV = "01.00.00.15A"
 INC_PR = "r0"
-- 
1.9.1


