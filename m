Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C89D8E0083C; Wed, 14 Jan 2015 14:11:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76565E002F9
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 14:11:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0EMBEXB029128
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 16:11:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0EMBEcQ030374
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 16:11:14 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 14 Jan 2015 16:11:14 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] sitara-linux-ti-staging: Create recipe for
	Sitara 3.14 kernel tree
Thread-Index: AQHQMDrE1HU+tvPT+kStOlWYt0sL0JzAftyA//+ppCA=
Date: Wed, 14 Jan 2015 22:11:13 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7CCB99@DFLE08.ent.ti.com>
References: <1421268209-24159-1-git-send-email-fcooper@ti.com>
	<20150114210213.GM4759@edge>
In-Reply-To: <20150114210213.GM4759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] sitara-linux-ti-staging: Create recipe for Sitara 3.14 kernel tree
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
X-List-Received-Date: Wed, 14 Jan 2015 22:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, January 14, 2015 3:02 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] sitara-linux-ti-staging: Create recipe for=
 Sitara
> 3.14 kernel tree
>=20
> Franklin,
>=20
> Isn't it heavy-handed?
[Franklin] Yes :(
 How many changes on top do you foresee you'd
> need?=20
[Franklin] Very little
Have you considered doing those changes (patches or configs) inside
> the recipe itself?
[Franklin] Yes. We want to point customers to a commit with all of our patc=
hes and configs. We don't want to give them a list of patches they need to =
apply themselves. So no matter what we will end up needing a separate git t=
ree.

When the customer downloads the SDK I end up having to tell customers to go=
 to the git tree and manually commit the patches that OE applied and create=
 a branch that only exist on their local setup. They end up being confused =
since now the git tree inside of the sdk is different than the one they clo=
ned manually.=20

For AMSDK 7 this was painful when disabling SMP wasn't a part of the git tr=
ee and was only an OE patch. It's surprising how many issues that were repo=
rted to simply find out that a customer either cloned the kernel git tree m=
anually or used the git tree within the SDK but checked out the tag or comm=
it id we have in our documentation (doesn't include the patches). It even m=
ade creating the PRU addon package for SDK 7 complicated due to these out o=
f tree patches.

It is heavy-handed and honestly something I tried extremely hard to avoid b=
ut since I was unable to get the patches and config added to the main git t=
ree I was left with no choice.
>=20
> --
> Denys
>=20
>=20
> On Wed, Jan 14, 2015 at 02:43:29PM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * The Sitara 3.14 Kernel tree is based on the linux-ti-staging_3.14 rec=
ipe
> and
> >   kernel. However, the tree includes additional patches and configs.
> > * This tree is only meant for AM335x and AM437x
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../linux/sitara-linux-ti-staging-3.14/defconfig   |    1 +
> >  ...ing_3.14.bb =3D> sitara-linux-ti-staging_3.14.bb} |   23 ++++------=
----------
> >  2 files changed, 5 insertions(+), 19 deletions(-)
> >  create mode 100644 recipes-kernel/linux/sitara-linux-ti-staging-
> 3.14/defconfig
> >  copy recipes-kernel/linux/{linux-ti-staging_3.14.bb =3D> sitara-linux-=
ti-
> staging_3.14.bb} (58%)
> >
> > diff --git a/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfi=
g
> b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
> > new file mode 100644
> > index 0000000..98c4069
> > --- /dev/null
> > +++ b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
> > @@ -0,0 +1 @@
> > +use-kernel-config=3Dsinglecore-omap2plus_defconfig
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/sitara-linux-ti-staging_3.14.bb
> > similarity index 58%
> > copy from recipes-kernel/linux/linux-ti-staging_3.14.bb
> > copy to recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > index d762be8..f9c4641 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > @@ -20,46 +20,31 @@ RDEPENDS_kernel-base +=3D "kernel-devicetree"
> >  RDEPENDS_kernel-base_append_ti33x =3D " am33x-cm3"
> >  RDEPENDS_kernel-base_append_ti43x =3D " am33x-cm3"
> >
> > -# Add a run-time dependency for the VPE VPDMA firmware to be installed
> > -# on the target file system.
> > -RDEPENDS_kernel-base_append_dra7xx =3D " vpe-vpdma-fw"
> >
> >  # Default is to package all dtb files for ti33x devices unless buildin=
g
> >  # for the specific beaglebone machine.
> >  KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
> am335x-bone.dtb am335x-boneblack.dtb"
> >  KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am43x-epos-evm-
> hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-
> evm.dtb"
> >  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
> > -KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> > -KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb dra7-evm-lcd7.dtb dra7-
> evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd7.dtb dra72-evm-lcd10.dtb
> am57xx-beagle-x15.dtb"
> > -KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb"
> > -KERNEL_DEVICETREE_omap3 =3D "omap3-beagle.dtb omap3-beagle-xm.dtb
> omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
> > -KERNEL_DEVICETREE_am3517-evm =3D "am3517-evm.dtb"
> > -KERNEL_DEVICETREE_am37x-evm =3D "omap3-evm-37xx.dtb"
> > -KERNEL_DEVICETREE_beagleboard =3D "omap3-beagle.dtb omap3-beagle-
> xm.dtb"
> >
> >  KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
> >
> > -COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|omap3"
> > +COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -BRANCH =3D "ti-linux-3.14.y"
> > +BRANCH =3D "sitara-ti-linux-3.14.y"
> >
> > -SRCREV =3D "7828f3b4cb26fa9c978aa96cc46cca8521957f24"
> > +SRCREV =3D "2d7148a3a95a2811604611f6c66a8826a61b8b12"
> >  PV =3D "3.14.26"
> >
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild
> >  MACHINE_KERNEL_PR_append =3D "f+gitr${SRCPV}"
> >  PR =3D "${MACHINE_KERNEL_PR}"
> >
> > -KERNEL_CONFIG_DIR =3D "${S}/ti_config_fragments"
> > -
> > -KERNEL_CONFIG_FRAGMENTS_append_ti33x =3D "
> ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
> > -KERNEL_CONFIG_FRAGMENTS_append_ti43x =3D "
> ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
> > -
> >  MULTI_CONFIG_BASE_SUFFIX =3D ""
> >
> > -KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.g=
it"
> > +KERNEL_GIT_URI =3D "git://git.ti.com/sitara-linux/sitara-linux.git"
> >  KERNEL_GIT_PROTOCOL =3D "git"
> >  SRC_URI +=3D
> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRAN
> CH} \
> >              file://defconfig \
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

