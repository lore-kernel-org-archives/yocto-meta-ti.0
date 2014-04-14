Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0E6BE00BB7
	for <meta-ti@yoctoproject.org>; Mon, 14 Apr 2014 09:52:12 -0700 (PDT)
Received: by mail-ig0-f182.google.com with SMTP id uy17so3623580igb.9
	for <meta-ti@yoctoproject.org>; Mon, 14 Apr 2014 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cHiOV5cs8VSalpMlt9emc0AMvgRSpKg+VpX2KkdCZBs=;
	b=SYDUTRKpCrx0W3uRpn0ytjbqjkq5vjMSnya+MpZv42kxn4PxRIid5NPgwAkxo9a1s/
	PnB8ZgGqBANE0PTG0+fTBbhLHDQUkeVVX4cTQbpNHCWiJjKECtcxtYKgF4g5ijr6CrU7
	3xH3giie3DyurrZknYVW+cFXnNp+KvU8ZXNK1Ib4SxYL4PBG9/XTV477RoH5UzXzzfk9
	+h2a0uHjgPJtR5LpEMhnxr0N/wGzklbL8J+7nY2nggMrtqmJ+cxVcmcAMvupYh5/wJSS
	KJK1WGLZ6sL91uLpI2nC2HbTIpWusG2MnZckUu8N1O/kcLoKZJjN82Akk1bEk/Vq66U7
	QKAA==
MIME-Version: 1.0
X-Received: by 10.50.49.109 with SMTP id t13mr17824885ign.2.1397494331410;
	Mon, 14 Apr 2014 09:52:11 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 14 Apr 2014 09:52:11 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 14 Apr 2014 09:52:11 -0700 (PDT)
In-Reply-To: <20140414135455.GZ12929@edge>
References: <1397447422-6936-1-git-send-email-denis@denix.org>
	<1397447422-6936-2-git-send-email-denis@denix.org>
	<CAMKF1spaW8peXjQSd7rDSzn8CMe6zt8FcPOGyOq+oOHEWK05kg@mail.gmail.com>
	<20140414135455.GZ12929@edge>
Date: Mon, 14 Apr 2014 09:52:11 -0700
Message-ID: <CAMKF1srCvFWOnahh5NVinvyofRRyKKGpkxYxH=T0M+Hmz+Ptqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Mon, 14 Apr 2014 16:52:14 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1234330fd304f7038175

--047d7bdc1234330fd304f7038175
Content-Type: text/plain; charset=UTF-8

On Apr 14, 2014 3:54 AM, "Denys Dmytriyenko" <denys@ti.com> wrote:
>
> On Sun, Apr 13, 2014 at 09:22:32PM -0700, Khem Raj wrote:
> > On Apr 13, 2014 5:51 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../linux/linux-ti-staging/baseport_defconfig        |  8 ++++++++
> > >  .../linux/linux-ti-staging/connectivity_defconfig    | 14
++++++++++++++
> > >  recipes-kernel/linux/linux-ti-staging/defconfig      |  4 ++++
> > >  recipes-kernel/linux/linux-ti-staging/ipc_defconfig  | 18
> > ++++++++++++++++++
> > >  .../linux/linux-ti-staging/systest_defconfig         | 20
> > ++++++++++++++++++++
> > >  recipes-kernel/linux/linux-ti-staging_3.12.bb        |  6 +++++-
> > >  6 files changed, 69 insertions(+), 1 deletion(-)
> > >  create mode 100644
> > recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> > >  create mode 100644
> > recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> > >  create mode 100644
recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> > >  create mode 100644
> > recipes-kernel/linux/linux-ti-staging/systest_defconfig
> >
> > should they be called with .cfg extension ?
>
> Doesn't really matter. To match linux-yocto, they could have an
extension, but
> it's not really required.
>

yes however consistent naming would be helpful

>
> > > diff --git a/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> > b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> > > new file mode 100644
> > > index 0000000..8dc24af
> > > --- /dev/null
> > > +++ b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> > > @@ -0,0 +1,8 @@
> > > +##################################################
> > > +# Baseport Config Options
> > > +##################################################
> > > +CONFIG_CRYPTO_HW=y
> > > +CONFIG_CRYPTO_DEV_OMAP_AES=y
> > > +CONFIG_CRYPTO_DEV_OMAP_SHAM=y
> > > +CONFIG_CRYPTO_TEST=m
> > > +CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
> > > diff --git
a/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> > b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> > > new file mode 100644
> > > index 0000000..bf18dae
> > > --- /dev/null
> > > +++ b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> > > @@ -0,0 +1,14 @@
> > > +##################################################
> > > +# Connectivity Configs
> > > +##################################################
> > > +CONFIG_MTD_NAND_OMAP_BCH=y
> > > +CONFIG_MTD_TESTS=m
> > > +CONFIG_SPI_SPIDEV=y
> > > +CONFIG_USB_TEST=m
> > > +CONFIG_USB_ACM=y
> > > +CONFIG_USB_SERIAL_PL2303=y
> > > +CONFIG_USB_PRINTER=y
> > > +CONFIG_USB_NET_AX8817X=y
> > > +CONFIG_USB_G_MULTI=m
> > > +CONFIG_USB_G_MULTI_RNDIS=y
> > > +CONFIG_USB_G_MULTI_CDC=y
> > > diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig
> > b/recipes-kernel/linux/linux-ti-staging/defconfig
> > > index 926b35a..2a920e8 100644
> > > --- a/recipes-kernel/linux/linux-ti-staging/defconfig
> > > +++ b/recipes-kernel/linux/linux-ti-staging/defconfig
> > > @@ -1 +1,5 @@
> > >  use-kernel-config=omap2plus_defconfig
> > > +config-fragment=baseport_defconfig
> > > +config-fragment=connectivity_defconfig
> > > +config-fragment=systest_defconfig
> > > +config-fragment=ipc_defconfig
> > > diff --git a/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> > b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> > > new file mode 100644
> > > index 0000000..645dfdf
> > > --- /dev/null
> > > +++ b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> > > @@ -0,0 +1,18 @@
> > > +##################################################
> > > +# IPC config options
> > > +##################################################
> > > +CONFIG_IOMMU_API=y
> > > +CONFIG_IOMMU_SUPPORT=y
> > > +CONFIG_OF_IOMMU=y
> > > +CONFIG_OMAP_IOMMU=y
> > > +CONFIG_OMAP_IOVMM=y
> > > +CONFIG_OMAP_IOMMU_DEBUG=y
> > > +CONFIG_VIRTIO=m
> > > +CONFIG_RPMSG=m
> > > +CONFIG_RPMSG_RPC=m
> > > +CONFIG_REMOTEPROC=m
> > > +CONFIG_OMAP_REMOTEPROC=m
> > > +CONFIG_OMAP_REMOTEPROC_IPU=y
> > > +CONFIG_OMAP_REMOTEPROC_DSP=y
> > > +CONFIG_OMAP_REMOTEPROC_IPU1=y
> > > +CONFIG_OMAP_REMOTEPROC_DSP2=y
> > > diff --git a/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> > b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> > > new file mode 100644
> > > index 0000000..e21602f
> > > --- /dev/null
> > > +++ b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> > > @@ -0,0 +1,20 @@
> > > +##################################################
> > > +# Systest config options
> > > +##################################################
> > > +CONFIG_DEBUG_SPINLOCK=y
> > > +CONFIG_DEBUG_MUTEXES=y
> > > +CONFIG_DEBUG_KMEMLEAK=y
> > > +CONFIG_DEVKMEM=y
> > > +CONFIG_HAVE_DEBUG_KMEMLEAK=y
> > > +CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
> > > +CONFIG_DEBUG_KMEMLEAK_TEST=n
> > > +CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
> > > +CONFIG_DEBUG_LOCK_ALLOC=y
> > > +CONFIG_DEBUG_INFO=y
> > > +CONFIG_DEBUG_FS=y
> > > +CONFIG_DEBUG_KERNEL=y
> > > +CONFIG_PM_DEBUG=y
> > > +CONFIG_DEBUG_GPIO=y
> > > +CONFIG_USB_DEBUG=y
> > > +CONFIG_SND_DEBUG=y
> > > +CONFIG_RTC_DEBUG=y
> > > diff --git
a/recipes-kernel/linux/linux-ti-staging_3.12.bbb/recipes-kernel/linux/
> > linux-ti-staging_3.12.bb
> > > index 96be621..704d96b 100644
> > > --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> > > +++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> > > @@ -40,11 +40,15 @@ SRCREV =
"f0d4672333685697320f4907d5b4d3919121c299"
> > >  PV = "3.12.17"
> > >
> > >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > rebuild
> > > -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > > +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> > >  PR = "${MACHINE_KERNEL_PR}"
> > >
> > >  SRC_URI = "git://
> >
git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}\
> > >             file://defconfig \
> > > +           file://baseport_defconfig \
> > > +           file://connectivity_defconfig \
> > > +           file://ipc_defconfig \
> > > +           file://systest_defconfig \
> > >            "
> > >
> > >  # Disable SMP in defconfig on single-core platforms to reduce
overhead
> > > --
> > > 1.9.2
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--047d7bdc1234330fd304f7038175
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 14, 2014 3:54 AM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailt=
o:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Apr 13, 2014 at 09:22:32PM -0700, Khem Raj wrote:<br>
&gt; &gt; On Apr 13, 2014 5:51 PM, &quot;Denys Dmytriyenko&quot; &lt;<a hre=
f=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">=
denys@ti.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys=
@ti.com">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0.../linux/linux-ti-staging/baseport_defconfig =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A08 ++++++++<br>
&gt; &gt; &gt; =C2=A0.../linux/linux-ti-staging/connectivity_defconfig =C2=
=A0 =C2=A0| 14 ++++++++++++++<br>
&gt; &gt; &gt; =C2=A0recipes-kernel/linux/linux-ti-staging/defconfig =C2=A0=
 =C2=A0 =C2=A0| =C2=A04 ++++<br>
&gt; &gt; &gt; =C2=A0recipes-kernel/linux/linux-ti-staging/ipc_defconfig =
=C2=A0| 18<br>
&gt; &gt; ++++++++++++++++++<br>
&gt; &gt; &gt; =C2=A0.../linux/linux-ti-staging/systest_defconfig =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 20<br>
&gt; &gt; ++++++++++++++++++++<br>
&gt; &gt; &gt; =C2=A0recipes-kernel/linux/<a href=3D"http://linux-ti-stagin=
g_3.12.bb">linux-ti-staging_3.12.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
6 +++++-<br>
&gt; &gt; &gt; =C2=A06 files changed, 69 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; =C2=A0create mode 100644<br>
&gt; &gt; recipes-kernel/linux/linux-ti-staging/baseport_defconfig<br>
&gt; &gt; &gt; =C2=A0create mode 100644<br>
&gt; &gt; recipes-kernel/linux/linux-ti-staging/connectivity_defconfig<br>
&gt; &gt; &gt; =C2=A0create mode 100644 recipes-kernel/linux/linux-ti-stagi=
ng/ipc_defconfig<br>
&gt; &gt; &gt; =C2=A0create mode 100644<br>
&gt; &gt; recipes-kernel/linux/linux-ti-staging/systest_defconfig<br>
&gt; &gt;<br>
&gt; &gt; should they be called with .cfg extension ?<br>
&gt;<br>
&gt; Doesn&#39;t really matter. To match linux-yocto, they could have an ex=
tension, but<br>
&gt; it&#39;s not really required.<br>
&gt;</p>
<p dir=3D"ltr">yes however consistent naming would be helpful</p>
<p dir=3D"ltr">&gt;<br>
&gt; &gt; &gt; diff --git a/recipes-kernel/linux/linux-ti-staging/baseport_=
defconfig<br>
&gt; &gt; b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..8dc24af<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/recipes-kernel/linux/linux-ti-staging/baseport_defconf=
ig<br>
&gt; &gt; &gt; @@ -0,0 +1,8 @@<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +# Baseport Config Options<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +CONFIG_CRYPTO_HW=3Dy<br>
&gt; &gt; &gt; +CONFIG_CRYPTO_DEV_OMAP_AES=3Dy<br>
&gt; &gt; &gt; +CONFIG_CRYPTO_DEV_OMAP_SHAM=3Dy<br>
&gt; &gt; &gt; +CONFIG_CRYPTO_TEST=3Dm<br>
&gt; &gt; &gt; +CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dn<br>
&gt; &gt; &gt; diff --git a/recipes-kernel/linux/linux-ti-staging/connectiv=
ity_defconfig<br>
&gt; &gt; b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig<br=
>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..bf18dae<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/recipes-kernel/linux/linux-ti-staging/connectivity_def=
config<br>
&gt; &gt; &gt; @@ -0,0 +1,14 @@<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +# Connectivity Configs<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +CONFIG_MTD_NAND_OMAP_BCH=3Dy<br>
&gt; &gt; &gt; +CONFIG_MTD_TESTS=3Dm<br>
&gt; &gt; &gt; +CONFIG_SPI_SPIDEV=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_TEST=3Dm<br>
&gt; &gt; &gt; +CONFIG_USB_ACM=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_SERIAL_PL2303=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_PRINTER=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_NET_AX8817X=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_G_MULTI=3Dm<br>
&gt; &gt; &gt; +CONFIG_USB_G_MULTI_RNDIS=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_G_MULTI_CDC=3Dy<br>
&gt; &gt; &gt; diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig=
<br>
&gt; &gt; b/recipes-kernel/linux/linux-ti-staging/defconfig<br>
&gt; &gt; &gt; index 926b35a..2a920e8 100644<br>
&gt; &gt; &gt; --- a/recipes-kernel/linux/linux-ti-staging/defconfig<br>
&gt; &gt; &gt; +++ b/recipes-kernel/linux/linux-ti-staging/defconfig<br>
&gt; &gt; &gt; @@ -1 +1,5 @@<br>
&gt; &gt; &gt; =C2=A0use-kernel-config=3Domap2plus_defconfig<br>
&gt; &gt; &gt; +config-fragment=3Dbaseport_defconfig<br>
&gt; &gt; &gt; +config-fragment=3Dconnectivity_defconfig<br>
&gt; &gt; &gt; +config-fragment=3Dsystest_defconfig<br>
&gt; &gt; &gt; +config-fragment=3Dipc_defconfig<br>
&gt; &gt; &gt; diff --git a/recipes-kernel/linux/linux-ti-staging/ipc_defco=
nfig<br>
&gt; &gt; b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..645dfdf<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig<br=
>
&gt; &gt; &gt; @@ -0,0 +1,18 @@<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +# IPC config options<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +CONFIG_IOMMU_API=3Dy<br>
&gt; &gt; &gt; +CONFIG_IOMMU_SUPPORT=3Dy<br>
&gt; &gt; &gt; +CONFIG_OF_IOMMU=3Dy<br>
&gt; &gt; &gt; +CONFIG_OMAP_IOMMU=3Dy<br>
&gt; &gt; &gt; +CONFIG_OMAP_IOVMM=3Dy<br>
&gt; &gt; &gt; +CONFIG_OMAP_IOMMU_DEBUG=3Dy<br>
&gt; &gt; &gt; +CONFIG_VIRTIO=3Dm<br>
&gt; &gt; &gt; +CONFIG_RPMSG=3Dm<br>
&gt; &gt; &gt; +CONFIG_RPMSG_RPC=3Dm<br>
&gt; &gt; &gt; +CONFIG_REMOTEPROC=3Dm<br>
&gt; &gt; &gt; +CONFIG_OMAP_REMOTEPROC=3Dm<br>
&gt; &gt; &gt; +CONFIG_OMAP_REMOTEPROC_IPU=3Dy<br>
&gt; &gt; &gt; +CONFIG_OMAP_REMOTEPROC_DSP=3Dy<br>
&gt; &gt; &gt; +CONFIG_OMAP_REMOTEPROC_IPU1=3Dy<br>
&gt; &gt; &gt; +CONFIG_OMAP_REMOTEPROC_DSP2=3Dy<br>
&gt; &gt; &gt; diff --git a/recipes-kernel/linux/linux-ti-staging/systest_d=
efconfig<br>
&gt; &gt; b/recipes-kernel/linux/linux-ti-staging/systest_defconfig<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..e21602f<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/recipes-kernel/linux/linux-ti-staging/systest_defconfi=
g<br>
&gt; &gt; &gt; @@ -0,0 +1,20 @@<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +# Systest config options<br>
&gt; &gt; &gt; +##################################################<br>
&gt; &gt; &gt; +CONFIG_DEBUG_SPINLOCK=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_MUTEXES=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_KMEMLEAK=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEVKMEM=3Dy<br>
&gt; &gt; &gt; +CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=3D400<br>
&gt; &gt; &gt; +CONFIG_DEBUG_KMEMLEAK_TEST=3Dn<br>
&gt; &gt; &gt; +CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=3Dn<br>
&gt; &gt; &gt; +CONFIG_DEBUG_LOCK_ALLOC=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_INFO=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_FS=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_KERNEL=3Dy<br>
&gt; &gt; &gt; +CONFIG_PM_DEBUG=3Dy<br>
&gt; &gt; &gt; +CONFIG_DEBUG_GPIO=3Dy<br>
&gt; &gt; &gt; +CONFIG_USB_DEBUG=3Dy<br>
&gt; &gt; &gt; +CONFIG_SND_DEBUG=3Dy<br>
&gt; &gt; &gt; +CONFIG_RTC_DEBUG=3Dy<br>
&gt; &gt; &gt; diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bbb/=
recipes-kernel/linux/<br>
&gt; &gt; <a href=3D"http://linux-ti-staging_3.12.bb">linux-ti-staging_3.12=
.bb</a><br>
&gt; &gt; &gt; index 96be621..704d96b 100644<br>
&gt; &gt; &gt; --- a/recipes-kernel/linux/<a href=3D"http://linux-ti-stagin=
g_3.12.bb">linux-ti-staging_3.12.bb</a><br>
&gt; &gt; &gt; +++ b/recipes-kernel/linux/<a href=3D"http://linux-ti-stagin=
g_3.12.bb">linux-ti-staging_3.12.bb</a><br>
&gt; &gt; &gt; @@ -40,11 +40,15 @@ SRCREV =3D &quot;f0d4672333685697320f490=
7d5b4d3919121c299&quot;<br>
&gt; &gt; &gt; =C2=A0PV =3D &quot;3.12.17&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0# Append to the MACHINE_KERNEL_PR so that a new SRCREV=
 will cause a<br>
&gt; &gt; rebuild<br>
&gt; &gt; &gt; -MACHINE_KERNEL_PR_append =3D &quot;a+gitr${SRCPV}&quot;<br>
&gt; &gt; &gt; +MACHINE_KERNEL_PR_append =3D &quot;b+gitr${SRCPV}&quot;<br>
&gt; &gt; &gt; =C2=A0PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;=
protocol=3Dgit;branch=3D${BRANCH}\">git.ti.com/ti-linux-kernel/ti-linux-ker=
nel.git;protocol=3Dgit;branch=3D${BRANCH}\</a><br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://defconfig \=
<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://baseport_defconf=
ig \<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://connectivity_def=
config \<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ipc_defconfig \<=
br>
&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://systest_defconfi=
g \<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0# Disable SMP in defconfig on single-core platforms to=
 reduce overhead<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 1.9.2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctopro=
ject.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">=
https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.=
org</a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https=
://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
</p>

--047d7bdc1234330fd304f7038175--
