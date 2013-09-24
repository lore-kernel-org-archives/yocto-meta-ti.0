Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E989DE0153B
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 06:53:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8ODrRVR019626;
	Tue, 24 Sep 2013 08:53:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8ODrRCr016504;
	Tue, 24 Sep 2013 08:53:27 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 08:53:27 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 4/4] ti33x, ti43x, omap-a15: switch
	KERNEL_IMAGETYPE to zImage by default
Thread-Index: AQHOuM213RcAyZqKrUOSsIsh27dC5pnU6Qeg
Date: Tue, 24 Sep 2013 13:53:26 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015974763D@DLEE11.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-4-git-send-email-denis@denix.org>
In-Reply-To: <1379989631-8098-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Rini, Tom" <trini@ti.com>
Subject: Re: [PATCH 4/4] ti33x, ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Tue, 24 Sep 2013 13:53:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

As Franklin mentioned let's hold this one off until the change to use zImag=
e has been pushed for am335x, or at least split this into only supporting t=
i43x and omap-a15 for now and do am335x later.

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, September 23, 2013 9:27 PM
>To: meta-ti@yoctoproject.org
>Cc: Rini, Tom
>Subject: [meta-ti] [PATCH 4/4] ti33x, ti43x, omap-a15: switch
>KERNEL_IMAGETYPE to zImage by default
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* To be used with latest u-boot, that prefers zImage over uImage
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>Cc: Tom Rini <trini@ti.com>
>---
> conf/machine/include/omap-a15.inc | 2 +-
> conf/machine/include/ti33x.inc    | 2 +-
> conf/machine/include/ti43x.inc    | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/conf/machine/include/omap-a15.inc
>b/conf/machine/include/omap-a15.inc
>index 623f2df..aba122a 100644
>--- a/conf/machine/include/omap-a15.inc
>+++ b/conf/machine/include/omap-a15.inc
>@@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-
>staging"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>
>-KERNEL_IMAGETYPE =3D "uImage"
>+KERNEL_IMAGETYPE =3D "zImage"
>
> UBOOT_ARCH =3D "arm"
> UBOOT_ENTRYPOINT =3D "0x80008000"
>diff --git a/conf/machine/include/ti33x.inc
>b/conf/machine/include/ti33x.inc
>index 12b80c6..7f02042 100644
>--- a/conf/machine/include/ti33x.inc
>+++ b/conf/machine/include/ti33x.inc
>@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-
>staging"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>
>-KERNEL_IMAGETYPE =3D "uImage"
>+KERNEL_IMAGETYPE =3D "zImage"
>
> UBOOT_ARCH =3D "arm"
> UBOOT_MACHINE =3D "am335x_evm_config"
>diff --git a/conf/machine/include/ti43x.inc
>b/conf/machine/include/ti43x.inc
>index 62da105..adb66e3 100644
>--- a/conf/machine/include/ti43x.inc
>+++ b/conf/machine/include/ti43x.inc
>@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-
>staging"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>
>-KERNEL_IMAGETYPE =3D "uImage"
>+KERNEL_IMAGETYPE =3D "zImage"
>
> UBOOT_ARCH =3D "arm"
> UBOOT_MACHINE =3D "am43xx_evm_config"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

