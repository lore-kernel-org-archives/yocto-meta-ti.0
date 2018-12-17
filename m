Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2B0CE00C28; Mon, 17 Dec 2018 07:25:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CF08E00C10
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 07:25:52 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBHFPqai101724
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 09:25:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545060352;
	bh=l09bmss6R4XNDLox7Ky9SCt4/ZnCb1BO9DKWOKjzbZI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=w2UbuqJn7knSZxP72mRCcGVHmmZwowWmLiaKWrP2gxrdaWAn6fBInkvbGqB26jMx7
	S3iGJBoAilO//eE8pEE8VXQwfiupkShQZDqPIwDa3BXXpSml6NRtKnbxEoJSE8qQ+i
	DVy9hUjTFwFsmlt/dGju7dhIqQ/8SRNAHDU/EuFI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBHFPqbm068476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 09:25:52 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 17 Dec 2018 09:25:51 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1591.008; Mon, 17 Dec 2018 09:25:51 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH 05/34] common-csl-ip: SRCREV
	update to 03.03.00.13 and use 'release' branch
Thread-Index: AQHUk/rLsimUHPHsHE6n2NcAYqVKLKWDEOLg
Date: Mon, 17 Dec 2018 15:25:51 +0000
Message-ID: <33114b0a3ab841dfb1eed1e0a56e90a3@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
	<1544815903-10792-6-git-send-email-m-radhakrishnan2@ti.com>
	<20181214221726.GT517@beryl>
In-Reply-To: <20181214221726.GT517@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.196]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH 05/34] common-csl-ip: SRCREV update to 03.03.00.13 and use 'release' branch
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
X-List-Received-Date: Mon, 17 Dec 2018 15:25:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, December 14, 2018 5:17 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH 05/34] common-csl-ip: SRCREV up=
date to 03.03.00.13 and use 'release' branch

On Fri, Dec 14, 2018 at 02:31:14PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/co=
mmon-csl-ip/common-csl-ip.inc
> index 61fc3e6..201a524 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,17 +4,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5857833e=
20836213677fac33f9aded21"
> =20
>  COMPATIBLE_MACHINE =3D "keystone|dra7xx|ti33x|ti43x|omapl1"
> =20
> -PV =3D "03.03.00.12A"
> +PV =3D "03.03.00.13"
>  INC_PR =3D "r0"
> -PE =3D "1"
> +PE =3D "0"

Once Epoch gets bumped, you cannot go back. IIRC, it was due to PV going=20
backwards in a major way.


Okay, I will put it back and send an update=20

>  CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
>  CSL_GIT_PROTOCOL =3D"git"
> -CSL_GIT_BRANCH =3D "master"
> +CSL_GIT_BRANCH =3D "release"
>  CSL_GIT_DESTSUFFIX =3D "git"
> =20
> -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.12A"
> -CSL_SRCREV =3D "852cfe681c766a2096007fee37358c0782194897"
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.13"
> +CSL_SRCREV =3D "463b1f31dfc79e6fe393fcb9027c612872d4f7b1"
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

