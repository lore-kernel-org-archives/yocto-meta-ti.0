Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BB3FE00AB7; Thu, 28 Jan 2016 06:41:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A98B8E00AB6
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 06:41:16 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SEfFnG026721
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:15 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SEfF61018736
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 08:41:15 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SEfDlH029208;	Thu, 28 Jan 2016 08:41:15 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jan 2016 09:41:08 -0500
Message-ID: <1453992071-23149-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
References: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] pktlib: Upgrade to version 2.1.0.6
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
X-List-Received-Date: Thu, 28 Jan 2016 14:41:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pktlib/pktlib_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index 03399cf..9a45340 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -9,15 +9,15 @@ PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
 PKTLIB_GIT_PROTOCOL = "git"
 PKTLIB_GIT_BRANCH = "master"
 
-# Corresponds to DEV.PKTLIB.2.1.0.5
-PKTLIB_SRCREV = "d757026f3d6a837711f4b44b5ffdefed761fc186"
+# Corresponds to DEV.PKTLIB.2.1.0.6
+PKTLIB_SRCREV = "2aa4843d79c344c2d76d0d5d32ecda3d7213d514"
 
 BRANCH = "${PKTLIB_GIT_BRANCH}"
 SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PKTLIB_SRCREV}"
 
-PV = "2.1.0.5"
-PR = "r1"
+PV = "2.1.0.6"
+PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/pktlib"
 
-- 
1.9.1


