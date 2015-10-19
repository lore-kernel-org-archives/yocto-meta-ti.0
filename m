Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 025A6E0049B; Mon, 19 Oct 2015 12:36:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62D4EE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:36:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJaGmd009902
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:36:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJaGpk023099
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:36:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:36:16 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJaGdt018966;	Mon, 19 Oct 2015 14:36:16 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:36:15 -0400
Message-ID: <1445283375-9670-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] traceframework: Update to new version 1.1.1.7
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
X-List-Received-Date: Mon, 19 Oct 2015 19:36:18 -0000
Content-Type: text/plain

-Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/traceframework/traceframework_git.bb |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index e164428..50989af 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPY
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
 
-# Below commit ID corresponds to DEV.TFWK-01.01.01.06B
-SRCREV = "6d29bc0d1ab6bb0658876552197dcdc757a25082"
-PV = "01.01.01.06"
-PR = "r1"
+# Below commit ID corresponds to DEV.TFWK-01.01.01.07
+SRCREV = "8d9c0e3a5bcb43aad98a794c31f42b652c6b3b53"
+PV = "01.01.01.07"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 DEPENDS = "cuia"
-- 
1.7.9.5


