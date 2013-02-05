Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33AACE002AB
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 16:58:16 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r150wCbf022526;
	Mon, 4 Feb 2013 18:58:12 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r150wCqG021333;
	Mon, 4 Feb 2013 18:58:12 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 4 Feb 2013 18:58:11 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Javier Martinez Canillas
	<javier@dowhile0.org>
Thread-Topic: [meta-ti] i *really* want a bootable OE image for my pdlogic
	am1808 experimenter kit
Thread-Index: AQHOAAyqELIq2uduVE+7VBhZ0XIQ4phlQs8AgADP7ICAA+v+IA==
Date: Tue, 5 Feb 2013 00:58:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C385D25@DFLE09.ent.ti.com>
References: <alpine.DEB.2.02.1301311735390.5243@oneiric>
	<CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
	<alpine.DEB.2.02.1302011749020.4566@oneiric>
In-Reply-To: <alpine.DEB.2.02.1302011749020.4566@oneiric>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: i *really* want a bootable OE image for my pdlogic am1808 experimenter kit
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
X-List-Received-Date: Tue, 05 Feb 2013 00:58:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Robert,
I am currently working on porting am180x to the latest Sitara Linux SDK (ht=
tp://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer%E2%80=
%99s_Guide). Our Sitara SDK is based on the Arago distribution (http://arag=
o-project.org/git/?p=3Dmeta-arago.git;a=3Dsummary)

Meta-Arago has the following restrictions:
1. We use a prebuilt toolchain for our oe-core builds (http://software-dl.t=
i.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html). You =
probably can use the tool chain built with oe-core but you have to make a t=
weak to use the "internal" built tool chain instead of the expected "extern=
al" tool chain.
2. Meta-Arago master is based on the latest meta-oe, meta-ti, oe-core maint=
enance branch. This means you will need to use meta-oe, meta-ti and oe-core=
 danny/denzil branches for things to work without a problem. We just starte=
d work on transitioning to danny from denzil.
3. My work for am18 hasn't been pushed to meta-arago or meta-ti yet. But yo=
u can see my hacks in the Sitara SDK integration branches.

http://arago-project.org/git/projects/?p=3Dmeta-arago-amsdk.git;a=3Dsummary=
 Branch: amsdk-05.07.00.00-integration
http://arago-project.org/git/projects/?p=3Dmeta-ti-amsdk.git;a=3Dsummary Br=
anch: amsdk-05.07.00.00-integration

If you build tisdk-rootfs-image (full SDK root filesystem) or arago-base-im=
age (minimal root filesystem) you should get what you need to get the board=
 booted up.

If you have issues we do have a script that configures everything you need =
to get up and running and building with our Arago distribution in no time.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Robert P. J. Day
> Sent: Friday, February 01, 2013 5:52 PM
> To: Javier Martinez Canillas
> Cc: meta-ti mailing list
> Subject: Re: [meta-ti] i *really* want a bootable OE image for my pdlogic
> am1808 experimenter kit
>=20
> On Fri, 1 Feb 2013, Javier Martinez Canillas wrote:
>=20
> > > hwclock: can't open '/dev/misc/rtc': No such file or directory Thu
> > > Jan 31 16:02:00 UTC 2013
> > > hwclock: can't open '/dev/misc/rtc': No such file or directory
> > >
> > >    (hangs)
> > >
> >
> > Hi Robert,
> >
> > I don't have your board but I've seen a similar issue before caused by
> > using a recent udev and not having enabled CONFIG_DEVTMPFS=3Dy on your
> > kernel config.
> >
> > The problem is that since udev-182, udev no longer creates device
> > nodes under /dev and this has to be managed by the kernel devtmpfs
> > filesystem.
> >
> > This means that a kernel built without devtmpfs config will not boot
> > since there won't be any device files on /dev.
>=20
>   that sounds vaguely familiar, i remember reading that once upon a time.
> which brings me back to my plaintive lament -- is there a recipe i can us=
e to
> build a bootable system for this board?
>=20
>   the SD card that came with it has "arago" splashed all over it so i'm g=
oing to
> check out the meta-arago layer(s) to see what i get.  but i would *dearly=
* love
> to figure out what it takes to build a working system for this in the nex=
t day or
> two.
>=20
>   don't make me beg.  all right, i'm begging ...
>=20
> rday
>=20
> --
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

