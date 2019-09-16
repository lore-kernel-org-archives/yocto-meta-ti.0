Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD326E00B33; Mon, 16 Sep 2019 12:24:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EF3CE0098A
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 12:24:16 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GJOFeT036559
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 14:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568661855;
	bh=y9CZab3OT2ngKLUW82iFmBt8s7EsbOfDivE2LW2Wq5M=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=dbJ8EFsU4GgyqChkEqqFc+MPZPreSOzOIAky4pz7rpjUfHAXhGp8XUfBYyvD8c0ge
	Ef7WOT80HKHxv/E84NtERVtqAV54K78T79AvPUsH51ExW3Y7gmsiYWnjsqmqYt7t4P
	D7zH1KJwrpK2bQGY33l/wkQA/HyRDcd0utA5wj3Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GJOF6u112777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 14:24:15 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 14:24:13 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1713.004; Mon, 16 Sep 2019 14:24:13 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [thud/master] ti-ipc: Update to new version 3.50.04.07
Thread-Index: AQHVanZZElJlOoccHUu6egBEfDUeYacus6UA
Date: Mon, 16 Sep 2019 19:24:13 +0000
Message-ID: <490bcfb2a61b460ebcdbd088139f23d6@ti.com>
References: <1568408431-59130-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1568408431-59130-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [thud/master] ti-ipc: Update to new version 3.50.04.07
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ti-ipc-rtos fails on am65xx with "error: ti.drv.sciclient.Settings: no elem=
ent named 'coreType'"


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> Sent: Friday, September 13, 2019 5:01 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [thud/master] ti-ipc: Update to new version 3.50.04.07
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-common.inc | 2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc   | 6 +++---
>  recipes-ti/ipc/ti-ipc.inc        | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-com=
mon.inc
> index 4ec72cc..365486e 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,4 +1,4 @@
> -PV =3D "3.50.04.06"
> +PV =3D "3.50.04.07"
>  INC_PR =3D "r0"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.=
inc
> index 460befe..3d4a7a2 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -24,9 +24,9 @@ protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
>  name=3D${TI_IPC_METADATA_NAME}"
>=20
> -# Corresponds to tag: 3.50.04.06
> -TI_IPC_METADATA_SRCREV =3D
> "15d256ea3c3a35fe065a0513f09f4ea6ece58725"
> -# Corresponds to tag: 3.50.04.06
> +# Corresponds to tag: 3.50.04.07
> +TI_IPC_METADATA_SRCREV =3D
> "37e85ff1966f7d093fe2bde2dd9d4546f29d0d80"
> +# Corresponds to tag: 3.50.04.07
>  TI_IPC_EXAMPLES_SRCREV =3D "f29c27652302892abbe78ce2c22a2aae28b28d69"
>=20
>  SRCREV_FORMAT =3D "default"
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index b9f9ca9..000c5c0 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,8 +8,8 @@ TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL =3D "git"
>  TI_IPC_GIT_BRANCH =3D "3.50"
>=20
> -#Corresponds to 3.50.04.06
> -TI_IPC_SRCREV =3D "ca7ce99b8ec82331559f0fd99a174bdcca1da9ac"
> +#Corresponds to 3.50.04.07
> +TI_IPC_SRCREV =3D "129b6f44c50cbe760a5c1481b34b323b7a42ead5"
>=20
>  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
>  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};n=
a
> me=3Dipcdev"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

