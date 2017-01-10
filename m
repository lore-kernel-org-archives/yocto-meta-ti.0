Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9909BE00A93; Tue, 10 Jan 2017 09:06:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D572E00A73
	for <meta-ti@yoctoproject.org>; Tue, 10 Jan 2017 09:06:52 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0AH6qtb012615
	for <meta-ti@yoctoproject.org>; Tue, 10 Jan 2017 11:06:52 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0AH6qXc006247
	for <meta-ti@yoctoproject.org>; Tue, 10 Jan 2017 11:06:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 10 Jan 2017 11:06:51 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0AH6p1B027404;	Tue, 10 Jan 2017 11:06:51 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Jan 2017 12:06:50 -0500
Message-ID: <1484068010-33160-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] cmem: Update to new version 4.13.00.01_eng
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
X-List-Received-Date: Tue, 10 Jan 2017 17:06:59 -0000
Content-Type: text/plain

Update to new version 4.13.00.01_eng with bug fix

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index af48891..aa9c8f2 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH = "lu-next"
-# This corresponds to version 4.13.00.00_eng
-SRCREV = "1b1e19754049446c20fba7c22b39b325eb0154ec"
+# This corresponds to version 4.13.00.01_eng
+SRCREV = "1389059f01eabc1e853a384f0e5f51c4f3e4f197"
 
-PV = "4.13.00.00+git${SRCPV}"
+PV = "4.13.00.01+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


