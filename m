Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD8DCE00569
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 07:18:45 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKFIi0d021343
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 09:18:44 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKFIiRA012631
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 09:18:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 09:18:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKFIhfu002644;
	Wed, 20 Nov 2013 09:18:43 -0600
Date: Wed, 20 Nov 2013 10:18:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131120151843.GB29952@edge>
References: <20131120110538.GA22903@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FD3F@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015983FD3F@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH] ipc: IPC for communication between multiple processors
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
X-List-Received-Date: Wed, 20 Nov 2013 15:18:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

See my comments below.


On Wed, Nov 20, 2013 at 01:02:30PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
> >Sent: Wednesday, November 20, 2013 5:06 AM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH] ipc: IPC for communication between
> >multiple processors
> 
> I would recommend using --numbered in your patches and creating them as a 
> series to make it easier to determine the order in which they should be 
> applied.  For example this patch should come before you other patch for 
> libdce.

If you extract more than one patch with git-format-patch, then --numbered is 
used by default.


> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >---
> > ...nstallation-prefix-feature-to-products.ma.patch |   38
> >++++++++++++++++++++
> > recipes-ti/ipc/ti-ipc_3.10.00.08.bb                |   30
> >++++++++++++++++
> > 2 files changed, 68 insertions(+)
> > create mode 100644 recipes-ti/ipc/0001-ipc-Added-installation-
> >prefix-feature-to-products.ma.patch
> > create mode 100644 recipes-ti/ipc/ti-ipc_3.10.00.08.bb
> >
> >diff --git a/recipes-ti/ipc/0001-ipc-Added-installation-prefix-
> >feature-to-products.ma.patch b/recipes-ti/ipc/0001-ipc-Added-
> >installation-prefix-feature-to-products.ma.patch
> >new file mode 100644
> >index 0000000..7d5ff94
> >--- /dev/null
> >+++ b/recipes-ti/ipc/0001-ipc-Added-installation-prefix-feature-
> >to-products.ma.patch
> >@@ -0,0 +1,38 @@
> >+From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00
> >2001
> >+From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >+Date: Thu, 5 Sep 2013 17:01:15 +0530
> >+Subject: [PATCH] ipc: Added installation prefix feature to
> >products.mak
> 
> Can this be driven back into the IPC team to add to their makefile?
> 
> >+
> >+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >+---
> >+ ipc-linux.mak |    1 +
> >+ products.mak  |    1 +
> >+ 2 files changed, 2 insertions(+)
> >+
> >+diff --git a/ipc-linux.mak b/ipc-linux.mak
> >+index 788a5a2..01579e4 100644
> >+--- a/ipc-linux.mak
> >++++ b/ipc-linux.mak
> >+@@ -38,6 +38,7 @@ include products.mak
> >+ config:
> >+ 	@echo "Configuring Linux Ipc ..."
> >+ 	./configure --host=$(TOOLCHAIN_LONGNAME) \
> >++            --prefix=$(PREFIX) \
> >+             CC=$(TOOLCHAIN_PREFIX)gcc \
> >+             PLATFORM=$(PLATFORM) \
> >+             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
> 
> This line makes me think there is a dependency missing.  In the past 
> something like ti-paths.inc would pass this value along.  I'm not saying 
> that should be replicated as is, but likely you want to se this to 
> STAGING_DIR_TARGET or something similar and the cmem recipe should stage 
> appropriately.
> 
> I think it would be good if you walked through your software stack to make 
> sure you are sending your patches in order.  Likewise, there was some 
> discussion with Sam about cmem recipes and basically about aligning recipes 
> between your groups.  I thin the approach of breaking linux-utils up into a 
> recipe per component is going to be the cleanest approach.  I'll ping on 
> Sam's patches as well to get an update posted to meta-ti instead of 
> meta-arago list.
> 
> Any pointers you can provide to documentation about the configuration and 
> building of these components you are pushing up would also be useful to help 
> in reviewing so we can understand what you are trying to accomplish.

Nice catch. The first question - does it depend and require cmem?


> >+diff --git a/products.mak b/products.mak
> >+index e418d2f..4578a1e 100644
> >+--- a/products.mak
> >++++ b/products.mak
> >+@@ -55,6 +55,7 @@ PLATFORM ?=
> >+ TOOLCHAIN_LONGNAME ?= arm-none-linux-gnueabi
> >+ TOOLCHAIN_INSTALL_DIR ?= $(DEPOT)/_your_arm_code_gen_install_
> >+ TOOLCHAIN_PREFIX ?=
> >$(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
> >++PREFIX ?= /usr/local
> >+
> >+ # Optional: Path to Linux Kernel - needed to build the MmRpc
> >user libraries
> >+ # (for devices that support it)
> >+--
> >+1.7.9.5
> >+
> >diff --git a/recipes-ti/ipc/ti-ipc_3.10.00.08.bb b/recipes-
> >ti/ipc/ti-ipc_3.10.00.08.bb
> >new file mode 100644
> >index 0000000..645061d
> >--- /dev/null
> >+++ b/recipes-ti/ipc/ti-ipc_3.10.00.08.bb
> >@@ -0,0 +1,30 @@
> >+DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms
> >(for Uni- and Multi- Processor Configurations)"
> >+HOMEPAGE = "https://git.ti.com/ipc/pages/Home"
> >+LICENSE = "BSD"
> >+
> >+PV = "3_10_00_08"
> 
> I don't think you want to do this.  Why not leave the version . separated?

This is actually more critical than that. Don't use underscores in the 
recipe/package version! If the component requires undersocred version, pass it 
separately.


> >+PR = "r0"
> >+
> >+LIC_FILES_CHKSUM = "file://${S}/ipc-
> >linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02
> >edc"
> >+
> >+PLATFORM_omap5-evm = "omap54xx_smp"
> >+PLATFORM_dra7xx-evm = "dra7xx"
> >+
> >+inherit autotools pkgconfig
> >+
> >+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
> >+           file://0001-ipc-Added-installation-prefix-feature-to-
> >products.ma.patch \
> >+           "
> >+SRCREV = "b11251f705f84f32740cd288afe9281e653bd8eb"
> 
> Any need for a BRANCH setting?

Well, it's not a required variables - as a matter of fact, I invented it 
years ago and since it's useful in many cases, it just stuck around... :)


> >+S = "${WORKDIR}/git"
> >+
> >+do_configure() {
> >+	sed -i -e "s#^KERNEL_INSTALL_DIR ?=.*#KERNEL_INSTALL_DIR =
> >${STAGING_KERNEL_DIR}#" ${S}/products.mak
> >+	sed -i -e "s#^TOOLCHAIN_INSTALL_DIR
> >?=.*#TOOLCHAIN_INSTALL_DIR = ${TOOLCHAIN_PATH}#" ${S}/products.mak
> >+	sed -i -e "s#^TOOLCHAIN_LONGNAME ?=.*#TOOLCHAIN_LONGNAME =
> >arm-linux-gnueabihf#" ${S}/products.mak
> >+	sed -i -e "s#^PLATFORM ?=.*#PLATFORM = ${PLATFORM}#"
> >${S}/products.mak
> >+	sed -i -e "s#^PREFIX ?=.*#PREFIX = /usr#" ${S}/products.mak
> 
> Is there a way to drive this back into the IPC team to allow you to pass 
> these values and have them picked up from the command line, rather than 
> using a lot of sed commands?  History has shown in the past that this gets 
> ugly to maintain.

From what I can see, the above variables are being assigned conditionally in 
the Makefile (uses ?=), meaning that IPC team is already provinding a way to 
cleanly pass those variables from outside. So, there's no need to sed those 
vars! You are meant to pass them on the command line to oe_runmake...

-- 
Denys

