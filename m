Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 795E5E00B84
	for <meta-ti@yoctoproject.org>; Sun, 13 Apr 2014 21:22:33 -0700 (PDT)
Received: by mail-ie0-f172.google.com with SMTP id as1so7702718iec.17
	for <meta-ti@yoctoproject.org>; Sun, 13 Apr 2014 21:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MMgwh5yAvBdyS1yxKP+2WBCeRmxnX9UhLV5QbaOaKPM=;
	b=TZX3jmxkcnE08/kMtKGSTEaWHcaKvrSNW5/JfGOMTKBVc1BdcAo2mMruMks00hwZrG
	oPOkfo9ImyWIByRTB/O41MdyczRsEfC0oJ8/QpUwicuqYmvbXqHDVRbq4k0ygUoOER7T
	PruaGK2zr6qdkRd5/zKuzfjheljDbFJ1MW9SHlwNI9MqwVLasJXPS+A5K3DDV9TRDZn0
	dfOYFkXMZZN9IgKKfRBGfdRaUd3EIdVTndvTO0mAG68EuG1rzz7HHNjr9buJTLG3t7Cr
	zUCVuI2fsqGXW3S2SuCuTm0BzxbXohmTGcNDuvmy2TFq0+Ok651Q4610QC3/iHo3pDhk
	e5bQ==
MIME-Version: 1.0
X-Received: by 10.42.232.206 with SMTP id jv14mr10026080icb.52.1397449353020; 
	Sun, 13 Apr 2014 21:22:33 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Sun, 13 Apr 2014 21:22:32 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Sun, 13 Apr 2014 21:22:32 -0700 (PDT)
In-Reply-To: <1397447422-6936-2-git-send-email-denis@denix.org>
References: <1397447422-6936-1-git-send-email-denis@denix.org>
	<1397447422-6936-2-git-send-email-denis@denix.org>
Date: Sun, 13 Apr 2014 21:22:32 -0700
Message-ID: <CAMKF1spaW8peXjQSd7rDSzn8CMe6zt8FcPOGyOq+oOHEWK05kg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Mon, 14 Apr 2014 04:22:34 -0000
Content-Type: multipart/alternative; boundary=047d7b86eae6474ae604f6f9089f

--047d7b86eae6474ae604f6f9089f
Content-Type: text/plain; charset=UTF-8

On Apr 13, 2014 5:51 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../linux/linux-ti-staging/baseport_defconfig        |  8 ++++++++
>  .../linux/linux-ti-staging/connectivity_defconfig    | 14 ++++++++++++++
>  recipes-kernel/linux/linux-ti-staging/defconfig      |  4 ++++
>  recipes-kernel/linux/linux-ti-staging/ipc_defconfig  | 18
++++++++++++++++++
>  .../linux/linux-ti-staging/systest_defconfig         | 20
++++++++++++++++++++
>  recipes-kernel/linux/linux-ti-staging_3.12.bb        |  6 +++++-
>  6 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644
recipes-kernel/linux/linux-ti-staging/baseport_defconfig
>  create mode 100644
recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
>  create mode 100644 recipes-kernel/linux/linux-ti-staging/ipc_defconfig
>  create mode 100644
recipes-kernel/linux/linux-ti-staging/systest_defconfig

should they be called with .cfg extension ?

>
> diff --git a/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> new file mode 100644
> index 0000000..8dc24af
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
> @@ -0,0 +1,8 @@
> +##################################################
> +# Baseport Config Options
> +##################################################
> +CONFIG_CRYPTO_HW=y
> +CONFIG_CRYPTO_DEV_OMAP_AES=y
> +CONFIG_CRYPTO_DEV_OMAP_SHAM=y
> +CONFIG_CRYPTO_TEST=m
> +CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
> diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> new file mode 100644
> index 0000000..bf18dae
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
> @@ -0,0 +1,14 @@
> +##################################################
> +# Connectivity Configs
> +##################################################
> +CONFIG_MTD_NAND_OMAP_BCH=y
> +CONFIG_MTD_TESTS=m
> +CONFIG_SPI_SPIDEV=y
> +CONFIG_USB_TEST=m
> +CONFIG_USB_ACM=y
> +CONFIG_USB_SERIAL_PL2303=y
> +CONFIG_USB_PRINTER=y
> +CONFIG_USB_NET_AX8817X=y
> +CONFIG_USB_G_MULTI=m
> +CONFIG_USB_G_MULTI_RNDIS=y
> +CONFIG_USB_G_MULTI_CDC=y
> diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig
b/recipes-kernel/linux/linux-ti-staging/defconfig
> index 926b35a..2a920e8 100644
> --- a/recipes-kernel/linux/linux-ti-staging/defconfig
> +++ b/recipes-kernel/linux/linux-ti-staging/defconfig
> @@ -1 +1,5 @@
>  use-kernel-config=omap2plus_defconfig
> +config-fragment=baseport_defconfig
> +config-fragment=connectivity_defconfig
> +config-fragment=systest_defconfig
> +config-fragment=ipc_defconfig
> diff --git a/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> new file mode 100644
> index 0000000..645dfdf
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
> @@ -0,0 +1,18 @@
> +##################################################
> +# IPC config options
> +##################################################
> +CONFIG_IOMMU_API=y
> +CONFIG_IOMMU_SUPPORT=y
> +CONFIG_OF_IOMMU=y
> +CONFIG_OMAP_IOMMU=y
> +CONFIG_OMAP_IOVMM=y
> +CONFIG_OMAP_IOMMU_DEBUG=y
> +CONFIG_VIRTIO=m
> +CONFIG_RPMSG=m
> +CONFIG_RPMSG_RPC=m
> +CONFIG_REMOTEPROC=m
> +CONFIG_OMAP_REMOTEPROC=m
> +CONFIG_OMAP_REMOTEPROC_IPU=y
> +CONFIG_OMAP_REMOTEPROC_DSP=y
> +CONFIG_OMAP_REMOTEPROC_IPU1=y
> +CONFIG_OMAP_REMOTEPROC_DSP2=y
> diff --git a/recipes-kernel/linux/linux-ti-staging/systest_defconfig
b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> new file mode 100644
> index 0000000..e21602f
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
> @@ -0,0 +1,20 @@
> +##################################################
> +# Systest config options
> +##################################################
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_MUTEXES=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEVKMEM=y
> +CONFIG_HAVE_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
> +CONFIG_DEBUG_KMEMLEAK_TEST=n
> +CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
> +CONFIG_DEBUG_LOCK_ALLOC=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_FS=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_PM_DEBUG=y
> +CONFIG_DEBUG_GPIO=y
> +CONFIG_USB_DEBUG=y
> +CONFIG_SND_DEBUG=y
> +CONFIG_RTC_DEBUG=y
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bbb/recipes-kernel/linux/
linux-ti-staging_3.12.bb
> index 96be621..704d96b 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> @@ -40,11 +40,15 @@ SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
>  PV = "3.12.17"
>
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
rebuild
> -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
>  PR = "${MACHINE_KERNEL_PR}"
>
>  SRC_URI = "git://
git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}\
>             file://defconfig \
> +           file://baseport_defconfig \
> +           file://connectivity_defconfig \
> +           file://ipc_defconfig \
> +           file://systest_defconfig \
>            "
>
>  # Disable SMP in defconfig on single-core platforms to reduce overhead
> --
> 1.9.2
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--047d7b86eae6474ae604f6f9089f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 13, 2014 5:51 PM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailt=
o:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../linux/linux-ti-staging/baseport_defconfig =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A08 ++++++++<br>
&gt; =C2=A0.../linux/linux-ti-staging/connectivity_defconfig =C2=A0 =C2=A0|=
 14 ++++++++++++++<br>
&gt; =C2=A0recipes-kernel/linux/linux-ti-staging/defconfig =C2=A0 =C2=A0 =
=C2=A0| =C2=A04 ++++<br>
&gt; =C2=A0recipes-kernel/linux/linux-ti-staging/ipc_defconfig =C2=A0| 18 +=
+++++++++++++++++<br>
&gt; =C2=A0.../linux/linux-ti-staging/systest_defconfig =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
&gt; =C2=A0recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.12.bb"=
>linux-ti-staging_3.12.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A06 +++++-<b=
r>
&gt; =C2=A06 files changed, 69 insertions(+), 1 deletion(-)<br>
&gt; =C2=A0create mode 100644 recipes-kernel/linux/linux-ti-staging/basepor=
t_defconfig<br>
&gt; =C2=A0create mode 100644 recipes-kernel/linux/linux-ti-staging/connect=
ivity_defconfig<br>
&gt; =C2=A0create mode 100644 recipes-kernel/linux/linux-ti-staging/ipc_def=
config<br>
&gt; =C2=A0create mode 100644 recipes-kernel/linux/linux-ti-staging/systest=
_defconfig</p>
<p dir=3D"ltr">should they be called with .cfg extension ?<br>
 <br>
&gt;<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging/baseport_defconfig =
b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8dc24af<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +##################################################<br>
&gt; +# Baseport Config Options<br>
&gt; +##################################################<br>
&gt; +CONFIG_CRYPTO_HW=3Dy<br>
&gt; +CONFIG_CRYPTO_DEV_OMAP_AES=3Dy<br>
&gt; +CONFIG_CRYPTO_DEV_OMAP_SHAM=3Dy<br>
&gt; +CONFIG_CRYPTO_TEST=3Dm<br>
&gt; +CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dn<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity_defcon=
fig b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000..bf18dae<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig<br>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +##################################################<br>
&gt; +# Connectivity Configs<br>
&gt; +##################################################<br>
&gt; +CONFIG_MTD_NAND_OMAP_BCH=3Dy<br>
&gt; +CONFIG_MTD_TESTS=3Dm<br>
&gt; +CONFIG_SPI_SPIDEV=3Dy<br>
&gt; +CONFIG_USB_TEST=3Dm<br>
&gt; +CONFIG_USB_ACM=3Dy<br>
&gt; +CONFIG_USB_SERIAL_PL2303=3Dy<br>
&gt; +CONFIG_USB_PRINTER=3Dy<br>
&gt; +CONFIG_USB_NET_AX8817X=3Dy<br>
&gt; +CONFIG_USB_G_MULTI=3Dm<br>
&gt; +CONFIG_USB_G_MULTI_RNDIS=3Dy<br>
&gt; +CONFIG_USB_G_MULTI_CDC=3Dy<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes=
-kernel/linux/linux-ti-staging/defconfig<br>
&gt; index 926b35a..2a920e8 100644<br>
&gt; --- a/recipes-kernel/linux/linux-ti-staging/defconfig<br>
&gt; +++ b/recipes-kernel/linux/linux-ti-staging/defconfig<br>
&gt; @@ -1 +1,5 @@<br>
&gt; =C2=A0use-kernel-config=3Domap2plus_defconfig<br>
&gt; +config-fragment=3Dbaseport_defconfig<br>
&gt; +config-fragment=3Dconnectivity_defconfig<br>
&gt; +config-fragment=3Dsystest_defconfig<br>
&gt; +config-fragment=3Dipc_defconfig<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging/ipc_defconfig b/rec=
ipes-kernel/linux/linux-ti-staging/ipc_defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000..645dfdf<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig<br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +##################################################<br>
&gt; +# IPC config options<br>
&gt; +##################################################<br>
&gt; +CONFIG_IOMMU_API=3Dy<br>
&gt; +CONFIG_IOMMU_SUPPORT=3Dy<br>
&gt; +CONFIG_OF_IOMMU=3Dy<br>
&gt; +CONFIG_OMAP_IOMMU=3Dy<br>
&gt; +CONFIG_OMAP_IOVMM=3Dy<br>
&gt; +CONFIG_OMAP_IOMMU_DEBUG=3Dy<br>
&gt; +CONFIG_VIRTIO=3Dm<br>
&gt; +CONFIG_RPMSG=3Dm<br>
&gt; +CONFIG_RPMSG_RPC=3Dm<br>
&gt; +CONFIG_REMOTEPROC=3Dm<br>
&gt; +CONFIG_OMAP_REMOTEPROC=3Dm<br>
&gt; +CONFIG_OMAP_REMOTEPROC_IPU=3Dy<br>
&gt; +CONFIG_OMAP_REMOTEPROC_DSP=3Dy<br>
&gt; +CONFIG_OMAP_REMOTEPROC_IPU1=3Dy<br>
&gt; +CONFIG_OMAP_REMOTEPROC_DSP2=3Dy<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging/systest_defconfig b=
/recipes-kernel/linux/linux-ti-staging/systest_defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e21602f<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-ti-staging/systest_defconfig<br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +##################################################<br>
&gt; +# Systest config options<br>
&gt; +##################################################<br>
&gt; +CONFIG_DEBUG_SPINLOCK=3Dy<br>
&gt; +CONFIG_DEBUG_MUTEXES=3Dy<br>
&gt; +CONFIG_DEBUG_KMEMLEAK=3Dy<br>
&gt; +CONFIG_DEVKMEM=3Dy<br>
&gt; +CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy<br>
&gt; +CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=3D400<br>
&gt; +CONFIG_DEBUG_KMEMLEAK_TEST=3Dn<br>
&gt; +CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=3Dn<br>
&gt; +CONFIG_DEBUG_LOCK_ALLOC=3Dy<br>
&gt; +CONFIG_DEBUG_INFO=3Dy<br>
&gt; +CONFIG_DEBUG_FS=3Dy<br>
&gt; +CONFIG_DEBUG_KERNEL=3Dy<br>
&gt; +CONFIG_PM_DEBUG=3Dy<br>
&gt; +CONFIG_DEBUG_GPIO=3Dy<br>
&gt; +CONFIG_USB_DEBUG=3Dy<br>
&gt; +CONFIG_SND_DEBUG=3Dy<br>
&gt; +CONFIG_RTC_DEBUG=3Dy<br>
&gt; diff --git a/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3=
.12.bb">linux-ti-staging_3.12.bb</a> b/recipes-kernel/linux/<a href=3D"http=
://linux-ti-staging_3.12.bb">linux-ti-staging_3.12.bb</a><br>
&gt; index 96be621..704d96b 100644<br>
&gt; --- a/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.12.bb"=
>linux-ti-staging_3.12.bb</a><br>
&gt; +++ b/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.12.bb"=
>linux-ti-staging_3.12.bb</a><br>
&gt; @@ -40,11 +40,15 @@ SRCREV =3D &quot;f0d4672333685697320f4907d5b4d3919=
121c299&quot;<br>
&gt; =C2=A0PV =3D &quot;3.12.17&quot;<br>
&gt;<br>
&gt; =C2=A0# Append to the MACHINE_KERNEL_PR so that a new SRCREV will caus=
e a rebuild<br>
&gt; -MACHINE_KERNEL_PR_append =3D &quot;a+gitr${SRCPV}&quot;<br>
&gt; +MACHINE_KERNEL_PR_append =3D &quot;b+gitr${SRCPV}&quot;<br>
&gt; =C2=A0PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&gt;<br>
&gt; =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/ti-linux-ke=
rnel/ti-linux-kernel.git;protocol=3Dgit;branch=3D${BRANCH}">git.ti.com/ti-l=
inux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3D${BRANCH}</a> \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://defconfig \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://baseport_defconfig \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://connectivity_defconfig \<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ipc_defconfig \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://systest_defconfig \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; =C2=A0# Disable SMP in defconfig on single-core platforms to reduce ov=
erhead<br>
&gt; --<br>
&gt; 1.9.2<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
</p>

--047d7b86eae6474ae604f6f9089f--
