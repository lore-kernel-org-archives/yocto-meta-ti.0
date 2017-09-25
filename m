Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5AD4E00D1F; Mon, 25 Sep 2017 10:53:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D0F4E00C82
	for <meta-ti@yoctoproject.org>; Mon, 25 Sep 2017 10:53:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8PHr1Of020272
	for <meta-ti@yoctoproject.org>; Mon, 25 Sep 2017 12:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506361981;
	bh=iIdK3WeglPbc35sQTQBtii5MK3pxhvedGYEVsHJVHD4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=utrFGu0c4oy2EPW6cTpfU2L6vf0WaPHl+ZFSeLIDwxM4AMMIuEfx734JIsZuv/HYk
	c0w5JLYUK2NjET+xD75MZP0eO+n1V+DAybf2aM9bx1N6/mrZLLrJ/JeVq+n3zWdJIl
	dKFuHeZQFnHeFi48xqFHNDieqnYGARAueoMvAbGs=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PHr1Yt013414
	for <meta-ti@yoctoproject.org>; Mon, 25 Sep 2017 12:53:01 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 25 Sep 2017 12:53:01 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] conf/machine: add pru-uio dtbs in
	KERNEL_DEVICETREE for am3/am4/am5/k2g
Thread-Index: AQHTJpj7noutr/XkSEqlevRzGyJyQ6LGAQfA
Date: Mon, 25 Sep 2017 17:53:00 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D827A3@DLEE08.ent.ti.com>
References: <1504651660-6772-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1504651660-6772-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] conf/machine: add pru-uio dtbs in KERNEL_DEVICETREE for am3/am4/am5/k2g
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
X-List-Received-Date: Mon, 25 Sep 2017 17:53:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping...

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Tuesday, September 05, 2017 6:48 PM
> To: meta-ti@yoctoproject.org
> Cc: Gou, Hongmei
> Subject: [meta-ti] [PATCH] conf/machine: add pru-uio dtbs in
> KERNEL_DEVICETREE for am3/am4/am5/k2g
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  conf/machine/am57xx-evm.conf   | 3 ++-
>  conf/machine/include/ti33x.inc | 2 +-
>  conf/machine/include/ti43x.inc | 2 +-
>  conf/machine/k2g-evm.conf      | 3 ++-
>  4 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-
> evm.conf index 3bc2d13..78f56e6 100644
> --- a/conf/machine/am57xx-evm.conf
> +++ b/conf/machine/am57xx-evm.conf
> @@ -14,7 +14,8 @@ KERNEL_DEVICETREE =3D "am57xx-beagle-x15.dtb
> am57xx-beagle-x15-revb1.dtb \
>                      am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm=
-
> cam-ov10635.dtb \
>                      am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-mt9t111.dt=
b
> am57xx-evm-reva3-cam-ov10635.dtb \
>                      am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x=
-idk-lcd-
> osd101t2587.dtb \
> -                    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x=
-idk-lcd-
> osd101t2587.dtb"
> +                    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x=
-idk-lcd-
> osd101t2587.dtb \
> +                    ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'a=
m572x-idk-
> pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
>=20
>  UBOOT_MACHINE =3D "am57xx_evm_config"
>=20
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.=
inc
> index cadc7df..4014f79 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>=20
>  KERNEL_IMAGETYPE =3D "zImage"
>=20
> -KERNEL_DEVICETREE =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-
> bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
> +KERNEL_DEVICETREE =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-
> bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb
> ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-
> uio.dtb', '', d)}"
>=20
>  UBOOT_ARCH =3D "arm"
>  UBOOT_MACHINE =3D "am335x_evm_config"
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.=
inc
> index 2d563ee..243bc5a 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>=20
>  KERNEL_IMAGETYPE =3D "zImage"
>=20
> -KERNEL_DEVICETREE =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-
> gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
> +KERNEL_DEVICETREE =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-
> gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb
> ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-
> uio.dtb', '', d)}"
>=20
>  UBOOT_ARCH =3D "arm"
>  UBOOT_MACHINE =3D "am43xx_evm_config"
> diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf index
> 3222868..da0234b 100644
> --- a/conf/machine/k2g-evm.conf
> +++ b/conf/machine/k2g-evm.conf
> @@ -6,7 +6,8 @@ require conf/machine/include/k2g.inc
>=20
>  MACHINE_FEATURES +=3D "alsa"
>=20
> -KERNEL_DEVICETREE =3D "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb
> keystone-k2g-ice.dtb"
> +KERNEL_DEVICETREE =3D "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb
> keystone-k2g-ice.dtb \
> +                     ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', '=
keystone-
> k2g-ice-pru-excl-uio.dtb', '', d)}"
>=20
>  UBOOT_MACHINE =3D "k2g_evm_config"
>=20
> --
> 1.9.1


