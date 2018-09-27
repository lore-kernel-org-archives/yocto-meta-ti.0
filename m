Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDACDE00754; Thu, 27 Sep 2018 16:41:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B48CE00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:41:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNf5ZQ109327
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538091665;
	bh=jyxORouzHQ69oAKHyR2M/DmcSwwnNVADQd7/c0LyARk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cD13LWIDWfEabvg7CGHmHQKemjZQearocIu6NmXjeVxKk2k7UVDTxX/12KNo3vpqn
	fdTYuLWmfQtYJD5B5tSFjdFh4BfRs+EruwHyQ1EJtsYzqXpQ8Epu8UnIBkRFevj0c3
	9rfNkEUbV1JONhi2sx9tv/3HTAKXajsIZ+dyN/4I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNf5QN007415
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:41:05 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:41:04 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 18:41:04 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2 17/30] pm-lld-rtos: Update to
	version 01.08.00.19 and k3 support
Thread-Index: AQHUVqtB7HgEw6SIhE+vNHjr/TLFaaUEyQwA
Date: Thu, 27 Sep 2018 23:41:04 +0000
Message-ID: <11225c07e3d04da1aae75e0398203be0@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-18-git-send-email-m-radhakrishnan2@ti.com>
	<20180927214423.GQ8582@beryl>
In-Reply-To: <20180927214423.GQ8582@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 17/30] pm-lld-rtos: Update to version 01.08.00.19 and k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 23:41:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 27, 2018 5:44 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v2 17/30] pm-lld-rtos: Update t=
o version 01.08.00.19 and k3 support

On Thu, Sep 27, 2018 at 04:43:16PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 30 +++++++++++++++++++----------=
-
>  1 file changed, 19 insertions(+), 11 deletions(-)
>=20
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/p=
m-lld-rtos_git.bb
> index 3e4e4f7..4dc43f6 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -5,30 +5,34 @@ inherit ti-pdk
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://Power.h;beginline=3D1;endline=3D31;md5=3D52=
7b91fdcd26cd19ac07a754f45dedbe"
> =20
> -COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"
> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|k3"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> =20
>  PM_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pm-lld.git"
>  PM_LLD_GIT_PROTOCOL =3D "git"
> -PM_LLD_GIT_BRANCH =3D "int_pm_am335x"
> -PM_LLD_GIT_BRANCH_dra7xx-evm =3D "master"
> -PM_LLD_GIT_BRANCH_am57xx-evm =3D "master"
> -PM_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pm"
> =20
> -# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05A"
> -PM_LLD_SRCREV =3D "a5f12b8210ccea4b2e8848e54b4e178534771843"
> +PM_LLD_GIT_BRANCH =3D "master"
> +
> +PM_LLD_GIT_BRANCH_ti33x =3D "int_pm_am335x"
> +PM_LLD_GIT_BRANCH_ti43x =3D "int_pm_am335x"
> +PM_LLD_GIT_BRANCH_k2g =3D "int_pm_am335x"

Argh, sorry about the confusion - didn't realize am335x branch was also use=
d=20
for am437 and k2g. So, it doesn't really make it simpler.

Anyway, let's keep it this way with master as default and am335x as a speci=
al=20
case...

I agree. All new SOCs I believe will be built from master (the am335x,43x, =
k2g were an aberration which eventually will be merged to master in future)
The non master default causes confusion when adding new targets for sure.=20

> +PM_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pm"
> =20
> -# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.18"
> -PM_LLD_SRCREV_dra7xx-evm =3D "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> -PM_LLD_SRCREV_am57xx-evm =3D "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> +# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.19"
> +PM_LLD_SRCREV =3D "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
> =20
> +# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05B"
> +PM_LLD_SRCREV_ti33x =3D "bac16125842f08d05156dccabec74947756d831b"
> +PM_LLD_SRCREV_ti43x =3D "bac16125842f08d05156dccabec74947756d831b"
> +PM_LLD_SRCREV_k2g =3D "bac16125842f08d05156dccabec74947756d831b"
> =20
>  BRANCH =3D "${PM_LLD_GIT_BRANCH}"
>  SRC_URI =3D "${PM_LLD_GIT_URI};destsuffix=3D${PM_LLD_GIT_DESTSUFFIX};pro=
tocol=3D${PM_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> =20
>  SRCREV =3D "${PM_LLD_SRCREV}"
> -PV =3D "01.04.00.05A"
> +PV =3D "01.08.00.19"
>  PR =3D "r0"
> =20
>  S =3D "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> @@ -40,6 +44,10 @@ DEPENDS_append_ti33x =3D " starterware-rtos \
>  "
>  DEPENDS_append_ti43x =3D " starterware-rtos \
>  "
> +
> +DEPENDS_append_k3 =3D " sciclient-rtos \
> +"
> +
>  export PDK_PM_ROOT_PATH =3D "${WORKDIR}/build"
>  export DEST_ROOT=3D"${S}"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

