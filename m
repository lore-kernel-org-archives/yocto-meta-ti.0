Return-Path: <d-senicic1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09CADE00CB2; Sun, 17 Jun 2018 12:24:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8850E0044F
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 12:24:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5HJOVd5019201
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 14:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529263471;
	bh=Ftwa+i1AnJQKW56xqx36eweyvoI0rRJLLmn+GgQZ+lU=;
	h=From:To:CC:Subject:Date;
	b=Hy7fLrzfkpxNGnCcO/QOe/8NTBtYQy1rhjICEV9caZtAxkqfK1hAWxXs+BAjcqc35
	tcsQ20e8hdOA5t8fawAC6a2dCfEtLbzgNEjnvAFvWpTGh9VTkcCpz/piXfR77nZTyd
	AHvZa4LapiK4qMHzbGy9S//eCPs4bGiGXPlP64uk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5HJOVpc005440
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 14:24:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Sun, 17 Jun 2018 14:24:30 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Sun, 17 Jun 2018 14:24:31 -0500
Received: from UDA0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5HJOUWi023977;
	Sun, 17 Jun 2018 14:24:30 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 17 Jun 2018 15:24:29 -0400
Message-ID: <1529263469-20920-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] ti-pdk-build: New DEV.PDK_BUILD.01.00.00.08F
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
X-List-Received-Date: Sun, 17 Jun 2018 19:24:33 -0000
Content-Type: text/plain

* Enhancements for semi-hosting support
* Add TDA2x cascade board support
* Adding arp32 makefile
* Add McBSP component
* mmwvedfp migration

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 0f60714..e81f6e8 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.08E"
+PV = "01.00.00.08F"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08E"
-PDK_BUILD_SRCREV = "9622a097c143188cab74b8827461eafdf54f8ed9"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08F"
+PDK_BUILD_SRCREV = "4d41f3540af5850f1c7f57afcb8a7b4610cfc8f0"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "\
-- 
1.9.1


