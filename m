Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B837E00AD2; Wed, 14 Sep 2016 20:07:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5125FE00AB6
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 20:07:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8F37s6P026683
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 22:07:54 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8F37rAk002142
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 22:07:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 22:07:52 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8F37qS0027940;	Wed, 14 Sep 2016 22:07:52 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Sep 2016 23:07:49 -0400
Message-ID: <1473908869-15217-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mpm-transport: Update to new version 2.0.2.0
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
X-List-Received-Date: Thu, 15 Sep 2016 03:07:59 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 280a5e1..bfbf85b 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -15,10 +15,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.01.02
-SRCREV = "5c1f177b8d5802227dfe7e86fc026620e1e10189"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00
+SRCREV = "696a9ec37559b671860ef393194c6032b7b6d9ef"
 
-PV = "2.0.1.2"
+PV = "2.0.2.0"
 PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
-- 
1.9.1


