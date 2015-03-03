Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3F92E00810; Tue,  3 Mar 2015 05:50:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEAA2E003FA
	for <meta-ti@yoctoproject.org>; Tue,  3 Mar 2015 05:50:27 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23DoQj4018967
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 07:50:26 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23DoPpm030850
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 07:50:25 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 07:50:25 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
	which	runs on the accelerators.
Thread-Index: AQHQUcuK5aFWZNp4UEeFuJtjUK2qGp0KzdtQ
Date: Tue, 3 Mar 2015 13:50:25 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814103BFF@DFLE09.ent.ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-5-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C82B1FD@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C82B1FD@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Tue, 03 Mar 2015 13:50:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Except for some source dependencies between the opencl library and clocl (w=
hich use the same source repo), the libraries and headers are sufficient. H=
owever, some of these headers are internal, and also, the opencl build does=
 not look for these headers on the standard paths.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Thursday, February 26, 2015 8:53 AM
To: Stiffler, Jacob; meta-ti@yoctoproject.org
Subject: RE: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware whic=
h runs on the accelerators.

Why do you need to repeatedly include the same sources in various recipes?
Are you rebuilding the same software over and over again? If not then why a=
ren't the headers and libraries sufficient.


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> Sent: Thursday, February 26, 2015 7:34 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware=20
> which runs on the accelerators.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/ocl/opencl-monitor_git.bb |   41
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb
>=20
> diff --git a/recipes-ti/ocl/opencl-monitor_git.bb=20
> b/recipes-ti/ocl/opencl- monitor_git.bb new file mode 100644 index=20
> 0000000..54b3f45
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

