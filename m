Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95B48E0131E
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 11:36:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 90B9452AA9; Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326183618.90B9452AA9@arago-project.org>
Date: Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: Add OMAP5 support
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
X-List-Received-Date: Tue, 26 Mar 2013 18:36:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 881fcc959914a9a647306cab7ec59734bacc2b51
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=881fcc959914a9a647306cab7ec59734bacc2b51

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Tue Mar 19 10:10:40 2013 -0500

linux-ti-staging: Add OMAP5 support

* Add the KERNEL_DEVICETREE definitions for omap5-evm
* Add the omap-a15 SOC_FAMILY to the list of COMPATIBLE_MACHINEs

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index cfd4da0..3ff038d 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -32,8 +32,9 @@ DEPENDS_ti33x += "am33x-cm3"
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-evm.dts"
 
-COMPATIBLE_MACHINE = "ti33x"
+COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
 S = "${WORKDIR}/git"
 


