Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C33CE00CCE; Wed, 23 Dec 2015 13:46:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AECDE00B3A
	for <meta-ti@yoctoproject.org>; Wed, 23 Dec 2015 13:46:03 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B1A8D52A22; Wed, 23 Dec 2015 21:46:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151223214602.B1A8D52A22@arago-project.org>
Date: Wed, 23 Dec 2015 21:46:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest and add deps for serdes fw
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
X-List-Received-Date: Wed, 23 Dec 2015 21:46:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ddc09eb823def7be6151e279e507fffbc85b3e0f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ddc09eb823def7be6151e279e507fffbc85b3e0f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Dec 18 16:25:04 2015 -0500

linux-ti-staging: update to the latest and add deps for serdes fw

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index e764324..5adfb33 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -31,6 +31,9 @@ RDEPENDS_kernel-base_append_keystone = " boot-monitor"
 # Install ti-sci-fw into /boot dir of rootfs
 RDEPENDS_kernel-base_append_k2g-evm = " ti-sci-fw"
 
+# Add run-time dependency for SerDes firmware to the rootfs
+RDEPENDS_kernel-base_append_keystone = " serdes-fw"
+
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
@@ -57,11 +60,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "f0f52afb60f57f31c099dc849c6757fea5664e89"
+SRCREV = "0f37ee50e2b263eb5941d91ef6da7d4ca51f7488"
 PV = "4.1.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


