Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87001E014AA; Thu, 19 Jul 2018 10:24:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D49F0E0146C
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHORjW022000
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021067;
	bh=ofXQ68U/2hfQ2718ft8ldmCGTLIXY8TiMJ2lrr5w34A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OBXAe588j+RQ3UYMi/BlaIrEe0X5J8bV0ejkVLhJXEW4B6Uvi8KqxVmpZeVfJ2EL6
	qDkuJGBEJ+dMq4acicErM+GV/fUbhHA4x42zz8OaxO9k1uVB32+Y+zRTGUi97DyeXY
	06k757zYLHVtCJE1jFTyBxE9pjSDteipPXcVsBBg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHORHh011557
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:26 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORf023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:44 -0400
Message-ID: <1532021058-48916-12-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 11/45] faultmanagement-rtos: Update to version 1.0.1.4
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:32 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
index 507677c..aed5637 100644
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -13,14 +13,14 @@ FAULT_MANAGEMENT_GIT_PROTOCOL = "git"
 FAULT_MANAGEMENT_GIT_BRANCH = "master"
 FAULT_MANAGEMENT_GIT_DESTSUFFIX = "git/ti/instrumentation/fault_mgmt"
 
-# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.03"
-FAULT_MANAGEMENT_SRCREV = "a300e7d1f262bdfa48c92851bad0da228a41acc3"
+# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.04"
+FAULT_MANAGEMENT_SRCREV = "f96fd9d9de8a6c658f444a0d5cabbdbbf43b34f0"
 
 BRANCH = "${FAULT_MANAGEMENT_GIT_BRANCH}"
 SRC_URI = "${FAULT_MANAGEMENT_GIT_URI};destsuffix=${FAULT_MANAGEMENT_GIT_DESTSUFFIX};protocol=${FAULT_MANAGEMENT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${FAULT_MANAGEMENT_SRCREV}"
-PV = "01.00.01.03"
+PV = "01.00.01.04"
 PR = "r0"
 
 S = "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
-- 
1.9.1


