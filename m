Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA87CE01528
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 10:11:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NHBgwP003571
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 12:11:42 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NHBfbJ004039
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 12:11:42 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 12:11:41 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NHBf0E027036;
	Tue, 23 Jul 2013 12:11:41 -0500
Date: Tue, 23 Jul 2013 13:11:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130723171141.GO31158@edge>
References: <20130701123138.GA16101@ti.com>
	<7D46E86EC0A8354091174257B2FED1015962B49B@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015962B49B@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] recipes-bsp: Add recipe for PowerVR SGX544MP2 kernel drivers
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
X-List-Received-Date: Tue, 23 Jul 2013 17:11:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping for addressing Chase's comments?

On Mon, Jul 01, 2013 at 01:41:43PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
> >Sent: Monday, July 01, 2013 7:32 AM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 1/2] recipes-bsp: Add recipe for PowerVR
> >SGX544MP2 kernel drivers
> >
> >* The PowerVR SGX544MP2 is found on omap5 and dra7xx devices. This
> >  recipe adds support for the PowerVR graphics subsystem.
> >
> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >---
> > .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   42
> >++++++++++++++++++++
> > 1 files changed, 42 insertions(+), 0 deletions(-)
> > create mode 100644 recipes-bsp/powervr-drivers/omapdrm-
> >pvr_1.9.2253347.bb
> >
> >diff --git a/recipes-bsp/powervr-drivers/omapdrm-
> >pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-
> >pvr_1.9.2253347.bb
> >new file mode 100644
> >index 0000000..edb2682
> >--- /dev/null
> >+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> >@@ -0,0 +1,42 @@
> >+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found
> >in the omap5 SoCs"
> >+HOMEPAGE = "http://git.ti.com"
> >+LICENSE = "GPLv2"
> >+
> >+LIC_FILES_CHKSUM = "file://MIT-
> >COPYING;md5=8c2810fa6bfdc5ae5c15a0c1ade34054"
> 
> I see an issue with you setting the LICENSE to GPLv2 but having the file you 
> are checking be MIT-COPYING.  This seems wrong.
> 
> >+
> >+inherit module
> >+
> >+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-
> >linux.git;protocol=git"
> >+S = "${WORKDIR}/git"
> >+
> >+SRCREV = "6668f4ea0bbf7e3df7f72dc2230ab8da1e748b2d"
> >+PR = "${MACHINE_KERNEL_PR}"
> >+
> >+do_compile() {
> >+    cd ${S}/eurasiacon/build/linux2/omap5430_linux
> >+    oe_runmake KERNELDIR="${STAGING_KERNEL_DIR}"
> >+}
> 
> I think you could do a do_compile_prepend here to perform the cd command and 
> set EXTRA_OEMAKE to include the KERNELDIR setting.  That way you don't have 
> to override the entire do_compile function.
> 
> >+
> >+do_install() {
> >+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
> >+    cp
> >${S}/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapd
> >rm_pvr.ko \
> >+    ${D}/lib/modules/${KERNEL_VERSION}/extra/
> >+}
> 
> Can you not use the default do_install in the module.bbclass?  As long as 
> your makefile can handle modules_install you should be fine here.
> 
> >+
> >+FILES_omapdrm-pvr =
> >"/lib/modules/${KERNEL_VERSION}/extra/omapdrm_pvr.ko"
> 
> The FILES setting in module.bbclass should pick this us out of /lib/modules
> 
> >+RDEPENDS_omapdrm-pvr += "update-modules"
> 
> This RDEPENDS is already part of module.bbclass
> 
> >+
> >+pkg_postinst_omapdrm-pvr () {
> >+#!/bin/sh
> >+if [ -n "$D" ]; then
> >+        exit 1
> >+fi
> >+
> >+depmod -a
> >+update-modules || true
> >+}
> >+
> >+pkg_postrm_omapdrm-pvr () {
> >+#!/bin/sh
> >+update-modules || true
> 
> Why did you need to define these functions?  The module.bbclass that you 
> inherit already has:
> 
> pkg_postinst_append () {
> if [ -z "$D" ]; then
>     depmod -a
>     update-modules || true
> fi
> }
> 
> pkg_postrm_append () {
> update-modules || true
> }
> 
> Won't these work for you?
> 
> >+}
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

