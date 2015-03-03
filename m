Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 987FCE00777; Tue,  3 Mar 2015 06:58:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BB2FE00750
	for <meta-ti@yoctoproject.org>; Tue,  3 Mar 2015 06:58:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23EweX3005328
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 08:58:40 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23Ewdfx022211
	for <meta-ti@yoctoproject.org>; Tue, 3 Mar 2015 08:58:39 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 08:58:39 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
	which	runs on the accelerators.
Thread-Index: AQHQUckVbziwrt+0lUyUf5BcB059TJ0C9SfAgAB6TAD//5tnQIAIKWsA//+tOWM=
Date: Tue, 3 Mar 2015 14:58:39 +0000
Message-ID: <C51B5D21-1406-47D1-B377-1D15BFBB4AC1@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-5-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C82B2BF@DFLE08.ent.ti.com>
	<20150226151640.GB6052@edge>
	<8F29D6B095ED194EA1980491A5E029710C82C62B@DFLE08.ent.ti.com>,
	<4B26FB5A64EBA14C87266869E037F95814103C13@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814103C13@DFLE09.ent.ti.com>
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
X-List-Received-Date: Tue, 03 Mar 2015 14:58:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 3, 2015, at 7:54 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> I've seen conflicting suggestions about manually setting the PR =3D "r0".=
 I can add this, but how should this interact with the .inc file? I assume =
that either the inc file or bb recipe should append a value, so should the =
recipe make the append?

Manually setting PR =3D "r0" isn't technically required but it doesn't hurt=
 anything.

When you have inc files like ocl.inc that may be reused by several recipes =
generally you set the PR in the include file and use PR_inc (something like=
 that) within the recipes. PR inc essentially sets the recipe PR to    PR +=
 PR inc =3D recipe PR.  This way when you make changes to the include file =
and bump the PR all recipes that depend on the inc file are automatically b=
umped.

Look at some of the Matrix apps recipes
>=20
>=20
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin=20
> Sent: Thursday, February 26, 2015 10:17 AM
> To: Dmytriyenko, Denys
> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware wh=
ich runs on the accelerators.
>=20
>=20
>=20
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Thursday, February 26, 2015 9:17 AM
>> To: Cooper Jr., Franklin
>> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware=20
>> which runs on the accelerators.
>>=20
>>> On Thu, Feb 26, 2015 at 02:02:22PM +0000, Cooper Jr., Franklin wrote:
>>> Mesa as a whole as a MIT license based on the recipe. Looking at the=20
>>> license for those headers your using they are also using a MIT=20
>>> license. So this program should have a BSD and MIT license.
>>> Also your missing a PR which I think Denys still wants to include=20
>>> for package upgrading purposes. But it's up to him.
>>=20
>> But this one is not an upgrade, so not sure why do you need a PR?
> [Franklin] Without a PR people tend to forget to bump it.
>>=20
>>=20
>>>> -----Original Message-----
>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
>>>> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
>>>> Sent: Thursday, February 26, 2015 7:34 AM
>>>> To: meta-ti@yoctoproject.org
>>>> Subject: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware=20
>>>> which runs on the accelerators.
>>>>=20
>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>> ---
>>>> recipes-ti/ocl/opencl-monitor_git.bb |   41
>>>> ++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 41 insertions(+)
>>>> create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb
>>>>=20
>>>> diff --git a/recipes-ti/ocl/opencl-monitor_git.bb
>>>> b/recipes-ti/ocl/opencl- monitor_git.bb new file mode 100644 index
>>>> 0000000..54b3f45
>>>> --- /dev/null
>>>> +++ b/recipes-ti/ocl/opencl-monitor_git.bb
>>>> @@ -0,0 +1,41 @@
>>>> +DESCRIPTION =3D "TI OpenCL"
>>>> +HOMEPAGE =3D "https://gitorious.design.ti.com/ocl"
>>>> +LICENSE =3D "BSD"
>>>> +
>>>> +include ocl.inc
>>>> +
>>>> +inherit cmake
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "dra7xx"
>>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>> +
>>>> +SRC_URI_append =3D " \
>>>> +    ${SRC_URI_OPENCL} \
>>>> +    ${SRC_URI_MONITOR} \
>>>> +    ${SRC_URI_BUILTINS} \
>>>> +    ${SRC_URI_LIBM} \
>>>> +    ${SRC_URI_MONITOR_IMAGE} \
>>>> +    ${MONITOR_PATCHES} \
>>>> +    ${OPENCL_PATCHES} \
>>>> +    ${OPENGL_HEADERS} \
>>>> +"
>>>> +
>>>> +S =3D "${WORKDIR}/git/opencl_monitor"
>>>> +
>>>> +
>>>> +do_compile_append() {
>>>> +    cp -rv ${WORKDIR}/opencl_monitor-vayu-0.12.0/* ${S}/ }
>>>> +
>>>> +do_install_append() {
>>>> +    cp -v ${D}${datadir}/ti/opencl/dsp0.out
>> ${D}${datadir}/ti/opencl/dsp.out
>>>> +    cp -v ${D}${datadir}/ti/opencl/dsp0.syms
>>>> +${D}${datadir}/ti/opencl/dsp.syms }
>>>> +
>>>> +FILES_${PN} +=3D " \
>>>> +    ${datadir}/ti/opencl/* \
>>>> +    ${base_libdir}/firmware/* \
>>>> +"
>>>> +
>>>> +INSANE_SKIP_${PN} =3D "arch"
>>>> +
>>>> --
>>>> 1.7.9.5
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti

