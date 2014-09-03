Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4381EE004F5; Wed,  3 Sep 2014 09:12:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECAB8E0049D
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 09:12:16 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBC002YF2BBFU40@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 03 Sep 2014 11:11:50 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 548912008C; Wed,
	03 Sep 2014 12:11:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 03 Sep 2014 12:11:34 -0400
Message-id: <1409760694-25824-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] linux-ti-staging: update to the latest rev and add wlan config
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
X-List-Received-Date: Wed, 03 Sep 2014 16:12:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 46c3ded..2a458b7 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -44,17 +44,17 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "367e55fbd8b6a7fb853f44a4f854eaadbbfd68c2"
+SRCREV = "0627fb95826dbcaac164f051d7d0a694e59d709a"
 PV = "3.14.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
 KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFIG_DIR}/baseport.cfg \
                            ${KERNEL_CONFIG_DIR}/connectivity.cfg ${KERNEL_CONFIG_DIR}/ipc.cfg \
-                           ${KERNEL_CONFIG_DIR}/power.cfg"
+                           ${KERNEL_CONFIG_DIR}/power.cfg ${KERNEL_CONFIG_DIR}/wlan.cfg"
 
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
-- 
2.0.4


