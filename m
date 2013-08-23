Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30DD7E00343
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 09:05:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NG5IIW015711;
	Fri, 23 Aug 2013 11:05:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NG5IY4013134;
	Fri, 23 Aug 2013 11:05:18 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 11:05:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Bernard Mentink <bmentink@gmail.com>
Thread-Topic: [meta-ti] Cannot boot beaglebone image
Thread-Index: AQHOoBUT3LWSPi6KCEi6MFZ3N4wWwJmjQCOA//+vdAA=
Date: Fri, 23 Aug 2013 16:05:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C52AF1D@DFLE08.ent.ti.com>
References: <CALEed8Ywhz3PEPEGePauXhC6b_-ahzHZSQ+BgJqk+rQMe2yDYQ@mail.gmail.com>
	<20130823153422.GB27059@edge>
In-Reply-To: <20130823153422.GB27059@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Cannot boot beaglebone image
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
X-List-Received-Date: Fri, 23 Aug 2013 16:05:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, August 23, 2013 10:34 AM
> To: Bernard Mentink
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Cannot boot beaglebone image
>=20
> On Thu, Aug 08, 2013 at 10:57:32AM +1200, Bernard Mentink wrote:
> > Hi There,
> >
> > Very new to Yocto and the Ti BSP so be nice ;-)
> >
> > I have built the minimal image and created an SD card with the boot
> > and rootfs partitions ..
> >
> > I have copied MLO (first), u-boot.img, am335x-bone.dtb, u-boot-spl.bin
> > and uImage to the "boot" partition.
> > (I am not sure if the am33xx file or the spl file is necessary ..) I
> > have un-tar'ed the root filesystem to the "rootfs" partition.
> >
> > However when I boot this card, all I see on the beaglebone black is 4
> > lights on continuous ..
> > There is no serial port over USB to see what is going on, and no
> > ethernet device shows up, even after including dropbear in the image ..
> >
> > I am at a loss ... there is no "standard" serial port to see if u-boot
> > is coming up at all ..
>=20
> Did you have anything in eMMC?
[Franklin] What Denys is talking about is that the kernel, u-boot and files=
ystem will be loaded from the eMMC by default. One way to avoid this is to =
delete the MLO on the eMMC.  Information on doing this can be found here: h=
ttp://processors.wiki.ti.com/index.php/Sitara_Linux_SDK_Setup_Script#Beagle=
Bone_Black_Users. My removing the MLO the SD card will then be used.

Another difference between Beaglebone and Beaglebone Black is that the USB =
cable that comes with the BBB is not a true serial cable. This link list va=
rious serial cables you can purchase to regain that functionality http://ci=
rcuitco.com/support/index.php?title=3DBeagleBone_Black_Accessories#Serial_D=
ebug_Cables. This way you can see what goes on in SPL, U-boot and the kerne=
l.

If you run Angstrom after the kernel is booted and the filesystem is loaded=
 the USB cable can then be seen as a virtual serial port.=20

>=20
>=20
> > By the way, to sucessfully build meta-ti, I had to add the following li=
ne
> > to my local.conf   ..
> > BBMASK ?=3D ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"
> >
> > ... if I did not do that, the build failed with all the Angstom
> > licencing rubbish (it should not be in there .... I want a
> > "distro-less" build  ;)
>=20
> Yes, that is explained in README, which nobody reads :(
>=20
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

