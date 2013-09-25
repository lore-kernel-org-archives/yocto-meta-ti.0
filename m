Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 707A8E01600
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 06:45:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PDj5Ob006277
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 08:45:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PDj4fF004278;
	Wed, 25 Sep 2013 08:45:04 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 25 Sep 2013 08:45:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Muddegowda, Deepak" <x0171695@ti.com>, "Srinivasan, Nageswari"
	<nageswari@ti.com>, "Heroor, Siddharth" <heroor@ti.com>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "Mankad,
	Maulik Ojas" <maulik@ti.com>, "epos_dev@list.ti.com - Internal mailing list
	for EPOS dev team (May contain non-TIers)" <epos_dev@list.ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti patch v3  3/3] am43xx: Added the kernel recipe
Thread-Index: AQHOuexWgWm8jhuWlkSH/SvwBRHVY5nWdvfw
Date: Wed, 25 Sep 2013 13:45:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015974D65F@DLEE11.ent.ti.com>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-4-git-send-email-x0171695@ti.com>
In-Reply-To: <1380112791-22545-4-git-send-email-x0171695@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [meta-ti patch v3 3/3] am43xx: Added the kernel recipe
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
X-List-Received-Date: Wed, 25 Sep 2013 13:45:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Same question as u-boot recipe about temporary.

>-----Original Message-----
>From: Muddegowda, Deepak
>Sent: Wednesday, September 25, 2013 7:40 AM
>To: Srinivasan, Nageswari; Maupin, Chase; Heroor, Siddharth;
>Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>Muddegowda, Deepak; epos_dev@list.ti.com - Internal mailing list
>for EPOS dev team (May contain non-TIers); meta-
>ti@yoctoproject.org
>Subject: [meta-ti patch v3 3/3] am43xx: Added the kernel recipe
>
>Signed-off-by: Deepak M <x0171695@ti.com>
>---
>v3:
>1. Changed the kernel recipe name to linux-am43xx
>2. Using the external source link
>
> recipes-kernel/linux/linux-am43xx/defconfig |  1 +
> recipes-kernel/linux/linux-am43xx_3.12.bb   | 31
>+++++++++++++++++++++++++++++
> 2 files changed, 32 insertions(+)
> create mode 100644 recipes-kernel/linux/linux-am43xx/defconfig
> create mode 100644 recipes-kernel/linux/linux-am43xx_3.12.bb
>
>diff --git a/recipes-kernel/linux/linux-am43xx/defconfig
>b/recipes-kernel/linux/linux-am43xx/defconfig
>new file mode 100644
>index 0000000..926b35a
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-am43xx/defconfig
>@@ -0,0 +1 @@
>+use-kernel-config=3Domap2plus_defconfig
>diff --git a/recipes-kernel/linux/linux-am43xx_3.12.bb b/recipes-
>kernel/linux/linux-am43xx_3.12.bb
>new file mode 100644
>index 0000000..a4b0700
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-am43xx_3.12.bb
>@@ -0,0 +1,31 @@
>+SECTION =3D "kernel"
>+DESCRIPTION =3D "Linux kernel for TI33x devices from PSP"
>+LICENSE =3D "GPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>+COMPATIBLE_MACHINE =3D "am437x-epos-evm"
>+
>+DEFAULT_PREFERENCE =3D "-1"
>+
>+inherit kernel
>+require recipes-kernel/linux/linux-dtb.inc
>+require setup-defconfig.inc
>+
>+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>+
>+KERNEL_IMAGETYPE =3D "uImage"
>+KERNEL_DEVICETREE =3D "am43x-epos-evm.dtb"
>+
>+KERNEL_DTB =3D "arch/arm/boot/dts/am43x-epos-evm.dtb"
>+
>+
>+# The main PR is now using MACHINE_KERNEL_PR,
>+PR =3D "r1+gitr${SRCPV}"
>+
>+BRANCH   =3D "linux-3.12.y"
>+
>+SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;BRANCH=3D${BRANCH};protocol=3Dssh \
>+           file://defconfig \
>+"
>+
>+SRCREV =3D "272b98c6455f00884f0350f775c5342358ebb73f"
>+S =3D "${WORKDIR}/git"
>--
>1.8.1


