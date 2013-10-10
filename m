Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A7FAE015ED
	for <meta-ti@yoctoproject.org>; Thu, 10 Oct 2013 05:02:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AC2MpI011543;
	Thu, 10 Oct 2013 07:02:22 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AC2MZt000689;
	Thu, 10 Oct 2013 07:02:22 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 07:02:22 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] ti33x: switch KERNEL_IMAGETYPE to zImage by
	default
Thread-Index: AQHOxTsNlO4nbhGB5UuRIETExum0wZnt1ptQ
Date: Thu, 10 Oct 2013 12:02:22 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979A70E@DLEE11.ent.ti.com>
References: <1381356010-21556-1-git-send-email-denis@denix.org>
In-Reply-To: <1381356010-21556-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ti33x: switch KERNEL_IMAGETYPE to zImage by	default
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
X-List-Received-Date: Thu, 10 Oct 2013 12:02:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>



>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, October 09, 2013 5:00 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] ti33x: switch KERNEL_IMAGETYPE to
>zImage by default
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>To be used with latest u-boot that prefers zImage over uImage
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> conf/machine/include/ti33x.inc | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/conf/machine/include/ti33x.inc
>b/conf/machine/include/ti33x.inc
>index 12b80c6..8a91a52 100644
>--- a/conf/machine/include/ti33x.inc
>+++ b/conf/machine/include/ti33x.inc
>@@ -16,14 +16,14 @@ XSERVER =3D "xserver-xorg \
> GUI_MACHINE_CLASS =3D "bigscreen"
>
> # Increase this everytime you change something in the kernel
>-MACHINE_KERNEL_PR =3D "r19"
>+MACHINE_KERNEL_PR =3D "r20"
>
> # Default providers, may need to override for specific machines
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>
>-KERNEL_IMAGETYPE =3D "uImage"
>+KERNEL_IMAGETYPE =3D "zImage"
>
> UBOOT_ARCH =3D "arm"
> UBOOT_MACHINE =3D "am335x_evm_config"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

