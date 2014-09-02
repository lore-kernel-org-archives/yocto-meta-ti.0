Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4C5FE00842; Tue,  2 Sep 2014 00:56:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78050E00837
	for <meta-ti@yoctoproject.org>; Tue,  2 Sep 2014 00:56:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 613771168F44;
	Tue,  2 Sep 2014 09:56:09 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: meta-ti@yoctoproject.org, "Peter A. Bigot" <pab@pabigot.com>
Date: Tue, 02 Sep 2014 09:56:08 +0200
Message-ID: <3756859.1y16KtP05K@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <5405010E.2070400@pabigot.com>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com>
	<5405010E.2070400@pabigot.com>
MIME-Version: 1.0
Subject: Re: BBB + uboot 2014.07 - not booting
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
X-List-Received-Date: Tue, 02 Sep 2014 07:56:21 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 01 of September 2014 18:28:14 Peter A. Bigot wrote:
> On 09/01/2014 04:53 PM, Diego Sueiro wrote:
> > Peter,
> >=20
> > On Mon, Sep 1, 2014 at 6:10 PM, Peter A. Bigot <pab@pabigot.com
> >=20
> > <mailto:pab@pabigot.com>> wrote:
> >     I am seeing the same behavior with an SD card with u-boot from
> >     current meta-ti master
> >     (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)
> >    =20
> >     I partition the cards and create the boot/root partitions with:=

> >    =20
> >     sudo dd if=3D/dev/zero of=3D${MMC} bs=3D1024 count=3D1024
> >     ( echo ,9,0x0C,* ; echo ,,,- ) \
> >    =20
> >       | sudo sfdisk -D -H 255 -S 63 ${MMC}
> >    =20
> >     ${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1
> >     ${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2
> >    =20
> >     ${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot
> >    =20
> >     This process works with poky master and yocto-bsp on beaglebone=
.
> >    =20
> >     I recall from long ago that some TI systems were picky about th=
e
> >     partitioning of the boot media.
> >=20
> > This is not true for recent Sitara SoCs:
> > http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088
> >=20
> >     Would somebody with an SD card image that boots the current
> >     meta-ti master provide the output of fdisk -lu from it, or a
> >     pointer to instructions for doing the formatting?  For referenc=
e,
> >     what doesn't work is:
> >    =20
> >     llc[325]$ sudo fdisk -lu /dev/sdh
> >    =20
> >     Disk /dev/sdh: 7892 MB, 7892631552 bytes
> >     255 heads, 63 sectors/track, 959 cylinders, total 15415296 sect=
ors
> >     Units =3D sectors of 1 * 512 =3D 512 bytes
> >     Sector size (logical/physical): 512 bytes / 512 bytes
> >     I/O size (minimum/optimal): 512 bytes / 512 bytes
> >     Disk identifier: 0x00000000
> >    =20
> >        Device Boot      Start         End      Blocks  Id  System
> >    =20
> >     /dev/sdh1   *          63      144584       72261    c W95 FAT3=
2 (LBA)
> >     /dev/sdh2          144585    15406334     7630875   83 Linux
> >=20
> > I'm using the following partition layout (both working on eMMC and
> >=20
> > sdcard with u-boot_2014.07.bb <http://u-boot_2014.07.bb>):
> >     # fdisk -lu /dev/mmcblk0
> >    =20
> >     Disk /dev/mmcblk0: 1920 MB, 1920991232 bytes, 3751936 sectors
> >     Units =3D sectors of 1 * 512 =3D 512 bytes
> >     Sector size (logical/physical): 512 bytes / 512 bytes
> >     I/O size (minimum/optimal): 512 bytes / 512 bytes
> >     Disk label type: dos
> >     Disk identifier: 0x00000000
> >    =20
> >             Device Boot      Start     End      Blocks   Id  System=

> >    =20
> >     /dev/mmcblk0p1   *          63   80324       40131    c  W95 FA=
T32
> >     (LBA)
>=20
> Thanks.  That does appear to be an eMMC partition, which probably
> shouldn't matter, but I replicated the configuration on a 2GB class 4=

> uSD card, and an 8GB class 6, and it doesn't work on either one.
>=20
> llc[77]$ sudo fdisk -lu /dev/sdh
>=20
> Disk /dev/sdh: 3965 MB, 3965190144 bytes
> 255 heads, 63 sectors/track, 482 cylinders, total 7744512 sectors
> Units =3D sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>=20
>     Device Boot      Start         End      Blocks   Id  System
> /dev/sdh1   *          63       80324       40131    c  W95 FAT32 (LB=
A)
> /dev/sdh2           80325     7743329     3831502+  83  Linux
>=20
> Anybody got a uSD partition layout that works?  I'm suspecting an iss=
ue
> with the heads/sectors/cylinders configuration.

Try looking here:
http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/4371

Although I could not confirm this, it seems that the first partition on=
 SD=20
needs to have an even block count (not sure about eMMC though, but I'm=20=

guessing the same rules apply).

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

