Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0525FE0049B; Mon, 19 Oct 2015 12:11:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 972BCE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:11:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJBh39005033
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:43 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJBhi2015667
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:11:42 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJBdgs021251;	Mon, 19 Oct 2015 14:11:40 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:11:37 -0400
Message-ID: <1445281897-8256-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] rm-lld: Update to new version 2.1.2.0
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
X-List-Received-Date: Mon, 19 Oct 2015 19:11:49 -0000
Content-Type: text/plain

-Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/rm-lld/rm-lld_git.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index beac927..8b2806c 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b6536
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.RM_LLD.02.01.00.08
-SRCREV = "7873d22076b4cb865365bbce20a244121414bb44"
-PV = "02.01.00.08"
+# Below commit ID corresponds to DEV.RM_LLD.02.01.02.00
+SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
+PV = "02.01.02.00"
 PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"
-- 
1.7.9.5


