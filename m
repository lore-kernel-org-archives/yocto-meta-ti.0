Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 930FDE00CF5; Tue, 25 Oct 2016 20:45:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 333C1E00CEA
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 20:45:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9Q3jRrM011393;
	Tue, 25 Oct 2016 22:45:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9Q3jRHc012391;
	Tue, 25 Oct 2016 22:45:27 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Tue, 25 Oct 2016 22:45:26 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: Arago Project git <git@arago-project.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Denys Dmytriyenko : ti-ipc: update to 3.43.03.05
	version
Thread-Index: AQHSLxOHFkHFtvi+NUKB3YcAVyX63qC6GJfw
Date: Wed, 26 Oct 2016 03:45:25 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490584C4CCD@DLEE11.ent.ti.com>
References: <20161025225610.0E5E952AD8@arago-project.org>
In-Reply-To: <20161025225610.0E5E952AD8@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: Denys Dmytriyenko : ti-ipc: update to 3.43.03.05 version
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
X-List-Received-Date: Wed, 26 Oct 2016 03:45:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Arago Project git
> Sent: Tuesday, October 25, 2016 6:56 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Denys Dmytriyenko : ti-ipc: update to 3.43.03.05 versi=
on
>=20
> Module: meta-ti
> Branch: master
> Commit: ec712fdccb9490fb134a3fe59cdc636d438948f5
> URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3Dec712fdccb9490fb134a3fe59cdc636d438948f5
>=20
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Wed Oct 26 03:03:49 2016 +0000
>=20
> ti-ipc: update to 3.43.03.05 version
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  recipes-ti/ipc/ti-ipc-rtos_git.bb |    8 ++++----
>  recipes-ti/ipc/ti-ipc.inc         |    6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rt=
os_git.bb
> index 53c9a6e..e03e753 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -26,16 +26,16 @@ protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
>  name=3D${TI_IPC_METADATA_NAME}"
>=20
> -# Corresponds to tag: 3.43.02.04
> +# Corresponds to tag: 3.43.03.05
>  SRCREV_ipc-examples =3D "766ee598c790c95dad80f9e5db5051e35de4e18f"
>=20
> -# Corresponds to tag: 3.43.02.04
> -SRCREV_ipc-metadata =3D "394e8b9fda6981f4c485c4a48c0a13a0a3236390"
> +# Corresponds to tag: 3.43.04.05
> +SRCREV_ipc-metadata =3D "70d397241ebb4b2fd5a09cb9d506ecbbb3f4ad1e"
>=20
>  S_ipc-examples =3D "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
>=20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>=20
>  DEPENDS =3D "ti-xdctools ti-sysbios doxygen-native zip-native"
>  DEPENDS_append_keystone =3D " ti-cgt6x-native \ diff --git a/recipes-ti/=
ipc/ti-
> ipc.inc b/recipes-ti/ipc/ti-ipc.inc index 3ce02c4..cf576d1 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,15 +8,15 @@ TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL =3D "git"
>  TI_IPC_GIT_BRANCH =3D "3.43"
>=20
> -#Corresponds to 3.43.02.04
> -TI_IPC_SRCREV =3D "c179a1f4a102fc0c2b72da4db87753c8e523d639"
> +#Corresponds to 3.43.03.05
> +TI_IPC_SRCREV =3D "6c2b64342cbd0317527a0924140566b2446488f5"
>=20
>  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
>  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};n
> ame=3Dipcdev"
>  SRCREV =3D "${TI_IPC_SRCREV}"
>=20
>  S =3D "${WORKDIR}/git"
> -PV =3D "3.43.02.04"
> +PV =3D "3.43.03.05"
>  INC_PR =3D "r0"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

