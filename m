Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCF1CE00985; Fri, 28 Apr 2017 07:37:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71EEDE00953
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 07:37:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SEbK5T009325
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 09:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493390240;
	bh=9WqXuKCaAbGtZJARqQsHgRUq4EKbd1aLH3DneU2P2kg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TSh9nCHEJaWWdViXDlLruRy+MqiWU48VNk05AI0VKBbIoRmNF0dQhdYfFKPo79AOY
	N+tHC4uq4hG21ikxrKIvB4kfKtViy81OAgAi7pZwZxthfkV9eF6SzKhSFLoHt/xWsP
	rbjhUWI+sxm2vJfGXg+SBfOXpV7WQjPK7Z150t8Y=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SEbFt1027755
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 09:37:15 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 28 Apr 2017 09:37:15 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [master/morty][PATCH] Resolve host contamination
	warnings
Thread-Index: AQHSv7WSD06CqfnJsUm+CMO7gpFVPqHa2gAQ
Date: Fri, 28 Apr 2017 14:37:14 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE14C092A75@DFLE12.ent.ti.com>
References: <1493331034-13464-1-git-send-email-jsobota@ti.com>
	<20170428002250.GI31608@edge>
In-Reply-To: <20170428002250.GI31608@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/morty][PATCH] Resolve host contamination warnings
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
X-List-Received-Date: Fri, 28 Apr 2017 14:37:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hmm...I rebased with latest from morty, including Karthik's patches which t=
ouch two of the files in this patch, and the patch applied cleanly.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, April 27, 2017 8:23 PM
To: Sobota, Justin
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [master/morty][PATCH] Resolve host contamination war=
nings

Does not apply - haven't checked what's wrong yet...


On Thu, Apr 27, 2017 at 06:10:34PM -0400, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  classes/ti-pdk.bbclass                                      | 2 +-
>  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb                 | 5 +++--
>  recipes-ti/bios/ti-sysbios.inc                              | 3 ++-
>  recipes-ti/devtools/ti-cg-xml_2.41.00.bb                    | 3 ++-
>  recipes-ti/dsplib/dsplib-c66x.inc                           | 3 ++-
>  recipes-ti/framework-components/ti-framework-components.inc | 3 ++-
>  recipes-ti/imglib/imglib-c66x.inc                           | 3 ++-
>  recipes-ti/mathlib/mathlib-c66x.inc                         | 3 ++-
>  recipes-ti/xdais/ti-xdais.inc                               | 3 ++-
>  9 files changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass index=20
> fd7c3e7..d4dbb5f 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -89,7 +89,7 @@ do_compile() {
> =20
>  do_install () {
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> -    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages \;
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C=20
> + ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
>     =20
>      if [ "${PDK_COMP_LINK_TEXT}" !=3D "" ]
>      then
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb=20
> b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> index 6a01d0b..63dca8f 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> @@ -2,7 +2,7 @@ require edma3-lld.inc
>  require recipes-ti/includes/ti-paths.inc  require=20
> recipes-ti/includes/ti-staging.inc
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  DEPENDS =3D "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-ccsv6-na=
tive ti-cgt6x-native"
> =20
> @@ -106,8 +106,9 @@ do_compile () {
>  }
> =20
>  do_install () {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
>  }
> =20
>  INSANE_SKIP_${PN}-dev =3D "arch ldflags"
> diff --git a/recipes-ti/bios/ti-sysbios.inc=20
> b/recipes-ti/bios/ti-sysbios.inc index 408be78..53b55a5 100644
> --- a/recipes-ti/bios/ti-sysbios.inc
> +++ b/recipes-ti/bios/ti-sysbios.inc
> @@ -15,8 +15,9 @@ BINFILE=3D"bios_setuplinux_${PV}.bin"
>  TI_BIN_UNPK_CMDS=3D"Y: q:workdir:Y"
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
>  }
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb=20
> b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> index 115254e..a0387b7 100644
> --- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> +++ b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> @@ -25,8 +25,9 @@ TI_BIN_UNPK_CMDS=3D""
>  TI_BIN_UNPK_ARGS=3D"--prefix ${S} --mode silent"
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${CG_XML_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
>  }
> =20
>  FILES_${PN} +=3D "${CG_XML_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/dsplib/dsplib-c66x.inc=20
> b/recipes-ti/dsplib/dsplib-c66x.inc
> index 31acc1e..ce978db 100644
> --- a/recipes-ti/dsplib/dsplib-c66x.inc
> +++ b/recipes-ti/dsplib/dsplib-c66x.inc
> @@ -16,8 +16,9 @@ TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
>  TI_BIN_UNPK_CMDS =3D ""
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
>  }
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> diff --git=20
> a/recipes-ti/framework-components/ti-framework-components.inc=20
> b/recipes-ti/framework-components/ti-framework-components.inc
> index e111ec4..d3a1d75 100644
> --- a/recipes-ti/framework-components/ti-framework-components.inc
> +++ b/recipes-ti/framework-components/ti-framework-components.inc
> @@ -11,8 +11,9 @@ S =3D "${WORKDIR}/framework_components_${PV}"
>  SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=3Dfcta=
rball"
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${FC_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
>  }
> =20
>  INSANE_SKIP_${PN} =3D "ldflags"
> diff --git a/recipes-ti/imglib/imglib-c66x.inc=20
> b/recipes-ti/imglib/imglib-c66x.inc
> index 3c76ad5..eb57598 100644
> --- a/recipes-ti/imglib/imglib-c66x.inc
> +++ b/recipes-ti/imglib/imglib-c66x.inc
> @@ -18,8 +18,9 @@ TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
>  TI_BIN_UNPK_CMDS =3D ""
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
>  }
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> diff --git a/recipes-ti/mathlib/mathlib-c66x.inc=20
> b/recipes-ti/mathlib/mathlib-c66x.inc
> index 1511337..7951e6c 100644
> --- a/recipes-ti/mathlib/mathlib-c66x.inc
> +++ b/recipes-ti/mathlib/mathlib-c66x.inc
> @@ -18,8 +18,9 @@ TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
>  TI_BIN_UNPK_CMDS =3D ""
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
>  }
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> diff --git a/recipes-ti/xdais/ti-xdais.inc=20
> b/recipes-ti/xdais/ti-xdais.inc index a12ad64..24268b3 100644
> --- a/recipes-ti/xdais/ti-xdais.inc
> +++ b/recipes-ti/xdais/ti-xdais.inc
> @@ -11,8 +11,9 @@ S =3D "${WORKDIR}/xdais_${PV}"
>  SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=3Dxdaistarball"
> =20
>  do_install() {
> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
>      install -d ${D}${XDAIS_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
>  }
> =20
>  INHIBIT_PACKAGE_STRIP =3D "1"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

