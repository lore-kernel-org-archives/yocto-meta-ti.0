Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54726E006AD
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2013 06:46:39 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D158352998; Mon, 25 Nov 2013 14:46:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131125144638.D158352998@arago-project.org>
Date: Mon, 25 Nov 2013 14:46:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omapdrm-pvr: fix the license definition
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
X-List-Received-Date: Mon, 25 Nov 2013 14:46:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 7923a087619503fe6004b7c0a6ce85c4486cd2ae
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7923a087619503fe6004b7c0a6ce85c4486cd2ae

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 22 16:32:52 2013 -0500

omapdrm-pvr: fix the license definition

From the README file:

You may use, distribute and copy this software under the terms of the MIT
license.  Details of this license can be found in the file "MIT-COPYING".

Alternatively, you may use, distribute and copy this software under the terms
of the GNU General Public License version 2.  The full GNU General Public
License version 2 can be found in the file "GPL-COPYING".

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

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
 


