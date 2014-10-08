Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A26C0E00848; Tue,  7 Oct 2014 17:17:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B8C1E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 17:17:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ND30026YNGPT100@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 Oct 2014 19:17:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1EB23200AC; Tue,
	07 Oct 2014 20:17:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 07 Oct 2014 20:17:12 -0400
Message-id: <1412727432-5188-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH v2] linux-ti-staging 3.14: update with latest fixes
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
X-List-Received-Date: Wed, 08 Oct 2014 00:17:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

non-smp configuration has moved to the kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - new config fragments use underscores in name, not dash

 recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg | 5 -----
 recipes-kernel/linux/linux-ti-staging_3.14.bb          | 9 ++++-----
 2 files changed, 4 insertions(+), 10 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg

diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg
deleted file mode 100644
index d61a413..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg
+++ /dev/null
@@ -1,5 +0,0 @@
-##################################################
-# Non-SMP config options
-##################################################
-CONFIG_SMP=n
-CONFIG_NR_CPUS=n
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index f0dd841..180a038 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -44,11 +44,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "f56742085ff39d6aa7f487c14a6abff473b4b810"
+SRCREV = "bdbce705b538fb18116afbcf62a59d2fb602de5e"
 PV = "3.14.19"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -56,12 +56,11 @@ KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFI
                            ${KERNEL_CONFIG_DIR}/connectivity.cfg ${KERNEL_CONFIG_DIR}/ipc.cfg \
                            ${KERNEL_CONFIG_DIR}/power.cfg ${KERNEL_CONFIG_DIR}/wlan.cfg"
 
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
            file://defconfig \
-           file://non-smp.cfg \
           "
-- 
2.1.2


