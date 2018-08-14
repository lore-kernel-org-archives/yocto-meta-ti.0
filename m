Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAB9DE00566; Tue, 14 Aug 2018 10:15:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1B47E0049F
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 10:15:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EHFYxG009245
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 12:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534266934;
	bh=wKeFdjbjUEsTooL+PDDezswAy0Slvoa/LwEC9trt5xQ=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=fbxS78+icbuXZyh87BROKzIlXp+Vo4grzZD2+Xhqw3RbWDqTEIDa4B5qLT2YYumxQ
	8YG/Wd/jr32uJhHU2ejXQ0+rn3j3t+qeZvfIQMIDlNTUrEB2crhOLKTbTdijkYNbEB
	FEgsFBbxNQ8xGK9TvDIZ0MMo/V41pzWfU91f3Zjs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EHFY22023719
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 12:15:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 12:15:33 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Tue, 14 Aug 2018 12:15:33 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [PATCH] recipes-ti: devtools: add GCC
	Linaro baremetal toolchain 2017.11 v7.2.1
Thread-Index: AQHUM9ucvv7JdM1llk2rG1JQYRGSPqS/fEFQ
Date: Tue, 14 Aug 2018 17:15:33 +0000
Message-ID: <37facad8053e4f69bec675017778a762@ti.com>
References: <1534238985-17254-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1534238985-17254-1-git-send-email-hzhang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.11]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH] recipes-ti: devtools: add GCC Linaro baremetal toolchain 2017.11 v7.2.1
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
X-List-Received-Date: Tue, 14 Aug 2018 17:15:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Zhang, Hao
> Sent: Tuesday, August 14, 2018 5:30 AM
> To: meta-ti@yoctoproject.org
> Subject: [EXTERNAL] [meta-ti] [PATCH] recipes-ti: devtools: add GCC Linar=
o
> baremetal toolchain 2017.11 v7.2.1
>=20
> From: Hao Zhang <hzhang@ti.com>
>=20
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  .../gcc-linaro-baremetal-aarch64-native.bb         | 24
> ++++++++++++++++++++++
>  recipes-ti/devtools/gcc-linaro-baremetal-native.bb | 24
> ++++++++++++++++++++++
>  recipes-ti/devtools/gcc-linaro.inc                 | 12 +++++++++++
>  recipes-ti/includes/ti-paths.inc                   |  2 ++
>  4 files changed, 62 insertions(+)
>  create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-
> native.bb
>  create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb
>  create mode 100644 recipes-ti/devtools/gcc-linaro.inc
>=20
> diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
> b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
> new file mode 100644
> index 0000000..5e3e3b6
> --- /dev/null
> +++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
> @@ -0,0 +1,24 @@
> +include recipes-ti/devtools/gcc-linaro.inc
> +
> +PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
> +S =3D "${WORKDIR}/${PACKAGE_DIR}"
> +
> +LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
> +
> +inherit native
> +require recipes-ti/includes/ti-paths.inc
> +
> +SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7=
.2-
> ${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-
> x86_64_aarch64-elf.tar.xz;name=3Dgcc-linaro-aarch64"
> +
> +SRC_URI[gcc-linaro-aarch64.md5sum] =3D
> "4972f8943820bdd2f577f498de78964b"
> +SRC_URI[gcc-linaro-aarch64.sha256sum] =3D
> "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4
> c8"
> +
> +do_install() {
> +    install -d
> ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
> +    cp -r ${S}/.
> ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
> +}
> +
> +FILES_${PN} =3D
> "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
> +
> +INSANE_SKIP_${PN} =3D "already-stripped"
> +
> diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes=
-
> ti/devtools/gcc-linaro-baremetal-native.bb
> new file mode 100644
> index 0000000..07a6f49
> --- /dev/null
> +++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
> @@ -0,0 +1,24 @@
> +include recipes-ti/devtools/gcc-linaro.inc
> +
> +PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
> +S =3D "${WORKDIR}/${PACKAGE_DIR}"
> +
> +LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
> +
> +inherit native
> +require recipes-ti/includes/ti-paths.inc
> +
> +SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7=
.2-
> ${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-
> x86_64_arm-eabi.tar.xz;name=3Dgcc-linaro"
> +
> +SRC_URI[gcc-linaro.md5sum] =3D "9a4a39cfc78c84375b1160aa93587aed"
> +SRC_URI[gcc-linaro.sha256sum] =3D
> "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
> +
> +do_install() {
> +    install -d ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
> +    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
> +}
> +
> +FILES_${PN} =3D "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
> +
> +INSANE_SKIP_${PN} =3D "already-stripped"
> +
> diff --git a/recipes-ti/devtools/gcc-linaro.inc b/recipes-ti/devtools/gcc=
-
> linaro.inc
> new file mode 100644
> index 0000000..6575fc5
> --- /dev/null
> +++ b/recipes-ti/devtools/gcc-linaro.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "Linaro GCC for ARM"
> +HOMEPAGE =3D "https://launchpad.net/gcc-arm-embedded"
> +SECTION =3D "devel"
> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> +LIC_FILES_CHKSUM =3D "file://share/doc/gcc/GNU-Free-Documentation-
> License.html;md5=3D${LIC_CHKSUM}"
> +
> +PV =3D "7.2.1"
> +PR =3D "r0"
> +
> +GCC_ARM_YEAR =3D "2017.11"
> +
> +
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
> index 4f99d5e..b6c15d7 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -56,6 +56,8 @@ export CG_XML_INSTALL_DIR_RECIPE     =3D
> "${installdir}/ti-cg-xml-tree"
>  export OMP_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-omp-tree"
>  export MPM_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-mpm-tree"
>  export TI_CGT6X_7_INSTALL_DIR_RECIPE   =3D "${installdir}/cgt6x-7"
> +export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          =3D
> "${installdir}/gcc-linaro-baremetal"
> +export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  =3D
> "${installdir}/gcc-linaro-baremetal-aarch64"

Can you please also add for completeness:
export GCC_LINARO_BAREMETAL_TOOLCHAIN        =3D  "${STAGING_DIR_NATIVE}${ =
GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE }"
export GCC_LINARO_ BAREMETAL_AARCH64_TOOLCHAIN            =3D  "${STAGING_D=
IR_NATIVE}${GCC_LINARO_BAREMETAL _AARCH64_TOOLCHAIN_RECIPE}"

>=20
>  # This is where the tools will end up in sysroot
>  export BIOS_INSTALL_DIR       =3D
> "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

