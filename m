Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0D0AE006EB
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 13:36:35 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWO009XRPCAHG40@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 22 Nov 2013 15:36:16 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 839CF20011; Fri,
	22 Nov 2013 16:36:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 22 Nov 2013 16:36:08 -0500
Message-id: <1385156168-2204-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] omapdrm-pvr: fix the license definition
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
X-List-Received-Date: Fri, 22 Nov 2013 21:36:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

From the README file:

You may use, distribute and copy this software under the terms of the MIT
license.  Details of this license can be found in the file "MIT-COPYING".

Alternatively, you may use, distribute and copy this software under the terms
of the GNU General Public License version 2.  The full GNU General Public
License version 2 can be found in the file "GPL-COPYING".

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 24aadd5..a129e60 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -1,15 +1,17 @@
 DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
 HOMEPAGE = "http://git.ti.com"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://MIT-COPYING;md5=8c2810fa6bfdc5ae5c15a0c1ade34054"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
 
 inherit module
 
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git"
 S = "${WORKDIR}/git"
 
 SRCREV = "86a4ffae3458c51f0a58e44b17b7a4fd92d2b8c6"
-PR = "${MACHINE_KERNEL_PR}"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
 
-- 
1.8.3.2


