Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66A1EE00BB7; Tue, 18 Dec 2018 14:26:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABAAEE00C4E
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 14:26:40 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIMQepa107428
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:26:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545172000;
	bh=PlF7FMWCzh8X2McwZUpTSozUu2gMKYFrdjmqda2fwl0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RhakM8swzCP5xCHRIT314DGSQYPMaKO6idmRMww9KlWeTn7D4F0Kpl4wHUUJ9LADI
	jBcLmtIiqU5pe1RFq+h9HEfmVwZFGf1mIMpeehN9NS3acHIoFp/OP3L/gRN6QSRGh3
	4fQfS7J4t/nMS/hNHygYyedYQYIoo9QrC/P7jfro=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIMQepe063075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:26:40 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:26:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:26:39 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIMQcEP023799
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:26:39 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Dec 2018 17:26:33 -0500
Message-ID: <1545171996-17507-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545171996-17507-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545171996-17507-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 4/7] osal: SRCREV update to 01.00.00.13A
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
X-List-Received-Date: Tue, 18 Dec 2018 22:26:41 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index 5388164..8abc2e6 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -9,12 +9,12 @@ OSAL_GIT_PROTOCOL = "git"
 OSAL_GIT_BRANCH = "master"
 OSAL_GIT_DESTSUFFIX = "git/ti/osal"
 
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.13"
-OSAL_SRCREV = "ce73d71aacc4c3cbe7f7baf18a45049465c99eee"
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.13A"
+OSAL_SRCREV = "0615fea1ac9a2639445362f2da628802011a8824"
 
 BRANCH = "${OSAL_GIT_BRANCH}"
 SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${OSAL_SRCREV}"
-PV = "01.00.00.13"
+PV = "01.00.00.13A"
 INC_PR = "r0"
-- 
1.9.1


