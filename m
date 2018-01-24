Return-Path: <sjmolfetta@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35704E00D99; Wed, 24 Jan 2018 05:16:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E795FE00CE8
	for <meta-ti@yoctoproject.org>; Wed, 24 Jan 2018 05:16:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0ODGq7i014064
	for <meta-ti@yoctoproject.org>; Wed, 24 Jan 2018 07:16:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516799812;
	bh=qne7Eg2/dfdjzvGEbMZuffeAU6nxyX5DHDO/ounqmwI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=x4Dn5uv2olVL6bRM1hz+Qfg147dK9d1EYE9ArKUeWr85aX+dE8o+VItjMfgsWk7Gt
	qc8eNsKuI3UsK7Skv/ILILe8Ds5HvbzuDIdEoyvwXzgvO0SxOTCKKOAfH/lUqJpwm7
	wiJSUh1tr37SKFoxrG7vXCDQdCY7sL6NiGI7KVt8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0ODGqlQ003681
	for <meta-ti@yoctoproject.org>; Wed, 24 Jan 2018 07:16:52 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 24 Jan 2018 07:16:51 -0600
Received: from DLEE104.ent.ti.com ([fe80::1b8:1a58:6ede:b6f0]) by
	DLEE104.ent.ti.com ([fe80::1b8:1a58:6ede:b6f0%17]) with mapi id
	15.01.1261.035; Wed, 24 Jan 2018 07:16:51 -0600
From: "Molfetta, Stephen" <sjmolfetta@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti]  [PATCH] dra7xx-evm.conf: removing am57xx SOCS from PDK
Thread-Index: AQHTlJfN7JcuKaiHwU+ZDcJR+vGMeqODAUQQ
Date: Wed, 24 Jan 2018 13:16:51 +0000
Message-ID: <5606eef4743d48e58e43f19ac4f6b606@ti.com>
References: <1516652148-16513-1-git-send-email-sjmolfetta@ti.com>
	<20180123221621.GA10142@edge>
In-Reply-To: <20180123221621.GA10142@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.88.129]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] dra7xx-evm.conf: removing am57xx SOCS from PDK
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
X-List-Received-Date: Wed, 24 Jan 2018 13:16:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, please merge into morty.

Agreed on where PDK SOCs ought to be set, but I'm not sure whether this wil=
l break am57xx builds right now and will let Jake comment further.

Thanks,
Stephen

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, January 23, 2018 4:16 PM
To: Molfetta, Stephen; Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] dra7xx-evm.conf: removing am57xx SOCS from P=
DK

I assume, you want this merged into morty too, correct?

This change is fine with me, but I'd go even further and move setting initi=
al TI_PDK_LIMIT_SOCS from omap-a15.inc into am57xx-evm.conf=20


Jake,

Do you have any comments?


On Mon, Jan 22, 2018 at 02:15:48PM -0600, Stephen Molfetta wrote:
> opencl-monitor does not distinguish between dra7xx and am57xx devices,
> treating both as the same and attempting to build for am57xx regardless.
> However, this is dependent on common-csl-ip-rtos, a component of PDK,
> which in general does handle these devices differently.  The definition
> of am57xx SOCs in the PDK list from omap-15.conf gets inherited by
> dra7xx-evm.conf, thereby creating a rule that all dra7xx PDK recipes
> must build am57xx libraries. This results in a dra7xx image which is
> much larger than necessary, and more severely, creates an artifical
> dependency link between these two devices and introduces build failures
> for various PDK recipes.
>=20
> Instead, we now override the PDK SOC definition in dra7xx-evm.conf, and
> only in the CSL RTOS recipe do we append the am57xx SOCS for dra7xx-evm
> machine build.  This allows for opencl-monitor to build successfully for
> dra7xx while preventing any other PDK recipes from attempting to build
> libraries for am57xx devices.
>=20
> This is a workaround that must stay in place until opencl build can
> properly comprehend am57xx and dra7xx independently, and/or omap-a15
> is not implied to be synonymous with am57xx in various recipes.
>=20
> Signed-off-by: Stephen Molfetta <sjmolfetta@ti.com>
> ---
>  conf/machine/dra7xx-evm.conf                        | 2 +-
>  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
> index 91afd85..7db9ff6 100644
> --- a/conf/machine/dra7xx-evm.conf
> +++ b/conf/machine/dra7xx-evm.conf
> @@ -40,4 +40,4 @@ UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
> =20
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_BOARDS =3D "evmDRA72x evmDRA75x evmDRA78x"
> -TI_PDK_LIMIT_SOCS_append =3D " dra72x dra75x dra78x"
> +TI_PDK_LIMIT_SOCS =3D "dra72x dra75x dra78x"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipe=
s-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index f4496b9..100d2f4 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -1,5 +1,5 @@
>  require common-csl-ip.inc
> -PR =3D "${INC_PR}.5"
> +PR =3D "${INC_PR}.6"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE_append =3D "|c66x"
> @@ -16,3 +16,6 @@ export DEST_ROOT=3D"${S}"
> =20
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT =3D "CSL-Chip Support Library"
> +
> +# Workaround: dra7xx build requires am57xx CSL libraries for opencl-moni=
tor
> +TI_PDK_LIMIT_SOCS_append_dra7xx =3D " am571x am572x"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

