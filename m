Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9975FE01069; Fri, 13 Jul 2018 12:21:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F704E0080A
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:21:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DJLknJ056795
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531509706;
	bh=3ZCaXeDUtmO4nbmKyxXEwY3NNz5Ggc+n9yZeyRcW0RE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=IyCVzYP0i6hRisSNjw+JhXDv5w1FZQwrQPuuwqBdyr1L7BEzTsaS2DSwu3lt8fpDc
	8QDMlLbcAoIsE8BooTt1VQ5Z+wY4PUbT592SogBx//nm0zmidE+UMVzh7nz+temVjk
	XsSJNJrP0hXCzsdRFL8xVxI/QKlifQij2UTLeFRA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJLk3G015495
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:21:46 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 14:21:46 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Fri, 13 Jul 2018 14:21:46 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v3 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
Thread-Index: AQHUGt3Wt2/nMEObI0ifxjKocp68j6SNhkdQ
Date: Fri, 13 Jul 2018 19:21:46 +0000
Message-ID: <f2cb8560ec1246eba91c8b3db3f1defb@ti.com>
References: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
	<1531509016-6395-4-git-send-email-e-ruei1@ti.com>
	<20180713191439.GM25410@beryl>
In-Reply-To: <20180713191439.GM25410@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
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
X-List-Received-Date: Fri, 13 Jul 2018 19:21:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The kernel module is the same for all window system.
The DDK 1.17 provides three window systems (nulldrmws, wayland and org (def=
ault)).
 I can create the one for nulldrmws by export the environment variable WIND=
OW_SYSTEM=3Dnulldrmws
Is there a way that I can do that at the recipe?

Best regards,

Eric



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, July 13, 2018 3:15 PM
To: Ruei, Eric
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v3 3/3] ti-sgx-ddk-km: add k3 (AM654x) suppor=
t

On Fri, Jul 13, 2018 at 03:10:16PM -0400, Eric Ruei wrote:
> - add K3 (AM654x) support based on SGX DDK 1.17
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...gx-ddk-km_1.14.3699939.bb =3D> ti-sgx-ddk-km_1.17.4948957.bb} | 10 ++=
++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb =3D> ti-=
sgx-ddk-km_1.17.4948957.bb} (75%)
>=20
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> similarity index 75%
> copy from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> copy to recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index a4eb82a..3ce9105 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://eurasia_km/README;beginline=
=3D13;endline=3D22;md5=3D74506d9
> =20
>  inherit module
> =20
> -COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
> +COMPATIBLE_MACHINE =3D "k3"
> =20
>  MACHINE_KERNEL_PR_append =3D "o"
>  PR =3D "${MACHINE_KERNEL_PR}"
> @@ -26,11 +26,9 @@ SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-l=
inux.git;protocol=3Dgit;branch
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "d2b3959738cfcc6209e8e882d1989de790866c8f"
> +SRCREV =3D "b630d462f5fbb86e5f98965ba1af35da1207822f"
> =20
> -TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
> -TARGET_PRODUCT_ti33x =3D "ti335x"
> -TARGET_PRODUCT_ti43x =3D "ti437x"
> +TARGET_PRODUCT_k3 =3D "ti654x"
> =20
>  EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" TARGET_PRODUCT=3D=
${TARGET_PRODUCT}'
> =20
> @@ -39,5 +37,5 @@ do_compile_prepend() {
>  }
> =20
>  do_install() {
> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B}/eurasia_km/eurasiacon/b=
inary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=3D${D} PREFIX=3D${=
STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B}/eurasia_km/eurasiacon/b=
inary_omap_linux_xorg_release/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}=
 PREFIX=3D${STAGING_DIR_HOST} modules_install

BTW, are these binaries with X11 or Wayland support? I see path has xorg he=
re ^^^


>  }
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

