Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B56FE01595
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 07:22:40 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OEMdmN023186
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 09:22:40 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OEMdwN025936
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 09:22:39 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 09:22:39 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] linux: Inherit new machine_kernel_pr class
Thread-Index: AQHOuTBeR9vgcDugtEm/WXropoBz1JnVRDMA//+sQ2A=
Date: Tue, 24 Sep 2013 14:22:38 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55C510@DFLE08.ent.ti.com>
References: <1380034621-4413-1-git-send-email-fcooper@ti.com>
	<20130924142137.GM4390@edge>
In-Reply-To: <20130924142137.GM4390@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux: Inherit new machine_kernel_pr class
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
X-List-Received-Date: Tue, 24 Sep 2013 14:22:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From my search the other kernels either include linux.inc or multi-kernel.i=
nc which includes linux.inc.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, September 24, 2013 9:22 AM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux: Inherit new machine_kernel_pr class
>=20
> Right, I've been meaning to add this too, so I agree with the change.
> The only question is - why only those kernels and not others? Are all the=
 others
> covered by linux.inc?
>=20
> --
> Denys
>=20
>=20
> On Tue, Sep 24, 2013 at 09:57:01AM -0500, Franklin S. Cooper Jr wrote:
> > * MACHINE_KERNEL_PR was originally defined in the kernel class located =
in
> >   meta-oe which overrode the version of the class in oe-core.
> > * Some time ago kernel.bbclass was removed from meta-oe and a separate
> class
> >   machine_kernel_pr was created to add support for MACHINE_KERNEL_PR.
> > * Since this variable is used significantly in both meta-ti and meta-ar=
ago make
> >   sure all the kernel recipes directly or indirectly inherit this new c=
lass.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  recipes-kernel/linux/linux-am335x-psp_3.2.bb |    2 +-
> >  recipes-kernel/linux/linux-ti-glsdk_3.8.bb   |    2 +-
> >  recipes-kernel/linux/linux-ti-staging_3.8.bb |    2 +-
> >  recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
> >  recipes-kernel/linux/linux.inc               |    2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-
> kernel/linux/linux-am335x-psp_3.2.bb
> > index eaf788f..cf1b2dd 100644
> > --- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > +++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE =3D "ti33x"
> >
> >  DEFAULT_PREFERENCE =3D "-1"
> >
> > -inherit kernel
> > +inherit kernel machine_kernel_pr
> >  require setup-defconfig.inc
> >
> >  # Stage the power management firmware before building the kernel
> > diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
> kernel/linux/linux-ti-glsdk_3.8.bb
> > index 5fd17f8..d7aebea 100644
> > --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >  KERNEL_IMAGETYPE =3D "uImage"
> >
> > -inherit kernel
> > +inherit kernel machine_kernel_pr
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-
> kernel/linux/linux-ti-staging_3.8.bb
> > index fd7b671..f832b54 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >  KERNEL_IMAGETYPE =3D "uImage"
> >
> > -inherit kernel
> > +inherit kernel machine_kernel_pr
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> > index 694a164..50253ea 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >  KERNEL_IMAGETYPE =3D "uImage"
> >
> > -inherit kernel
> > +inherit kernel machine_kernel_pr
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> > diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linu=
x.inc
> > index ac51dae..e0d414c 100644
> > --- a/recipes-kernel/linux/linux.inc
> > +++ b/recipes-kernel/linux/linux.inc
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >
> > -inherit kernel siteinfo
> > +inherit kernel siteinfo machine_kernel_pr
> >
> >  # Enable OABI compat for people stuck with obsolete userspace
> >  ARM_KEEP_OABI ?=3D "1"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

