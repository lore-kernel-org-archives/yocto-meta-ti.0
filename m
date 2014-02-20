Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73350E0088A
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 12:05:30 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1KK5Tmu021160
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 14:05:29 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1KK5T6W022128
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 14:05:29 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 20 Feb 2014 14:05:29 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] Graphics SDK: Add version 05.01.01.01
Thread-Index: AQHPLMht2vt0UHb2ckSwl9yNi6bQfpq+zemA///GpTA=
Date: Thu, 20 Feb 2014 20:05:28 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6430EC@DLEE08.ent.ti.com>
References: <1392741750-18725-1-git-send-email-fcooper@ti.com>
	<20140220173027.GA16134@edge>
In-Reply-To: <20140220173027.GA16134@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] Graphics SDK: Add version 05.01.01.01
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
X-List-Received-Date: Thu, 20 Feb 2014 20:05:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 20, 2014 11:30 AM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] Graphics SDK: Add version 05.01.01.01
>=20
> Franklin,
>=20
> The patch is fine. But I'm thinking about how to best handle it pushing t=
o specific
> branches...
>=20
> I could push it to master and dora right away. But I'd assume you'd want =
it in
> dylan as well. Unfortunately, it's not going into our dylan-based release=
, so I'd
> like to wait until I tag the branch, which should hopefully happen tomorr=
ow or
> on Monday. Does it work for you?
[Franklin] Works for me.
>=20
> --
> Denys
>=20
>=20
> On Tue, Feb 18, 2014 at 10:42:30AM -0600, Franklin S. Cooper Jr wrote:
> > * Add latest version of the Graphics SDK that includes bug fixes.
> > * Fixed Suspend and Resume issue on AM43x.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  ...01.00.01.bb =3D> omap3-sgx-modules_5.01.01.01.bb} |    6 +++---
> >  .../rc.pvr                                         |    0
> >  .../rc_dri.pvr                                     |    0
> >  ...3_5.01.00.01.bb =3D> libgles-omap3_5.01.01.01.bb} |    8 ++++----
> >  4 files changed, 7 insertions(+), 7 deletions(-)
> >  copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_5.01.00.01.bb =3D>
> omap3-sgx-modules_5.01.01.01.bb} (92%)
> >  copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 =3D> libgles-o=
map3-
> 5.01.01.01}/rc.pvr (100%)
> >  copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 =3D> libgles-o=
map3-
> 5.01.01.01}/rc_dri.pvr (100%)
> >  copy recipes-graphics/libgles/{libgles-omap3_5.01.00.01.bb =3D> libgle=
s-
> omap3_5.01.01.01.bb} (87%)
> >
> > diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.b=
b
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> > similarity index 92%
> > copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
> > copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> > index 162e4d5..40bf8c0 100644
> > --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
> > +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://GPL-
> COPYING;md5=3D60422928ba677faaa13d6ab5f5baaa1e"
> >  TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> >  require ../../recipes-ti/includes/ti-eula-unpack.inc
> >
> > -SGXPV =3D "5_01_00_01"
> > +SGXPV =3D "5_01_01_01"
> >  IMGPV =3D "1.10.2359475"
> >
> >  inherit module
> > @@ -14,8 +14,8 @@ MACHINE_KERNEL_PR_append =3D "a"
> >  PR =3D "${MACHINE_KERNEL_PR}"
> >
> >  BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> > -MD5SUM_HARDFP =3D "0ee7d59808330d442a51c0990c2cb30e"
> > -SHA256SUM_HARDFP =3D
> "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c1
> 28"
> > +MD5SUM_HARDFP =3D "94acdbd20152c905939c2448d5e80a72"
> > +SHA256SUM_HARDFP =3D
> "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae
> "
> >
> >  # For now we only have hardfp version
> >  python __anonymous() {
> > diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr b=
/recipes-
> graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> > similarity index 100%
> > copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
> > copy to recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> > diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.p=
vr
> b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> > similarity index 100%
> > copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
> > copy to recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> > diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb b/rec=
ipes-
> graphics/libgles/libgles-omap3_5.01.01.01.bb
> > similarity index 87%
> > copy from recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
> > copy to recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> > index a3b34fe..2d11317 100644
> > --- a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
> > +++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> > @@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
> >
> >  LICENSE =3D "TSPA"
> >
> > -PR =3D "${INC_PR}.1"
> > +PR =3D "${INC_PR}.0"
> >
> >  BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> >  BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> > @@ -13,14 +13,14 @@ BINLOCATION_ti43x =3D "${S}/gfx_rel_es9.x"
> >  PLATFORM =3D "LinuxARMV7"
> >  PVR_INIT =3D "pvrsrvctl"
> >
> > -SGXPV =3D "5_01_00_01"
> > +SGXPV =3D "5_01_01_01"
> >  IMGPV =3D "1.10.2359475"
> >
> >  TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
> >
> >  BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> > -MD5SUM_HARDFP =3D "0ee7d59808330d442a51c0990c2cb30e"
> > -SHA256SUM_HARDFP =3D
> "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c1
> 28"
> > +MD5SUM_HARDFP =3D "94acdbd20152c905939c2448d5e80a72"
> > +SHA256SUM_HARDFP =3D
> "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae
> "
> >
> >  # For now we only have hardfp version
> >  python __anonymous() {
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

