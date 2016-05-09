Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D8CAE00736; Mon,  9 May 2016 09:50:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07E88E00736
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 09:50:52 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8ED6052ACB; Mon,  9 May 2016 16:50:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160509165050.8ED6052ACB@arago-project.org>
Date: Mon,  9 May 2016 16:50:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to ti2016.01-rc1
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
X-List-Received-Date: Mon, 09 May 2016 16:50:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1fc1e6e5cff90beec8610049b43b1bb53be7f7cd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1fc1e6e5cff90beec8610049b43b1bb53be7f7cd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon May  9 22:40:19 2016 +0000

linux-ti-staging: update to ti2016.01-rc1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index dd925aa..c1c5b86 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "ee87bb1741b3e2f05a5ff46b1ad59ca82b8f2514"
+SRCREV = "0997a7f0b943274b71db74f01018c7b7e746eec2"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 5953992..a9b99c0 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -42,6 +42,7 @@ RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
 RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
 RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_am335x-evm = " prueth-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -70,11 +71,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "89ae5e0da227de05d1c4ce78796a6544895e8b28"
+SRCREV = "ba05e8fda276bd3a1b2ef970a868b229d5184246"
 PV = "4.4.9+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


