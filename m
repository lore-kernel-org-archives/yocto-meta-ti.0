Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E574E0084F; Tue,  7 Oct 2014 18:10:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64D04E0084F
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 18:10:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5888C52A50; Wed,  8 Oct 2014 01:10:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008011018.5888C52A50@arago-project.org>
Date: Wed,  8 Oct 2014 01:10:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging 3.14: update with latest fixes
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
X-List-Received-Date: Wed, 08 Oct 2014 01:10:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: e8df8ef878c357792d269f60b00e7adcffc61365
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e8df8ef878c357792d269f60b00e7adcffc61365

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct  8 06:17:12 2014 +0000

linux-ti-staging 3.14: update with latest fixes

non-smp configuration has moved to the kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-3.14/non-smp.cfg        |    5 -----
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |    9 ++++-----
 2 files changed, 4 insertions(+), 10 deletions(-)

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


