Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 034C0E00C5D; Thu, 23 Jun 2016 05:49:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A47A3E00C55
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 05:49:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5NCmBjR006730
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 07:48:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCmxWn005292
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 07:48:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Jun 2016 07:48:59 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCmq9n007685;
	Thu, 23 Jun 2016 07:48:58 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Jun 2016 18:18:04 +0530
Message-ID: <1466686084-6369-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466686084-6369-1-git-send-email-a0393906@ti.com>
References: <1466686084-6369-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dspdce-fw: Update SRCREV for adding new API
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
X-List-Received-Date: Thu, 23 Jun 2016 12:49:02 -0000
Content-Type: text/plain

This API will allow querying remote core information

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 3979ce9..ee00833 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
-SRCREV = "88705fd4584edd1289e4bb50658def936de90433"
+SRCREV = "3b9cea492f23d7dabb9ffa0e69631b858ba8e90a"
 
 PV = "1.00.00.06"
 
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r2"
+PR = "r3"
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
-- 
1.9.1


