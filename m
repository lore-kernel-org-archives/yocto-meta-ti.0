Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B57FD2D99
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:52:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40582.1773150770059859351
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 06:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B2C340CD4;
	Tue, 10 Mar 2026 13:52:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TS9GzdWnn5_d; Tue, 10 Mar 2026 13:52:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1105640CC6;
	Tue, 10 Mar 2026 13:52:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5E0F5179C74; Tue, 10 Mar 2026 09:52:47 -0400 (EDT)
Date: Tue, 10 Mar 2026 09:52:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-sadik@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths
 QA warning
Message-ID: <20260310135247.GS11121@denix.org>
References: <20260309170134.2779295-1-s-sadik@ti.com>
 <20260309170134.2779295-4-s-sadik@ti.com>
 <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com>
 <20260309185808.GQ11121@denix.org>
 <317026.1773133125690466392@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <317026.1773133125690466392@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 13:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19691

On Tue, Mar 10, 2026 at 01:58:45AM -0700, Sadik via lists.yoctoproject.or=
g wrote:
> On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:
>=20
> >
> > On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
> > lists.yoctoproject.org wrote:
> > >=20
> > >=20
> > > On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
> > > >Add -ffile-prefix-map flags to KCFLAGS to remove build path
> > > >references from kernel module compilation, ensuring reproducible
> > > >builds and preventing absolute path leakage in binaries.
> > > >
> > > >This resolves buildpaths QA warnings during packaging.
> > > >
> > > >Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> > > >---
> > > >  meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > >diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > >index 91076c9e..8308f0e5 100644
> > > >--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > >+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> > > >@@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
> > -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
> > > >  TOOLS_SRC_DIR =3D "${S}/tools"
> > > >-EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREF=
IX} CC=3D"${CC}"
> > KDIR=3D${STAGING_KERNEL_BUILDDIR}"
> > > >-
> > > >+EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREF=
IX} CC=3D"${CC}"
> > KDIR=3D${STAGING_KERNEL_BUILDDIR} \
> > > >+    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D
> > -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
> > > >  do_compile() {
> > > >          oe_runmake V=3D1
> > > >  }
> >=20
> > Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile=
()
>=20
> Thanks for the review Denys, Apologies for multiple replies was facing =
some issues with relply all in mail.
>=20
> Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the do_comp=
ile() override. . This is insufficient for jailhouse, which requires buil=
ding:
> 1. Kernel modules (driver/jailhouse.ko)
> 2. Hypervisor binary (hypervisor/jailhouse.bin)
> 3. Userspace tools (tools/jailhouse, jailhouse-*)
> 4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install failure=
 for all the demos during the build.
>=20
> The do_compile() override is needed to run a plain oe_runmake which hit=
s jailhouse's top-level Makefile and builds the full project.

The default do_compile() does exactly that - calls oe_runmake:
https://git.openembedded.org/openembedded-core/tree/meta/classes-global/b=
ase.bbclass#n399


> If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but th=
at doesn't serve our purpose of completely overriding the do_compile
> And also I couldn't find an existing bbclass that does "run the top-lev=
el Makefile and build everything."
>=20
> >=20
> >=20
> > > Thank you.  I was going to comment on the v1 to not disable buildpa=
ths.
> >=20
> > +1

