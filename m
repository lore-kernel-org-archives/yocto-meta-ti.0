Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD6D5E01538; Mon, 18 Jun 2018 11:29:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01D19E01252
	for <meta-ti@yoctoproject.org>; Mon, 18 Jun 2018 11:29:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5IITK86011977
	for <meta-ti@yoctoproject.org>; Mon, 18 Jun 2018 13:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529346560;
	bh=F5QwmLXlhaCIwmfvpfX4d5ACAO64XfPzYD1S4OcGoMM=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=WnWicsFOecMgtGCBdn9x6NS4yN4EHJnP0Za47xlrfQSb+H/OyuyxieqalSXMZo0AB
	sAjY0G9YkD8jtJ4r9DVXNftmHt3m5jeu9NcuWYStgGAQ7wdtiGOD66ENcW1oNTokso
	Bo0z4+xWU+zZFgbd5s1fKhjQC3s1vkNg+NGkmd+4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5IITKDb019639
	for <meta-ti@yoctoproject.org>; Mon, 18 Jun 2018 13:29:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 18 Jun 2018 13:29:20 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Mon, 18 Jun 2018 13:29:20 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [rocko/master][PATCH] ti-pdk-build: New
	DEV.PDK_BUILD.01.00.00.08F
Thread-Index: AQHUBnDbTOBaZY41LE+NBjhza68v7qRmV3Iw
Date: Mon, 18 Jun 2018 18:29:19 +0000
Message-ID: <1a6cc17f8f8c400cbad046e36cdfc55a@ti.com>
References: <1529263469-20920-1-git-send-email-x0157990@ti.com>
In-Reply-To: <1529263469-20920-1-git-send-email-x0157990@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [rocko/master][PATCH] ti-pdk-build: New DEV.PDK_BUILD.01.00.00.08F
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
X-List-Received-Date: Mon, 18 Jun 2018 18:29:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please add this to the ti2018.01 branch.

Acked-by: Jacob Stiffler <j-stiffler@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Senicic, Djordje
> Sent: Sunday, June 17, 2018 3:24 PM
> To: meta-ti@yoctoproject.org
> Cc: Senicic, Djordje; Senicic, Djordje
> Subject: [EXTERNAL] [meta-ti] [rocko/master][PATCH] ti-pdk-build: New
> DEV.PDK_BUILD.01.00.00.08F
>=20
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
i/ti-
> pdk-build/ti-pdk-build-rtos_git.bb
> index 0f60714..e81f6e8 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM =3D
> "file://makerules/env.mk;beginline=3D1;endline=3D31;md5=3D10503e8de
>=20
>  require recipes-ti/includes/ti-paths.inc
>=20
> -PV =3D "01.00.00.08E"
> +PV =3D "01.00.00.08F"
>  PR =3D "r0"
>=20
>  PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-
> build.git"
>  PDK_BUILD_GIT_PROTOCOL =3D "git"
>  PDK_BUILD_GIT_BRANCH =3D "master"
>=20
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08E"
> -PDK_BUILD_SRCREV =3D "9622a097c143188cab74b8827461eafdf54f8ed9"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08F"
> +PDK_BUILD_SRCREV =3D "4d41f3540af5850f1c7f57afcb8a7b4610cfc8f0"
>=20
>  BRANCH =3D "${PDK_BUILD_GIT_BRANCH}"
>  SRC_URI =3D "\
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

