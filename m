Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A854CE00343; Mon, 19 Oct 2015 12:19:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 400A8E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:19:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJJagb015196
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:19:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJJacq008065
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:19:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:19:36 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJJYjd027228;	Mon, 19 Oct 2015 14:19:35 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:19:33 -0400
Message-ID: <1445282373-8790-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] dfe-lld: Update to new version 1.0.0.5
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
X-List-Received-Date: Mon, 19 Oct 2015 19:19:38 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index 2053c74..f5778d9 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -3,10 +3,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1f4217b705bf98762a302fd720649dcc"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git;destsuffix=git/ti/drv/dfe;protocol=git;branch=${BRANCH}"
-# The following commit correspond to DEV.DFE_LLD.01.00.00.04C
-SRCREV = "62da141c1cf6224d24161f0c020091043a3d7c82"
+# The following commit correspond to DEV.DFE_LLD.01.00.00.05E
+SRCREV = "42e9df0108d208c92b9d2fee7e8b1b1ab62f4b69"
 
-PV = "1.0.0.4"
+PV = "1.0.0.5"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-- 
1.7.9.5


