Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEBB9E006E9; Thu, 26 Feb 2015 05:53:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F36AE003AB
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 05:53:05 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QDr5su002239
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:53:05 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QDr4Co012941
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:53:04 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 26 Feb 2015 07:53:04 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
	which	runs on the accelerators.
Thread-Index: AQHQUckVbziwrt+0lUyUf5BcB059TJ0C8h0w
Date: Thu, 26 Feb 2015 13:53:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C82B1FD@DFLE08.ent.ti.com>
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
X-List-Received-Date: Thu, 26 Feb 2015 13:53:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why do you need to repeatedly include the same sources in various recipes?
Are you rebuilding the same software over and over again? If not then why a=
ren't the headers and libraries sufficient.


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

