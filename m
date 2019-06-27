Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E7A5E00DA5; Wed, 26 Jun 2019 21:24:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18642E00D86
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 21:24:10 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5R4O9iG095914
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561609449;
	bh=Z0XYz8XewiEOCHq66CZJpV6HnaViKS56RJqa0G0tROo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bcUKpYKuRhUi8EDR7VWrcLPVbFdQPquc1vkC4tTXp/rOCMcF4kqudnvdalacNOYFJ
	Phv6kZsyIHkjeYLPegGrzjjZwaM6xcjNuCN2MDpJgnaF2Np0ECabrtI627Fg7Eb9y1
	bTSrx5PaFFx59qQ+OjDAiPRpkrPF8Q5hKKljhsfs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5R4O9kR025312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 23:24:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 23:24:08 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5R4O50e079141
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:08 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jun 2019 00:23:44 -0400
Message-ID: <1561609436-41672-13-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561609436-41672-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1561609436-41672-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 12/24] pm-lld-rtos: SRCREV update to 01.08.00.22
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
X-List-Received-Date: Thu, 27 Jun 2019 04:24:11 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index a8b870f..5889fa2 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -20,8 +20,8 @@ PM_LLD_GIT_BRANCH_k2g = "int_pm_am335x"
 
 PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.21"
-PM_LLD_SRCREV = "73d6a8536a420de7e7c40a4f3fd49e9e3b93ac6a"
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.22"
+PM_LLD_SRCREV = "091ab8a3b96911ed2cb7a19d4cac4005c171fafb"
 
 # Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05C"
 PM_LLD_SRCREV_ti33x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
@@ -32,7 +32,7 @@ BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.08.00.21"
+PV = "01.08.00.22"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


