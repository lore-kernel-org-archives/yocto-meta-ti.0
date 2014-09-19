Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 732B1E0076C; Fri, 19 Sep 2014 01:21:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2725BE006EF
	for <meta-ti@yoctoproject.org>; Fri, 19 Sep 2014 01:21:45 -0700 (PDT)
Received: from comp-006-thk.localnet (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 7A9892B01900;
	Fri, 19 Sep 2014 10:21:42 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 19 Sep 2014 10:21:41 +0200
Message-ID: <1944605.XngXTCW5jK@comp-006-thk>
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140919080024.GE29620@piout.net>
References: <20140918133355.GC29620@piout.net>
	<2297605.6c1qGey1Tv@comp-006-thk>
	<20140919080024.GE29620@piout.net>
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 19 Sep 2014 08:21:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 19 of September 2014 10:00:25 Alexandre Belloni wrote:
> Hi,
>=20
> On 18/09/2014 at 23:46:02 +0200, Maciej Borzecki wrote :
> > On Thursday 18 of September 2014 15:33:55 Alexandre Belloni wrote:
> > > 1/ With wic, this is the command line to generate the FAT
> > > filesystem:
> > >=20
> > > mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C
> > > /var/tmp/wic/build/boot
> > > 10240
> >=20
> > With current master this line should look more like this:
> > mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C
> > /var/tmp/wic/build/fs_boot.vfat 10240
> >=20
> > What revision of poky do you use?
>=20
> I'm currently using daisy.

I'm afraid that a number of patches to wic are in master only at the mo=
ment.=20
You can try backporting them, wic is kind of self contained so I'd expe=
ct it=20
to be relatively easy. Alternatively, you could use your 1.6 build with=
 wic=20
from master and pass paths to sysroot (see --help for -k, -r, -n), thou=
gh I=20
haven't tested this myself.

If you get into problems try catching me in #yocto, my nick is bboozzo.=


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

