Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D94FE00CC0; Mon, 21 Mar 2016 07:51:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09383E00ACF
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 07:51:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LEpHuB015177
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LEpHlE024790
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 09:51:16 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2LEpFkn000744;	Mon, 21 Mar 2016 09:51:17 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 21 Mar 2016 10:51:07 -0400
Message-ID: <1458571873-12889-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] cppi-lld: Upgrae to version 2.1.0.12
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
X-List-Received-Date: Mon, 21 Mar 2016 14:51:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index 26d0e5c..cee7142 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -9,14 +9,14 @@ CPPI_LLD_GIT_PROTOCOL = "git"
 CPPI_LLD_GIT_BRANCH = "master"
 CPPI_LLD_GIT_DESTSUFFIX = "git/ti/drv/cppi"
 
-# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.11"
-CPPI_LLD_SRCREV = "91047a01a6d64d7ffaf650c6ebb280de775af997"
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.12"
+CPPI_LLD_SRCREV = "1dc105ad256c49fbd1a92a0a27a27a34dae85e56"
 
 BRANCH = "${CPPI_LLD_GIT_BRANCH}"
 SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${CPPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${CPPI_LLD_SRCREV}"
-PV = "02.01.00.11"
+PV = "02.01.00.12"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
-- 
1.9.1


