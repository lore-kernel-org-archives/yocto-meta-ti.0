Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD9C9E00CC2; Wed, 11 Jul 2018 16:43:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB712E006F1
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 16:43:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6BNhFPJ002216
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 18:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531352595;
	bh=mvjGflufRI0awdiRrJ6y9ftpT0ot5VWoj04m6jDP78k=;
	h=From:To:CC:Subject:Date;
	b=NQ+RPS/JTG1sItAIh0t7dZDJpIzatsUFW7jBSQC11uqzyQQ6r7+tpUyB9LdiyM8ci
	oorTwbusQMXbns3XBqtPLbD11E3UO2oSzP1I0giJH3tRSzY/lbKPq9gigA07wraNnx
	WRuTiltaY802vssRI7pcv6jG4q6pjRuvrugzVG/0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BNhFeE023511
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 18:43:15 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 11 Jul 2018 18:43:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 11 Jul 2018 18:43:14 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BNhEHU021384;
	Wed, 11 Jul 2018 18:43:14 -0500
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w6BNhEx18042; Wed, 11 Jul 2018 18:43:14 -0500 (CDT)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 11 Jul 2018 18:43:07 -0500
Message-ID: <1531352587-28264-1-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] pru-icss_git.bb: bug fixes for SDK 5.0, PRU_ADC
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
X-List-Received-Date: Wed, 11 Jul 2018 23:43:16 -0000
Content-Type: text/plain

Updated commit hash for PRU Software Support Package.

PRU Software Support Package v5.2.0 integrates 3 bug fixes and adds am65x code
(as of previous commit) as well as am335x PRU_ADC example.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 5161e1f9dc4a..fb576bf797dc 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,7 +8,7 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "df1d9da2047385fdd27e8735af31000dfdcf7625"
+SRCREV = "8af83221c65e1982cd4828703ed50a352c01e684"
 
 PV = "5.2.0"
 PR = "r1"
-- 
1.9.1


