Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A495FD88D5
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 23:58:50 +0000 (UTC)
Subject: Re: [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA warning
To: meta-ti@lists.yoctoproject.org
From: "Sadik" <s-sadik@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Chrome 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 16:58:40 -0700
References: <20260309170134.2779295-1-s-sadik@ti.com> <20260309170134.2779295-4-s-sadik@ti.com> <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com> <20260309185808.GQ11121@denix.org> <317026.1773133125690466392@lists.yoctoproject.org> <20260310135247.GS11121@denix.org> <131089.1773162481263461889@lists.yoctoproject.org> <77b645a9-1de9-47da-b41a-b41f1a342ad9@ti.com> <a00be4fa-9f6c-49a8-8f65-9d6e4c928bd0@ti.com>
In-Reply-To: <a00be4fa-9f6c-49a8-8f65-9d6e4c928bd0@ti.com>
Message-ID: <131089.1773187120611631674@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 23:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19696

On Wed, Mar 11, 2026 at 01:05 AM, Ryan Eatmon wrote:

>
>=20
>=20
> On 3/10/2026 12:58 PM, Andrew Davis via lists.yoctoproject.org wrote:
> > On 3/10/26 12:08 PM, Sadik via lists.yoctoproject.org wrote:
> >> On Tue, Mar 10, 2026 at 07:22 PM, Denys Dmytriyenko wrote:
> >>
> >>>
> >>> On Tue, Mar 10, 2026 at 01:58:45AM -0700, Sadik via=20
> >>> lists.yoctoproject.org
> >>> wrote:
> >>>> On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:
> >>>>
> >>>>>
> >>>>> On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
> >>>>> lists.yoctoproject.org wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
> >>>>>>> Add -ffile-prefix-map flags to KCFLAGS to remove build path
> >>>>>>> references from kernel module compilation, ensuring reproducible
> >>>>>>> builds and preventing absolute path leakage in binaries.
> >>>>>>>
> >>>>>>> This resolves buildpaths QA warnings during packaging.
> >>>>>>>
> >>>>>>> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> >>>>>>> ---
> >>>>>>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 +=
+--
> >>>>>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >>>>> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >>>>>>> index 91076c9e..8308f0e5 100644
> >>>>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >>>>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >>>>>>> @@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
> >>>>> -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
> >>>>>>> =C2=A0 TOOLS_SRC_DIR =3D "${S}/tools"
> >>>>>>> -EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PRE=
FIX}
> >>> CC=3D"${CC}"
> >>>>> KDIR=3D${STAGING_KERNEL_BUILDDIR}"
> >>>>>>> -
> >>>>>>> +EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PRE=
FIX}
> >>> CC=3D"${CC}"
> >>>>> KDIR=3D${STAGING_KERNEL_BUILDDIR} \
> >>>>>>> +=C2=A0=C2=A0=C2=A0 KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERN=
EL_BUILDDIR}/=3D
> >>>>> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
> >>>>>>> =C2=A0 do_compile() {
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake=
 V=3D1
> >>>>>>> =C2=A0 }
> >>>>>
> >>>>> Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compi=
le()
> >>>>
> >>>> Thanks for the review Denys, Apologies for multiple replies was=20
> >>>> facing some
> >>> issues with relply all in mail.
> >>>>
> >>>> Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the=20
> >>>> do_compile()
> >>> override. . This is insufficient for jailhouse, which requires buildi=
ng:
> >>>> 1. Kernel modules (driver/jailhouse.ko)
> >>>> 2. Hypervisor binary (hypervisor/jailhouse.bin)
> >>>> 3. Userspace tools (tools/jailhouse, jailhouse-*)
> >>>> 4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install fail=
ure for all
> >>> the demos during the build.
> >>>>
> >>>> The do_compile() override is needed to run a plain oe_runmake which=
=20
> >>>> hits
> >>> jailhouse's top-level Makefile and builds the full project.
> >>>
> >>> The default do_compile() does exactly that - calls oe_runmake:
> >>>
> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/b=
ase.bbclass#n399
> >>
> >> Yeah you are right, that the default base_do_compile() calls=20
> >> oe_runmake, which would work fine. But, the jailhouse recipe inherits=
=20
> >> module bbclass,
> >> "inherit module python3native bash-completion deploy"
> >> =C2=A0 which overrides default do_compile() with module_do_compile.=20
> >> resulting in compilation errors if do_compile override is removed.
> >> If I don't use the do-compile override I am still getting build=20
> >> errors. I am unable to remove the module bbclass is required for=20
> >> building jailhouse kernel modules.
> >>
> >=20
> > Split out the kernel module building into its own recipe.
>=20
> Agreed.

Yeah I am sending  an follow up patch for these changes, meanwhile this ser=
ies is good to go right?

>=20
>=20
> > Andrew
> >=20
> >>>
> >>>
> >>>> If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but=
 that
> >>> doesn't serve our purpose of completely overriding the do_compile
> >>>> And also I couldn't find an existing bbclass that does "run the=20
> >>>> top-level
> >>> Makefile and build everything."
> >>>>
> >>>>>
> >>>>>
> >>>>>> Thank you.=C2=A0 I was going to comment on the v1 to not disable=
=20
> >>>>>> buildpaths.
> >>>>>
> >>>>> +1
> >>>
> >>>
> >>>
> >>>
> >>>
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
> --=20
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

