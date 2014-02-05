Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36E40E007A1
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 14:48:07 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15Mm6YB012121
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 16:48:06 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15Mm5v8010982
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 16:48:05 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 16:48:05 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v3] linux-keystone: Update to linux kernel
	version 3.10
Thread-Index: AQHPId2kTxXU9LDsqUKriX3VUxnvlJqndneA///N8cA=
Date: Wed, 5 Feb 2014 22:48:05 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549F0974@DLEE11.ent.ti.com>
References: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
	<20140205194522.GV18784@edge>
In-Reply-To: <20140205194522.GV18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3] linux-keystone: Update to linux kernel version 3.10
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
X-List-Received-Date: Wed, 05 Feb 2014 22:48:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for clarifying.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 05, 2014 2:45 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v3] linux-keystone: Update to linux kernel
> version 3.10
>=20
> On Tue, Feb 04, 2014 at 02:16:32PM -0500, Sam Nelson wrote:
> > - Updated Source URL & version
> > - Added device tree file
> > - Added LOADADDR extra args
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Changes from last revision of patch
> > - Added LOADADDR extra args
> > - Name change to from 3.10.10--> 3.10
>=20
> Ok, I think Chase and I have confused you a bit here...
>=20
> Initially, you already had the recipe named as linux-keystone_3.10.bb and=
 I
> made a comment that you might want to consider setting PV =3D "3.10.10" t=
o
> indicate this stable version in the resulting package:
>=20
> http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/3285
>=20
> It wasn't probably very clear, since you then renamed the recipe to
> linux-keystone_3.10.10.bb and after another Chase' comment reverted back
> to
> linux-keystone_3.10.bb, but still there's no PV being set to the full ver=
sion.
[Sam] OK. I will add the PV. But looks like I need to rename also linux-key=
stone-3.10/defconfig
--> linux-keystone/defconfig to get the build working. I will send the upda=
ted patch.
>=20
> The best illustration may be to look at the change history of our
> linux-ti-staging_3.12.bb recipe:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/log/recipes-
> kernel/linux/linux-ti-staging_3.12.bb
>=20
> Take a look at those commits, but few things to note:
>=20
> 1. it has _3.12 in the filename, so no renames for stable updates
> 2. it has actual PV =3D "3.12.9" which follows the stable version of kern=
el
> 3. when SRCREV is updated, but PV stays the same, you bump
> MACHINE_KERNEL_PR
> 4. when SRCREV is updated along with PV, you want to reset
> MACHINE_KERNEL_PR
>=20
> --
> Denys
>=20
>=20
> > ---
> > ---
> >  .../defconfig                                      |    0
> >  ...ux-keystone_3.8.4.bb =3D> linux-keystone_3.10.bb} |   26 ++++++++++=
+-----
> ----
> >  2 files changed, 15 insertions(+), 11 deletions(-)
> >  rename recipes-kernel/linux/{linux-keystone-3.8.4 =3D> linux-keystone-
> 3.10}/defconfig (100%)
> >  rename recipes-kernel/linux/{linux-keystone_3.8.4.bb =3D> linux-
> keystone_3.10.bb} (59%)
> >
> > diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/reci=
pes-
> kernel/linux/linux-keystone-3.10/defconfig
> > similarity index 100%
> > rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> > rename to recipes-kernel/linux/linux-keystone-3.10/defconfig
> > diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-
> kernel/linux/linux-keystone_3.10.bb
> > similarity index 59%
> > rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
> > rename to recipes-kernel/linux/linux-keystone_3.10.bb
> > index d176f14..3ddd195 100644
> > --- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
> > +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> > @@ -3,26 +3,30 @@ DESCRIPTION =3D "Linux kernel for TI Keystone devices=
"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> >  inherit kernel
> >
> >  require recipes-kernel/linux/linux-dtb.inc
> >  require recipes-kernel/linux/setup-defconfig.inc
> >
> > +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> > +PR =3D "${MACHINE_KERNEL_PR}"
> > +
> >  KERNEL_DEVICETREE_keystone-evm =3D "k2hk-evm.dtb"
> >
> > -COMPATIBLE_MACHINE =3D "keystone"
> > +KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
> >
> > -S =3D "${WORKDIR}/git"
> > +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> > +SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
> >
> > -BRANCH =3D "sept-2013/master"
> > +BRANCH =3D "master"
> >
> > -# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
> > -SRCREV =3D "20a48dc5309c4434650baef2b6072b5f1016f946"
> > +SRC_URI =3D "git://git.ti.com/keystone-
> linux/linux.git;protocol=3Dgit;branch=3D${BRANCH}\
> > +           file://defconfig\
> > +           "
> >
> > -# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild
> > -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> > -PR =3D "${MACHINE_KERNEL_PR}"
> > +S =3D "${WORKDIR}/git"
> > +
> > +RDEPENDS_kernel-base =3D ""
> >
> > -SRC_URI =3D "git://arago-project.org/git/projects/linux-
> keystone.git;protocol=3Dgit;branch=3D${BRANCH}\
> > -           file://defconfig\
> > -          "
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

