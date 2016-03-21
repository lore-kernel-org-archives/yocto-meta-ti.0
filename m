Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02843E00C3C; Mon, 21 Mar 2016 07:51:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64933E00CA2
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 07:51:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LEpIrA006567
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LEpIQM001368
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 09:51:18 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2LEpFks000744;	Mon, 21 Mar 2016 09:51:18 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 21 Mar 2016 10:51:12 -0400
Message-ID: <1458571873-12889-10-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] traceframework: Bump SRCREV for fix
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
X-List-Received-Date: Mon, 21 Mar 2016 14:51:24 -0000
Content-Type: text/plain

* tf:cuiaTest:fixing linker options

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/traceframework/traceframework_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 298ead4..49a7e95 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -7,15 +7,15 @@ TRACEFRAMEWORK_GIT_PROTOCOL = "git"
 TRACEFRAMEWORK_GIT_BRANCH = "master"
 TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
 
-# Below commit ID corresponds to DEV.TFWK-01.01.01.08
-TRACEFRAMEWORK_SRCREV = "4e84c37c456ca62188cc9560d4ebf22452dab01f"
+# Below commit ID corresponds to DEV.TFWK-01.01.01.08B
+TRACEFRAMEWORK_SRCREV = "e7a60a71a385337425547e3cac6716998c6a3528"
 
 BRANCH="${TRACEFRAMEWORK_GIT_BRANCH}"
 SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
 
 PV = "01.01.01.08"
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


