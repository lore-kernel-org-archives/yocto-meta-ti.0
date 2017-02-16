Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8416CE009B9; Thu, 16 Feb 2017 07:24:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46F57E00510
	for <meta-ti@yoctoproject.org>; Thu, 16 Feb 2017 07:24:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1GFOKYa004102
	for <meta-ti@yoctoproject.org>; Thu, 16 Feb 2017 09:24:20 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1GFOKQQ001586
	for <meta-ti@yoctoproject.org>; Thu, 16 Feb 2017 09:24:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 09:24:19 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1GFOJTs025643;	Thu, 16 Feb 2017 09:24:19 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 16 Feb 2017 10:24:18 -0500
Message-ID: <1487258658-15721-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master] cmem: Update to new version 4.14.0.0_eng
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
X-List-Received-Date: Thu, 16 Feb 2017 15:24:23 -0000
Content-Type: text/plain

Has update to changes related to Kernel 4.9

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index aa9c8f2..b6ffb27 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH = "lu-next"
-# This corresponds to version 4.13.00.01_eng
-SRCREV = "1389059f01eabc1e853a384f0e5f51c4f3e4f197"
+# This corresponds to version 4.14.00.00_eng
+SRCREV = "b514a99ac45c64f0439282d0774d7cff5def4c6f"
 
-PV = "4.13.00.01+git${SRCPV}"
+PV = "4.14.00.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


