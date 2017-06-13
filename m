Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DEF1E00B9F; Mon, 12 Jun 2017 20:26:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E007E00B76
	for <meta-ti@yoctoproject.org>; Mon, 12 Jun 2017 20:26:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5D3QBnb026101
	for <meta-ti@yoctoproject.org>; Mon, 12 Jun 2017 22:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497324371;
	bh=I1yjSn8zpYskrwxtb73vnBE4Xu810FQLC4KN88r8G2E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jjrwmc3ZNnTSn8YNLHb6D91HBqUocITI1jsEPzvmqfunqt8gTKkCoRwdKJ0FUBPVt
	0jqUwxvZQA2FvbZXFhDTs9MPxp1d0hnQS0KuonaxdjHq3KKzI4QIFk7/9eUHTojJyl
	pfj5mkIErxqXRwcHdjSEqFWn0V/MQ1AEVaGnHVRo=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5D3QBb1022679
	for <meta-ti@yoctoproject.org>; Mon, 12 Jun 2017 22:26:11 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 12 Jun 2017 22:26:10 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Pang, Ivan" <i-pang@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] starterware-rtos: added recipe for RTOS
	starterware
Thread-Index: AQHS4+hLIeL46Hc7mUadadadfXadlKIiIXOA
Date: Tue, 13 Jun 2017 03:26:10 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE14C0B6FDA@DFLE12.ent.ti.com>
References: <1496686180-21056-1-git-send-email-i-pang@ti.com>
	<20170613015610.GJ21219@edge>
In-Reply-To: <20170613015610.GJ21219@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] starterware-rtos: added recipe for RTOS starterware
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
X-List-Received-Date: Tue, 13 Jun 2017 03:26:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ivan,

Did you verify the commit ID is locked for the upcoming release before upst=
reaming this?  You'll have to upstream another patch soon if not.

Justin

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Monday, June 12, 2017 9:56 PM
To: Pang, Ivan
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] starterware-rtos: added recipe for RTOS s=
tarterware

Jake,

Do you have any comments?


On Mon, Jun 05, 2017 at 01:09:40PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-bsp/starterware/starterware-rtos_git.bb | 46=20
> +++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb
>=20
> diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb=20
> b/recipes-bsp/starterware/starterware-rtos_git.bb
> new file mode 100644
> index 0000000..3fbe763
> --- /dev/null
> +++ b/recipes-bsp/starterware/starterware-rtos_git.bb
> @@ -0,0 +1,46 @@
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://Makefile;beginline=3D1;endline=3D35;md5=3D2=
86cbb5dce3e348294b6b025cff969b3"
> +
> +COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> +DEPENDS =3D "gcc-arm-none-eabi-native"
> +
> +require recipes-ti/includes/ti-staging.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +STARTERWARE_GIT_URI =3D "git://git.ti.com/keystone-rtos/starterware.git"
> +STARTERWARE_GIT_PROTOCOL =3D "git"
> +STARTERWARE_GIT_BRANCH =3D "master"
> +
> +# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.02A"
> +STARTERWARE_SRCREV =3D "d648ffc46a3508802ec5d4f70f3d0e8f970ce1fa"
> +
> +BRANCH =3D "${STARTERWARE_GIT_BRANCH}"
> +SRC_URI =3D "${STARTERWARE_GIT_URI};protocol=3D${STARTERWARE_GIT_PROTOCO=
L};branch=3D${BRANCH}"
> +
> +SRCREV =3D "${STARTERWARE_SRCREV}"
> +PV =3D "02.01.01.02A"
> +PR =3D "r0"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PARTNO_ti33x =3D "am335x"
> +PARTNO_ti43x =3D "am437x"
> +
> +export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> +
> +do_compile() {
> +    cd build
> +    ./release_${PARTNO}.sh
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C=20
> +${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \; }
> +
> +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INSANE_SKIP_${PN} =3D "arch staticdev"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

