Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AECBE01605
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 04:59:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QBxWhm028606;
	Thu, 26 Sep 2013 06:59:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QBxWs2009137;
	Thu, 26 Sep 2013 06:59:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 26 Sep 2013 06:59:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv2 4/4] ti43x, omap-a15: switch
	KERNEL_IMAGETYPE to zImage by default
Thread-Index: AQHOuiiC3IT+0pc+/U6vCmij1/fHb5nX61Tg
Date: Thu, 26 Sep 2013 11:59:32 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597510CF@DLEE11.ent.ti.com>
References: <1380138591-17071-1-git-send-email-denis@denix.org>
In-Reply-To: <1380138591-17071-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Rini, Tom" <trini@ti.com>
Subject: Re: [PATCHv2 4/4] ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Thu, 26 Sep 2013 11:59:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, September 25, 2013 2:50 PM
>To: meta-ti@yoctoproject.org
>Cc: Rini, Tom
>Subject: [meta-ti] [PATCHv2 4/4] ti43x, omap-a15: switch
>KERNEL_IMAGETYPE to zImage by default
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* To be used with latest u-boot, that prefers zImage over uImage
>* ti33x will follow as soon as u-boot changes its default for that
>platform
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>Cc: Tom Rini <trini@ti.com>
>---
>v2 - don't change the default for ti33x yet, wait for u-boot
>
> conf/machine/include/omap-a15.inc | 2 +-
> conf/machine/include/ti43x.inc    | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
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

