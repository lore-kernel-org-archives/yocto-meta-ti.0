Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD185E00C44; Mon, 21 Mar 2016 08:27:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2B4AE00973
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:27:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LFRHVG027984
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:27:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LFRHSJ007679
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:27:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 10:27:17 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2LFRDM8027129;	Mon, 21 Mar 2016 10:27:17 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 21 Mar 2016 11:27:02 -0400
Message-ID: <1458574026-24513-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458574026-24513-3-git-send-email-j-stiffler@ti.com>
References: <1458574026-24513-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 06/10] pa-lld: Upgrade to version 3.0.1.8
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
X-List-Received-Date: Mon, 21 Mar 2016 15:27:18 -0000
Content-Type: text/plain

* Update license to add TI-TFL license

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Fix license: replace '_' with '-'

 recipes-bsp/pa-lld/pa-lld.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 7b09ceb..b45d3bc 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -1,5 +1,5 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+LICENSE = "BSD-3-Clause & TI-TFL"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
 
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -9,15 +9,15 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.07"
-PA_LLD_SRCREV = "cad5bc0b422a7ac3c6fa013fc2288447318329a0"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.08"
+PA_LLD_SRCREV = "43badac6ff6269e9449fb03fb7af985e61ab723c"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
             file://0001-makefile_armv7-fix-missing-separator-error.patch"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.01.07"
+PV = "03.00.01.08"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


