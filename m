Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A621E004DD; Thu, 14 Aug 2014 13:20:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3634E0034B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 13:20:34 -0700 (PDT)
Received: from localhost.localdomain (unknown [78.8.226.132])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id DE8F831640A0
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 22:20:31 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: meta-ti@yoctoproject.org
Date: Thu, 14 Aug 2014 22:20:30 +0200
Message-ID: <2948184.BeJYLBqp38@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <53ED175D.2090502@pseudoterminal.org>
References: <53ED13BE.2090809@pseudoterminal.org> <20140814200450.GX23523@edge>
	<53ED175D.2090502@pseudoterminal.org>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 14 Aug 2014 20:20:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 14 of August 2014 22:09:01 Carlos Rafael Giani wrote:
> On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:
> > On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote=
:
> >> Hello,
> >>=20
> >> after building a rootfs for the Beaglebone Black, I see the
> >> following files in the deploy folder for the machine:
> >>=20
> >> MLO
> >> u-boot.img
> >> u-boot-spl.bin
> >> zImage
> >>=20
> >> as well as other symlinks with "-beaglebone" attached to their fil=
enames.
> >>=20
> >> What should I copy, the SPL bin, or the .img u-boot binary?
> >> Also, u-boot tries to load a uImage, even though a zImage was buil=
t.
> >> There is also no uEnv.txt file.
> >> Do I have to write one to be able to let u-boot load the zImage, o=
r
> >> should it work out-of-the-box?
> >=20
> > Depends on the rootfs image you are building. Most images that are =
based
> > on
> > core-image-base will take care of deploying necessary pieces into t=
he
> > rootfs. But core-image-minimal is special and very bare-bone, so ex=
tra
> > manual steps are required.
> >=20
> > Regardless of the rootfs image, you'd need MLO and u-boot.img to be=

> > located in the first FAT partition of your SD card or eMMC flash.
> >=20
> > Then, if your rootfs does not already have zImage and the necessary=
 DTB
> > files in the /boot directory, you have to place them there (i.e.
> > core-image-minimal) and you are ready to boot. All the defaults wil=
l work
> > for out-of-the-box in this case. No uEnv.txt is necessary, unless y=
ou
> > need to do something extra special...
>=20
> Oh, I just built core-image-base .
>=20
> So I should use the .img and not the SPL .bin? I was wondering if the=

> SPL bin is a newer binary that will eventually replace the .img one.
>=20
> But when I use the .img file, it turns out that it tries to load a
> uImage, even though a zImage was built. Simply setting the bootfile e=
nv
> var to "zImage" won't work, because the u-boot script will try to boo=
t
> with the incorrect command.

Try setting bootfile=3DzImage in uEnv.txt in the first partition.

>=20
> I am trying to rule out that something went wrong in my build, that
> something is wrong in my setup. If I build core-image-base , the
> resulting u-boot.img should automatically load a zImage, not a uImage=
,
> correct?

Can you post serial output from uboot?

Your default environment should look similar to what is here:
http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Dinclude/configs/am335x_=
evm.h;h=3Da48b386477167010c8e0d206423a3bdbe611cf83;hb=3D524123a70761110=
c5cf3ccc5f52f6d4da071b959#l78



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

