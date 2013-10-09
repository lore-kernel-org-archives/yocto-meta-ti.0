Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4D86E016C5
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 05:06:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99C6O8p004778;
	Wed, 9 Oct 2013 07:06:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99C6NJp003059;
	Wed, 9 Oct 2013 07:06:23 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 9 Oct 2013 07:06:23 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: merged PM, platform &
	connectivity, install boneblack DTB
Thread-Index: AQHOxHAJxJ3WNSnM+kamF44qK66ZM5nsRvYQ
Date: Wed, 9 Oct 2013 12:06:22 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597957E4@DLEE11.ent.ti.com>
References: <1381268834-29065-1-git-send-email-denis@denix.org>
In-Reply-To: <1381268834-29065-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: merged PM, platform & connectivity, install boneblack DTB
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
X-List-Received-Date: Wed, 09 Oct 2013 12:06:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 08, 2013 4:47 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] linux-ti-staging: merged PM, platform &
>connectivity, install boneblack DTB
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* The PM for TI part was merged in
>* Platform and connectivity got updated
>* Since we now have separate DTB for BeagleBone Black, install it
>too
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/linux-ti-staging_git.bb | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
>b/recipes-kernel/linux/linux-ti-staging_git.bb
>index 44b0b83..c731443 100644
>--- a/recipes-kernel/linux/linux-ti-staging_git.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
>@@ -17,9 +17,9 @@ RDEPENDS_kernel-base_append_ti33x =3D " am33x-cm3
>am33x-cm3-initscript"
>
> # Default is to package all dtb files for ti33x devices unless
>building
> # for the specific beaglebone machine.
>-KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
>am335x-bone.dtb"
>+KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
>am335x-bone.dtb am335x-boneblack.dtb"
> KERNEL_DEVICETREE_am437x-evm =3D "am43x-epos-evm.dtb"
>-KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb"
>+KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
>boneblack.dtb"
> KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
>
>@@ -31,11 +31,11 @@ S =3D "${WORKDIR}/git"
>
> BRANCH =3D "ti-linux-3.12.y"
>
>-SRCREV =3D "cfb43bb45e51e2cbff47d62fa348de6a30147f41"
>+SRCREV =3D "6c33548b82709198a16b751d6092037556fc4c05"
> PV =3D "3.11+3.12-rc4"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

