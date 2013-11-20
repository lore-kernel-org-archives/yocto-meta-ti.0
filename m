Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C97D1E0055C
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 05:02:32 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKD2VfO015848
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 07:02:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKD2VIM007160
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 07:02:31 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 20 Nov 2013 07:02:31 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>, "Ring, Chris" <cring@ti.com>, "Nelson, Sam"
	<sam.nelson@ti.com>
Thread-Topic: [meta-ti] [PATCH] ipc: IPC for communication between multiple
	processors
Thread-Index: AQHO5eB852jD+SqeRUW99LzvV4ZNSJouETDg
Date: Wed, 20 Nov 2013 13:02:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015983FD3F@DLEE11.ent.ti.com>
References: <20131120110538.GA22903@ti.com>
In-Reply-To: <20131120110538.GA22903@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ipc: IPC for communication between multiple	processors
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
X-List-Received-Date: Wed, 20 Nov 2013 13:02:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Wednesday, November 20, 2013 5:06 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] ipc: IPC for communication between
>multiple processors

I would recommend using --numbered in your patches and creating them as a s=
eries to make it easier to determine the order in which they should be appl=
ied.  For example this patch should come before you other patch for libdce.

>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> ...nstallation-prefix-feature-to-products.ma.patch |   38
>++++++++++++++++++++
> recipes-ti/ipc/ti-ipc_3.10.00.08.bb                |   30
>++++++++++++++++
> 2 files changed, 68 insertions(+)
> create mode 100644 recipes-ti/ipc/0001-ipc-Added-installation-
>prefix-feature-to-products.ma.patch
> create mode 100644 recipes-ti/ipc/ti-ipc_3.10.00.08.bb
>
>diff --git a/recipes-ti/ipc/0001-ipc-Added-installation-prefix-
>feature-to-products.ma.patch b/recipes-ti/ipc/0001-ipc-Added-
>installation-prefix-feature-to-products.ma.patch
>new file mode 100644
>index 0000000..7d5ff94
>--- /dev/null
>+++ b/recipes-ti/ipc/0001-ipc-Added-installation-prefix-feature-
>to-products.ma.patch
>@@ -0,0 +1,38 @@
>+From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00
>2001
>+From: Mrinmayee Hingolikar <mrinmayee@ti.com>
>+Date: Thu, 5 Sep 2013 17:01:15 +0530
>+Subject: [PATCH] ipc: Added installation prefix feature to
>products.mak

Can this be driven back into the IPC team to add to their makefile?

>+
>+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>+---
>+ ipc-linux.mak |    1 +
>+ products.mak  |    1 +
>+ 2 files changed, 2 insertions(+)
>+
>+diff --git a/ipc-linux.mak b/ipc-linux.mak
>+index 788a5a2..01579e4 100644
>+--- a/ipc-linux.mak
>++++ b/ipc-linux.mak
>+@@ -38,6 +38,7 @@ include products.mak
>+ config:
>+ 	@echo "Configuring Linux Ipc ..."
>+ 	./configure --host=3D$(TOOLCHAIN_LONGNAME) \
>++            --prefix=3D$(PREFIX) \
>+             CC=3D$(TOOLCHAIN_PREFIX)gcc \
>+             PLATFORM=3D$(PLATFORM) \
>+             CMEM_INSTALL_DIR=3D$(CMEM_INSTALL_DIR) \

This line makes me think there is a dependency missing.  In the past someth=
ing like ti-paths.inc would pass this value along.  I'm not saying that sho=
uld be replicated as is, but likely you want to se this to STAGING_DIR_TARG=
ET or something similar and the cmem recipe should stage appropriately.

I think it would be good if you walked through your software stack to make =
sure you are sending your patches in order.  Likewise, there was some discu=
ssion with Sam about cmem recipes and basically about aligning recipes betw=
een your groups.  I thin the approach of breaking linux-utils up into a rec=
ipe per component is going to be the cleanest approach.  I'll ping on Sam's=
 patches as well to get an update posted to meta-ti instead of meta-arago l=
ist.

Any pointers you can provide to documentation about the configuration and b=
uilding of these components you are pushing up would also be useful to help=
 in reviewing so we can understand what you are trying to accomplish.

>+diff --git a/products.mak b/products.mak
>+index e418d2f..4578a1e 100644
>+--- a/products.mak
>++++ b/products.mak
>+@@ -55,6 +55,7 @@ PLATFORM ?=3D
>+ TOOLCHAIN_LONGNAME ?=3D arm-none-linux-gnueabi
>+ TOOLCHAIN_INSTALL_DIR ?=3D $(DEPOT)/_your_arm_code_gen_install_
>+ TOOLCHAIN_PREFIX ?=3D
>$(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
>++PREFIX ?=3D /usr/local
>+
>+ # Optional: Path to Linux Kernel - needed to build the MmRpc
>user libraries
>+ # (for devices that support it)
>+--
>+1.7.9.5
>+
>diff --git a/recipes-ti/ipc/ti-ipc_3.10.00.08.bb b/recipes-
>ti/ipc/ti-ipc_3.10.00.08.bb
>new file mode 100644
>index 0000000..645061d
>--- /dev/null
>+++ b/recipes-ti/ipc/ti-ipc_3.10.00.08.bb
>@@ -0,0 +1,30 @@
>+DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms
>(for Uni- and Multi- Processor Configurations)"
>+HOMEPAGE =3D "https://git.ti.com/ipc/pages/Home"
>+LICENSE =3D "BSD"
>+
>+PV =3D "3_10_00_08"

I don't think you want to do this.  Why not leave the version . separated?

>+PR =3D "r0"
>+
>+LIC_FILES_CHKSUM =3D "file://${S}/ipc-
>linux.mak;beginline=3D1;endline=3D30;md5=3Df2518e421e230f06fe6d449718d02
>edc"
>+
>+PLATFORM_omap5-evm =3D "omap54xx_smp"
>+PLATFORM_dra7xx-evm =3D "dra7xx"
>+
>+inherit autotools pkgconfig
>+
>+SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit \
>+           file://0001-ipc-Added-installation-prefix-feature-to-
>products.ma.patch \
>+           "
>+SRCREV =3D "b11251f705f84f32740cd288afe9281e653bd8eb"

Any need for a BRANCH setting?

>+
>+S =3D "${WORKDIR}/git"
>+
>+do_configure() {
>+	sed -i -e "s#^KERNEL_INSTALL_DIR ?=3D.*#KERNEL_INSTALL_DIR =3D
>${STAGING_KERNEL_DIR}#" ${S}/products.mak
>+	sed -i -e "s#^TOOLCHAIN_INSTALL_DIR
>?=3D.*#TOOLCHAIN_INSTALL_DIR =3D ${TOOLCHAIN_PATH}#" ${S}/products.mak
>+	sed -i -e "s#^TOOLCHAIN_LONGNAME ?=3D.*#TOOLCHAIN_LONGNAME =3D
>arm-linux-gnueabihf#" ${S}/products.mak
>+	sed -i -e "s#^PLATFORM ?=3D.*#PLATFORM =3D ${PLATFORM}#"
>${S}/products.mak
>+	sed -i -e "s#^PREFIX ?=3D.*#PREFIX =3D /usr#" ${S}/products.mak

Is there a way to drive this back into the IPC team to allow you to pass th=
ese values and have them picked up from the command line, rather than using=
 a lot of sed commands?  History has shown in the past that this gets ugly =
to maintain.

>+
>+	make -f ${S}/ipc-linux.mak config
>+}
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

