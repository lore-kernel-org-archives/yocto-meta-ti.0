Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 586F1E00D6E; Fri, 14 Dec 2018 11:31:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5E07E00D60
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:53 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVrSa040599
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815913;
	bh=m2Hwsr/KO6CoBz0Bx8rt2BRMmvyAjlLQda6KxKLQoKk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MlbtOFF4PNoDXVtsC1k3EIuD8Cecn7ZmLzC3XZH5/z+ChGDhz48B8iOurR0tYvzJv
	kgDzFPJQQw8y8yTpiEu47GfE+yReso7eKqIsVhNIih3PUSKqohfY1qrUs9kvxMPM8e
	+gkq7y1ERD6c33tyxZ7iHbaDFSL7TuDW/L46FqD4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVrAf098513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:53 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:53 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmdO031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:53 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:33 -0500
Message-ID: <1544815903-10792-25-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 24/34] serdes-diag-rtos: SRCREV update to 01.00.00.11A
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:54 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
index d6d0f8a..6b6792e 100644
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
@@ -13,14 +13,14 @@ SERDES_DIAG_GIT_PROTOCOL = "git"
 SERDES_DIAG_GIT_BRANCH = "master"
 SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
 
-# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.11"
-SERDES_DIAG_SRCREV = "48e1cb668dc118a11f38df244003ed0f35d50ed1"
+# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.11A"
+SERDES_DIAG_SRCREV = "74db059c48ca5a903dab9cfbf665fd8693de8296"
 
 BRANCH = "${SERDES_DIAG_GIT_BRANCH}"
 SRC_URI = "${SERDES_DIAG_GIT_URI};destsuffix=${SERDES_DIAG_GIT_DESTSUFFIX};protocol=${SERDES_DIAG_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SERDES_DIAG_SRCREV}"
-PV = "01.00.00.11"
+PV = "01.00.00.11A"
 PR = "r0"
 
 S = "${WORKDIR}/${SERDES_DIAG_GIT_DESTSUFFIX}"
-- 
1.9.1


