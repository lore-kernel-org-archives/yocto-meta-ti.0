Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25441E007A0; Wed, 13 Aug 2014 05:51:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBD53E00796
	for <meta-ti@yoctoproject.org>; Wed, 13 Aug 2014 05:51:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id D28CC115A79C;
	Wed, 13 Aug 2014 14:51:05 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Denys Dmytriyenko <denys@ti.com>
Date: Wed, 13 Aug 2014 14:51:05 +0200
Message-ID: <2416199.mUoSIRFDFS@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140812154053.GG23523@edge>
References: <1447960.SoSg2UIySt@localhost.localdomain>
	<20140812154053.GG23523@edge>
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black fails to boot with u-boot 2014.07, linux-yocto 3.14.5
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
X-List-Received-Date: Wed, 13 Aug 2014 12:51:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday 12 of August 2014 11:40:54 Denys Dmytriyenko wrote:
> The bug report you are mentioning is not related to this issue, most
> probably. The manifestation is exactly the same - it just doesn't boo=
t. But
> that can be caused by million other things... And yes, the fix was al=
ready
> pending upstream when I applied it to 2013.07 version in OE-Core. So
> 2014.07 already has it.
>=20
> Now, as of the issue at hand - late last year, early this year, all
> platforms in U-boot have switched from uImage to zImage, as a default=

> format. So, 2013.07 used uImage and 2014.07 expects zImage.
>=20
> Looks like you are mixing layers badly. So, you are getting machine c=
onfig
> from Poky/meta-yocto, instead of meta-ti, because you are building ke=
rnel in
> uImage format and not zImage. But then you are building newer U-boot =
from
> meta-ti. But not the kernel from meta-ti...
>=20
> Ways to fix it (from easy to hard):
>=20
> 1. Decide whether you want beaglebone from meta-yocto or from meta-ti=
 and
> use the correct layer alone w/o mixing them.
>=20
> 2. If you are mixing layers, use all the components from the same lay=
er -
> machine config, bootloader, kernel. If there are 2 layers defining th=
e same
> machine (e.g. the case of beaglebone.conf provided by meta-yocto and
> meta-ti), the one that is mentioned first in the bblayers.conf wins.
> Machine config usually defines things like preferred bootloader, kern=
el
> versions, load addresses and image formats.
>=20
> 3. If for some of the reasons one of the components gets picked up fr=
om a
> wrong layer (u-boot from meta-ti instead of oe-core/meta-yocto), make=
 sure
> to add additional PREFERRED_PROVIDER and/or PREFERRED_VERSION accordi=
ngly.
>=20
> 4. If you are adventurous and know what you are doing, you can mix an=
d match
> layers as well as components, making sure all the parameters like ima=
ge
> formats, addresses, etc. do match. My guess it should be possible to =
do so
> by setting KERNEL_IMAGETYPE to zImage, if you want to use latest U-bo=
ot
> from meta-ti, while keeping kernel from meta-yocto. Maybe some other
> tweaks...
>=20
> Good luck and let me know if you have more questions.

Thanks for suggestions. I've removed meta-ti from bblayers and done a c=
lean=20
build of core-image-minimal + kernel-devicetree in IMAGE_INSTALL_append=
.=20
Unfortunately with the same effect.

What is the order in which load addresses are used? It seems that the a=
ddress=20
embedded in uboot header takes precedence before default uboot environm=
ent=20
setting. Running `bitbake -e linux-yocto` produces this:

# $UBOOT_ENTRYPOINT [3 operations]
#   set /home/mborzecki/yocto/heads/poky/meta-yocto-
bsp/conf/machine/beaglebone.conf:34
#     "0x80008000"
#   set /home/mborzecki/yocto/heads/poky/meta/conf/documentation.conf:4=
32
#     [doc] "Specifies the entry point for the U-Boot image."
#   set? /home/mborzecki/yocto/heads/poky/meta/classes/kernel.bbclass:6=
6
#     "20008000"
# computed:
#   "0x80008000"
UBOOT_ENTRYPOINT=3D"0x80008000"
...
# $UBOOT_LOADADDRESS [3 operations]
#   set /home/mborzecki/yocto/heads/poky/meta-yocto-
bsp/conf/machine/beaglebone.conf:35
#     "0x80008000"
#   set /home/mborzecki/yocto/heads/poky/meta/conf/documentation.conf:4=
33
#     [doc] "Specifies the load address for the U-Boot image."
#   set? /home/mborzecki/yocto/heads/poky/meta/classes/kernel.bbclass:6=
7
#     "${UBOOT_ENTRYPOINT}"
# computed:
#   "0x80008000"
UBOOT_LOADADDRESS=3D"0x80008000"

Then UBOOT_ENTRYPOINT is passed as LOADADDR in KERNEL_EXTRA_ARGS where =
it ends=20
up in uboot header.

Setting this in local.conf produces a bootable image:
UBOOT_LOADADDRESS_beaglebone =3D "0x82000000"
UBOOT_ENTRYPOINT_beaglebone =3D "0x82000000"

/proc/iomem has this:
  80008000-809e33ef : Kernel code
  80a60000-80b9fc07 : Kernel data

>=20
> > Hi all,
> >=20
> > I'm having trouble booting BBB with current meta-ti
> > (f7b1140774e6c8c8aecde41388d40d9d407df6ff). The problem looks simil=
ar to
> > this bug report:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6165
> >=20
> > Console output is as follows:
> > Booting from mmc ...
> > ## Booting kernel from Legacy Image at 80007fc0 ...
> >=20
> >    Image Name:   Linux-3.14.5-yocto-standard
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    5098048 Bytes =3D 4.9 MiB
> >    Load Address: 80008000
> >    Entry Point:  80008000
> >    Verifying Checksum ... OK
> >=20
> > ## Flattened Device Tree blob at 80f80000
> >=20
> >    Booting using the fdt blob at 0x80f80000
> >    XIP Kernel Image ... OK
> >=20
> > OK
> >=20
> >    Using Device Tree in place at 80f80000, end 80f8a207
> >=20
> > Starting kernel ...
> >=20
> >=20
> > The original issue with kernel overlapping fdt was fixed with this =
patch
> > to
> > OE-core:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D2cae5f7=
8ad2982c7
> > ca0c22c085b71a1d2184a1b0 However, current meta-ti contains u-boot i=
n
> > version 2014.07, overriding 2013.07 from poky master. I'm assuming =
that
> > the patch eventually made it into denx tree.
> >=20
> > Another problem is that uImage contains the following info:
> > Image Name:   Linux-3.14.5-yocto-standard
> > Created:      Mon Aug 11 16:59:42 2014
> > Image Type:   ARM Linux Kernel Image (uncompressed)
> > Data Size:    5098048 Bytes =3D 4978.56 kB =3D 4.86 MB
> > Load Address: 80008000
> > Entry Point:  80008000
> >=20
> > I'm not sure what is the order in which the addresses are applied. =
Is it
> > kernel -> default env -> uEnv.txt?
> >=20
> > Adding uEnv.txt with these contents fixes the problem:
> > loadaddr=3D0x82000000
> > kernel_addr_r=3D0x82000000
> > fdtaddr=3D0x88000000
> > fdt_addr_r=3D0x88000000
> > rdaddr=3D0x88080000
> > ramdisk_addr_r=3D0x88080000
> > bootm_size=3D0x10000000
> >=20
> > Please advise how to fix it without falling back to uEnv.

--=20

Maciej Borz=C4=99cki=20
Senior Software Engineer Open-RnD Sp. z o.o.=20
www.open-rnd.pl, Facebook, Twitter=20
mobile: +48 telefon, fax: +48 42 657 9079=20

Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe z=
awiera=C4=87 chronione prawem lub=20
poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wi=
adomo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 =
zosta=C5=82a otrzymana przypadkowo=20
zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzec=
ich. W takim przypadku=20
uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poin=
formowanie=20
nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwro=
tnej. Dzi=C4=99kujemy.=20

This message, including any attachments hereto, may contain privileged =
or=20
confidential information and is sent solely for the attention and use o=
f the=20
intended addressee(s). If you are not an intended addressee, you may ne=
ither=20
use this message nor copy or deliver it to anyone. In such case, you sh=
ould=20
immediately destroy this message and kindly notify the sender by reply =
email.=20
Thank you. 

