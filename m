Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17A04E007DF; Sat, 23 Aug 2014 01:37:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80F75E00781
	for <meta-ti@yoctoproject.org>; Sat, 23 Aug 2014 01:36:54 -0700 (PDT)
Received: from localhost.localdomain (unknown [78.8.164.13])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id ACCD86098ED;
	Sat, 23 Aug 2014 10:36:51 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Denys Dmytriyenko <denys@ti.com>
Date: Sat, 23 Aug 2014 10:36:50 +0200
Message-ID: <29987622.exz6SDnJbz@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <20140823032420.GZ23523@edge>
References: <53ED13BE.2090809@pseudoterminal.org>
	<5823428.XaY5WDaLTE@localhost.localdomain>
	<20140823032420.GZ23523@edge>
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Sat, 23 Aug 2014 08:37:07 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 22 of August 2014 23:24:20 Denys Dmytriyenko wrote:
> On Mon, Aug 18, 2014 at 04:45:16PM +0200, Maciej Borzecki wrote:
> > On Monday 18 of August 2014 10:16:14 Denys Dmytriyenko wrote:
> > > On Mon, Aug 18, 2014 at 09:34:58AM -0300, Diego Sueiro wrote:
> > > > On Mon, Aug 18, 2014 at 9:28 AM, Maciej Borzecki <
> > > >=20
> > > > maciej.borzecki@open-rnd.pl> wrote:
> > > > > Rough guess, but it looks like a default u-boot from eMMC. Tr=
y
> > > > > following
> > > > > official instruction to make it boot off SD card:
> > > > > https://www.yoctoproject.org/downloads/bsps/daisy16/beaglebon=
e
> > > >=20
> > > > This should do the trick:
> > > > "Pressing the USER/BOOT button when powering on will temporaril=
y
> > > > change
> > > > the
> > > > boot order".
> > >=20
> > > The USER button may sometimes be tricky, as it preserves the stat=
e
> > > across
> > > reboots. So, if you already booted off of eMMC, holding the butto=
n and
> > > rebooting won't work - you'd have to unplug the power to complete=
ly turn
> > > it
> > > down and then power it up, while pressing the USER button. Making=
 eMMC
> > > non-bootable is more reliable in many cases...
> >=20
> > Silly question, is there any requirement that partition block count=
 must
> > be
> > even for boot partition?
> >=20
> > For instance, I'm not able to boot using this partition layout, kee=
p
> > getting CCC on serial console:
> >=20
> > Device         Boot     Start       End Blocks  Id System
> > /dev/mmcblk0p1 *         2048     22526  10239+  c W95 FAT32 (LBA)
> > /dev/mmcblk0p2          22528    116735  47104  83 Linux
> >=20
> > This one, almost works (u-boot runs, init fails mounting rootfs):
> > evice         Boot     Start       End Blocks  Id System
> > /dev/mmcblk0p1 *         2048     22527  10240   c W95 FAT32 (LBA)
> > /dev/mmcblk0p2          22528    116735  47104  83 Linux
>=20
> Have you tried the latest update to u-boot-ti-staging? There were cou=
ple
> fixes related to FAT and SD handling.

I tried these, but the problem was elsewhere. After some digging I foun=
d that=20
there are some intricacies to the boot process.

First of all, the CCCC sequence appears the boot ROM is attempting to l=
oad a=20
bootloader from UART. This would imply that attempts to locate a bootlo=
ader=20
failed. In case of BBB this would mean that MLO (?) was not located nei=
ther on=20
eMMC no SD (I'm guessing the checks are done in sequence eMMC -> SD -> =
UART).

There's some clue about this behavior here:
http://e2e.ti.com/support/embedded/starterware/f/790/t/210768.aspx

Then, there was an error in wic partition generating code that ended up=
=20
stealing a single sector from the first partition to compensate for byt=
es lost=20
to MBR. The code always subtracted from partition size, by never made u=
p for=20
this. Eventually, the partition that was initially even in size sector-=
wise,=20
ended up with an odd size. This apparently is a problem for OMAPs, see =
the=20
links below (not BBB exactly but still an OMAP CPU):

http://comments.gmane.org/gmane.comp.embedded.pandaboard/2790
https://groups.google.com/forum/#!topic/beagleboard/ro5k5r4Cuq4

There's very little info on the subject. Either what happened here is a=
 very=20
special case, or everyone knows about these intricacies, in which case,=
 shame=20
on me :) Yet, the partitions were perfectly valid for fdisk/parted not =
to=20
complain, and kernel to mount them.

Since wic only generates partition in at least 1MB size, removing the c=
ode=20
stealing single sectors was enough for the image to become correct.

The fix is already in master-next:=20
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dmaster-next&=
id=3De67d59c6fab33a3ae38ff2375189dc5235995492

I guess that eventually some sanity checking code would be useful, just=
 to=20
verify that some basic alignment constrains for particular platform is =
met.

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

