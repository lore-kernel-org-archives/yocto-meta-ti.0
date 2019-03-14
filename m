Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE8A5E00D24; Thu, 14 Mar 2019 15:50:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03750E00D30
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 15:50:36 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EMoZZQ095615
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552603835;
	bh=TzFaearq8VNYUAhlgM5S6/68OTSxYvOcDlMOEeBxcRk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GI/S0k6pb8mgQ3OGSTwZvkjgyOkbJVcBoadgbYoPKKV26r10zpT7ZadQkfzpTzni9
	fsMuihk+SvXl/Hj5WFurh5tBhYMvyLgxw2q1GOEelaMti7Zfz2WDfy70ckitm8AlTx
	pwPM8IQ3CnrNJ1xRf+old6GNSWzhVkWxNCxNRr9A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EMoZLj086257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Mar 2019 17:50:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Mar 2019 17:50:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EMoXS8013025
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Mar 2019 18:50:31 -0400
Message-ID: <1552603832-16016-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552603832-16016-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1552603832-16016-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 4/5] swtools: SRCREV update and updates to facilitate AUTOREV
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
X-List-Received-Date: Thu, 14 Mar 2019 22:50:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/swtools/swtools_git.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
index 425a069..b950f3f 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -11,11 +11,17 @@ DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native"
 
 PV = "5_0_8"
-PR = "r0"
+PR = "r1"
 S = "${WORKDIR}/git"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
-SRCREV = "881267836907de650edadc56b8e57ab45428021d"
+
+SWTOOLS_GIT_BRANCH = "master"
+SWTOOLS_GIT_PROTOCOL = "git"
+SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
+SWTOOLS_SRCREV = "d0c1022954b489d5f3d8d2f5c81d8c6a392f4af4"
+
+BRANCH = "${SWTOOLS_GIT_BRANCH}"
+SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
+SRCREV = "${SWTOOLS_SRCREV}"
 
 export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
 export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
-- 
1.9.1


