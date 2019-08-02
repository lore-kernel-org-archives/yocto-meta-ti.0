Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A41E2E00EB0; Fri,  2 Aug 2019 12:28:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 104FEE00EAA
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 12:28:55 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72JStj6116039
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564774135;
	bh=lAv6+pzz6SPFxKsRHr4lGXu8yaOYF7BXyquuiLqsUNI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=dYiCUjQJJ3w79XZX1Td4pdE9+A5OHVe7o7JcLKKvscDJOcOfe4UXR08KO7c55OAcG
	AbE55Yb/4FoPcAxYnqwKc/fD2Urm6RQ75KMA7WhB/H8Gl/M3VdKrOr+sRbEpxEdkgb
	8Io9K9brh9+sm7s10RZyokqqYmSB7Vzlzl+MzHM0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72JStWr068851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:28:55 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 14:28:54 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Fri, 2 Aug 2019 14:28:54 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] ti-img-rogue-driver: Update recipe to pick newer version
Thread-Index: AQHVSWhv3ucWJeFWWEqXikWRtSFX56boPiAg
Date: Fri, 2 Aug 2019 19:28:54 +0000
Message-ID: <c712cd58ad6d445e96780796c30eb6dc@ti.com>
References: <20190802193001.20559-1-g-tammana@ti.com>
In-Reply-To: <20190802193001.20559-1-g-tammana@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [PATCH] ti-img-rogue-driver: Update recipe to pick newer version
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
X-List-Received-Date: Fri, 02 Aug 2019 19:28:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Missed on meta-ti tag in the subject. Will send v2.

Thanks,
Gowtham

>-----Original Message-----
>From: Tammana, Gowtham
>Sent: Friday, August 02, 2019 2:30 PM
>To: Dmytriyenko, Denys; meta-ti@yoctoproject.org
>Cc: Tammana, Gowtham
>Subject: [PATCH] ti-img-rogue-driver: Update recipe to pick newer version
>
>Updated the recipe to pick the newer version, 1.10.5371573, of rogue
>gpu kernel sources.
>
>Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>---
> ...er_1.10.5187610.bb =3D> ti-img-rogue-driver_1.10.5371573.bb} | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.10.5187610.bb =
=3D>
>ti-img-rogue-driver_1.10.5371573.bb} (92%)
>
>diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.=
bb
>b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
>similarity index 92%
>rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.b=
b
>rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
>index 9ae60c4e..fcf35edc 100644
>--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
>+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
>@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>"file://README;beginline=3D15;endline=3D20;md5=3D0403c7dea01a2b8232
>
> inherit module
>
>-MACHINE_KERNEL_PR_append =3D "e"
>+MACHINE_KERNEL_PR_append =3D "a"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>@@ -20,7 +20,7 @@ BRANCH =3D "linuxws/thud/k4.19/${PV}"
> SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-
>driver.git;branch=3D${BRANCH}"
> S =3D "${WORKDIR}/git"
>
>-SRCREV =3D "976f73444ef86b231819052bba2020e5b00aeb06"
>+SRCREV =3D "1531b98ba602911359bfded2d683e49b3c731313"
>
> PVR_SOC =3D "j721e_linux"
> PVR_BVNC =3D "22.104.208.318"
>--
>2.22.0


