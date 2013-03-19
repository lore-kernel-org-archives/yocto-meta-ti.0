Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04D43E006C3
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 12:29:56 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JJTuYQ006664
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 14:29:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JJTtut014277
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 14:29:56 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 19 Mar 2013 14:29:55 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 19 Mar 2013 14:29:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] omap5-evm: Add OMAP5 EVM configuration
Thread-Index: AQHOJMT9i72mWlDnO0mz0VuuXlluYpitVlNg
Date: Tue, 19 Mar 2013 19:29:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159486FDB@DLEE11.ent.ti.com>
References: <1363705841-9610-1-git-send-email-Chase.Maupin@ti.com>
	<1363705841-9610-2-git-send-email-Chase.Maupin@ti.com>
	<20130319171251.GP32759@edge>
In-Reply-To: <20130319171251.GP32759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Tue, 19 Mar 2013 19:29:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 19, 2013 12:13 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2] omap5-evm: Add OMAP5 EVM
> configuration
>=20
> On Tue, Mar 19, 2013 at 10:10:41AM -0500, Chase Maupin wrote:
> > * Add the machine configuration for the OMAP5 EVM device.
>=20
> Overall looks good.
>=20
> > * Create the omap-a15.inc file to be shared with all Cortex-A15
> >   derivative devices.
>=20
> Is the omap-a15 a preferred name? I didn't see it used internally
> anywhere.
> It's not like I object specifically to this name, but was
> wondering if there
> was something else other people are more familiar with? Another
> option would
> be just simple "omap5", but I guess you are planning for few of
> those new
> derivative platforms that don't really have omap5 in the name...
> :)
>=20
> Moreover, the comment above implies omap-a15 SoC file will be
> used for all
> Cortex-A15 devices, which is not exactly correct, as Keystone has
> nothing to
> do with omap5 and shouldn't share that SoC file.

Good point.  I'll change the comment.  I was thinking of this because of th=
e DRA7xx.  I'm open to other SOC_FAMILY names though.

>=20
> --
> Denys
>=20
>=20
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  conf/machine/include/omap-a15.inc                |   18
> ++++++++++++++++++
> >  conf/machine/{am335x-evm.conf =3D> omap5-evm.conf} |   20
> ++++++++++++++------
> >  2 files changed, 32 insertions(+), 6 deletions(-)
> >  create mode 100644 conf/machine/include/omap-a15.inc
> >  copy conf/machine/{am335x-evm.conf =3D> omap5-evm.conf} (65%)
> >
> > diff --git a/conf/machine/include/omap-a15.inc
> b/conf/machine/include/omap-a15.inc
> > new file mode 100644
> > index 0000000..3ea1a05
> > --- /dev/null
> > +++ b/conf/machine/include/omap-a15.inc
> > @@ -0,0 +1,18 @@
> > +SOC_FAMILY =3D "omap-a15"
> > +require conf/machine/include/soc-family.inc
> > +
> > +require conf/machine/include/tune-cortexa15.inc
> > +
> > +# Increase this everytime you change something in the kernel
> > +MACHINE_KERNEL_PR =3D "r0"
> > +
> > +PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
> > +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> > +
> > +KERNEL_IMAGETYPE =3D "uImage"
> > +
> > +UBOOT_ARCH =3D "arm"
> > +UBOOT_ENTRYPOINT =3D "0x80008000"
> > +UBOOT_LOADADDRESS =3D "0x80008000"
> > +
> > +EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
> > diff --git a/conf/machine/am335x-evm.conf b/conf/machine/omap5-
> evm.conf
> > similarity index 65%
> > copy from conf/machine/am335x-evm.conf
> > copy to conf/machine/omap5-evm.conf
> > index 21e79a2..daa5f58 100644
> > --- a/conf/machine/am335x-evm.conf
> > +++ b/conf/machine/omap5-evm.conf
> > @@ -1,13 +1,15 @@
> >  #@TYPE: Machine
> > -#@NAME: AM335x EVM
> > -#@DESCRIPTION: Machine configuration for the TI AM335x EVM
> > +#@NAME: OMAP5 EVM
> > +#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
> >
> > -require conf/machine/include/ti33x.inc
> > +PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
> > +XSERVER =3D "xserver-xorg \
> > +           xf86-input-evdev \
> > +           xf86-video-fbdev"
> >
> > -# Use built-in LCD by default
> > -XSERVER +=3D "xf86-input-tslib"
> >  GUI_MACHINE_CLASS =3D "smallscreen"
> > -MACHINE_FEATURES +=3D "touchscreen"
> > +
> > +require conf/machine/include/omap-a15.inc
> >
> >  IMAGE_FSTYPES +=3D "ubi tar.gz"
> >
> > @@ -33,3 +35,9 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
> >  # UBI: sub-page size:              512
> >  # UBI: VID header offset:          2048 (aligned 2048)
> >  UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
> > +
> > +UBOOT_MACHINE =3D "omap5_evm_config"
> > +
> > +# Currently removing the sgx machine feature because there is
> no SGX package
> > +# available for omap5
> > +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2
> screen touchscreen"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

