Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522B8EA8550
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:58:55 +0000 (UTC)
Subject: Re: [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA warning
To: meta-ti@lists.yoctoproject.org
From: "Sadik" <s-sadik@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Chrome 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 01:58:45 -0700
References: <20260309170134.2779295-1-s-sadik@ti.com> <20260309170134.2779295-4-s-sadik@ti.com> <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com> <20260309185808.GQ11121@denix.org>
In-Reply-To: <20260309185808.GQ11121@denix.org>
Message-ID: <317026.1773133125690466392@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 08:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19687

On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:

>
> On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
> lists.yoctoproject.org wrote:
> >=20
> >=20
> > On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
> > >Add -ffile-prefix-map flags to KCFLAGS to remove build path
> > >references from kernel module compilation, ensuring reproducible
> > >builds and preventing absolute path leakage in binaries.
> > >
> > >This resolves buildpaths QA warnings during packaging.
> > >
> > >Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> > >---
> > >  meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > >index 91076c9e..8308f0e5 100644
> > >--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > >+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > >@@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
> -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
> > >  TOOLS_SRC_DIR =3D "${S}/tools"
> > >-EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} =
CC=3D"${CC}"
> KDIR=3D${STAGING_KERNEL_BUILDDIR}"
> > >-
> > >+EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} =
CC=3D"${CC}"
> KDIR=3D${STAGING_KERNEL_BUILDDIR} \
> > >+    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D
> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
> > >  do_compile() {
> > >          oe_runmake V=3D1
> > >  }
>=20
> Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile()

Thanks for the review Denys, Apologies for multiple replies was facing some=
 issues with relply all in mail.

Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the do_compile(=
) override. . This is insufficient for jailhouse, which requires building:
1. Kernel modules (driver/jailhouse.ko)
2. Hypervisor binary (hypervisor/jailhouse.bin)
3. Userspace tools (tools/jailhouse, jailhouse-*)
4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install failure for=
 all the demos during the build.

The do_compile() override is needed to run a plain oe_runmake which hits ja=
ilhouse's top-level Makefile and builds the full project.

If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but that d=
oesn't serve our purpose of completely overriding the do_compile
And also I couldn't find an existing bbclass that does "run the top-level M=
akefile and build everything."

>=20
>=20
> > Thank you.  I was going to comment on the v1 to not disable buildpaths.
>=20
> +1
>

