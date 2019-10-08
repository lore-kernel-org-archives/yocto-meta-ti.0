Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3030E00D8A; Tue,  8 Oct 2019 13:14:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26889E00D75
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2019 13:14:17 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KEH5X107016
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570565657;
	bh=/Gdb3MUGmM7Xg0/0r6+jE3XzmTqeO7yfuHXk5Qnfpbo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=n5culwYSxJDQNhw1owO9XR4VYRufoLtfVKMq1F6IVdfSokkrJq7P+0V8z0BfjR6Tg
	AkyRAwKkPq8wMy2jr+Q05u1Ko47IEMlnQz/KYqWx4MX216nTZjrgQF05wkgwcaKDGc
	CNUCXVW1bNYa7TprnD2ldkAMCDXq6U/n3E1qxKoA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98KEHHv122519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 8 Oct 2019 15:14:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 8 Oct 2019 15:14:17 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KEG1X014809
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 Oct 2019 16:14:12 -0400
Message-ID: <1570565655-33346-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/5] mcasp-lld-rtos: SRCREV update to 01.01.00.15B
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
X-List-Received-Date: Tue, 08 Oct 2019 20:14:18 -0000
Content-Type: text/plain

---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
index 983a299..cdd1027 100644
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -13,14 +13,14 @@ MCASP_LLD_GIT_PROTOCOL = "git"
 MCASP_LLD_GIT_BRANCH = "master"
 MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
 
-# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15A"
-MCASP_LLD_SRCREV = "d2d79afe8b4fa9503860d58d8e78137dd5801954"
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15B"
+MCASP_LLD_SRCREV = "0322199e23fc90e4acdcd715076bae4e1afabbb7"
 
 BRANCH = "${MCASP_LLD_GIT_BRANCH}"
 SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MCASP_LLD_SRCREV}"
-PV = "01.01.00.15A"
+PV = "01.01.00.15B"
 PR = "r0"
 
 S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


