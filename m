Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2256E00CA3; Wed, 25 Jul 2018 08:29:09 -0700 (PDT)
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
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBB7AE00B6C
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2018 08:29:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PFT6YP070645
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2018 10:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532532546;
	bh=DVmFmBzc+X8ZNM3FFJPprfp067D00vkjJGNfJWFb27I=;
	h=From:To:CC:Subject:Date;
	b=d7hbaIemWWvYgX5+CgqRyYQDY8b+bhjU+xZFHxsFhtY1utfuPlqq5p8RIPJruRgvm
	IQeaS1cgF+DufYi2S08m0ywE0e4420BHEINGBMBNjwmgxtrOMDaRRZNKmi1vo4cFQO
	HIx0/wd/M3mYsNiHevgaR1Uqp8EFIpGxu7ZBmZs0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PFT2Lv027311
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2018 10:29:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 10:29:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 25 Jul 2018 10:29:05 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PFT52J017614;
	Wed, 25 Jul 2018 10:29:05 -0500
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w6PFT5x13486; Wed, 25 Jul 2018 10:29:05 -0500 (CDT)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 25 Jul 2018 10:28:51 -0500
Message-ID: <1532532531-3669-1-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] pru-icss_git.bb: bug fixes, add PRU_ADC
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
X-List-Received-Date: Wed, 25 Jul 2018 15:29:09 -0000
Content-Type: text/plain

PRU Software Support Package v5.2.1 integrates 3 bug fixes and adds am335x
PRU_ADC example. PRU Software Support Package tags were updated so that v5.2.0
corresponds to the release that will be pulled into Linux SDK 5.0, while v5.2.1
corresponds to the commit for this version of the bitbake.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index e359b56457f8..3c871b70e3f0 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "df1d9da2047385fdd27e8735af31000dfdcf7625"
+SRCREV = "81b568741b8b98e6f590271a9aea5956d2b2d9ce"
 
-PV = "5.2.0"
+PV = "5.2.1"
 PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
-- 
1.9.1


