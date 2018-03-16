Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D255E00B18; Fri, 16 Mar 2018 09:01:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52FC3E00CBD
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 09:01:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GG1mCu001357
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521216108;
	bh=d54P08Eoz8/bYlzJLM63AYrkaeEl6xtrI/8voo56gTk=;
	h=From:To:Subject:Date;
	b=uSYVyfEj1/XV3BULd0ufgUCMolOpn2+I31Z8WyUXdYTvleO1vLeAQcmJ/+dB6do1G
	cUdYdH/RReCz1yOfJCGb9dpxpQUuvVuWSKKIUWZNYZoAfVA/xktf9mhrkn486LvY+F
	f/cH+Gl1WZWKxCH8BdaJCzA+lnHQVA4nuywQk9I4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GG1mIR022576
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:01:48 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:01:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:01:48 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GG1mqP008520
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:01:48 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Mar 2018 12:01:43 -0400
Message-ID: <1521216103-27039-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] gpio-lld-rtos: Updating to version 01.00.00.10
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
X-List-Received-Date: Fri, 16 Mar 2018 16:01:59 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
index e313cee..0d1d42f 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -13,14 +13,14 @@ GPIO_LLD_GIT_PROTOCOL = "git"
 GPIO_LLD_GIT_BRANCH = "master"
 GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
 
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.09"
-GPIO_LLD_SRCREV = "99a20a668f36217705d57f7cc2f7faf1a5533bbe"
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.10"
+GPIO_LLD_SRCREV = "2661a410e5bc00b4769db6ef2692f680a7a42feb"
 
 BRANCH = "${GPIO_LLD_GIT_BRANCH}"
 SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPIO_LLD_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.10"
 PR = "r0"
 
 S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


