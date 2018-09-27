Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22093E0090A; Thu, 27 Sep 2018 16:38:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DECD3E00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:37:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNbxvo026710
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538091479;
	bh=qxn5zI+8e5JpOII8oIIaiMeC3v9xHhPmXw3tcq785ps=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=IalK7A87QjkDonBJPGGjN0xa9zUt0g0Uejugi42ZPNhpTYlgFTCgRBY5S1+zNlIhH
	0P16Av97ibWCN8REfhM/orpZkxyQN5SsQziEqFuTLeYe5x2uPKHI6uMWdDPgQd4/uP
	ULk64GI7uU+RFXoSIEka8gF9ZS/oDSv8VFejW6RY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNbxFF028545
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:37:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:37:59 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 18:37:58 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2 20/30] pcie-lld-rtos: Update
	to version 02.03.00.01 and added k3 support
Thread-Index: AQHUVqtlBydUFJjeKU+lV+eO+3e+fKUEyEwA
Date: Thu, 27 Sep 2018 23:37:58 +0000
Message-ID: <9093020a82614713b6bff4433652cdad@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-21-git-send-email-m-radhakrishnan2@ti.com>
	<20180927214524.GR8582@beryl>
In-Reply-To: <20180927214524.GR8582@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 20/30] pcie-lld-rtos: Update to version 02.03.00.01 and added k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 23:38:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 27, 2018 5:45 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v2 20/30] pcie-lld-rtos: Update=
 to version 02.03.00.01 and added k3 support

On Thu, Sep 27, 2018 at 04:43:19PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie=
-lld/pcie-lld-rtos_git.bb
> index 1b7218a..35a0cbc 100644
> --- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> +++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> @@ -3,9 +3,9 @@ SUMMARY =3D "TI RTOS low lever driver for Peripheral Inte=
rconnect Express (PCIE)"
>  inherit ti-pdk
> =20
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://pcie.h;beginline=3D1;endline=3D34;md5=3Dc09=
4db055596498ba803933936611eb2"
> +LIC_FILES_CHKSUM =3D "file://pcie.h;beginline=3D1;endline=3D34;md5=3D566=
a784d78790a716d641764d5d60b74"

Why the change?
The copyright year changed. Here is the diff
 @@ -1,6 +1,6 @@
 /*
  *
- * Copyright (C) 2010-2016 Texas Instruments Incorporated - http://www.ti.=
com/
+ * Copyright (C) 2010-2018 Texas Instruments Incorporated - http://www.ti.=
com/^M
  *
  *


> -COMPATIBLE_MACHINE =3D "omap-a15|keystone|c66x"
> +COMPATIBLE_MACHINE =3D "omap-a15|keystone|c66x|k3"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  PCIE_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pcie-lld.git"
> @@ -13,16 +13,19 @@ PCIE_LLD_GIT_PROTOCOL =3D "git"
>  PCIE_LLD_GIT_BRANCH =3D "master"
>  PCIE_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pcie"
> =20
> -# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.13"
> -PCIE_LLD_SRCREV =3D "bf8d3a22c03a5f273321c284fa1737072eca3f77"
> +# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.01"
> +PCIE_LLD_SRCREV =3D "61759fc238600e3d5506ce86db1f6b604334edf8"
> =20
>  BRANCH =3D "${PCIE_LLD_GIT_BRANCH}"
>  SRC_URI =3D "${PCIE_LLD_GIT_URI};destsuffix=3D${PCIE_LLD_GIT_DESTSUFFIX}=
;protocol=3D${PCIE_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> =20
>  SRCREV =3D "${PCIE_LLD_SRCREV}"
> -PV =3D "02.02.00.13"
> +PV =3D "02.03.00.01"
>  PR =3D "r0"
> =20
> +DEPENDS_append_k3 =3D " udma-lld-rtos \
> +"
> +
>  S =3D "${WORKDIR}/${PCIE_LLD_GIT_DESTSUFFIX}"
> =20
>  export PDK_PCIE_ROOT_PATH =3D"${WORKDIR}/build"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

