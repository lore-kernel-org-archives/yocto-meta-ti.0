Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A25C3E00D21; Tue, 26 Mar 2019 15:35:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72372E00D08
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 15:34:58 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMYwRD112709
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 17:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639698;
	bh=9Oa02BMMs7SYGh1CueTphtCZYL4lTiLHQBt2vd54X3c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KFtspkikFuMCfmQJFBHAaCEM3ejJ6ZbbmQSjUF63t1zdcqP4BngTfTHIIjE6TZyxi
	wO1sPltQvixNVFtdUd6zlGSJQJp16+ML3GM15jQiVDqf6qnH4D3vj9R5Uou++C0g0l
	uEB4EWY04FJKSGYAl/t+OL33atGFxTODVhhicX7k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMYwUT101207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 17:34:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:34:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:34:57 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMYuVR126272
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 17:34:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Mar 2019 18:34:50 -0400
Message-ID: <1553639694-36968-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639694-36968-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639694-36968-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 3/7] mmcsd-lld-rtos: SRCREV bump to 01.00.00.15A
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
X-List-Received-Date: Tue, 26 Mar 2019 22:35:00 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
index 02e7a2d..e0a0450 100644
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -13,14 +13,14 @@ MMCSD_LLD_GIT_PROTOCOL = "git"
 MMCSD_LLD_GIT_BRANCH = "master"
 MMCSD_LLD_GIT_DESTSUFFIX = "git/ti/drv/mmcsd"
 
-# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.15"
-MMCSD_LLD_SRCREV = "d2a3c3233193cddf4076a6065faa34fb48b59119"
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.15A"
+MMCSD_LLD_SRCREV = "612a2d6dc91a73cdf290e4060228b0df5e209992"
 
 BRANCH = "${MMCSD_LLD_GIT_BRANCH}"
 SRC_URI = "${MMCSD_LLD_GIT_URI};destsuffix=${MMCSD_LLD_GIT_DESTSUFFIX};protocol=${MMCSD_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MMCSD_LLD_SRCREV}"
-PV = "01.00.00.15"
+PV = "01.00.00.15A"
 PR = "r0"
 
 S = "${WORKDIR}/${MMCSD_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


