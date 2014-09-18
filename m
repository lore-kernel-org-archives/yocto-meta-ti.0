Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22031E0085F; Thu, 18 Sep 2014 14:46:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA9B5E0085E
	for <meta-ti@yoctoproject.org>; Thu, 18 Sep 2014 14:46:06 -0700 (PDT)
Received: from comp-006-thk.localnet (unknown [78.10.74.216])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id CD45E2B005FD;
	Thu, 18 Sep 2014 23:46:03 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: meta-ti@yoctoproject.org
Date: Thu, 18 Sep 2014 23:46:02 +0200
Message-ID: <2297605.6c1qGey1Tv@comp-006-thk>
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140918133355.GC29620@piout.net>
References: <20140918133355.GC29620@piout.net>
MIME-Version: 1.0
Subject: Re: Creating am335x sdcard images with wic
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
X-List-Received-Date: Thu, 18 Sep 2014 21:46:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 18 of September 2014 15:33:55 Alexandre Belloni wrote:
> Hi,
>=20
> I tried multiple ways of create sd card images for my am335x based
> platform.
>=20
> I tried to revive the sdimg image type, using the last patch from
> Otavio [1]
>=20
> This didn't generate bootable images.
>=20
> Now, I'm trying to use wic, based on this patch from Maciej [2].
> I have multiple issue, the first one is making wic load the plugin. I=

> have to apply the patch on poky rather than on my own layer to get wi=
c
> to load that plugin, is that intended ?
>=20
> Next, I'm still not able to generate a bootable image. I tracked it d=
own
> to an issue with the fat filesystem rather than the partitionning
> itself.
>=20
> 1/ With wic, this is the command line to generate the FAT
> filesystem:
>=20
> mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C /var/tmp/wic/buil=
d/boot
> 10240

With current master this line should look more like this:
mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C=20
/var/tmp/wic/build/fs_boot.vfat 10240

What revision of poky do you use?

>=20
> This results in an image that doesn't boot.
>=20
>=20
> 2/ On the same SD card, if I use:
>=20
> mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot /dev/mmcblk0p1
>=20
> This results in an SD card that can boot, the MLO starts, loads and
> starts u-boot.img but then it fails to load my dtb from the FAT
> filesystem because somehow, it only has short names.
>=20
>=20
> 3/ On the same SD card, if I manually format and copy files
> mkfs.vfat -F 16 /dev/mmcblk0p1 -n boot
> mount /dev/mmcblk0p1 /mnt
> cp $BUILDDIR/tmp/deploy/images/beaglebone/{MLO,u-boot.img,zImage} /mn=
t
> cp $BUILDDIR/tmp/deploy/images/beaglebone/*.dtb /mnt
> umount /dev/mmcblk0p1
>=20
> This one just boots fine, with long names.
>=20
> Any insight?
>=20
> [1]
> https://lists.yoctoproject.org/pipermail/meta-ti/2011-December/000234=
.html
> [2] https://lists.yoctoproject.org/pipermail/meta-ti/2014-July/004901=
.html

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

