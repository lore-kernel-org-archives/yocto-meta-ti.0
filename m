Return-Path: <poojaprajod@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 438F5E00D03; Wed, 12 Oct 2016 10:17:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BAB7E00C27
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:17:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CHHPHY009076
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:17:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CHHPPu008472
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:17:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 12:17:25 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CHHNxv013814;	Wed, 12 Oct 2016 12:17:24 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <1476292641-6416-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:52:03 -0800
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-ti/ipumm] ipumm: Update SRCREV to 3.00.12.00
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
Date: Wed, 12 Oct 2016 17:17:30 -0000
X-Original-Date: Wed, 12 Oct 2016 22:47:21 +0530
X-List-Received-Date: Wed, 12 Oct 2016 17:17:30 -0000
Content-Type: text/plain

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 53b4245..76278d0 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "7c283ebc252223a728cb542dbc10c3ca0ab53e59"
+SRCREV = "cd93550ed32c7849de91288e7d90cba3bd89614b"
 
 S = "${WORKDIR}/git"
 
-PV = "3.00.11.00"
-PR = "r4"
+PV = "3.00.12.00"
+PR = "r5"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
-- 
1.9.1


