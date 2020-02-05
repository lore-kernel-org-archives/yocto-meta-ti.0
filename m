Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.54.1580927069933143220
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 10:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qnzzawCa;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: sam.nelson@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C84E9E016CC; Wed,  5 Feb 2020 10:24:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 746C9E016C8
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2020 10:24:27 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 015IORa9027364
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2020 12:24:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580927067;
	bh=IiGAUpJChuyFnH2roPTDoaXKNDEWZYL1t52v2Ifjg0A=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qnzzawCaR1AnJIUkH7O92zvyPY2LDjVKwvaNSDqUaeYC1LlbPUXM1k6bgrlonhuJY
	 Vpv1979zvJNKeMuA4yt5TrOvFkP/DvyT2yPQ0CqwMkNvu85zs5LEYBOs+Gv0MZU2ZI
	 ql2bL6Y9QFxZJbv5Vhfn1WwGCORM23ZucpN8Yy0o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 015IOQhl020465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2020 12:24:26 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 5 Feb
 2020 12:24:26 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
 DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
 15.01.1847.003; Wed, 5 Feb 2020 12:24:26 -0600
From: "Sam Nelson" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][thud/master][PATCH] ti-ipc: Update to new version 3.51.00.00
Thread-Topic: [meta-ti][thud/master][PATCH] ti-ipc: Update to new version
 3.51.00.00
Thread-Index: AQHV3FFG1s8dQ2n+x0igaNwaAkyYLagM6kfg
Date: Wed, 5 Feb 2020 18:24:26 +0000
Message-ID: <abfa6dac6d51412893f0a15a76090d87@ti.com>
References: <1580926967-7906-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1580926967-7906-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.11]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore. Duplicate patch.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Wednesday, February 5, 2020 1:23 PM
> To: meta-ti@yoctoproject.org
> Cc: Nelson, Sam
> Subject: [meta-ti][thud/master][PATCH] ti-ipc: Update to new version
> 3.51.00.00
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-common.inc | 2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc   | 8 ++++----
>  recipes-ti/ipc/ti-ipc.inc        | 6 +++---
>  3 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-com=
mon.inc
> index 86a0fd0..96cbd66 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,4 +1,4 @@
> -PV =3D "3.50.04.08"
> +PV =3D "3.51.00.00"
>  INC_PR =3D "r0"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.=
inc
> index 4d0d449..c4ab268 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -24,9 +24,9 @@ protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
>  name=3D${TI_IPC_METADATA_NAME}"
>=20
> -# Corresponds to tag: 3.50.04.08
> -TI_IPC_METADATA_SRCREV =3D
> "48788ea79190c4995df4c802e8aa4e17f332943d"
> -# Corresponds to tag: 3.50.04.08
> +# Corresponds to tag: 3.51.00.00
> +TI_IPC_METADATA_SRCREV =3D
> "1bf668fd6b0ec2ef6956fa55b8484d0b21a9f9e2"
> +# Corresponds to tag: 3.51.00.00
>  TI_IPC_EXAMPLES_SRCREV =3D
> "4707fcbbe0d136e781c4a7ffdc072be407c34358"
>=20
>  SRCREV_FORMAT =3D "default"
> @@ -39,7 +39,7 @@ S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
>  RELEASE_TYPE =3D "GA"
>  RELEASE_SUFFIX =3D ""
>=20
> -PR =3D "${INC_PR}.r2"
> +PR =3D "${INC_PR}.r0"
>=20
>  DEPENDS_append_keystone =3D " ti-cgt6x-native \
>                              gcc-arm-none-eabi-native \
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index d1eaad2..1206e33 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9
>=20
>  TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL =3D "git"
> -TI_IPC_GIT_BRANCH =3D "3.50"
> +TI_IPC_GIT_BRANCH =3D "master"
>=20
> -#Corresponds to 3.50.04.08
> -TI_IPC_SRCREV =3D "1d53b856338b86d1979fe09345c0b382913a848a"
> +#Corresponds to 3.51.00.00
> +TI_IPC_SRCREV =3D "36b2fe589de8d2d79db7c076c2ca3b0a7488fc15"
>=20
>  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
>  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};n
> ame=3Dipcdev"
> --
> 1.9.1

