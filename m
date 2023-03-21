Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8D8C761A6
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:33:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.23621.1679427218151966136
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 72C0C40C60;
	Tue, 21 Mar 2023 19:33:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kakpHOYgSqHc; Tue, 21 Mar 2023 19:33:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 05E9840C16;
	Tue, 21 Mar 2023 19:33:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 581FE1637C5; Tue, 21 Mar 2023 15:32:57 -0400 (EDT)
Date: Tue, 21 Mar 2023 15:32:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: p-bhagat@ti.com, meta-ti@lists.yoctoproject.org, praneeth@ti.com,
	reatmon@ti.com, c-shilwant@ti.com, g-gupta@ti.com, s-adivi@ti.com
Subject: Re: [meta-ti][dunfell/kirkstone][PATCH] Support building for AM65x
 SR2.0 & SR1.0 HS & GP with am65xx-evm machine
Message-ID: <20230321193257.GI18050@denix.org>
References: <20230321110742.26379-1-p-bhagat@ti.com>
 <CANPvuRmOgTPzzwk-HOXXOQpXRM6sT=BgPpjVUe6EBNVyG=qA=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRmOgTPzzwk-HOXXOQpXRM6sT=BgPpjVUe6EBNVyG=qA=g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:33:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16225

On Tue, Mar 21, 2023 at 07:26:27PM +0000, Jose Quaresma wrote:
> Hi,
>=20
> This patch uses the old bitbake syntax so they won't work on kikstone.

It simply won't apply to kirkstone at all - this looks like dunfell-speci=
fic=20
patch and kirkstone was mentioned by mistake.


> Paresh Bhagat via lists.yoctoproject.org <p-bhagat=3D
> ti.com@lists.yoctoproject.org> escreveu no dia ter=E7a, 21/03/2023 =E0(=
s) 11:08:
>=20
> > From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> >
> > - multiconfig, conf:
> >     - Add new multiconfig file to build for K3R5F SR2 GP devices
> >     - Update the am65xx-evm conf files to build both HS and GP for
> >       AM65x SR2.0. SR1.0 and keep SR2.0 HS sysfw.itb as default.
> >     - Remove am65xx-hs-evm conf files since am65xx-evm will build bot=
h
> >       GP and HS.
> > - optee: Sign optee for am65xx-evm to support HS builds
> > - ATF: Sign ATF for am65xx-evm to support HS builds
> > - ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY name to differentiate
> >   between GP and HS binaries.
> >
> > Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> > ---
> >  conf/machine/am65xx-evm-k3r5-gp.conf          | 13 +++++++
> >  conf/machine/am65xx-evm-k3r5-hs-se.conf       | 13 +++++++
> >  ...-k3r5.conf =3D> am65xx-evm-k3r5-sr2-gp.conf} |  4 +--
> >  ...r2.conf =3D> am65xx-evm-k3r5-sr2-hs-se.conf} |  4 ++-
> >  conf/machine/am65xx-hs-evm-k3r5-sr2.conf      | 11 ------
> >  conf/machine/am65xx-hs-evm-k3r5.conf          | 18 ----------
> >  conf/machine/am65xx-hs-evm.conf               | 11 ------
> >  conf/machine/include/am65xx.inc               | 30 +++++++++++-----
> >  conf/multiconfig/k3r5-sr2-gp.conf             |  3 ++
> >  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 34 +++++++++--------=
--
> >  .../trusted-firmware-a_%.bbappend             |  2 +-
> >  recipes-security/optee/optee-os_%.bbappend    |  2 +-
> >  12 files changed, 74 insertions(+), 71 deletions(-)
> >  create mode 100644 conf/machine/am65xx-evm-k3r5-gp.conf
> >  create mode 100644 conf/machine/am65xx-evm-k3r5-hs-se.conf
> >  rename conf/machine/{am65xx-evm-k3r5.conf =3D> am65xx-evm-k3r5-sr2-g=
p.conf}
> > (87%)
> >  rename conf/machine/{am65xx-evm-k3r5-sr2.conf =3D>
> > am65xx-evm-k3r5-sr2-hs-se.conf} (80%)
> >  delete mode 100644 conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> >  delete mode 100644 conf/machine/am65xx-hs-evm-k3r5.conf
> >  delete mode 100644 conf/machine/am65xx-hs-evm.conf
> >  create mode 100644 conf/multiconfig/k3r5-sr2-gp.conf
> >
> > diff --git a/conf/machine/am65xx-evm-k3r5-gp.conf
> > b/conf/machine/am65xx-evm-k3r5-gp.conf
> > new file mode 100644
> > index 00000000..c67699ac
> > --- /dev/null
> > +++ b/conf/machine/am65xx-evm-k3r5-gp.conf
> > @@ -0,0 +1,13 @@
> > +#@TYPE: Machine
> > +#@NAME: AM65xx SR1.0 EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5=
F
> > core)
> > +
> > +# Booting SR1 requires different SYSFW, the rest is handled at runti=
me
> > +
> > +require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> > +SOC_FAMILY_append =3D ":k3r5"
> > +
> > +SYSFW_SUFFIX =3D "gp"
> > +SYSFW_SOC =3D "am65x"
> > +SYSFW_SYMLINK =3D ""
> > +
> > diff --git a/conf/machine/am65xx-evm-k3r5-hs-se.conf
> > b/conf/machine/am65xx-evm-k3r5-hs-se.conf
> > new file mode 100644
> > index 00000000..6060de85
> > --- /dev/null
> > +++ b/conf/machine/am65xx-evm-k3r5-hs-se.conf
> > @@ -0,0 +1,13 @@
> > +#@TYPE: Machine
> > +#@NAME: AM65xx SR1.0 EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5=
F
> > core)
> > +
> > +# Booting SR1 requires different SYSFW, the rest is handled at runti=
me
> > +
> > +require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> > +SOC_FAMILY_append =3D ":k3r5"
> > +
> > +SYSFW_SUFFIX =3D "hs"
> > +SYSFW_SOC =3D "am65x"
> > +SYSFW_SYMLINK =3D ""
> > +
> > diff --git a/conf/machine/am65xx-evm-k3r5.conf
> > b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> > similarity index 87%
> > rename from conf/machine/am65xx-evm-k3r5.conf
> > rename to conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> > index a484e444..31ca807a 100644
> > --- a/conf/machine/am65xx-evm-k3r5.conf
> > +++ b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> > @@ -4,7 +4,7 @@
> >
> >  require conf/machine/include/k3r5.inc
> >
> > -SYSFW_SOC =3D "am65x"
> > +SYSFW_SOC =3D "am65x_sr2"
> >  SYSFW_CONFIG =3D "evm"
> >  SYSFW_SUFFIX =3D "gp"
> >  SYSFW_SYMLINK =3D ""
> > @@ -15,4 +15,4 @@ UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
> >  UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> >  UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> >
> > -UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
> > +UBOOT_MACHINE =3D "am65x_hs_evm_r5_defconfig"
> > diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf
> > b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
> > similarity index 80%
> > rename from conf/machine/am65xx-evm-k3r5-sr2.conf
> > rename to conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
> > index c0b3cd51..cf127029 100644
> > --- a/conf/machine/am65xx-evm-k3r5-sr2.conf
> > +++ b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
> > @@ -4,8 +4,10 @@
> >
> >  # Booting SR2 requires different SYSFW, the rest is handled at runti=
me
> >
> > -require conf/machine/am65xx-evm-k3r5.conf
> > +require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> >  SOC_FAMILY_append =3D ":k3r5-sr2"
> >
> > +SYSFW_SUFFIX =3D "hs"
> >  SYSFW_SOC =3D "am65x_sr2"
> >  SYSFW_SYMLINK =3D "sysfw.itb"
> > +
> > diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > deleted file mode 100644
> > index ef1b6fbe..00000000
> > --- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM65xx SR2.0 HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 HS EVM =
(R5F
> > core)
> > -
> > -# Booting SR2 requires different SYSFW, the rest is handled at runti=
me
> > -
> > -require conf/machine/am65xx-hs-evm-k3r5.conf
> > -SOC_FAMILY_append =3D ":k3r5-sr2"
> > -
> > -SYSFW_SOC =3D "am65x_sr2"
> > -SYSFW_SYMLINK =3D "sysfw.itb"
> > diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf
> > b/conf/machine/am65xx-hs-evm-k3r5.conf
> > deleted file mode 100644
> > index d9041c9d..00000000
> > --- a/conf/machine/am65xx-hs-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM65xx HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F c=
ore)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am65x"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs"
> > -SYSFW_SYMLINK =3D ""
> > -
> > -SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
> > -SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
> > -UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
> > -UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> > -UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> > -
> > -UBOOT_MACHINE =3D "am65x_hs_evm_r5_defconfig"
> > diff --git a/conf/machine/am65xx-hs-evm.conf
> > b/conf/machine/am65xx-hs-evm.conf
> > deleted file mode 100644
> > index 2c1256d0..00000000
> > --- a/conf/machine/am65xx-hs-evm.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM65xx HS EVM
> > -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
> > -
> > -require conf/machine/include/am65xx.inc
> > -
> > -UBOOT_MACHINE =3D "am65x_hs_evm_a53_defconfig"
> > -
> > -SPL_BINARY =3D "tispl.bin_HS"
> > -UBOOT_BINARY =3D "u-boot.img_HS"
> > -UBOOT_SYMLINK =3D "u-boot.img"
> > diff --git a/conf/machine/include/am65xx.inc
> > b/conf/machine/include/am65xx.inc
> > index b70d212f..958cbc8a 100644
> > --- a/conf/machine/include/am65xx.inc
> > +++ b/conf/machine/include/am65xx.inc
> > @@ -20,16 +20,28 @@ KERNEL_DEVICETREE =3D " \
> >      ti/k3-am654-evm-ov5640.dtbo \
> >  "
> >
> > -BBMULTICONFIG +=3D "k3r5-sr2"
> > -
> > -# Since J721e does not support multi-cert tiboot3.bin add standalone
> > sysfw.itb
> > +BBMULTICONFIG =3D "k3r5-sr2-hs-se"
> >  IMAGE_BOOT_FILES +=3D "sysfw.itb"
> > -
> > -# Since default sysfw.itb on AM65x is for SR2.0, add a version for S=
R1.0
> > -IMAGE_BOOT_FILES +=3D "sysfw-am65x-evm.itb"
> > -
> > -do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
> > -do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
> > +do_image_wic[mcdepends] =3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] =3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> > +
> > +BBMULTICONFIG +=3D "k3r5-hs-se"
> > +IMAGE_BOOT_FILES +=3D "sysfw-am65x-hs-evm.itb"
> > +do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> > +
> > +BBMULTICONFIG +=3D "k3r5-gp"
> > +IMAGE_BOOT_FILES +=3D "sysfw-am65x-gp-evm.itb"
> > +do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
> > +
> > +
> > +BBMULTICONFIG +=3D "k3r5-sr2-gp"
> > +IMAGE_BOOT_FILES +=3D "sysfw-am65x_sr2-gp-evm.itb"
> > +do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-gp:u-boot-ti-staging:do_d=
eploy"
> > +do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-gp:u-boot-ti-staging:do_d=
eploy"
> > +do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-gp:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-gp:ti-sci-fw:do_deploy"
> >
> >  OPTEEMACHINE =3D "k3-am65x"
> >  OPTEEOUTPUTMACHINE =3D "k3"
> > diff --git a/conf/multiconfig/k3r5-sr2-gp.conf
> > b/conf/multiconfig/k3r5-sr2-gp.conf
> > new file mode 100644
> > index 00000000..fae89bd3
> > --- /dev/null
> > +++ b/conf/multiconfig/k3r5-sr2-gp.conf
> > @@ -0,0 +1,3 @@
> > +require k3r5-sr2.conf
> > +
> > +MACHINE_append =3D "-gp"
> > diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > index 80c0b890..6503e964 100644
> > --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > @@ -2,10 +2,10 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >  require recipes-ti/includes/ti-paths.inc
> >
> >  DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native
> > virtual/bootloader"
> > -DEPENDS_remove_am65xx-evm-k3r5 =3D " virtual/bootloader"
> > -DEPENDS_remove_am65xx-evm-k3r5-sr2 =3D " virtual/bootloader"
> > -DEPENDS_remove_am65xx-hs-evm-k3r5 =3D " virtual/bootloader"
> > -DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 =3D " virtual/bootloader"
> > +DEPENDS_remove_am65xx-evm-k3r5-sr2-gp =3D " virtual/bootloader"
> > +DEPENDS_remove_am65xx-evm-k3r5-sr2-hs-se =3D " virtual/bootloader"
> > +DEPENDS_remove_am65xx-evm-k3r5-gp =3D " virtual/bootloader"
> > +DEPENDS_remove_am65xx-evm-k3r5-hs-se =3D " virtual/bootloader"
> >  DEPENDS_remove_j7-evm-k3r5 =3D " virtual/bootloader"
> >  DEPENDS_remove_j7-hs-evm-k3r5 =3D " virtual/bootloader"
> >  DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 =3D " virtual/bootloader"
> > @@ -54,23 +54,23 @@ SYSFW_TISCI =3D
> > "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
> >  SYSFW_TIBOOT3 =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONF=
IG}.bin"
> >  SYSFW_TIBOOT3_SYMLINK ?=3D "tiboot3.bin"
> >
> > -SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > +SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}=
.itb"
> >  SYSFW_VBINARY =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> >  SYSFW_IMAGE =3D "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.=
itb"
> >  SYSFW_SYMLINK ?=3D "sysfw.itb"
> >
> > -SYSFW_VBINARY_am65xx-evm-k3r5 =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > -SYSFW_VBINARY_am65xx-evm-k3r5-sr2 =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > -SYSFW_VBINARY_am65xx-hs-evm-k3r5 =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > -SYSFW_VBINARY_am65xx-hs-evm-k3r5-sr2 =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > +SYSFW_VBINARY_am65xx-evm-k3r5-sr2-gp =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> > +SYSFW_VBINARY_am65xx-evm-k3r5-sr2-hs-se =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> > +SYSFW_VBINARY_am65xx-evm-k3r5-gp =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> > +SYSFW_VBINARY_am65xx-evm-k3r5-hs-se =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> >  SYSFW_VBINARY_j7-evm-k3r5 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONF=
IG}.itb"
> >  SYSFW_VBINARY_j7-hs-evm-k3r5 =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> >  SYSFW_VBINARY_j7-hs-evm-k3r5-sr1-1 =3D
> > "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> >
> > -SYSFW_IMAGE_am65xx-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.=
itb"
> > -SYSFW_IMAGE_am65xx-evm-k3r5-sr2 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONF=
IG}.itb"
> > -SYSFW_IMAGE_am65xx-hs-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFI=
G}.itb"
> > -SYSFW_IMAGE_am65xx-hs-evm-k3r5-sr2 =3D
> > "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > +SYSFW_IMAGE_am65xx-evm-k3r5-sr2-gp =3D
> > "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> > +SYSFW_IMAGE_am65xx-evm-k3r5-sr2-hs-se =3D
> > "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> > +SYSFW_IMAGE_am65xx-evm-k3r5-gp =3D
> > "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> > +SYSFW_IMAGE_am65xx-evm-k3r5-hs-se =3D
> > "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> >  SYSFW_IMAGE_j7-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> >  SYSFW_IMAGE_j7-hs-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.i=
tb"
> >  SYSFW_IMAGE_j7-hs-evm-k3r5-sr1-1 =3D
> > "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> > @@ -87,10 +87,10 @@ EXTRA_OEMAKE =3D "\
> >      CONFIG=3D${SYSFW_CONFIG} SYSFW_DIR=3D"${S}/ti-sysfw" \
> >      SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
> >  "
> > -EXTRA_OEMAKE_remove_am65xx-evm-k3r5 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > -EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > -EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > -EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-gp =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-hs-se =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-gp =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-hs-se =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >  EXTRA_OEMAKE_remove_j7-evm-k3r5 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >  EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >  EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 =3D "
> > SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> > diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbap=
pend
> > b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > index 70406724..38c7022f 100644
> > --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > @@ -23,7 +23,7 @@ tfa_sign_k3hs() {
> >         )
> >  }
> >
> > -do_compile_append_am65xx-hs-evm() {
> > +do_compile_append_am65xx-evm() {
> >         tfa_sign_k3hs
> >  }
> >
> > diff --git a/recipes-security/optee/optee-os_%.bbappend
> > b/recipes-security/optee/optee-os_%.bbappend
> > index ddfc76f1..807f1c0f 100644
> > --- a/recipes-security/optee/optee-os_%.bbappend
> > +++ b/recipes-security/optee/optee-os_%.bbappend
> > @@ -64,7 +64,7 @@ do_compile_append_dra7xx() {
> >      optee_sign_legacyhs
> >  }
> >
> > -do_compile_append_am65xx-hs-evm() {
> > +do_compile_append_am65xx-evm() {
> >      optee_sign_k3hs
> >  }
> >
> > --
> > 2.17.1

