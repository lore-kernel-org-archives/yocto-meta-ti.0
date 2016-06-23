Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6F99E00C55; Thu, 23 Jun 2016 05:50:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 67 seconds by postgrey-1.32 at yocto-www;
	Thu, 23 Jun 2016 05:50:02 PDT
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F139E00C4B
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 05:50:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5NCmsv5027958
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 07:48:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCms5m028848
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 07:48:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Jun 2016 07:48:54 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCmq9m007685;
	Thu, 23 Jun 2016 07:48:53 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Jun 2016 18:18:03 +0530
Message-ID: <1466686084-6369-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] ipumm: Update SRCREV for adding new API
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
X-List-Received-Date: Thu, 23 Jun 2016 12:50:05 -0000
Content-Type: text/plain

This API will allow querying remote core information

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 32d51cb..331c25d 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "a55e6e7b3a8b6917155f3f7ed6c10ed6170df3e7"
+SRCREV = "1627fec802da688fe44c6b0cac43ff811b08f064"
 
 S = "${WORKDIR}/git"
 
@@ -66,4 +66,4 @@ ALTERNATIVE_PRIORITY = "20"
 
 FILES_${PN} += "${base_libdir}/firmware/*"
 
-PR = "r0"
+PR = "r1"
-- 
1.9.1


