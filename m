Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3282E00D0F; Thu, 21 Mar 2019 06:16:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60B88E00C45
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:20 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGJT3068372
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174179;
	bh=0li4pNSUrJ6uf13/51PAnXWmlznHXovtrkUwPa832SY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oOphPzr9rULl5d7ZHpeCcl5ckVpRhPDXDBFBCrjuEOnvu3KHrIRu8IBN/MfTIp8Ha
	6CMYDNxjuwvKyGwjkQ8/R6fuHg6vVcd5Cvj9TOCFCmPHXk17x5p+srqtUDg/7LxWf7
	JknQKl4CzTDutNO9lQWZVkiQyyFAMZaOmf+OJYW8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGJAK061812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:19 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZj025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:15:49 -0400
Message-ID: <1553174173-28679-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 05/29] gpio-lld-rtos: SRCREV updater to 01.00.00.14
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
index 508cca9..d37583f 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -13,14 +13,14 @@ GPIO_LLD_GIT_PROTOCOL = "git"
 GPIO_LLD_GIT_BRANCH = "master"
 GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
 
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.13A"
-GPIO_LLD_SRCREV = "74c3b87c0cd6e25e3f830c74e20264f5eb776bce"
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.14"
+GPIO_LLD_SRCREV = "44d3cfcd49bfffe4d02d61c541398db3ffac7ef3"
 
 BRANCH = "${GPIO_LLD_GIT_BRANCH}"
 SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPIO_LLD_SRCREV}"
-PV = "01.00.00.13A"
+PV = "01.00.00.14"
 PR = "r0"
 
 S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


