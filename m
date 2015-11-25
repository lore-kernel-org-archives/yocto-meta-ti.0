Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBC83E007C9; Wed, 25 Nov 2015 13:54:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6E94E007C9
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 13:54:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8B55052A52; Wed, 25 Nov 2015 21:54:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151125215410.8B55052A52@arago-project.org>
Date: Wed, 25 Nov 2015 21:54:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux-ti-staging: k2g-evm: Add pmmc-fw as dependency
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
X-List-Received-Date: Wed, 25 Nov 2015 21:54:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: b88e9db0d10a0528913d3ec06ed8b679cc31c940
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b88e9db0d10a0528913d3ec06ed8b679cc31c940

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Nov 26 02:31:15 2015 +0000

linux-ti-staging: k2g-evm: Add pmmc-fw as dependency

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index afaa25c..ef953f9 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -28,6 +28,9 @@ RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 # Install boot-monitor skern file into /boot dir of rootfs
 RDEPENDS_kernel-base_append_keystone = " boot-monitor"
 
+# Install pmmc-fw into /boot dir of rootfs
+RDEPENDS_kernel-base_append_k2g-evm = " pmmc-fw"
+
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
@@ -58,7 +61,7 @@ SRCREV = "e7ce6b9cdee62083862c3d86853819d871f853de"
 PV = "4.1.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


