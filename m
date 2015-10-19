Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77AC4E0049B; Mon, 19 Oct 2015 12:25:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D74BEE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:25:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJPr2q022969
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:25:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJPrPD031597
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:25:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:25:53 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJPqSf025587;	Mon, 19 Oct 2015 14:25:52 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:25:51 -0400
Message-ID: <1445282751-9069-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] iqn2-lld: Update to new version 1.0.0.8
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
X-List-Received-Date: Mon, 19 Oct 2015 19:25:55 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index fb6886f..812d3f6 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -3,10 +3,10 @@ LICENSE = "BSD-3-Clause"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git;destsuffix=git/ti/drv/iqn2;protocol=git;branch=${BRANCH}"
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.07A
-SRCREV = "94017e30c87853e48f6e947186c5075289b190c6"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.08F
+SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
 
-PV = "1.0.0.7"
+PV = "1.0.0.8"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-- 
1.7.9.5


