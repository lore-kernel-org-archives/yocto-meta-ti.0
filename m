Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 221EEE00C11; Tue,  8 Sep 2015 15:46:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70919E00B68
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 15:46:23 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 283A652979; Tue,  8 Sep 2015 22:46:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908224623.283A652979@arago-project.org>
Date: Tue,  8 Sep 2015 22:46:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: for keystone RDEPENDS on boot-monitor
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
X-List-Received-Date: Tue, 08 Sep 2015 22:46:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dc515ca85e19ac79aa5ad3821b7456c605864a9a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dc515ca85e19ac79aa5ad3821b7456c605864a9a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep  9 03:42:21 2015 +0000

linux-ti-staging: for keystone RDEPENDS on boot-monitor

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index c1ca9c7..16b30a7 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -25,6 +25,9 @@ RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
 # on the target file system.
 RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 
+# Install boot-monitor skern file into /boot dir of rootfs
+RDEPENDS_kernel-base_append_keystone = " boot-monitor"
+
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
@@ -54,7 +57,7 @@ SRCREV = "72c971cc113833c7a1f22a3c0ac3260f3a9a3378"
 PV = "4.1.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "i"
+MACHINE_KERNEL_PR_append = "j"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


