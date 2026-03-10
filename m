Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FF6FD4F09
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:08:11 +0000 (UTC)
Subject: Re: [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA warning
To: meta-ti@lists.yoctoproject.org
From: "Sadik" <s-sadik@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Chrome 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 10:08:01 -0700
References: <20260309170134.2779295-1-s-sadik@ti.com> <20260309170134.2779295-4-s-sadik@ti.com> <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com> <20260309185808.GQ11121@denix.org> <317026.1773133125690466392@lists.yoctoproject.org> <20260310135247.GS11121@denix.org>
In-Reply-To: <20260310135247.GS11121@denix.org>
Message-ID: <131089.1773162481263461889@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 17:08:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19692

On Tue, Mar 10, 2026 at 07:22 PM, Denys Dmytriyenko wrote:

>
> On Tue, Mar 10, 2026 at 01:58:45AM -0700, Sadik via lists.yoctoproject.or=
g
> wrote:
> > On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:
> >=20
> > >
> > > On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
> > > lists.yoctoproject.org wrote:
> > > >=20
> > > >=20
> > > > On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
> > > > >Add -ffile-prefix-map flags to KCFLAGS to remove build path
> > > > >references from kernel module compilation, ensuring reproducible
> > > > >builds and preventing absolute path leakage in binaries.
> > > > >
> > > > >This resolves buildpaths QA warnings during packaging.
> > > > >
> > > > >Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> > > > >---
> > > > >  meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > >diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > > >index 91076c9e..8308f0e5 100644
> > > > >--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > > >+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > > >@@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
> > > -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
> > > > >  TOOLS_SRC_DIR =3D "${S}/tools"
> > > > >-EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREF=
IX}
> CC=3D"${CC}"
> > > KDIR=3D${STAGING_KERNEL_BUILDDIR}"
> > > > >-
> > > > >+EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREF=
IX}
> CC=3D"${CC}"
> > > KDIR=3D${STAGING_KERNEL_BUILDDIR} \
> > > > >+    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D
> > > -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
> > > > >  do_compile() {
> > > > >          oe_runmake V=3D1
> > > > >  }
> > >=20
> > > Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile=
()
> >=20
> > Thanks for the review Denys, Apologies for multiple replies was facing =
some
> issues with relply all in mail.
> >=20
> > Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the do_comp=
ile()
> override. . This is insufficient for jailhouse, which requires building:
> > 1. Kernel modules (driver/jailhouse.ko)
> > 2. Hypervisor binary (hypervisor/jailhouse.bin)
> > 3. Userspace tools (tools/jailhouse, jailhouse-*)
> > 4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install failure=
 for all
> the demos during the build.
> >=20
> > The do_compile() override is needed to run a plain oe_runmake which hit=
s
> jailhouse's top-level Makefile and builds the full project.
>=20
> The default do_compile() does exactly that - calls oe_runmake:
> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/b=
ase.bbclass#n399

Yeah you are right, that the default base_do_compile() calls oe_runmake, wh=
ich would work fine. But, the jailhouse recipe inherits module bbclass,
"inherit module python3native bash-completion deploy "
 which overrides default do_compile() with module_do_compile. resulting in =
compilation errors if do_compile override is removed.
If I don't use the do-compile override I am still getting build errors. I a=
m unable to remove the module bbclass is required for building jailhouse ke=
rnel modules.

>=20
>=20
> > If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but th=
at
> doesn't serve our purpose of completely overriding the do_compile
> > And also I couldn't find an existing bbclass that does "run the top-lev=
el
> Makefile and build everything."
> >=20
> > >=20
> > >=20
> > > > Thank you.  I was going to comment on the v1 to not disable buildpa=
ths.
> > >=20
> > > +1
>

