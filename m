Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7B72E00BB7
	for <meta-ti@yoctoproject.org>; Mon, 14 Apr 2014 06:54:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3EDsuIw017868;
	Mon, 14 Apr 2014 08:54:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EDsuBi015453;
	Mon, 14 Apr 2014 08:54:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Apr 2014 08:54:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EDst3o026957;
	Mon, 14 Apr 2014 08:54:56 -0500
Date: Mon, 14 Apr 2014 09:54:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140414135455.GZ12929@edge>
References: <1397447422-6936-1-git-send-email-denis@denix.org>
	<1397447422-6936-2-git-send-email-denis@denix.org>
	<CAMKF1spaW8peXjQSd7rDSzn8CMe6zt8FcPOGyOq+oOHEWK05kg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spaW8peXjQSd7rDSzn8CMe6zt8FcPOGyOq+oOHEWK05kg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 2/2] linux-ti-staging: add baseport, connectivity, ipc and systest config fragments
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
X-List-Received-Date: Mon, 14 Apr 2014 13:54:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Apr 13, 2014 at 09:22:32PM -0700, Khem Raj wrote:
> On Apr 13, 2014 5:51 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../linux/linux-ti-staging/baseport_defconfig        |  8 ++++++++
> >  .../linux/linux-ti-staging/connectivity_defconfig    | 14 ++++++++++++++
> >  recipes-kernel/linux/linux-ti-staging/defconfig      |  4 ++++
> >  recipes-kernel/linux/linux-ti-staging/ipc_defconfig  | 18
> ++++++++++++++++++
> >  .../linux/linux-ti-staging/systest_defconfig         | 20
> ++++++++++++++++++++
> >  recipes-kernel/linux/linux-ti-staging_3.12.bb        |  6 +++++-
> >  6 files changed, 69 insertions(+), 1 deletion(-)
> >  create mode 100644
> recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> >  create mode 100644
> recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> >  create mode 100644
> recipes-kernel/linux/linux-ti-staging/systest_defconfig
> 
> should they be called with .cfg extension ?

Doesn't really matter. To match linux-yocto, they could have an extension, but 
it's not really required.


> > diff --git a/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> > new file mode 100644
> > index 0000000..8dc24af
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> > @@ -0,0 +1,8 @@
> > +##################################################
> > +# Baseport Config Options
> > +##################################################
> > +CONFIG_CRYPTO_HW=y
> > +CONFIG_CRYPTO_DEV_OMAP_AES=y
> > +CONFIG_CRYPTO_DEV_OMAP_SHAM=y
> > +CONFIG_CRYPTO_TEST=m
> > +CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
> > diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> > new file mode 100644
> > index 0000000..bf18dae
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> > @@ -0,0 +1,14 @@
> > +##################################################
> > +# Connectivity Configs
> > +##################################################
> > +CONFIG_MTD_NAND_OMAP_BCH=y
> > +CONFIG_MTD_TESTS=m
> > +CONFIG_SPI_SPIDEV=y
> > +CONFIG_USB_TEST=m
> > +CONFIG_USB_ACM=y
> > +CONFIG_USB_SERIAL_PL2303=y
> > +CONFIG_USB_PRINTER=y
> > +CONFIG_USB_NET_AX8817X=y
> > +CONFIG_USB_G_MULTI=m
> > +CONFIG_USB_G_MULTI_RNDIS=y
> > +CONFIG_USB_G_MULTI_CDC=y
> > diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig
> b/recipes-kernel/linux/linux-ti-staging/defconfig
> > index 926b35a..2a920e8 100644
> > --- a/recipes-kernel/linux/linux-ti-staging/defconfig
> > +++ b/recipes-kernel/linux/linux-ti-staging/defconfig
> > @@ -1 +1,5 @@
> >  use-kernel-config=omap2plus_defconfig
> > +config-fragment=baseport_defconfig
> > +config-fragment=connectivity_defconfig
> > +config-fragment=systest_defconfig
> > +config-fragment=ipc_defconfig
> > diff --git a/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> > new file mode 100644
> > index 0000000..645dfdf
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> > @@ -0,0 +1,18 @@
> > +##################################################
> > +# IPC config options
> > +##################################################
> > +CONFIG_IOMMU_API=y
> > +CONFIG_IOMMU_SUPPORT=y
> > +CONFIG_OF_IOMMU=y
> > +CONFIG_OMAP_IOMMU=y
> > +CONFIG_OMAP_IOVMM=y
> > +CONFIG_OMAP_IOMMU_DEBUG=y
> > +CONFIG_VIRTIO=m
> > +CONFIG_RPMSG=m
> > +CONFIG_RPMSG_RPC=m
> > +CONFIG_REMOTEPROC=m
> > +CONFIG_OMAP_REMOTEPROC=m
> > +CONFIG_OMAP_REMOTEPROC_IPU=y
> > +CONFIG_OMAP_REMOTEPROC_DSP=y
> > +CONFIG_OMAP_REMOTEPROC_IPU1=y
> > +CONFIG_OMAP_REMOTEPROC_DSP2=y
> > diff --git a/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> > new file mode 100644
> > index 0000000..e21602f
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> > @@ -0,0 +1,20 @@
> > +##################################################
> > +# Systest config options
> > +##################################################
> > +CONFIG_DEBUG_SPINLOCK=y
> > +CONFIG_DEBUG_MUTEXES=y
> > +CONFIG_DEBUG_KMEMLEAK=y
> > +CONFIG_DEVKMEM=y
> > +CONFIG_HAVE_DEBUG_KMEMLEAK=y
> > +CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
> > +CONFIG_DEBUG_KMEMLEAK_TEST=n
> > +CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
> > +CONFIG_DEBUG_LOCK_ALLOC=y
> > +CONFIG_DEBUG_INFO=y
> > +CONFIG_DEBUG_FS=y
> > +CONFIG_DEBUG_KERNEL=y
> > +CONFIG_PM_DEBUG=y
> > +CONFIG_DEBUG_GPIO=y
> > +CONFIG_USB_DEBUG=y
> > +CONFIG_SND_DEBUG=y
> > +CONFIG_RTC_DEBUG=y
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bbb/recipes-kernel/linux/
> linux-ti-staging_3.12.bb
> > index 96be621..704d96b 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> > @@ -40,11 +40,15 @@ SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
> >  PV = "3.12.17"
> >
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild
> > -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> >  PR = "${MACHINE_KERNEL_PR}"
> >
> >  SRC_URI = "git://
> git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}\
> >             file://defconfig \
> > +           file://baseport_defconfig \
> > +           file://connectivity_defconfig \
> > +           file://ipc_defconfig \
> > +           file://systest_defconfig \
> >            "
> >
> >  # Disable SMP in defconfig on single-core platforms to reduce overhead
> > --
> > 1.9.2
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


