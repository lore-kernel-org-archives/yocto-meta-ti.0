Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0B81E00810; Tue,  3 Mar 2015 05:47:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09CE1E003FA
	for <meta-ti@yoctoproject.org>; Tue,  3 Mar 2015 05:47:22 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23DlLgL002570
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 07:47:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23DlKgC007581
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 07:47:20 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 07:47:20 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [RFC PATCH 1/6] opencl: Add common file specifying
	opencl	sources and version.
Thread-Index: AQHQUcwNjgwRQ6kyiEuaciHlCVqbLp0KywoA
Date: Tue, 3 Mar 2015 13:47:19 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814103BEA@DFLE09.ent.ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-2-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C82B26B@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C82B26B@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/6] opencl: Add common file specifying opencl	sources and version.
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
X-List-Received-Date: Tue, 03 Mar 2015 13:47:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There are shared sources within these repos, but not every recipe requires =
all of the sources.

As for the circular patch dependencies: Would it make sense to separate the=
 opengl headers into a separate recipe, and keep that one self-contained? A=
lso, I plan on upstreaming the opencl-examples patch, so this will not be r=
equired, thus removing the circular dependency with patch 5.



-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Thursday, February 26, 2015 8:57 AM
To: Stiffler, Jacob; meta-ti@yoctoproject.org
Subject: RE: [meta-ti] [RFC PATCH 1/6] opencl: Add common file specifying o=
pencl sources and version.

This shouldn't be the first patch in your patchset.

You depend on files from patch 2 and 5. But those patches also depend on pa=
tch 1 for the .inc.

I guess I can kind of understand the logic but to have 6 different sources =
in a single inc file that is partially reused by several different recipes =
doesn't seem right to me...

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> Sent: Thursday, February 26, 2015 7:34 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [RFC PATCH 1/6] opencl: Add common file specifying=20
> opencl sources and version.
>=20
> * opencl consists of multiple packages, so use this file for
>   shared information.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/ocl/ocl.inc |   64
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 recipes-ti/ocl/ocl.inc
>=20
> diff --git a/recipes-ti/ocl/ocl.inc b/recipes-ti/ocl/ocl.inc new file=20
> mode 100644 index 0000000..71965e2
> --- /dev/null
> +++ b/recipes-ti/ocl/ocl.inc
> @@ -0,0 +1,64 @@
> +PV =3D "1.1.0"
> +
> +LIC_FILES_CHKSUM =3D
> "file://../debian/copyright;md5=3Dd3795e71443db61e7c9677a97fa3aac4"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/ocl:"
> +
> +BRANCH_OCL =3D "master"
> +BRANCH_OPENCL =3D "master"
> +BRANCH_BUILTINS =3D "master"
> +BRANCH_MONITOR =3D "master"
> +BRANCH_LIBM =3D "master"
> +BRANCH_EXAMPLES =3D "master"
> +
> +DESTSUFFIX_OCL =3D "git"
> +DESTSUFFIX_OPENCL =3D "git/opencl"
> +DESTSUFFIX_BUILTINS =3D "git/opencl_builtins"
> +DESTSUFFIX_MONITOR =3D "git/opencl_monitor"
> +DESTSUFFIX_LIBM =3D "git/open_libm"
> +DESTSUFFIX_EXAMPLES =3D "git/opencl_examples"
> +
> +SRC_URI_BASE =3D "git://gitorious.design.ti.com/ocl"
> +
> +SRC_URI_OCL =3D
> "${SRC_URI_BASE}/ocl.git;protocol=3Dgit;branch=3D${BRANCH_OCL};name=3Docl=
;d
> estsuffix=3D${DESTSUFFIX_OCL}"
> +SRC_URI_OPENCL =3D
> "${SRC_URI_BASE}/opencl.git;protocol=3Dgit;branch=3D${BRANCH_OPENCL};nam
> e=3Dopencl;destsuffix=3D${DESTSUFFIX_OPENCL}"
> +SRC_URI_BUILTINS =3D
> "${SRC_URI_BASE}/opencl_builtins.git;protocol=3Dgit;branch=3D${BRANCH_BUI=
L
> TINS};name=3Dopencl_builtins;destsuffix=3D${DESTSUFFIX_BUILTINS}"
> +SRC_URI_MONITOR =3D
> "${SRC_URI_BASE}/opencl_monitor_vayu.git;protocol=3Dgit;branch=3D${BRANC
> H_MONITOR};name=3Dopencl_monitor;destsuffix=3D${DESTSUFFIX_MONITOR}"
> +SRC_URI_MONITOR_IMAGE =3D "http://udb0866934.am.dhcp.ti.com/mcsdk-
> 8.x/yocto-tmp/opencl_monitor-vayu-0.12.0-
> 1.tar.gz;name=3Docl_monitor_image"
> +SRC_URI_LIBM =3D
> "${SRC_URI_BASE}/open_libm.git;protocol=3Dgit;branch=3D${BRANCH_LIBM};na
> me=3Dopen_libm;destsuffix=3D${DESTSUFFIX_LIBM}"
> +SRC_URI_EXAMPLES =3D
> "${SRC_URI_BASE}/opencl_examples.git;protocol=3Dgit;branch=3D${BRANCH_EX
> AMPLES};name=3Dopencl_examples;destsuffix=3D${DESTSUFFIX_EXAMPLES}"
> +
> +SRCREV_ocl =3D "730e6c85e55770969489e4079f7b9a7071e6c8cf"
> +SRCREV_opencl =3D "d00eb494d52fbe07f419bff8f21ab28c05c494b6"
> +SRCREV_opencl_builtins =3D "c410a457c55973f8a5e572978c0581c42608c96c"
> +SRCREV_opencl_monitor =3D "a1fbe457f3fcfc9b087c91cfe9036cf700f1b187"
> +SRCREV_open_libm =3D "4f391bd2ff68a78eae3a91ba606bb86c616d3d55"
> +SRCREV_opencl_examples =3D
> "cba1bc746597a38827cab7d7e9fd9864229e298e"
> +SRC_URI[ocl_monitor_image.md5sum] =3D
> "b013b26d1809fb43893d3fbb286b0cba"
> +SRC_URI[ocl_monitor_image.sha256sum] =3D
> "5084679ab4eefa851c8bbfe95168fd82e2ff3aaea3a1cc800da04dfac1603367"
> +
> +OPENGL_HEADERS =3D " \
> +    file://GL/gl.h \
> +    file://GL/gl_mangle.h \
> +    file://GL/glext.h \
> +    file://GL/glx.h \
> +    file://GL/glx_mangle.h \
> +    file://GL/glxext.h \
> +    file://GL/osmesa.h \
> +    file://GL/wglext.h \
> +    file://GL/wmesa.h \
> +    file://GL/internal/dri_interface.h \ "
> +
> +OPENCL_PATCHES =3D " \
> +"
> +
> +MONITOR_PATCHES =3D " \
> +"
> +
> +EXAMPLES_PATCHES =3D " \
> +    file://0001-Add-larger-sets-and-display-size-information.patch \ "
> +
> +SRC_URI =3D "${SRC_URI_OCL}"
> +
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

