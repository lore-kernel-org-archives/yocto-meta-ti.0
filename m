Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37C08E00D89; Tue,  8 Oct 2019 13:14:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A814E00D82
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2019 13:14:18 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KEHBj084478
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570565657;
	bh=mLUj6mFLU1CMU/7dljkyEAg25TWPv8IqAZbDNvtgmns=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l/l3JJJSi1S6l4fQXwYVWUtpkG0vnCdORe2jdqrYJFt1qLNGF/T4ZenKmpooRCAiR
	0dthW5ki+DfnC4k1LA4cY2Z9pEGFI+9r2LFnNRs3Ov6ZeQmg16MWPddAqN8QpI3B0W
	itjTFvbDCSLRzUK+OZ0Z5bH5EAyHhheVpcTMpibE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98KEHfW013025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 8 Oct 2019 15:14:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 8 Oct 2019 15:14:17 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KEG1Y014809
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 Oct 2019 16:14:13 -0400
Message-ID: <1570565655-33346-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 3/5] mmcsd-lld-rtos: SRCREV update to 01.00.00.17D
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
X-List-Received-Date: Tue, 08 Oct 2019 20:14:20 -0000
Content-Type: text/plain

---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
index 30aa429..e94d8c8 100644
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -13,14 +13,14 @@ MMCSD_LLD_GIT_PROTOCOL = "git"
 MMCSD_LLD_GIT_BRANCH = "master"
 MMCSD_LLD_GIT_DESTSUFFIX = "git/ti/drv/mmcsd"
 
-# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.17C"
-MMCSD_LLD_SRCREV = "0b1dd11ffb9868b13d3083e5abe7adeadea35bd7"
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.17D"
+MMCSD_LLD_SRCREV = "d723e336b917989b08bef590c3e125010c0d3461"
 
 BRANCH = "${MMCSD_LLD_GIT_BRANCH}"
 SRC_URI = "${MMCSD_LLD_GIT_URI};destsuffix=${MMCSD_LLD_GIT_DESTSUFFIX};protocol=${MMCSD_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MMCSD_LLD_SRCREV}"
-PV = "01.00.00.17C"
+PV = "01.00.00.17D"
 PR = "r0"
 
 S = "${WORKDIR}/${MMCSD_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


