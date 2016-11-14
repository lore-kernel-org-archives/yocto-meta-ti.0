Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 869B2E00563; Mon, 14 Nov 2016 10:26:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 9416 seconds by postgrey-1.32 at yocto-www;
	Mon, 14 Nov 2016 10:26:19 PST
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 474C1E0050B
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2016 10:26:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uAEFnMXk025031
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2016 09:49:22 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uAEFnMUc003889
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2016 09:49:22 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Mon, 14 Nov 2016 09:49:22 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] mpm-transport: Update commit id with fixes
Thread-Index: AQHSPPOG4n9/iX267Uq7qFpAODA2sKDYo2RA
Date: Mon, 14 Nov 2016 15:49:21 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490584E16F9@DLEE11.ent.ti.com>
References: <1478961971-54163-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1478961971-54163-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] mpm-transport: Update commit id with fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 18:26:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK
Ignore this.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Saturday, November 12, 2016 9:46 AM
> To: meta-ti@yoctoproject.org
> Cc: Nelson, Sam
> Subject: [PATCH] mpm-transport: Update commit id with fixes
>=20
> Update and fixes to handle different type of memory sections in sysfs ent=
ry
> or device tree.
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/mpm-transport/mpm-transport_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-
> ti/mpm-transport/mpm-transport_git.bb
> index 51b5e9e..ee28f2f 100644
> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> @@ -15,11 +15,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  SRC_URI =3D "git://git.ti.com/keystone-linux/mpm-
> transport.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
>  BRANCH =3D "master"
> -# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00 -
> SRCREV =3D "696a9ec37559b671860ef393194c6032b7b6d9ef"
> +# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00A
> SRCREV
> +=3D "7284e75d36b265ef8535d2e2ee54d1f2c700e862"
>=20
>  PV =3D "2.0.2.0"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
>  EXTRA_OEMAKE_append_k2hk-evm +=3D "HYPLNK_TRANSPORT=3Dtrue
> SRIO_TRANSPORT=3Dtrue"
> --
> 1.9.1


