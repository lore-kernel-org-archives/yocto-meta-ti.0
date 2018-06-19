Return-Path: <d-senicic1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F742E011AD; Tue, 19 Jun 2018 13:59:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44AF0E007AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2018 13:59:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5JKxgbl029345
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2018 15:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529441982;
	bh=2Ql8G8dxjrR57zH9FJb2g5MT94DtGi6OGGH5hLGF6iU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=SdAZ9dBzF+iybYBVSGvrjsrvZaJg7e+ub8qaIV93DpDUwsrKyVT3h/KV2j1EhJCgv
	GFrzj9X0Rbe8bWXPyXj4Rg4CnO9sMpMskiVJLJ1aUv2GGJ8G0JO4nCCjC97cYTyYYE
	4LEBhBwTkNEmfM98iANvVKUuMd8ns99FARNg9Y7c=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5JKxg1r018964
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2018 15:59:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 19 Jun 2018 15:59:42 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Tue, 19 Jun 2018 15:59:42 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master/ti2018.01][PATCHv2] ti-pdk-build: New
	DEV.PDK_BUILD.01.00.00.08F
Thread-Index: AQHUCBBL0sLy1OMX00GtrpMRrBdtKqRoEIkQ
Date: Tue, 19 Jun 2018 20:59:42 +0000
Message-ID: <78f0f531a62849309a620e45af6d09d2@ti.com>
References: <1529441821-3936-1-git-send-email-x0157990@ti.com>
	<20180619205733.GV3859@beryl>
In-Reply-To: <20180619205733.GV3859@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.185]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master/ti2018.01][PATCHv2] ti-pdk-build: New DEV.PDK_BUILD.01.00.00.08F
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
X-List-Received-Date: Tue, 19 Jun 2018 20:59:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jake asked to submit to ti2018.01, so only subject line.
This patch is needed for PLSDK5.0

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, June 19, 2018 4:58 PM
To: Senicic, Djordje
Cc: meta-ti@yoctoproject.org; Senicic, Djordje
Subject: Re: [meta-ti] [rocko/master/ti2018.01][PATCHv2] ti-pdk-build: New =
DEV.PDK_BUILD.01.00.00.08F

What's the difference from v1?


On Tue, Jun 19, 2018 at 04:57:01PM -0400, Djordje Senicic wrote:
> * Enhancements for semi-hosting support
> * Add TDA2x cascade board support
> * Adding arp32 makefile
> * Add McBSP component
> * mmwvedfp migration
>=20
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-t=
i/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index 0f60714..e81f6e8 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM =3D "file://makerules/env.mk;beginline=
=3D1;endline=3D31;md5=3D10503e8de
> =20
>  require recipes-ti/includes/ti-paths.inc
> =20
> -PV =3D "01.00.00.08E"
> +PV =3D "01.00.00.08F"
>  PR =3D "r0"
> =20
>  PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-buil=
d.git"
>  PDK_BUILD_GIT_PROTOCOL =3D "git"
>  PDK_BUILD_GIT_BRANCH =3D "master"
> =20
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08E"
> -PDK_BUILD_SRCREV =3D "9622a097c143188cab74b8827461eafdf54f8ed9"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08F"
> +PDK_BUILD_SRCREV =3D "4d41f3540af5850f1c7f57afcb8a7b4610cfc8f0"
> =20
>  BRANCH =3D "${PDK_BUILD_GIT_BRANCH}"
>  SRC_URI =3D "\
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

