Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41992E0141D; Thu, 19 Jul 2018 10:24:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBA90E0130D
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOUBY022032
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021070;
	bh=iPb1uzwp29TJvmmAMJYez9bZpOWxn7lMMsxZFi2vc2A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ALktsuP91iDLNPSnP8fB6/nsMKBtF20ihB2QD7QCZ7kezRDcsAEwSl3psZVTtKDUP
	7zaCkzvRnArzxCGjJX/ZMSlG2BSDXaJgeAfravyZ+1HYtxjkGNu5OUnLk5IMisSild
	qOu5KeP0KdXCerrSuCiBlbt67Ywfuvy4DgDzPvSQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOUs1015469
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:30 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:29 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORu023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:59 -0400
Message-ID: <1532021058-48916-27-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 26/45] pktlib: Update to version 2.1.0.8A
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:35 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pktlib/pktlib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.inc
index 701a83f..f2afa31 100644
--- a/recipes-bsp/pktlib/pktlib.inc
+++ b/recipes-bsp/pktlib/pktlib.inc
@@ -10,15 +10,15 @@ PKTLIB_GIT_PROTOCOL = "git"
 PKTLIB_GIT_BRANCH = "master"
 PKTLIB_GIT_DESTSUFFIX = "git/ti/runtime/pktlib"
 
-# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.7"
-PKTLIB_SRCREV = "22f66931964c25f83d1971f7eb78902d10c17d8a"
+# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.8A"
+PKTLIB_SRCREV = "1fb44eb37ba0fcf94011204c9776360bfef5696c"
 
 BRANCH = "${PKTLIB_GIT_BRANCH}"
 # Don't use DESTSUFFIX when cloning since repo contains ti/runtime/pktlib directory tree
 SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PKTLIB_SRCREV}"
-PV = "2.1.0.7"
-INC_PR = "r2"
+PV = "2.1.0.8A"
+INC_PR = "r0"
 
 S = "${WORKDIR}/${PKTLIB_GIT_DESTSUFFIX}"
-- 
1.9.1


