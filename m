Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03219E01536
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2013 09:48:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8RGmaxh014967;
	Fri, 27 Sep 2013 11:48:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8RGmaa2029035;
	Fri, 27 Sep 2013 11:48:36 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 27 Sep 2013 11:48:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] Revert "linux: Inherit new	machine_kernel_pr
	class"
Thread-Index: AQHOutkQAB7tfe3XNE+4CIQXjzT5+ZnZzIhQ
Date: Fri, 27 Sep 2013 16:48:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C562138@DFLE08.ent.ti.com>
References: <1380213412-16982-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C5607A6@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5607A6@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "linux: Inherit new	machine_kernel_pr	class"
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
X-List-Received-Date: Fri, 27 Sep 2013 16:48:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
> Sent: Thursday, September 26, 2013 11:54 AM
> To: Denys Dmytriyenko; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] Revert "linux: Inherit new machine_kernel_=
pr
> class"
>=20
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Thursday, September 26, 2013 11:37 AM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] Revert "linux: Inherit new machine_kernel_pr
> class"
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > This adds a new mandatory dependency on meta-openembedded layer. While
> > we are still trying to resolve an existing optional dependency, not
> > bring a new one.
> > The MACHINE_KERNEL_PR requirement will need to be handled differently.
[Franklin] What about "including" that class instead of "inheriting" it? Th=
at way we can benefit from that class but not force a hard dependency.
> >
> > This reverts commit 6c1ab34c88edc127ff2835d87b48f4b10fe8ba0b.
> > ---
> >  recipes-kernel/linux/linux-am335x-psp_3.2.bb | 2 +-
> >  recipes-kernel/linux/linux-ti-glsdk_3.8.bb   | 2 +-
> >  recipes-kernel/linux/linux-ti-staging_3.8.bb | 2 +-
> > recipes-kernel/linux/linux-ti- staging_git.bb | 2 +-
> >  recipes-kernel/linux/linux.inc               | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-
> > kernel/linux/linux-am335x-psp_3.2.bb
> > index cf1b2dd..eaf788f 100644
> > --- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > +++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE =3D "ti33x"
> >
> >  DEFAULT_PREFERENCE =3D "-1"
> >
> > -inherit kernel machine_kernel_pr
> > +inherit kernel
> >  require setup-defconfig.inc
> >
> >  # Stage the power management firmware before building the kernel diff
> > --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > b/recipes-kernel/linux/linux-ti- glsdk_3.8.bb index d7aebea..5fd17f8
> > 100644
> > --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >  KERNEL_IMAGETYPE =3D "uImage"
> >
> > -inherit kernel machine_kernel_pr
> > +inherit kernel
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-
> > kernel/linux/linux-ti-staging_3.8.bb
> > index 8e6d198..833fb48 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >  KERNEL_IMAGETYPE =3D "uImage"
> >
> > -inherit kernel machine_kernel_pr
> > +inherit kernel
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> > kernel/linux/linux-ti-staging_git.bb
> > index b75e650..778ea7f 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > @@ -3,7 +3,7 @@ DESCRIPTION =3D "Linux kernel for TI devices"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >
> > -inherit kernel machine_kernel_pr
> > +inherit kernel
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> > diff --git a/recipes-kernel/linux/linux.inc
> > b/recipes-kernel/linux/linux.inc index e0d414c..ac51dae 100644
> > --- a/recipes-kernel/linux/linux.inc
> > +++ b/recipes-kernel/linux/linux.inc
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >
> > -inherit kernel siteinfo machine_kernel_pr
> > +inherit kernel siteinfo
> >
> >  # Enable OABI compat for people stuck with obsolete userspace
> > ARM_KEEP_OABI ?=3D "1"
> > --
> > 1.8.3.2
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

