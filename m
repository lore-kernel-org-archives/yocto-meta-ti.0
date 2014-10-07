Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A42BE007C1; Tue,  7 Oct 2014 12:52:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D5DEE0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:52:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97JqXEu022151
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 14:52:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97JqXtm005050
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 14:52:33 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 14:52:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97JqXAV001326;
	Tue, 7 Oct 2014 14:52:33 -0500
Date: Tue, 7 Oct 2014 15:52:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20141007195228.GI1731@edge>
References: <1412169273-30215-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F958140B4773@DFLE09.ent.ti.com>
	<20141001204110.GX6303@edge>
	<4B26FB5A64EBA14C87266869E037F958140B4963@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958140B4963@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy][PATCH v2] ti-ipc: Upgrade to IPC 3.30.00.09
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
X-List-Received-Date: Tue, 07 Oct 2014 19:52:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Try specifying smtp server, per Sam's comment.

I understand that your patches to meta-arago have no issues, but meta-ti is 
handled by a different server, so maybe some settings are a bit stricter.

Unfortunately, the way Patchwork captures your patches from the "ping" email 
makes them corrupt and they won't apply...

-- 
Denys


On Thu, Oct 02, 2014 at 06:39:37AM -0400, Stiffler, Jacob wrote:
> I am not sure what is happening. I am using the same procedure as with 
> patches sent to the meta-arago list, which works fine.
> 
> I am using the git-send-email format suggested on 
> (http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded):
> 
> $ git send-email --to=<email_addr> --confirm=always -M -1
> 
> 
> - Jake
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, October 01, 2014 4:41 PM
> To: Stiffler, Jacob
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [daisy][PATCH v2] ti-ipc: Upgrade to IPC 3.30.00.09
> 
> Jake,
> 
> Why are you patches not being sent to meta-ti list? Do you get any error messages? I assume you are sending them with git-send-email?
> 
> --
> Denys
> 
> 
> On Wed, Oct 01, 2014 at 01:35:20PM +0000, Stiffler, Jacob wrote:
> > ping
> > 
> > -----Original Message-----
> > From: Stiffler, Jacob 
> > Sent: Wednesday, October 01, 2014 9:15 AM
> > To: meta-ti@yoctoproject.org
> > Cc: Stiffler, Jacob
> > Subject: [daisy][PATCH v2] ti-ipc: Upgrade to IPC 3.30.00.09
> > 
> > * Added new recipe for latest IPC
> > * Removed older recipe versions
> > * Latest recipe points to IPC 3.30.00.09
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  ...nstallation-prefix-feature-to-products.ma.patch |   38 ------------------
> >  recipes-ti/ipc/ti-ipc/ipc.pc                       |    8 ----
> >  recipes-ti/ipc/ti-ipc_1.24.00.16.bb                |   41 --------------------
> >  recipes-ti/ipc/ti-ipc_3.00.00.bb                   |    7 ----
> >  recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |    4 --
> >  recipes-ti/ipc/{ti-ipc.inc => ti-ipc_git.bb}       |   26 +++++++------
> >  6 files changed, 15 insertions(+), 109 deletions(-)  delete mode 100644 recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
> >  delete mode 100644 recipes-ti/ipc/ti-ipc/ipc.pc  delete mode 100644 recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> >  delete mode 100644 recipes-ti/ipc/ti-ipc_3.00.00.bb  delete mode 100644 recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> >  rename recipes-ti/ipc/{ti-ipc.inc => ti-ipc_git.bb} (75%)
> > 
> > diff --git a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
> > deleted file mode 100644
> > index 58d77c7..0000000
> > --- a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00 2001
> > -From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > -Date: Thu, 5 Sep 2013 17:01:15 +0530
> > -Subject: [PATCH] ipc: Added installation prefix feature to products.mak
> > -
> > -Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > ----
> > - ipc-linux.mak |    1 +
> > - products.mak  |    1 +
> > - 2 files changed, 2 insertions(+)
> > -
> > -diff --git a/ipc-linux.mak b/ipc-linux.mak -index 788a5a2..01579e4 100644
> > ---- a/ipc-linux.mak
> > -+++ b/ipc-linux.mak
> > -@@ -38,6 +38,7 @@ include products.mak
> > - config:
> > - 	@echo "Configuring Linux Ipc ..."
> > - 	./configure --host=$(TOOLCHAIN_LONGNAME) \
> > -+            --prefix=$(PREFIX) \
> > -             CC=$(TOOLCHAIN_PREFIX)gcc \
> > -             PLATFORM=$(PLATFORM) \
> > -             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
> > -diff --git a/products.mak b/products.mak -index e418d2f..4578a1e 100644
> > ---- a/products.mak
> > -+++ b/products.mak
> > -@@ -55,6 +55,7 @@ PLATFORM ?=
> > - TOOLCHAIN_LONGNAME = arm-none-linux-gnueabi
> > - TOOLCHAIN_INSTALL_DIR = $(DEPOT)/_your_arm_code_gen_install_
> > - TOOLCHAIN_PREFIX = $(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
> > -+PREFIX = /usr/local
> > -
> > - # Optional: Path to Linux Kernel - needed to build the MmRpc user libraries
> > - # (for devices that support it)
> > ---
> > -1.7.9.5
> > -
> > diff --git a/recipes-ti/ipc/ti-ipc/ipc.pc b/recipes-ti/ipc/ti-ipc/ipc.pc deleted file mode 100644 index 1a8c52d..0000000
> > --- a/recipes-ti/ipc/ti-ipc/ipc.pc
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -prefix=/../../ipc_@VERSION@
> > -includedir=${prefix}/ti/ipc
> > -
> > -Name: TI IPC
> > -Description: TI ARM-DSP IPC (Inter Processor Communication)
> > -Version: @VERSION@
> > -Requires: 
> > -Cflags: -I${includedir}
> > diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> > deleted file mode 100644
> > index 420d0f7..0000000
> > --- a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
> > -HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
> > -SECTION = "devel"
> > -LICENSE = "BSD" 
> > -LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
> > -
> > -
> > -require ../includes/ti-paths.inc
> > -require ../includes/ti-staging.inc
> > -require ../includes/ti-eula-unpack.inc
> > -
> > -PV = "1_24_00_16"
> > -
> > -S = "${WORKDIR}/ipc_${PV}"
> > -
> > -SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=ipcbin \
> > -           file://ipc.pc"
> > -
> > -DEPENDS = "ti-sysbios ti-cgt6x ti-xdctools"
> > -
> > -BINFILE="ipc_setuplinux_${PV}.bin"
> > -TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
> > -
> > -do_configure() {
> > -    sed -i -e s:@VERSION@:${PV}:g ${WORKDIR}/ipc.pc
> > -    
> > -    cp ${WORKDIR}/ipc.pc ${S}
> > -}
> > -
> > -do_install() {
> > -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> > -   
> > -    install -d ${D}/${libdir}/pkgconfig
> > -    install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
> > -}
> > -
> > -FILES_${PN}-dev = "${libdir}/*"
> > -
> > -SRC_URI[ipcbin.md5sum] = "d2f7cc82310d555ca039dcd353bd94c5"
> > -SRC_URI[ipcbin.sha256sum] = "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c9fb9ca0f8a9b681aa5396"
> > diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-ipc_3.00.00.bb
> > deleted file mode 100644
> > index a6922c0..0000000
> > --- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -require ti-ipc.inc
> > -
> > -# For this version of IPC the PLATFORM value is lowercase -PLATFORM_keystone = "tci6638"
> > -
> > -# The following commit corresponds to 3.00.04.29 -SRCREV = "12794ea33870b782bffe1fe4398e86e93fb64396"
> > diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > deleted file mode 100644
> > index 17cdab0..0000000
> > --- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -require ti-ipc.inc
> > -
> > -# This commit corresponds to 3.21.00.07 -SRCREV = "c18fece0c9f0dc76361dc1ee11b7ee2417479847"
> > diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc_git.bb similarity index 75% rename from recipes-ti/ipc/ti-ipc.inc rename to recipes-ti/ipc/ti-ipc_git.bb index 860f55f..185e58b 100644
> > --- a/recipes-ti/ipc/ti-ipc.inc
> > +++ b/recipes-ti/ipc/ti-ipc_git.bb
> > @@ -2,11 +2,22 @@ DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Mul  HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
> >  
> >  LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
> > +LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f156e5eb9b0f3e202e48747f9a"
> >  
> >  DEPENDS += "virtual/kernel"
> >  
> > -PR = "r1"
> > +PV = "3.30.00.09"
> > +
> > +# This is the first version of the 3.30.00.09 # PR = "r0"
> > +
> > +BRANCH = "master"
> > +SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
> > +           file://tiipclad-daemon.sh \
> > +           "
> > +SRCREV = "595bc3e3bbb2e7ec12a8287145d8e3929291e59d"
> > +
> > +S = "${WORKDIR}/git"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -22,20 +33,13 @@ DAEMON_keystone = "lad_tci6638"
> >  
> >  inherit autotools pkgconfig update-rc.d
> >  
> > -SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
> > -           file://0002-ipc-Added-installation-prefix-feature-to-products.ma.patch \
> > -           file://tiipclad-daemon.sh \
> > -           "
> > -
> > -S = "${WORKDIR}/git"
> > -
> >  INITSCRIPT_NAME = "tiipclad-daemon.sh"
> >  INITSCRIPT_PARAMS = "defaults 10"
> >  
> > -EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_INSTALL_DIR=${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=${TOOLCHAIN_SYS} PLATFORM=${PLATFORM} PREFIX=${prefix}"
> > +EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}"
> >  
> >  do_configure() {
> > -    oe_runmake -f ${S}/ipc-linux.mak config
> > +    oe_runconf
> >  }
> >  
> >  do_install_append() {
> > --
> > 1.7.9.5
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

