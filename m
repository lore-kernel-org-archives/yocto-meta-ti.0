Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD69BE008BC; Thu, 26 Feb 2015 06:03:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA6F8E003AB
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 06:02:24 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QE2NUf000590
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 08:02:24 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QE2MrU009093
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 08:02:22 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 26 Feb 2015 08:02:22 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
	which	runs on the accelerators.
Thread-Index: AQHQUckVbziwrt+0lUyUf5BcB059TJ0C9SfA
Date: Thu, 26 Feb 2015 14:02:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C82B2BF@DFLE08.ent.ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-5-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1424957651-5207-5-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [RFC PATCH 4/6] opencl-monitor: OpenCL firmware which	runs on the accelerators.
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
X-List-Received-Date: Thu, 26 Feb 2015 14:03:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mesa as a whole as a MIT license based on the recipe. Looking at the licens=
e for those headers your using they are also using a MIT license. So this p=
rogram should have a BSD and MIT license.
Also your missing a PR which I think Denys still wants to include for packa=
ge upgrading purposes. But it's up to him.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> Sent: Thursday, February 26, 2015 7:34 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware which
> runs on the accelerators.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/ocl/opencl-monitor_git.bb |   41
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb
>=20
> diff --git a/recipes-ti/ocl/opencl-monitor_git.bb b/recipes-ti/ocl/opencl=
-
> monitor_git.bb
> new file mode 100644
> index 0000000..54b3f45
> --- /dev/null
> +++ b/recipes-ti/ocl/opencl-monitor_git.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION =3D "TI OpenCL"
> +HOMEPAGE =3D "https://gitorious.design.ti.com/ocl"
> +LICENSE =3D "BSD"
> +
> +include ocl.inc
> +
> +inherit cmake
> +
> +COMPATIBLE_MACHINE =3D "dra7xx"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +SRC_URI_append =3D " \
> +    ${SRC_URI_OPENCL} \
> +    ${SRC_URI_MONITOR} \
> +    ${SRC_URI_BUILTINS} \
> +    ${SRC_URI_LIBM} \
> +    ${SRC_URI_MONITOR_IMAGE} \
> +    ${MONITOR_PATCHES} \
> +    ${OPENCL_PATCHES} \
> +    ${OPENGL_HEADERS} \
> +"
> +
> +S =3D "${WORKDIR}/git/opencl_monitor"
> +
> +
> +do_compile_append() {
> +    cp -rv ${WORKDIR}/opencl_monitor-vayu-0.12.0/* ${S}/ }
> +
> +do_install_append() {
> +    cp -v ${D}${datadir}/ti/opencl/dsp0.out ${D}${datadir}/ti/opencl/dsp=
.out
> +    cp -v ${D}${datadir}/ti/opencl/dsp0.syms
> +${D}${datadir}/ti/opencl/dsp.syms }
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/ti/opencl/* \
> +    ${base_libdir}/firmware/* \
> +"
> +
> +INSANE_SKIP_${PN} =3D "arch"
> +
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

