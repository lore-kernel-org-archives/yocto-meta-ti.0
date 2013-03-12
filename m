Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 486CAE01404
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 04:51:00 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2CBox3l001478
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 06:50:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2CBoxaj020846
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 06:50:59 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 12 Mar 2013 06:50:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/5] linux-ti-staging: use setup-defconfig
Thread-Index: AQHOHqA/cC4ia2NKbkyB9+KFV5/1t5ih8hdw
Date: Tue, 12 Mar 2013 11:50:58 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015945691A@DLEE12.ent.ti.com>
References: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
	<1363032215-12645-2-git-send-email-Chase.Maupin@ti.com>
	<20130311213404.GD31635@denix.org>
In-Reply-To: <20130311213404.GD31635@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/5] linux-ti-staging: use setup-defconfig
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
X-List-Received-Date: Tue, 12 Mar 2013 11:51:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 11, 2013 4:34 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/5] linux-ti-staging: use setup-
> defconfig
>=20
> On Mon, Mar 11, 2013 at 03:03:32PM -0500, Chase Maupin wrote:
> > * Use the setup-defconfig.inc functionality to specify the in
> >   kernel tree defconfig file to use rather than hard coding it
> >   in the do_configure step.
> > * This is to make it easier to modify which configs are use by
> >   other layers as well as supporting additional machines which
> >   may not use omap2plus_defconfig as needed.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging/defconfig |    1 +
> >  recipes-kernel/linux/linux-ti-staging_git.bb    |   15 +++++--
> --------
> >  2 files changed, 6 insertions(+), 10 deletions(-)
> >  create mode 100644 recipes-kernel/linux/linux-ti-
> staging/defconfig
> >
> > diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig
> b/recipes-kernel/linux/linux-ti-staging/defconfig
> > new file mode 100644
> > index 0000000..926b35a
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging/defconfig
> > @@ -0,0 +1 @@
> > +use-kernel-config=3Domap2plus_defconfig
>=20
> Do we want this defconfig to be in linux-ti-staging/ti33x to be
> SoC-specific?
> I see omap5 also uses the same omap2plus_defconfig, so maybe
> not...

Since most things so far are using this same config I figured I would leave=
 it generic.  When/if we find the majority of machines using something else=
 then we can change this or split the defconfig out was my thought process.

>=20
> --
> Denys
>=20
>=20
> > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> b/recipes-kernel/linux/linux-ti-staging_git.bb
> > index 8cc7206..2581409 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > @@ -6,6 +6,7 @@ KERNEL_IMAGETYPE =3D "uImage"
> >
> >  inherit kernel
> >  require recipes-kernel/linux/linux-dtb.inc
> > +require recipes-kernel/linux/setup-defconfig.inc
> >
> >  # Stage the power management firmware before building the
> kernel
> >  DEPENDS +=3D "am33x-cm3"
> > @@ -23,17 +24,11 @@ SRCREV =3D
> "d26595a42220789b81a9d243e2fc0837c7776360"
> >  PV =3D "3.8.2"
> >
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> cause a rebuild
> > -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> >
> > -SRC_URI =3D "git://gitorious.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH}"
> > -
> > -do_setup_defconfig() {
> > -        :
> > -}
> > -
> > -do_configure() {
> > -    oe_runmake omap2plus_defconfig
> > -}
> > +SRC_URI =3D "git://gitorious.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
> > +           file://defconfig \
> > +          "
> >
> >  # Copy the am33x-cm3 firmware if it is available
> >  do_compile_prepend() {
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

