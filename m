Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DCACE0086B; Tue, 22 Mar 2016 12:58:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78F10E006CA
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 12:58:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2MJwpSk002945
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 14:58:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MJwpgY028280
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 14:58:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Mar 2016 14:58:50 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2MJwofl002397;	Tue, 22 Mar 2016 14:58:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 22 Mar 2016 15:58:49 -0400
Message-ID: <1458676729-29163-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pktlib: Upgrade to version 2.1.0.7
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
X-List-Received-Date: Tue, 22 Mar 2016 19:58:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pktlib/pktlib_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index 9a45340..341391e 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -9,14 +9,14 @@ PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
 PKTLIB_GIT_PROTOCOL = "git"
 PKTLIB_GIT_BRANCH = "master"
 
-# Corresponds to DEV.PKTLIB.2.1.0.6
-PKTLIB_SRCREV = "2aa4843d79c344c2d76d0d5d32ecda3d7213d514"
+# Corresponds to DEV.PKTLIB.2.1.0.7
+PKTLIB_SRCREV = "22f66931964c25f83d1971f7eb78902d10c17d8a"
 
 BRANCH = "${PKTLIB_GIT_BRANCH}"
 SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PKTLIB_SRCREV}"
 
-PV = "2.1.0.6"
+PV = "2.1.0.7"
 PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/pktlib"
-- 
1.9.1


