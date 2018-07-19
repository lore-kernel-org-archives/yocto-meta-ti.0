Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AB2FE00E04; Thu, 19 Jul 2018 10:24:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E40C4E00E04
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOWF9071123
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021072;
	bh=mAZVCVr6MgbHwu0b0aCErfJGGSXwCMNRr3BINcgVzpE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AOEsbAyiRJJy5GjodkQpY+Wgl1Bn1XCURc85OwVwntEc7smFKciwQZsR7FqZJ5rnz
	VkmbrEFATFIJfXz1gZAQCuf7gJKH5EjttUazteSWpWGV0TbO8wEzkZUwXSnzSJlRDj
	TY+qrVeJDCj9vAaC4DYLNLzFb6WLM7lOTAcIX6Ww=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOWMq011658
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:32 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:31 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOOS9023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:24:12 -0400
Message-ID: <1532021058-48916-40-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 39/45] tsip-lld-rtos: Update to version 1.0.0.8
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
index 168c67e..0e90e6a 100644
--- a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
+++ b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
@@ -12,14 +12,14 @@ TSIP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tsip-lld.git"
 TSIP_LLD_GIT_PROTOCOL = "git"
 TSIP_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TSIP_LLD.01.00.00.07A"
-TSIP_LLD_SRCREV = "211d2f1a5c3c7ec80349a18e6e6cae6c9e4df921"
+# Below commit ID corresponds to "DEV.TSIP_LLD.01.00.00.08"
+TSIP_LLD_SRCREV = "f40c0153b711622e67ab4b36da5cf044f7bd9a8e"
 
 BRANCH = "${TSIP_LLD_GIT_BRANCH}"
 SRC_URI = "${TSIP_LLD_GIT_URI};protocol=${TSIP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TSIP_LLD_SRCREV}"
-PV = "01.00.00.07"
+PV = "01.00.00.08"
 PR = "r0"
 
 # HTML doc link params
-- 
1.9.1


