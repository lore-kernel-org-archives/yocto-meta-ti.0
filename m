Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF8AFE00288; Fri, 20 Jun 2014 15:12:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D750E00282
	for <meta-ti@yoctoproject.org>; Fri, 20 Jun 2014 15:12:40 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00BHIN0F8B90@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 20 Jun 2014 17:12:25 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0563E200BD; Fri,
	20 Jun 2014 18:12:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Jun 2014 18:12:09 -0400
Message-id: <1403302329-10916-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] recipes: consolidate firmware recipes under recipes-bsp in own directories
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
X-List-Received-Date: Fri, 20 Jun 2014 22:12:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/{ti => am33x-cm3}/am33x-cm3/init-am33x-cm3        | 0
 recipes-bsp/{ti => am33x-cm3}/am33x-cm3/init-am43x-cm3        | 0
 recipes-bsp/{ti => am33x-cm3}/am33x-cm3_git.bb                | 0
 {recipes-ti => recipes-bsp}/dspdce-fw/dspdce-fw_1.00.00.02.bb | 0
 {recipes-ti => recipes-bsp}/ipumm-fw/ipumm-fw_3.00.04.02.bb   | 0
 {recipes-ti => recipes-bsp}/vis-fw/vis_01.50.07.15.bb         | 0
 recipes-bsp/{ti => vpe-vpdma}/vpe-vpdma_git.bb                | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/{ti => am33x-cm3}/am33x-cm3/init-am33x-cm3 (100%)
 rename recipes-bsp/{ti => am33x-cm3}/am33x-cm3/init-am43x-cm3 (100%)
 rename recipes-bsp/{ti => am33x-cm3}/am33x-cm3_git.bb (100%)
 rename {recipes-ti => recipes-bsp}/dspdce-fw/dspdce-fw_1.00.00.02.bb (100%)
 rename {recipes-ti => recipes-bsp}/ipumm-fw/ipumm-fw_3.00.04.02.bb (100%)
 rename {recipes-ti => recipes-bsp}/vis-fw/vis_01.50.07.15.bb (100%)
 rename recipes-bsp/{ti => vpe-vpdma}/vpe-vpdma_git.bb (100%)

diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
similarity index 100%
rename from recipes-bsp/ti/am33x-cm3/init-am33x-cm3
rename to recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
diff --git a/recipes-bsp/ti/am33x-cm3/init-am43x-cm3 b/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
similarity index 100%
rename from recipes-bsp/ti/am33x-cm3/init-am43x-cm3
rename to recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
similarity index 100%
rename from recipes-bsp/ti/am33x-cm3_git.bb
rename to recipes-bsp/am33x-cm3/am33x-cm3_git.bb
diff --git a/recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
similarity index 100%
rename from recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb
rename to recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
diff --git a/recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
similarity index 100%
rename from recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb
rename to recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
diff --git a/recipes-ti/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
similarity index 100%
rename from recipes-ti/vis-fw/vis_01.50.07.15.bb
rename to recipes-bsp/vis-fw/vis_01.50.07.15.bb
diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
similarity index 100%
rename from recipes-bsp/ti/vpe-vpdma_git.bb
rename to recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
-- 
2.0.0


