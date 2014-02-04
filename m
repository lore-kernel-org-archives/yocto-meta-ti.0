Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 700C7E00764
	for <meta-ti@yoctoproject.org>; Tue,  4 Feb 2014 15:15:39 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s14NFbAS006481
	for <meta-ti@yoctoproject.org>; Tue, 4 Feb 2014 17:15:38 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14NFbP5017469
	for <meta-ti@yoctoproject.org>; Tue, 4 Feb 2014 17:15:37 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 4 Feb 2014 17:15:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14NFbjZ028473;
	Tue, 4 Feb 2014 17:15:37 -0600
Date: Tue, 4 Feb 2014 18:15:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140204231536.GJ18784@edge>
References: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED10159948C34@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159948C34@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3] linux-keystone: Update to linux kernel version	3.10
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
X-List-Received-Date: Tue, 04 Feb 2014 23:15:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 04, 2014 at 10:41:46PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> >Sent: Tuesday, February 04, 2014 2:17 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH v3] linux-keystone: Update to linux
> >kernel version 3.10
> >
> >- Updated Source URL & version
> >- Added device tree file
> >- Added LOADADDR extra args
> >
> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> >---
> >Changes from last revision of patch
> >- Added LOADADDR extra args
> >- Name change to from 3.10.10--> 3.10
> >---
> >---
> > .../defconfig                                      |    0
> > ...ux-keystone_3.8.4.bb => linux-keystone_3.10.bb} |   26
> >+++++++++++---------
> > 2 files changed, 15 insertions(+), 11 deletions(-)
> > rename recipes-kernel/linux/{linux-keystone-3.8.4 => linux-
> >keystone-3.10}/defconfig (100%)
> > rename recipes-kernel/linux/{linux-keystone_3.8.4.bb => linux-
> >keystone_3.10.bb} (59%)
> >
> >diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> >b/recipes-kernel/linux/linux-keystone-3.10/defconfig
> >similarity index 100%
> >rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> >rename to recipes-kernel/linux/linux-keystone-3.10/defconfig
> >diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb
> >b/recipes-kernel/linux/linux-keystone_3.10.bb
> >similarity index 59%
> >rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
> >rename to recipes-kernel/linux/linux-keystone_3.10.bb
> >index d176f14..3ddd195 100644
> >--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
> >+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> >@@ -3,26 +3,30 @@ DESCRIPTION = "Linux kernel for TI Keystone
> >devices"
> > LICENSE = "GPLv2"
> > LIC_FILES_CHKSUM =
> >"file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> >
> >+COMPATIBLE_MACHINE = "keystone"
> >+
> > inherit kernel
> >
> > require recipes-kernel/linux/linux-dtb.inc
> > require recipes-kernel/linux/setup-defconfig.inc
> >
> >+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> >+PR = "${MACHINE_KERNEL_PR}"
> >+
> > KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
> >
> >-COMPATIBLE_MACHINE = "keystone"
> >+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> >
> >-S = "${WORKDIR}/git"
> >+#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> >+SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> >
> >-BRANCH = "sept-2013/master"
> >+BRANCH = "master"
> >
> >-# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
> >-SRCREV = "20a48dc5309c4434650baef2b6072b5f1016f946"
> >+SRC_URI = "git://git.ti.com/keystone-
> >linux/linux.git;protocol=git;branch=${BRANCH}\
> >+           file://defconfig\
> >+           "
> >
> >-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
> >a rebuild
> >-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> >-PR = "${MACHINE_KERNEL_PR}"
> >+S = "${WORKDIR}/git"
> >+
> >+RDEPENDS_kernel-base = ""
> 
> Why are you blanking the RDEPENDS?  I'm not sure of the issue being fixed here.

To not have the huge vmlinux image in /boot directory on the rootfs - it's 
only needed for oprofile, kernel profiling and debuging. MCSDK instructs 
users to install the image manually from the package, if they need it.


> >-SRC_URI = "git://arago-project.org/git/projects/linux-
> >keystone.git;protocol=git;branch=${BRANCH}\
> >-           file://defconfig\
> >-          "
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

