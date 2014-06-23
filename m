Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07122E00509; Mon, 23 Jun 2014 15:15:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  2.0 TO_NO_BRKTS_PCNT To: misformatted + percentage
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABAFAE003D8
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:15:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5F73052A9B; Mon, 23 Jun 2014 22:15:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623221509.5F73052A9B@arago-project.org>
Date: Mon, 23 Jun 2014 22:15:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: consolidate firmware recipes under recipes-bsp in own directories
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
X-List-Received-Date: Mon, 23 Jun 2014 22:15:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 65a3d9a04d66968a91c29acfe1c600877e001c17
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=65a3d9a04d66968a91c29acfe1c600877e001c17

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 20 18:10:18 2014 -0400

recipes: consolidate firmware recipes under recipes-bsp in own directories

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{ti => am33x-cm3}/am33x-cm3/init-am33x-cm3     |    0
 .../{ti => am33x-cm3}/am33x-cm3/init-am43x-cm3     |    0
 recipes-bsp/{ti => am33x-cm3}/am33x-cm3_git.bb     |    0
 .../dspdce-fw/dspdce-fw_1.00.00.02.bb              |    0
 .../ipumm-fw/ipumm-fw_3.00.04.02.bb                |    0
 .../vis-fw/vis_01.50.07.15.bb                      |    0
 recipes-bsp/{ti => vpe-vpdma}/vpe-vpdma_git.bb     |    0
 7 files changed, 0 insertions(+), 0 deletions(-)

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


