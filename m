Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26E56E01732
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 06:00:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9LD0IrL009249
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 08:00:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9LD0Iw0028413
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 08:00:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 21 Oct 2013 08:00:18 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9LD0HVv012923	for
	<meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 08:00:17 -0500
Date: Mon, 21 Oct 2013 18:30:16 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131021130016.GA6062@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv2] linux-ti-glsdk: Update to latest fixes
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
X-List-Received-Date: Mon, 21 Oct 2013 13:00:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

v1:
 * Kernel source migration from git.ti.com to omapzoom.org. The development
   tree is shared between the Linux and Android teams.This enables a common
   kernel development platform for both the teams for better alignment.
 * Add support for VIP and VPE
 * Add wilink/wlan support
 * Enable rpmsg/remoteproc driver for multimedia

v2:
 * Add conditional assignment for BRANCH and SRCREV

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 9e3e499..35d55df 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -18,14 +18,14 @@ DEFAULT_PREFERENCE = "-1"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "master"
+BRANCH ?= "p-ti-glsdk-3.8.y"
 
-SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
+SRCREV ?= "cc16f99176bf083829c028f9af5b8eb560debcc1"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.omapzoom.org/kernel/omap.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
-- 
1.7.9.5


