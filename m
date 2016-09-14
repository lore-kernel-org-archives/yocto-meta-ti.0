Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89B70E00848; Tue, 13 Sep 2016 18:29:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28142E00848
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 18:29:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8E1Tm7W006378
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 20:29:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8E1TmRe013533
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 20:29:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 20:29:47 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8E1TVLh003993;	Tue, 13 Sep 2016 20:29:45 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Sep 2016 21:29:19 -0400
Message-ID: <1473816561-27507-4-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1473816561-27507-1-git-send-email-jsobota@ti.com>
References: <1473816561-27507-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 4/6] qmss-lld: Bump version
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
X-List-Received-Date: Wed, 14 Sep 2016 01:29:53 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index ed560c8..65764b3 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -9,15 +9,15 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.14A
-QMSS_LLD_SRCREV = "8fc6a846e509d6ad8499e1de68abd912d7947069"
+# commit ID corresponding to "DEV.QMSS_LLD.02.01.00.14B"
+QMSS_LLD_SRCREV = "04095405680f4ec92eeef9312ba04f7808b1c813"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
-PV = "02.01.00.14"
-INC_PR = "r1"
+PV = "02.01.00.14B"
+INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
-- 
1.7.10.4


