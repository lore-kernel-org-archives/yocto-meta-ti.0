Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC99FE00D70; Wed, 13 Dec 2017 14:01:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 907E9E00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:01:12 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDM1CJw001923
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 16:01:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513202472;
	bh=5nG7eISzvUwQNwbe7rVwnJzpNzdS5sjRqOY/Wtkt7L4=;
	h=From:To:Subject:Date;
	b=pNzzWShXazZUK8gfNwevX3uFpVwAzDrm7T+Ol5q6Sni1o64NrvwyyGauGv7VjInvH
	F3qygK2zX2NXz2usMRswVMnYLTXKzleL5p/xIEGqiVzZM1r6EBrrgxG5BZ/ky5bY9a
	a5NLwJ+kPcjj4dc9sVgEEeOBv+W+SCbicufZNYjY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDM1CPT031055
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 16:01:12 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 13 Dec 2017 16:01:11 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 16:01:11 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDM1BrQ021415
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 16:01:11 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 17:01:10 -0500
Message-ID: <1513202470-23185-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] gpio-lld-rtos: Updating to version 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 22:01:13 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
index be68c9e..e313cee 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -13,14 +13,14 @@ GPIO_LLD_GIT_PROTOCOL = "git"
 GPIO_LLD_GIT_BRANCH = "master"
 GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
 
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.07A"
-GPIO_LLD_SRCREV = "3abf90c7c3dabb456346da0ab308fab12ff590de"
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.09"
+GPIO_LLD_SRCREV = "99a20a668f36217705d57f7cc2f7faf1a5533bbe"
 
 BRANCH = "${GPIO_LLD_GIT_BRANCH}"
 SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPIO_LLD_SRCREV}"
-PV = "01.00.00.07A"
+PV = "01.00.00.09"
 PR = "r0"
 
 S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


