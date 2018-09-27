Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC194E00C15; Thu, 27 Sep 2018 13:44:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D18C5E00C4D
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:43:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKhhbl053036
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081023;
	bh=RrAsLcverGG6coZ6n1FSzjq2s3azGoA7XC/Gf4kI02o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XvUrljFZA0c23/E+CE4JEWcX/ofzH9/LG5TMWkn3k1ZJtDJxMc9WBLeoAPhgXkFcc
	NMtRyTjtxUCchAQwxUNOWdXxaVRt45W89LqDep5Wu5qCBja+8xsXS4tk3qd07mgH3l
	7xngQd3X3xjYSYzLFHgufKHFVrDa1tIN/9zneKJ4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhhgu030670
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:43 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:43:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:43:43 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhbiV003847
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:43 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 16:43:29 -0400
Message-ID: <1538081009-52859-31-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 30/30] cmb-addon: Update to version 01.01.00.02
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
X-List-Received-Date: Thu, 27 Sep 2018 20:44:05 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
index f8242cf..bd87794 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -14,11 +14,11 @@ CMB_ADDON_GIT_PROTOCOL = "git"
 CMB_ADDON_GIT_BRANCH = "master"
 CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
 
-# Below commit ID corresponds to "DEV.CMB.01.01.00.01"
-CMB_ADDON_SRCREV = "d60c0887cc479abd09f014c038d0ebe1daa25dad"
+# Below commit ID corresponds to "DEV.CMB.01.01.00.02"
+CMB_ADDON_SRCREV = "0bcfbb40f1d671206f8cad04aac4e6bf548af21e"
 
 SRCREV = "${CMB_ADDON_SRCREV}"
-PV = "01.01.00.01"
+PV = "01.01.00.02"
 PR = "r0"
 
 BRANCH = "${CMB_ADDON_GIT_BRANCH}"
-- 
1.9.1


