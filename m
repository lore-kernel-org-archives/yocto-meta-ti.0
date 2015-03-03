Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C0BCE00777; Tue,  3 Mar 2015 07:01:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 684ADE00750
	for <meta-ti@yoctoproject.org>; Tue,  3 Mar 2015 07:01:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23F1JWI013809
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 09:01:19 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23F1H8X007853
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 09:01:17 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 09:01:17 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
	which	runs on the accelerators.
Thread-Index: AQHQUckVbziwrt+0lUyUf5BcB059TJ0C8h0wgAhA5YD//684SQ==
Date: Tue, 3 Mar 2015 15:01:16 +0000
Message-ID: <3173EF88-2FB3-4AE5-9253-6D1CC6AE37C5@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-5-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C82B1FD@DFLE08.ent.ti.com>,
	<4B26FB5A64EBA14C87266869E037F95814103BFF@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814103BFF@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 03 Mar 2015 15:01:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 3, 2015, at 7:50 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Except for some source dependencies between the opencl library and clocl =
(which use the same source repo), the libraries and headers are sufficient.=
 However, some of these headers are internal,
I'm not sure what you mean by internal.
> and also, the opencl build does not look for these headers on the standar=
d paths.
Have you tried playing with adding additional include paths to GCC to resol=
ve that problem?
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin=20
> Sent: Thursday, February 26, 2015 8:53 AM
> To: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware wh=
ich runs on the accelerators.
>=20
> Why do you need to repeatedly include the same sources in various recipes=
?
> Are you rebuilding the same software over and over again? If not then why=
 aren't the headers and libraries sufficient.
>=20
>=20
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
>> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
>> Sent: Thursday, February 26, 2015 7:34 AM
>> To: meta-ti@yoctoproject.org
>> Subject: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware=20
>> which runs on the accelerators.
>>=20
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> recipes-ti/ocl/opencl-monitor_git.bb |   41
>> ++++++++++++++++++++++++++++++++++
>> 1 file changed, 41 insertions(+)
>> create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb
>>=20
>> diff --git a/recipes-ti/ocl/opencl-monitor_git.bb=20
>> b/recipes-ti/ocl/opencl- monitor_git.bb new file mode 100644 index=20
>> 0000000..54b3f45
>> --- /dev/null
>> +++ b/recipes-ti/ocl/opencl-monitor_git.bb
>> @@ -0,0 +1,41 @@
>> +DESCRIPTION =3D "TI OpenCL"
>> +HOMEPAGE =3D "https://gitorious.design.ti.com/ocl"
>> +LICENSE =3D "BSD"
>> +
>> +include ocl.inc
>> +
>> +inherit cmake
>> +
>> +COMPATIBLE_MACHINE =3D "dra7xx"
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +SRC_URI_append =3D " \
>> +    ${SRC_URI_OPENCL} \
>> +    ${SRC_URI_MONITOR} \
>> +    ${SRC_URI_BUILTINS} \
>> +    ${SRC_URI_LIBM} \
>> +    ${SRC_URI_MONITOR_IMAGE} \
>> +    ${MONITOR_PATCHES} \
>> +    ${OPENCL_PATCHES} \
>> +    ${OPENGL_HEADERS} \
>> +"
>> +
>> +S =3D "${WORKDIR}/git/opencl_monitor"
>> +
>> +
>> +do_compile_append() {
>> +    cp -rv ${WORKDIR}/opencl_monitor-vayu-0.12.0/* ${S}/ }
>> +
>> +do_install_append() {
>> +    cp -v ${D}${datadir}/ti/opencl/dsp0.out ${D}${datadir}/ti/opencl/ds=
p.out
>> +    cp -v ${D}${datadir}/ti/opencl/dsp0.syms
>> +${D}${datadir}/ti/opencl/dsp.syms }
>> +
>> +FILES_${PN} +=3D " \
>> +    ${datadir}/ti/opencl/* \
>> +    ${base_libdir}/firmware/* \
>> +"
>> +
>> +INSANE_SKIP_${PN} =3D "arch"
>> +
>> --
>> 1.7.9.5
>>=20
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

