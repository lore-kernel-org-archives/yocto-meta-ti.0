Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84D17E007AD; Mon, 18 Aug 2014 07:45:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2077CE007A2
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 07:45:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 907C32B02785;
	Mon, 18 Aug 2014 16:45:16 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 18 Aug 2014 16:45:16 +0200
Message-ID: <5823428.XaY5WDaLTE@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140818141613.GI23523@edge>
References: <53ED13BE.2090809@pseudoterminal.org>
	<CAMCfZKFSUXqmrSP4evQyHQkRC1ygXVTROxJstDjJTDXtsAQatw@mail.gmail.com>
	<20140818141613.GI23523@edge>
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
X-List-Received-Date: Mon, 18 Aug 2014 14:45:21 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 18 of August 2014 10:16:14 Denys Dmytriyenko wrote:
> On Mon, Aug 18, 2014 at 09:34:58AM -0300, Diego Sueiro wrote:
> > On Mon, Aug 18, 2014 at 9:28 AM, Maciej Borzecki <
> >=20
> > maciej.borzecki@open-rnd.pl> wrote:
> > > Rough guess, but it looks like a default u-boot from eMMC. Try fo=
llowing
> > > official instruction to make it boot off SD card:
> > > https://www.yoctoproject.org/downloads/bsps/daisy16/beaglebone
> >=20
> > This should do the trick:
> > "Pressing the USER/BOOT button when powering on will temporarily ch=
ange
> > the
> > boot order".
>=20
> The USER button may sometimes be tricky, as it preserves the state ac=
ross
> reboots. So, if you already booted off of eMMC, holding the button an=
d
> rebooting won't work - you'd have to unplug the power to completely t=
urn it
> down and then power it up, while pressing the USER button. Making eMM=
C
> non-bootable is more reliable in many cases...

Silly question, is there any requirement that partition block count mus=
t be=20
even for boot partition?

For instance, I'm not able to boot using this partition layout, keep ge=
tting=20
CCC on serial console:

Device         Boot     Start       End Blocks  Id System
/dev/mmcblk0p1 *         2048     22526  10239+  c W95 FAT32 (LBA)
/dev/mmcblk0p2          22528    116735  47104  83 Linux

This one, almost works (u-boot runs, init fails mounting rootfs):
evice         Boot     Start       End Blocks  Id System
/dev/mmcblk0p1 *         2048     22527  10240   c W95 FAT32 (LBA)
/dev/mmcblk0p2          22528    116735  47104  83 Linux



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

