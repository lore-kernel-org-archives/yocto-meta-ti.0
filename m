Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3925E00932; Fri, 10 Apr 2015 06:44:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EF79E008CF
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 06:44:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ADiNxb005798
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 08:44:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ADiL4R003009
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 08:44:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 08:44:21 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3ADiLtl031834;	Fri, 10 Apr 2015 08:44:21 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Apr 2015 09:44:19 -0400
Message-ID: <1428673459-19336-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] srss-tc: Update to new version 1.0.0.1
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
X-List-Received-Date: Fri, 10 Apr 2015 13:44:31 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/srss-tc/srss-tc_git.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
index 79edbed..3c90069 100644
--- a/recipes-bsp/srss-tc/srss-tc_git.bb
+++ b/recipes-bsp/srss-tc/srss-tc_git.bb
@@ -4,11 +4,11 @@ LICENSE = "BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
 COMPATIBLE_MACHINE = "keystone"
 
-PV = "1.0.0.0"
+PV = "1.0.0.1"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.SRSS-TC-01.00.00.00A
-SRCREV = "7aaf8308d7ba470144730275df12edae5007e07a"
+# This commit corresponds to tag DEV.SRSS-TC-01.00.00.01A
+SRCREV = "107cd1433ef5785e5647ef086a4cc77566506604"
 
 SRC_URI = "git://git.ti.com/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9.5


