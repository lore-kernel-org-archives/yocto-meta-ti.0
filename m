Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F08C3E00B6C; Thu, 27 Sep 2018 13:10:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 880ADE0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:10:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKAcAx046024
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538079038;
	bh=UzyCiTWS43N1zJgsR/HO+E9TSQkzm4onFZfRzYbj0tM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=UAZ1/2M4HKEeGQMLsEta9a2XNzCEJ8DP+sg+O4ZLCpWPn98Oh2ExyDgwLn6t5DNB1
	gTqDTB/9oap7i5v7V6ULH4snh0JoqXNydK69KVC9ERg1AQh9e24S50tCcDB8pm0/a5
	wIHmKO2yke2a2GjY3lUJDR4/Affy66OiqwXTbvhI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKAcAg001618
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:10:38 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:10:37 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 15:10:37 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2 02/30] common-csl-ip: Update
	to version 03.03.00.12
Thread-Index: AQHUVp3J0eI3yKk6m0KrYnoaIBt1AKUEjmIQ
Date: Thu, 27 Sep 2018 20:10:37 +0000
Message-ID: <ca12e6b987354514a8daac5c10359236@ti.com>
References: <1538078682-5378-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538078682-5378-2-git-send-email-m-radhakrishnan2@ti.com>
	<20180927200758.GD8582@beryl>
In-Reply-To: <20180927200758.GD8582@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 02/30] common-csl-ip: Update to version 03.03.00.12
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
X-List-Received-Date: Thu, 27 Sep 2018 20:10:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 27, 2018 4:08 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v2 02/30] common-csl-ip: Update=
 to version 03.03.00.12

On Thu, Sep 27, 2018 at 04:04:42PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/co=
mmon-csl-ip/common-csl-ip.inc
> index ed8078d..baa7898 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5857833e20=
836213677fac33f9aded21"
> =20
>  COMPATIBLE_MACHINE =3D "keystone|dra7xx|ti33x|ti43x|omapl1"
> =20
> -PV =3D "05.01.00.00"
> +PV =3D "03.03.00.12"

Still backwards.

The previous version up streamed was wrong. It should have been 03.03.00.x =
consistent with the package.xdc & the versions mentioned in the release not=
es of CSL throughout.
This patch corrects it to the right version 03.03.00.12

>  INC_PR =3D "r0"
> =20
>  CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL =3D"git"
>  CSL_GIT_BRANCH =3D "master"
>  CSL_GIT_DESTSUFFIX =3D "git"
> =20
> -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.05.01.00.00"
> -CSL_SRCREV =3D "8db3d673101a504fd7fb36d6c9c4981e1e15ff50"
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.12"
> +CSL_SRCREV =3D "0c3b2c8a054d2af27fe1683e9aa579d43049a3bf"
> =20
>  BRANCH=3D"${CSL_GIT_BRANCH}"
>  SRC_URI =3D "${CSL_GIT_URI};protocol=3D${CSL_GIT_PROTOCOL};branch=3D${BR=
ANCH};destsuffix=3D${CSL_GIT_DESTSUFFIX}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

