Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DC9DE009C5; Thu,  1 May 2014 07:20:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 054B7E009BA
	for <meta-ti@yoctoproject.org>; Thu,  1 May 2014 07:20:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s41EKpkQ005698;
	Thu, 1 May 2014 09:20:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s41EKoUC018814;
	Thu, 1 May 2014 09:20:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 1 May 2014 09:20:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2 2/2] linux-ti-staging: add baseport,
	connectivity, ipc and systest config fragments
Thread-Index: AQHPYOAC6lbI8ZkaE0W8iZNdaA8UQ5srz1Xw
Date: Thu, 1 May 2014 14:20:50 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFE80EB@DLEE11.ent.ti.com>
References: <1398469261-32287-1-git-send-email-denis@denix.org>
	<1398469261-32287-2-git-send-email-denis@denix.org>
In-Reply-To: <1398469261-32287-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] linux-ti-staging: add baseport, connectivity, ipc and systest config fragments
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
X-List-Received-Date: Thu, 01 May 2014 14:20:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, April 25, 2014 4:41 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH v2 2/2] linux-ti-staging: add baseport,
>connectivity, ipc and systest config fragments
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
>v2 - Use .cfg extension for config fragment files to match linux-
>yocto
>
> recipes-kernel/linux/linux-ti-staging/baseport.cfg   |  8
>++++++++
> .../linux/linux-ti-staging/connectivity.cfg          | 14
>++++++++++++++
> recipes-kernel/linux/linux-ti-staging/ipc.cfg        | 18
>++++++++++++++++++
> recipes-kernel/linux/linux-ti-staging/systest.cfg    | 20
>++++++++++++++++++++
> recipes-kernel/linux/linux-ti-staging_3.12.bb        |  8
>+++++++-
> 5 files changed, 67 insertions(+), 1 deletion(-)
> create mode 100644 recipes-kernel/linux/linux-ti-
>staging/baseport.cfg
> create mode 100644 recipes-kernel/linux/linux-ti-
>staging/connectivity.cfg
> create mode 100644 recipes-kernel/linux/linux-ti-staging/ipc.cfg
> create mode 100644 recipes-kernel/linux/linux-ti-
>staging/systest.cfg
>
>diff --git a/recipes-kernel/linux/linux-ti-staging/baseport.cfg
>b/recipes-kernel/linux/linux-ti-staging/baseport.cfg
>new file mode 100644
>index 0000000..8dc24af
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-ti-staging/baseport.cfg
>@@ -0,0 +1,8 @@
>+##################################################
>+# Baseport Config Options
>+##################################################
>+CONFIG_CRYPTO_HW=3Dy
>+CONFIG_CRYPTO_DEV_OMAP_AES=3Dy
>+CONFIG_CRYPTO_DEV_OMAP_SHAM=3Dy
>+CONFIG_CRYPTO_TEST=3Dm
>+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dn
>diff --git a/recipes-kernel/linux/linux-ti-
>staging/connectivity.cfg b/recipes-kernel/linux/linux-ti-
>staging/connectivity.cfg
>new file mode 100644
>index 0000000..bf18dae
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-ti-staging/connectivity.cfg
>@@ -0,0 +1,14 @@
>+##################################################
>+# Connectivity Configs
>+##################################################
>+CONFIG_MTD_NAND_OMAP_BCH=3Dy
>+CONFIG_MTD_TESTS=3Dm
>+CONFIG_SPI_SPIDEV=3Dy
>+CONFIG_USB_TEST=3Dm
>+CONFIG_USB_ACM=3Dy
>+CONFIG_USB_SERIAL_PL2303=3Dy
>+CONFIG_USB_PRINTER=3Dy
>+CONFIG_USB_NET_AX8817X=3Dy
>+CONFIG_USB_G_MULTI=3Dm
>+CONFIG_USB_G_MULTI_RNDIS=3Dy
>+CONFIG_USB_G_MULTI_CDC=3Dy
>diff --git a/recipes-kernel/linux/linux-ti-staging/ipc.cfg
>b/recipes-kernel/linux/linux-ti-staging/ipc.cfg
>new file mode 100644
>index 0000000..645dfdf
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-ti-staging/ipc.cfg
>@@ -0,0 +1,18 @@
>+##################################################
>+# IPC config options
>+##################################################
>+CONFIG_IOMMU_API=3Dy
>+CONFIG_IOMMU_SUPPORT=3Dy
>+CONFIG_OF_IOMMU=3Dy
>+CONFIG_OMAP_IOMMU=3Dy
>+CONFIG_OMAP_IOVMM=3Dy
>+CONFIG_OMAP_IOMMU_DEBUG=3Dy
>+CONFIG_VIRTIO=3Dm
>+CONFIG_RPMSG=3Dm
>+CONFIG_RPMSG_RPC=3Dm
>+CONFIG_REMOTEPROC=3Dm
>+CONFIG_OMAP_REMOTEPROC=3Dm
>+CONFIG_OMAP_REMOTEPROC_IPU=3Dy
>+CONFIG_OMAP_REMOTEPROC_DSP=3Dy
>+CONFIG_OMAP_REMOTEPROC_IPU1=3Dy
>+CONFIG_OMAP_REMOTEPROC_DSP2=3Dy
>diff --git a/recipes-kernel/linux/linux-ti-staging/systest.cfg
>b/recipes-kernel/linux/linux-ti-staging/systest.cfg
>new file mode 100644
>index 0000000..e21602f
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-ti-staging/systest.cfg
>@@ -0,0 +1,20 @@
>+##################################################
>+# Systest config options
>+##################################################
>+CONFIG_DEBUG_SPINLOCK=3Dy
>+CONFIG_DEBUG_MUTEXES=3Dy
>+CONFIG_DEBUG_KMEMLEAK=3Dy
>+CONFIG_DEVKMEM=3Dy
>+CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>+CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=3D400
>+CONFIG_DEBUG_KMEMLEAK_TEST=3Dn
>+CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=3Dn
>+CONFIG_DEBUG_LOCK_ALLOC=3Dy
>+CONFIG_DEBUG_INFO=3Dy
>+CONFIG_DEBUG_FS=3Dy
>+CONFIG_DEBUG_KERNEL=3Dy
>+CONFIG_PM_DEBUG=3Dy
>+CONFIG_DEBUG_GPIO=3Dy
>+CONFIG_USB_DEBUG=3Dy
>+CONFIG_SND_DEBUG=3Dy
>+CONFIG_RTC_DEBUG=3Dy
>diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb
>b/recipes-kernel/linux/linux-ti-staging_3.12.bb
>index 96be621..32d5d92 100644
>--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
>@@ -40,11 +40,17 @@ SRCREV =3D
>"f0d4672333685697320f4907d5b4d3919121c299"
> PV =3D "3.12.17"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> PR =3D "${MACHINE_KERNEL_PR}"
>
>+KERNEL_CONFIG_FRAGMENTS =3D "baseport.cfg connectivity.cfg ipc.cfg
>systest.cfg"
>+
> SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>            file://defconfig \
>+           file://baseport.cfg \
>+           file://connectivity.cfg \
>+           file://ipc.cfg \
>+           file://systest.cfg \
>           "
>
> # Disable SMP in defconfig on single-core platforms to reduce
>overhead
>--
>1.9.2
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

