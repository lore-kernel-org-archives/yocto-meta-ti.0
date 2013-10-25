Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9569E016CD
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 07:11:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PEBl1Y016900;
	Fri, 25 Oct 2013 09:11:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PEBlch022650;
	Fri, 25 Oct 2013 09:11:47 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 09:11:47 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "rstreif@linuxfoundation.org" <rstreif@linuxfoundation.org>,
	"Joshua.Vanderpool@RAYMONDCORP.COM" <Joshua.Vanderpool@RAYMONDCORP.COM>
Thread-Topic: [meta-ti] AM335x EVM and core-image-sato
Thread-Index: AQHOz2ZZjCpx6ty+X0abnXjbWTNsEJoBXfSAgABZToD//637LIABap8AgALauQD//87mBQ==
Date: Fri, 25 Oct 2013 14:11:47 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E908EED@DLEE08.ent.ti.com>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
	<20131022222813.GA9802@edge>,
	<CA+gsK-oiA9pOpFrietcPdF-qLYH6Uzv0OHmYYyzXS0Lk9Yy7ZA@mail.gmail.com>,
	<B0581B5571079145BA1CD78C126DBDE72E903AFC@DLEE08.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9@USNYGRMBX4.raymondcorp.local>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA00009@USNYGRMBX4.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA00009@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Fri, 25 Oct 2013 14:11:54 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E908EEDDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E908EEDDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks!


Denys


-----Original Message-----
From: Vanderpool Josh [Joshua.Vanderpool@RAYMONDCORP.COM]
Received: Friday, 25 Oct 2013, 13:09
To: Dmytriyenko, Denys [denys@ti.com]; rstreif@linuxfoundation.org [rstreif=
@linuxfoundation.org]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: RE: [meta-ti] AM335x EVM and core-image-sato

Denys,

This is the commit of meta-ti that works with the AM335x-SK.

meta-ti           =3D "(nobranch):b739286d690bdaada952a2376bd7aa1ba221badd"

-Josh
________________________________________
From: Vanderpool Josh
Sent: Wednesday, October 23, 2013 12:32 PM
To: Dmytriyenko, Denys; rstreif@linuxfoundation.org
Cc: meta-ti@yoctoproject.org
Subject: RE: [meta-ti] AM335x EVM and core-image-sato

Attached is a boot log from a working version done back the 7th of October =
3.12.rc3.
This was using the master branch of poky, meta-ti and meta-qt5.

I hope plan on getting the commit tag shortly.

-Josh
________________________________________
From: Dmytriyenko, Denys [denys@ti.com]
Sent: Tuesday, October 22, 2013 7:54 PM
To: rstreif@linuxfoundation.org
Cc: Vanderpool Josh; meta-ti@yoctoproject.org
Subject: RE: [meta-ti] AM335x EVM and core-image-sato

I sent a different DTB...


Denys


-----Original Message-----
From: Rudolf Streif [rstreif@linuxfoundation.org]
Received: Wednesday, 23 Oct 2013, 0:48
To: Dmytriyenko, Denys [denys@ti.com]
CC: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]; meta-ti@yoctoproje=
ct.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] AM335x EVM and core-image-sato

Denys,

Sorry, yes, the board I have is a am335x_evmsk. I forgot to write it out co=
rrectly in the subject line. it's a purple board. I have been using the cor=
rect device tree file all along.

The board revision is 1.2B. The CPU is XAM3359ZCZ. On boot the kernel repor=
ts:

[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c=
53c7d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] Machine: am335xevm
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AM335X ES1.0 (sgx neon )

Maybe that helps you to determine what CPU revision that is.

I built a 3.2.0 kernel with core-image-sato and it works just fine (after e=
nabling tmpdevfs support in the kernel).

It may will be a combination of that hardware with the newer kernel version=
s. I just bought the board a couple of weeks ago from DigiKey. If it is an =
older CPU revision then they are apparently selling older stock.

If the CPU revision not being supported by the newer kernel is indeed the r=
oot cause of the issue then this may become frustrating for more users. The=
re is no way that a user can reasonably find out that the kernel does not b=
oot because of the CPU revision. I don't know what has changed between the =
CPU revisions but I would think that the kernel should support all of them.

Cheers,
Rudi




On Tue, Oct 22, 2013 at 11:28 PM, Denys Dmytriyenko <denys@ti.com<mailto:de=
nys@ti.com>> wrote:
Josh,

Yes, in your case it was clear from the beginning you had a problem with SK
and it is kind of known... In Rudi's case he was saying he had an actual EV=
M,
which is known to boot fine at the moment, hence I was confirming with him.

For your case, please try the DTB file attached. Thanks.

--
Denys


On Tue, Oct 22, 2013 at 08:36:13PM +0000, Vanderpool Josh wrote:
> It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ no A =
or
> B after the AM335x.
>
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoprojec=
t.org> [meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoprojec=
t.org>] on behalf of meta-ti-request@yoctoproject.org<mailto:meta-ti-reques=
t@yoctoproject.org> [meta-ti-request@yoctoproject.org<mailto:meta-ti-reques=
t@yoctoproject.org>]
> Sent: Tuesday, October 22, 2013 4:17 PM
> To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: meta-ti Digest, Vol 25, Issue 36
>
> Send meta-ti mailing list submissions to
>         meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
>         meta-ti-request@yoctoproject.org<mailto:meta-ti-request@yoctoproj=
ect.org>
>
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org<mailto:meta-ti-owner@yoctoproject.=
org>
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of meta-ti digest..."
>
>
> Today's Topics:
>
>    1. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
>    2. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
>    3. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
>       core-image-base (Vanderpool Josh)
>    4. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 22 Oct 2013 15:36:21 -0400
> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> To: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfounda=
tion.org>>
> Cc: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022193620.GB9301@edge>
> Content-Type: text/plain; charset=3D"us-ascii"
>
> Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1
> versions of the silicon and I believe those are the latest ones. Need to
> double-check that.
>
> Denys
>
>
> On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > Where do I find the PG version of the board? The barcode sticker on the
> > board says rev 1.2.
> >
> >
> > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com<mailt=
o:denys@ti.com>> wrote:
> >
> > > Now I'm just wondering what PG version of the board you've got, if it
> > > fails in
> > > the same way with our 3.8 kernel and a known good set of 3.12 images.=
..
> > >
> > >
> > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > Thanks, Denys.
> > > >
> > > > Interesting point about gcc. It's version 4.8.1 which is the defaul=
t for
> > > > poky master. Which is what I used all along.
> > > >
> > > > Thanks for sending your binaries. They fail too with the exact same
> > > > problem. See attached log. I found [1] on gmane which exactly descr=
ibes
> > > the
> > > > problem I am seeing.
> > > >
> > > > If that is the case then I was wondering why my earlier builds with
> > > > 3.12-rc3 actually worked. And I tried them again and they are now f=
ailing
> > > > too. Of course I don't know anything about the specifics of the gpi=
o and
> > > > the timers on the chip but it looks like a weird hardware initializ=
ation
> > > > condition. And I don't know if the proposed patch in [1] was ever
> > > > incorporated in your kernel tree.
> > > >
> > > > I don't think it's the hardware (or at least not alone) because the=
 SD
> > > that
> > > > ships with it with the 3.2 kernel works just fine.
> > > >
> > > > Cheers,
> > > > Rudi
> > > >
> > > >
> > > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.or=
g<mailto:denis@denix.org>>
> > > wrote:
> > > >
> > > > > Rudi,
> > > > >
> > > > > As we discussed earlier today, let my send you my binaries for th=
e
> > > kernel
> > > > > and
> > > > > u-boot to try on your board. I just wanted to ask you about the
> > > toolchain
> > > > > that
> > > > > you used to build yours. In our builds we use Linaro gcc-4.7 hard=
fp
> > > > > toolchain
> > > > > and I vaguely remember hearing about some problems with the recen=
t
> > > gcc-4.8
> > > > > toolchain from oe-core... I'm wondering if you are having the sam=
e
> > > issue.
> > > > >
> > > > > --
> > > > > Denys
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > Since the 3.12-rc5 kernel does not work I decided to give the 3=
.8
> > > kernel
> > > > > a
> > > > > > try. The issue with this one is that the linux-ti-staging_3.8.b=
brecipe
> > > > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-boo=
t
> > > > > environment
> > > > > > has now moved on to using zImage which consequently means u-boo=
t
> > > will not
> > > > > > find the kernel file.
> > > > > >
> > > > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked into=
 the
> > > > > > linux-ti-staging_3.8.bb<http://linux-ti-staging_3.8.bb> recipe =
but whoever did it did not think
> > > about
> > > > > > u-boot. Does zImage not work with 3.8? I did not try it but it =
should
> > > > > > normally have no effect. Since there is no dependency of the u-=
boot
> > > > > recipes
> > > > > > on the kernel image types changes to the kernel image type for =
newer
> > > > > > versions of the kernel then automatically means that it must be
> > > changed
> > > > > for
> > > > > > the previous versions too.
> > > > > >
> > > > > > I mocked around with the u-boot environment and booted the 3.8 =
uImage
> > > > > > kernel. To my surprise the 3.8 kernel from the TI staging repos=
itory
> > > > > fails
> > > > > > with the exact same problem and stops booting with a kernel not
> > > syncing
> > > > > > message during the init calls. Apparently a patch must have bee=
n
> > > applied
> > > > > to
> > > > > > the kernel repo that breaks it. It has nothing possibly to do w=
ith
> > > the
> > > > > > build system.
> > > > > >
> > > > > > I would appreciate any hints to get this kernel built and boot =
on the
> > > > > board.
> > > > > >
> > > > > > Thanks,
> > > > > > Rudi
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoundation.org=
>>wrote:
> > > > > >
> > > > > > > Denys,
> > > > > > >
> > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls du=
ring
> > > > > > > initialization. I attached the boot log. I don't know much ab=
out
> > > the
> > > > > > > platform details but maybe that's an issue you know about.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Rudi
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >>
> > > > > > >> [1]
> > > > > > >> Build Configuration:
> > > > > > >> BB_VERSION        =3D "1.21.0"
> > > > > > >> BUILD_SYS         =3D "x86_64-linux"
> > > > > > >> NATIVELSBSTRING   =3D "Fedora-18"
> > > > > > >> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> > > > > > >> MACHINE           =3D "am335x-evm"
> > > > > > >> DISTRO            =3D "poky"
> > > > > > >> DISTRO_VERSION    =3D "1.5+snapshot-20131019"
> > > > > > >> TUNE_FEATURES     =3D "armv7a vfp neon"
> > > > > > >> TARGET_FPU        =3D "vfp-neon"
> > > > > > >> meta-yocto        =3D
> > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > >> meta-ti           =3D
> > > "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > > >> meta-oe           =3D
> > > "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > > >> meta              =3D
> > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > >>
> > > > > > >>
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > --
> > > > > > *Rudolf J. Streif*
> > > > > > Director of Embedded Solutions
> > > > > > The Linux Foundation
> > > > > >
> > > > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > > > Skype: rudolfstreif
> > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > >
> > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<h=
ttp://events.linuxfoundation.org>
> > > > > > Linux Foundation Training Schedule: training.linuxfoundation.or=
g<http://training.linuxfoundation.org>
> > > > >
> > > > > > _______________________________________________
> > > > > > meta-ti mailing list
> > > > > > meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > --
> > > > *Rudolf J. Streif*
> > > > Director of Embedded Solutions
> > > > The Linux Foundation
> > > >
> > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<http:=
//events.linuxfoundation.org>
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org<ht=
tp://training.linuxfoundation.org>
> > >
> > >
> > >
> >
> >
> > --
> > --
> > *Rudolf J. Streif*
> > Director of Embedded Solutions
> > The Linux Foundation
> >
> > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > Skype: rudolfstreif
> > PGP: RSA 2048/2048 D6E7D28B
> >
> > Linux Foundation Events Schedule:  events.linuxfoundation.org<http://ev=
ents.linuxfoundation.org>
> > Linux Foundation Training Schedule: training.linuxfoundation.org<http:/=
/training.linuxfoundation.org>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 22 Oct 2013 15:37:32 -0400
> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> To: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfounda=
tion.org>>
> Cc: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022193732.GC9301@edge>
> Content-Type: text/plain; charset=3D"us-ascii"
>
> And just to double-check here as well - you did try all the binaries I se=
nt
> you, including MLO, u-boot, zImage and DTB, right?
>
> Denys
>
>
> On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > Thanks, Denys.
> >
> > Interesting point about gcc. It's version 4.8.1 which is the default fo=
r
> > poky master. Which is what I used all along.
> >
> > Thanks for sending your binaries. They fail too with the exact same
> > problem. See attached log. I found [1] on gmane which exactly describes=
 the
> > problem I am seeing.
> >
> > If that is the case then I was wondering why my earlier builds with
> > 3.12-rc3 actually worked. And I tried them again and they are now faili=
ng
> > too. Of course I don't know anything about the specifics of the gpio an=
d
> > the timers on the chip but it looks like a weird hardware initializatio=
n
> > condition. And I don't know if the proposed patch in [1] was ever
> > incorporated in your kernel tree.
> >
> > I don't think it's the hardware (or at least not alone) because the SD =
that
> > ships with it with the 3.2 kernel works just fine.
> >
> > Cheers,
> > Rudi
> >
> >
> > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> >
> >
> > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org<ma=
ilto:denis@denix.org>> wrote:
> >
> > > Rudi,
> > >
> > > As we discussed earlier today, let my send you my binaries for the ke=
rnel
> > > and
> > > u-boot to try on your board. I just wanted to ask you about the toolc=
hain
> > > that
> > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > > toolchain
> > > and I vaguely remember hearing about some problems with the recent gc=
c-4.8
> > > toolchain from oe-core... I'm wondering if you are having the same is=
sue.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8 k=
ernel
> > > a
> > > > try. The issue with this one is that the linux-ti-staging_3.8.bb<ht=
tp://linux-ti-staging_3.8.bb> recipe
> > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-boot
> > > environment
> > > > has now moved on to using zImage which consequently means u-boot wi=
ll not
> > > > find the kernel file.
> > > >
> > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked into the
> > > > linux-ti-staging_3.8.bb<http://linux-ti-staging_3.8.bb> recipe but =
whoever did it did not think about
> > > > u-boot. Does zImage not work with 3.8? I did not try it but it shou=
ld
> > > > normally have no effect. Since there is no dependency of the u-boot
> > > recipes
> > > > on the kernel image types changes to the kernel image type for newe=
r
> > > > versions of the kernel then automatically means that it must be cha=
nged
> > > for
> > > > the previous versions too.
> > > >
> > > > I mocked around with the u-boot environment and booted the 3.8 uIma=
ge
> > > > kernel. To my surprise the 3.8 kernel from the TI staging repositor=
y
> > > fails
> > > > with the exact same problem and stops booting with a kernel not syn=
cing
> > > > message during the init calls. Apparently a patch must have been ap=
plied
> > > to
> > > > the kernel repo that breaks it. It has nothing possibly to do with =
the
> > > > build system.
> > > >
> > > > I would appreciate any hints to get this kernel built and boot on t=
he
> > > board.
> > > >
> > > > Thanks,
> > > > Rudi
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoundation.org>>wr=
ote:
> > > >
> > > > > Denys,
> > > > >
> > > > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > > > initialization. I attached the boot log. I don't know much about =
the
> > > > > platform details but maybe that's an issue you know about.
> > > > >
> > > > > Thanks,
> > > > > Rudi
> > > > >
> > > > >
> > > > >
> > > > >>
> > > > >> [1]
> > > > >> Build Configuration:
> > > > >> BB_VERSION        =3D "1.21.0"
> > > > >> BUILD_SYS         =3D "x86_64-linux"
> > > > >> NATIVELSBSTRING   =3D "Fedora-18"
> > > > >> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> > > > >> MACHINE           =3D "am335x-evm"
> > > > >> DISTRO            =3D "poky"
> > > > >> DISTRO_VERSION    =3D "1.5+snapshot-20131019"
> > > > >> TUNE_FEATURES     =3D "armv7a vfp neon"
> > > > >> TARGET_FPU        =3D "vfp-neon"
> > > > >> meta-yocto        =3D "master:9a1dce10bdc9254bb38e0e54199f23ae55=
e209a4"
> > > > >> meta-ti           =3D "master:c11504664990f007c3903d349e7cc135a9=
04f8e2"
> > > > >> meta-oe           =3D "master:f8903f53db717294d63a8d79b5ef7ca34b=
3c189e"
> > > > >> meta              =3D "master:9a1dce10bdc9254bb38e0e54199f23ae55=
e209a4"
> > > > >>
> > > > >>
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > --
> > > > *Rudolf J. Streif*
> > > > Director of Embedded Solutions
> > > > The Linux Foundation
> > > >
> > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<http:=
//events.linuxfoundation.org>
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org<ht=
tp://training.linuxfoundation.org>
> > >
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> > >
> >
> >
> > --
> > --
> > *Rudolf J. Streif*
> > Director of Embedded Solutions
> > The Linux Foundation
> >
> > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > Skype: rudolfstreif
> > PGP: RSA 2048/2048 D6E7D28B
> >
> > Linux Foundation Events Schedule:  events.linuxfoundation.org<http://ev=
ents.linuxfoundation.org>
> > Linux Foundation Training Schedule: training.linuxfoundation.org<http:/=
/training.linuxfoundation.org>
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 22 Oct 2013 19:52:13 +0000
> From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com<mailto:Joshua.Va=
nderpool@raymondcorp.com>>
> To: "meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>" <meta-ti@=
yoctoproject.org<mailto:meta-ti@yoctoproject.org>>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.=
local>
>
> Content-Type: text/plain; charset=3D"us-ascii"
>
> Thanks for the links Rudi, I looked for the file referenced in [2] "arch/=
arm/mach-omap2/cclock33xx_data.c" to see if the patch works but...
>
> There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-poky=
-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a394c/g=
it/arch/arm/mach-omap2/cclock3xxx_data.c.
>
> however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/linu=
x-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c
>
> So it appears there is mis-match as the patch is in the 3.10 files that r=
e in the armv7a-vfp-neon-poky-linux-gnueabi directory?
>
> So is this something that is just lost from the 3.12-rc5 kernel and shoul=
dn't the linux-linc-headers be the version being built?
>
> Unfortunately being inexperienced with the project I am at a loss at how =
to fix this but hope this help point someone to the solution.
>
> Regards,
> Josh
>
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoprojec=
t.org> [meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoprojec=
t.org>] on behalf of meta-ti-request@yoctoproject.org<mailto:meta-ti-reques=
t@yoctoproject.org> [meta-ti-request@yoctoproject.org<mailto:meta-ti-reques=
t@yoctoproject.org>]
> Sent: Tuesday, October 22, 2013 3:00 PM
> To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: meta-ti Digest, Vol 25, Issue 35
>
> Send meta-ti mailing list submissions to
>         meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
>         meta-ti-request@yoctoproject.org<mailto:meta-ti-request@yoctoproj=
ect.org>
>
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org<mailto:meta-ti-owner@yoctoproject.=
org>
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of meta-ti digest..."
>
>
> Today's Topics:
>
>    1. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
>       core-image-base (Rudolf Streif)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 22 Oct 2013 18:18:29 +0100
> From: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoun=
dation.org>>
> To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com<mailto:Joshua.Vand=
erpool@raymondcorp.com>>
> Cc: "meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>" <meta-ti@=
yoctoproject.org<mailto:meta-ti@yoctoproject.org>>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.c=
om<mailto:CA%2BgsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.=
com>>
> Content-Type: text/plain; charset=3D"iso-8859-1"
>
> Hi Josh,
>
> I am seeing the exact same problem with my am335x-evmsk and the latest
> meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].
>
> This problem looks like the one posted here [2].
>
> The bad news is I don't have a solution for it. The good news is that Den=
ys
> and I are attending the same conference and I keep harassing him about it=
.
> :)
>
> Cheers,
> Rudi
>
>
> [1]
> https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html
> [2] http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
>
>
> On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh <
> Joshua.Vanderpool@raymondcorp.com<mailto:Joshua.Vanderpool@raymondcorp.co=
m>> wrote:
>
> > I am having a similar issue as Rudi.
> > Attached is the bootLog.
> >
> >
> > Build Configuration:
> > BB_VERSION        =3D "1.21.0"
> > BUILD_SYS         =3D "x86_64-linux"
> > NATIVELSBSTRING   =3D "Ubuntu-12.04"
> > TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> > MACHINE           =3D "am335x-evm"
> > DISTRO            =3D "poky"
> > DISTRO_VERSION    =3D "1.5+snapshot-20131022"
> > TUNE_FEATURES     =3D "armv7a vfp neon"
> > TARGET_FPU        =3D "vfp-neon"
> > meta
> > meta-yocto        =3D "master:505114c13d29799a25379f7ce720d632616d8776"
> > meta-ti           =3D "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > meta-qt5          =3D "master:84cd4be2491895b0c3a0af64e4c83d58910d1f6c"
> >
> > Josh Vanderpool
> > Electrical Engineer
> > Control Systems
> > The Raymond Corporation
> > 20 South Canal Street
> > Greene, New York 13778-0130
> > Phone: 607-656-2617
> > Fax: 607-656-4845
> > joshua.vanderpool@raymondcorp.com<mailto:joshua.vanderpool@raymondcorp.=
com>
> > http://www.raymondcorp.com
> >
> >
> > Confidentiality Notice:
> >
> > The preceding e-mail message (including any attachments) contains
> > information that may be confidential, protected by applicable legal
> > privileges, or constitute non-public information. It is intended to be
> > conveyed only to the designated recipient(s). If you are not an intende=
d
> > recipient of this message, please notify the sender by replying to this
> > message and then delete it from your system. Use, dissemination,
> > distribution or reproduction of this message by unintended recipients i=
s
> > not authorized and may be unlawful.
> >
> >
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/2013102=
2/34dc4b0c/attachment-0001.html>
>
> ------------------------------
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> End of meta-ti Digest, Vol 25, Issue 35
> ***************************************
> Confidentiality Notice:
>
> The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, or=
 constitute non-public information. It is intended to be conveyed only to t=
he designated recipient(s). If you are not an intended recipient of this me=
ssage, please notify the sender by replying to this message and then delete=
 it from your system. Use, dissemination, distribution or reproduction of t=
his message by unintended recipients is
> not authorized and may be unlawful.
>
>
>
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 22 Oct 2013 16:16:52 -0400
> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> To: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfounda=
tion.org>>,
>         meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022201652.GB404@denix.org<mailto:20131022201652.GB404@d=
enix.org>>
> Content-Type: text/plain; charset=3Dus-ascii
>
> Hey, Rudi,
>
> Just one more quick check about your board - are you sure yours is an EVM=
? Or
> is it an SK-EVM i.e. a "Starter Kit"? Basically, what color is the PCB of=
 your
> board - is it green (EVM) or purple (SK)?
>
> For example, here's the EVM:
> https://plus.google.com/u/0/110579591067038943673/posts/SLB35o1JgBu
>
> --
> Denys
>
>
>
> On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:
> > Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1
> > versions of the silicon and I believe those are the latest ones. Need t=
o
> > double-check that.
> >
> > Denys
> >
> >
> > On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > > Where do I find the PG version of the board? The barcode sticker on t=
he
> > > board says rev 1.2.
> > >
> > >
> > > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com<mai=
lto:denys@ti.com>> wrote:
> > >
> > > > Now I'm just wondering what PG version of the board you've got, if =
it
> > > > fails in
> > > > the same way with our 3.8 kernel and a known good set of 3.12 image=
s...
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > > Thanks, Denys.
> > > > >
> > > > > Interesting point about gcc. It's version 4.8.1 which is the defa=
ult for
> > > > > poky master. Which is what I used all along.
> > > > >
> > > > > Thanks for sending your binaries. They fail too with the exact sa=
me
> > > > > problem. See attached log. I found [1] on gmane which exactly des=
cribes
> > > > the
> > > > > problem I am seeing.
> > > > >
> > > > > If that is the case then I was wondering why my earlier builds wi=
th
> > > > > 3.12-rc3 actually worked. And I tried them again and they are now=
 failing
> > > > > too. Of course I don't know anything about the specifics of the g=
pio and
> > > > > the timers on the chip but it looks like a weird hardware initial=
ization
> > > > > condition. And I don't know if the proposed patch in [1] was ever
> > > > > incorporated in your kernel tree.
> > > > >
> > > > > I don't think it's the hardware (or at least not alone) because t=
he SD
> > > > that
> > > > > ships with it with the 3.2 kernel works just fine.
> > > > >
> > > > > Cheers,
> > > > > Rudi
> > > > >
> > > > >
> > > > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.=
org<mailto:denis@denix.org>>
> > > > wrote:
> > > > >
> > > > > > Rudi,
> > > > > >
> > > > > > As we discussed earlier today, let my send you my binaries for =
the
> > > > kernel
> > > > > > and
> > > > > > u-boot to try on your board. I just wanted to ask you about the
> > > > toolchain
> > > > > > that
> > > > > > you used to build yours. In our builds we use Linaro gcc-4.7 ha=
rdfp
> > > > > > toolchain
> > > > > > and I vaguely remember hearing about some problems with the rec=
ent
> > > > gcc-4.8
> > > > > > toolchain from oe-core... I'm wondering if you are having the s=
ame
> > > > issue.
> > > > > >
> > > > > > --
> > > > > > Denys
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > > Since the 3.12-rc5 kernel does not work I decided to give the=
 3.8
> > > > kernel
> > > > > > a
> > > > > > > try. The issue with this one is that the linux-ti-staging_3.8=
.bbrecipe
> > > > > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-b=
oot
> > > > > > environment
> > > > > > > has now moved on to using zImage which consequently means u-b=
oot
> > > > will not
> > > > > > > find the kernel file.
> > > > > > >
> > > > > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked in=
to the
> > > > > > > linux-ti-staging_3.8.bb<http://linux-ti-staging_3.8.bb> recip=
e but whoever did it did not think
> > > > about
> > > > > > > u-boot. Does zImage not work with 3.8? I did not try it but i=
t should
> > > > > > > normally have no effect. Since there is no dependency of the =
u-boot
> > > > > > recipes
> > > > > > > on the kernel image types changes to the kernel image type fo=
r newer
> > > > > > > versions of the kernel then automatically means that it must =
be
> > > > changed
> > > > > > for
> > > > > > > the previous versions too.
> > > > > > >
> > > > > > > I mocked around with the u-boot environment and booted the 3.=
8 uImage
> > > > > > > kernel. To my surprise the 3.8 kernel from the TI staging rep=
ository
> > > > > > fails
> > > > > > > with the exact same problem and stops booting with a kernel n=
ot
> > > > syncing
> > > > > > > message during the init calls. Apparently a patch must have b=
een
> > > > applied
> > > > > > to
> > > > > > > the kernel repo that breaks it. It has nothing possibly to do=
 with
> > > > the
> > > > > > > build system.
> > > > > > >
> > > > > > > I would appreciate any hints to get this kernel built and boo=
t on the
> > > > > > board.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Rudi
> > > > > > >
> > > > > > >
> > > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > > <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoundation.o=
rg>>wrote:
> > > > > > >
> > > > > > > > Denys,
> > > > > > > >
> > > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls =
during
> > > > > > > > initialization. I attached the boot log. I don't know much =
about
> > > > the
> > > > > > > > platform details but maybe that's an issue you know about.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Rudi
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >>
> > > > > > > >> [1]
> > > > > > > >> Build Configuration:
> > > > > > > >> BB_VERSION        =3D "1.21.0"
> > > > > > > >> BUILD_SYS         =3D "x86_64-linux"
> > > > > > > >> NATIVELSBSTRING   =3D "Fedora-18"
> > > > > > > >> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> > > > > > > >> MACHINE           =3D "am335x-evm"
> > > > > > > >> DISTRO            =3D "poky"
> > > > > > > >> DISTRO_VERSION    =3D "1.5+snapshot-20131019"
> > > > > > > >> TUNE_FEATURES     =3D "armv7a vfp neon"
> > > > > > > >> TARGET_FPU        =3D "vfp-neon"
> > > > > > > >> meta-yocto        =3D
> > > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > > >> meta-ti           =3D
> > > > "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > > > >> meta-oe           =3D
> > > > "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > > > >> meta              =3D
> > > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > > >>
> > > > > > > >>
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > --
> > > > > > > *Rudolf J. Streif*
> > > > > > > Director of Embedded Solutions
> > > > > > > The Linux Foundation
> > > > > > >
> > > > > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > > > > Skype: rudolfstreif
> > > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > > >
> > > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org=
<http://events.linuxfoundation.org>
> > > > > > > Linux Foundation Training Schedule: training.linuxfoundation.=
org<http://training.linuxfoundation.org>
> > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-ti mailing list
> > > > > > > meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > --
> > > > > *Rudolf J. Streif*
> > > > > Director of Embedded Solutions
> > > > > The Linux Foundation
> > > > >
> > > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > > Skype: rudolfstreif
> > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > >
> > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<htt=
p://events.linuxfoundation.org>
> > > > > Linux Foundation Training Schedule: training.linuxfoundation.org<=
http://training.linuxfoundation.org>
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > --
> > > *Rudolf J. Streif*
> > > Director of Embedded Solutions
> > > The Linux Foundation
> > >
> > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > Skype: rudolfstreif
> > > PGP: RSA 2048/2048 D6E7D28B
> > >
> > > Linux Foundation Events Schedule:  events.linuxfoundation.org<http://=
events.linuxfoundation.org>
> > > Linux Foundation Training Schedule: training.linuxfoundation.org<http=
://training.linuxfoundation.org>
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
>
>
> ------------------------------
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> End of meta-ti Digest, Vol 25, Issue 36
> ***************************************
> Confidentiality Notice:
>
> The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, or=
 constitute non-public information. It is intended to be conveyed only to t=
he designated recipient(s). If you are not an intended recipient of this me=
ssage, please notify the sender by replying to this message and then delete=
 it from your system. Use, dissemination, distribution or reproduction of t=
his message by unintended recipients is
> not authorized and may be unlawful.
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti



Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informati=
on that may be confidential, protected by applicable legal privileges, or c=
onstitute non-public information. It is intended to be conveyed only to the=
 designated recipient(s). If you are not an intended recipient of this mess=
age, please notify the sender by replying to this message and then delete i=
t from your system. Use, dissemination, distribution or reproduction of thi=
s message by unintended recipients is
not authorized and may be unlawful.





--_000_B0581B5571079145BA1CD78C126DBDE72E908EEDDLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Thanks!<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Vanderpool Josh [Joshua.Vanderpool@RAYMONDCORP.COM]<br>
<b>Received:</b> Friday, 25 Oct 2013, 13:09<br>
<b>To:</b> Dmytriyenko, Denys [denys@ti.com]; rstreif@linuxfoundation.org [=
rstreif@linuxfoundation.org]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> RE: [meta-ti] AM335x EVM and core-image-sato<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Denys,<br>
<br>
This is the commit of meta-ti that works with the AM335x-SK.<br>
<br>
meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &qu=
ot;(nobranch):b739286d690bdaada952a2376bd7aa1ba221badd&quot;<br>
<br>
-Josh<br>
________________________________________<br>
From: Vanderpool Josh<br>
Sent: Wednesday, October 23, 2013 12:32 PM<br>
To: Dmytriyenko, Denys; rstreif@linuxfoundation.org<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: RE: [meta-ti] AM335x EVM and core-image-sato<br>
<br>
Attached is a boot log from a working version done back the 7th of October =
3.12.rc3.<br>
This was using the master branch of poky, meta-ti and meta-qt5.<br>
<br>
I hope plan on getting the commit tag shortly.<br>
<br>
-Josh<br>
________________________________________<br>
From: Dmytriyenko, Denys [denys@ti.com]<br>
Sent: Tuesday, October 22, 2013 7:54 PM<br>
To: rstreif@linuxfoundation.org<br>
Cc: Vanderpool Josh; meta-ti@yoctoproject.org<br>
Subject: RE: [meta-ti] AM335x EVM and core-image-sato<br>
<br>
I sent a different DTB...<br>
<br>
<br>
Denys<br>
<br>
<br>
-----Original Message-----<br>
From: Rudolf Streif [rstreif@linuxfoundation.org]<br>
Received: Wednesday, 23 Oct 2013, 0:48<br>
To: Dmytriyenko, Denys [denys@ti.com]<br>
CC: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]; meta-ti@yoctoproje=
ct.org [meta-ti@yoctoproject.org]<br>
Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
<br>
Denys,<br>
<br>
Sorry, yes, the board I have is a am335x_evmsk. I forgot to write it out co=
rrectly in the subject line. it's a purple board. I have been using the cor=
rect device tree file all along.<br>
<br>
The board revision is 1.2B. The CPU is XAM3359ZCZ. On boot the kernel repor=
ts:<br>
<br>
[&nbsp;&nbsp;&nbsp; 0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (A=
RMv7), cr=3D10c53c7d<br>
[&nbsp;&nbsp;&nbsp; 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT=
 aliasing instruction cache<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Machine: am335xevm<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Memory policy: ECC disabled, Data cache write=
back<br>
[&nbsp;&nbsp;&nbsp; 0.000000] AM335X ES1.0 (sgx neon )<br>
<br>
Maybe that helps you to determine what CPU revision that is.<br>
<br>
I built a 3.2.0 kernel with core-image-sato and it works just fine (after e=
nabling tmpdevfs support in the kernel).<br>
<br>
It may will be a combination of that hardware with the newer kernel version=
s. I just bought the board a couple of weeks ago from DigiKey. If it is an =
older CPU revision then they are apparently selling older stock.<br>
<br>
If the CPU revision not being supported by the newer kernel is indeed the r=
oot cause of the issue then this may become frustrating for more users. The=
re is no way that a user can reasonably find out that the kernel does not b=
oot because of the CPU revision.
 I don't know what has changed between the CPU revisions but I would think =
that the kernel should support all of them.<br>
<br>
Cheers,<br>
Rudi<br>
<br>
<br>
<br>
<br>
On Tue, Oct 22, 2013 at 11:28 PM, Denys Dmytriyenko &lt;denys@ti.com&lt;mai=
lto:denys@ti.com&gt;&gt; wrote:<br>
Josh,<br>
<br>
Yes, in your case it was clear from the beginning you had a problem with SK=
<br>
and it is kind of known... In Rudi's case he was saying he had an actual EV=
M,<br>
which is known to boot fine at the moment, hence I was confirming with him.=
<br>
<br>
For your case, please try the DTB file attached. Thanks.<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Tue, Oct 22, 2013 at 08:36:13PM &#43;0000, Vanderpool Josh wrote:<br>
&gt; It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ no=
 A or<br>
&gt; B after the AM335x.<br>
&gt;<br>
&gt; ________________________________________<br>
&gt; From: meta-ti-bounces@yoctoproject.org&lt;mailto:meta-ti-bounces@yocto=
project.org&gt; [meta-ti-bounces@yoctoproject.org&lt;mailto:meta-ti-bounces=
@yoctoproject.org&gt;] on behalf of meta-ti-request@yoctoproject.org&lt;mai=
lto:meta-ti-request@yoctoproject.org&gt; [meta-ti-request@yoctoproject.org&=
lt;mailto:meta-ti-request@yoctoproject.org&gt;]<br>
&gt; Sent: Tuesday, October 22, 2013 4:17 PM<br>
&gt; To: meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br=
>
&gt; Subject: meta-ti Digest, Vol 25, Issue 36<br>
&gt;<br>
&gt; Send meta-ti mailing list submissions to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti@yoctoproject.o=
rg&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
&gt;<br>
&gt; To subscribe or unsubscribe via the World Wide Web, visit<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://lis=
ts.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listin=
fo/meta-ti</a><br>
&gt; or, via email, send a message with subject or body 'help' to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-request@yoctop=
roject.org&lt;mailto:meta-ti-request@yoctoproject.org&gt;<br>
&gt;<br>
&gt; You can reach the person managing the list at<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-owner@yoctopro=
ject.org&lt;mailto:meta-ti-owner@yoctoproject.org&gt;<br>
&gt;<br>
&gt; When replying, please edit your Subject line so it is more specific<br=
>
&gt; than &quot;Re: Contents of meta-ti digest...&quot;<br>
&gt;<br>
&gt;<br>
&gt; Today's Topics:<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp; 1. Re: AM335x EVM and core-image-sato (Denys Dmytriy=
enko)<br>
&gt;&nbsp;&nbsp;&nbsp; 2. Re: AM335x EVM and core-image-sato (Denys Dmytriy=
enko)<br>
&gt;&nbsp;&nbsp;&nbsp; 3. Re: AM335x-SK kernel panic with Poky(master), met=
a-ti(master)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core-image-base (Vanderpool Josh)<=
br>
&gt;&nbsp;&nbsp;&nbsp; 4. Re: AM335x EVM and core-image-sato (Denys Dmytriy=
enko)<br>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
<br>
&gt;<br>
&gt; Message: 1<br>
&gt; Date: Tue, 22 Oct 2013 15:36:21 -0400<br>
&gt; From: Denys Dmytriyenko &lt;denys@ti.com&lt;mailto:denys@ti.com&gt;&gt=
;<br>
&gt; To: Rudolf Streif &lt;rstreif@linuxfoundation.org&lt;mailto:rstreif@li=
nuxfoundation.org&gt;&gt;<br>
&gt; Cc: meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br=
>
&gt; Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
&gt; Message-ID: &lt;20131022193620.GB9301@edge&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;<br>
&gt; Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1=
<br>
&gt; versions of the silicon and I believe those are the latest ones. Need =
to<br>
&gt; double-check that.<br>
&gt;<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 22, 2013 at 08:57:51AM &#43;0100, Rudolf Streif wrote:<br>
&gt; &gt; Where do I find the PG version of the board? The barcode sticker =
on the<br>
&gt; &gt; board says rev 1.2.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko &lt;denys@ti.=
com&lt;mailto:denys@ti.com&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; Now I'm just wondering what PG version of the board you've g=
ot, if it<br>
&gt; &gt; &gt; fails in<br>
&gt; &gt; &gt; the same way with our 3.8 kernel and a known good set of 3.1=
2 images...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Oct 21, 2013 at 11:19:35PM &#43;0100, Rudolf Streif =
wrote:<br>
&gt; &gt; &gt; &gt; Thanks, Denys.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Interesting point about gcc. It's version 4.8.1 which i=
s the default for<br>
&gt; &gt; &gt; &gt; poky master. Which is what I used all along.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks for sending your binaries. They fail too with th=
e exact same<br>
&gt; &gt; &gt; &gt; problem. See attached log. I found [1] on gmane which e=
xactly describes<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; problem I am seeing.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If that is the case then I was wondering why my earlier=
 builds with<br>
&gt; &gt; &gt; &gt; 3.12-rc3 actually worked. And I tried them again and th=
ey are now failing<br>
&gt; &gt; &gt; &gt; too. Of course I don't know anything about the specific=
s of the gpio and<br>
&gt; &gt; &gt; &gt; the timers on the chip but it looks like a weird hardwa=
re initialization<br>
&gt; &gt; &gt; &gt; condition. And I don't know if the proposed patch in [1=
] was ever<br>
&gt; &gt; &gt; &gt; incorporated in your kernel tree.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don't think it's the hardware (or at least not alone)=
 because the SD<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; ships with it with the 3.2 kernel works just fine.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1]&nbsp; <a href=3D"http://permalink.gmane.org/gmane.l=
inux.ports.arm.omap/96044">
http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko &lt=
;denis@denix.org&lt;mailto:denis@denix.org&gt;&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Rudi,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; As we discussed earlier today, let my send you my =
binaries for the<br>
&gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; u-boot to try on your board. I just wanted to ask =
you about the<br>
&gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; you used to build yours. In our builds we use Lina=
ro gcc-4.7 hardfp<br>
&gt; &gt; &gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; and I vaguely remember hearing about some problems=
 with the recent<br>
&gt; &gt; &gt; gcc-4.8<br>
&gt; &gt; &gt; &gt; &gt; toolchain from oe-core... I'm wondering if you are=
 having the same<br>
&gt; &gt; &gt; issue.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; Denys<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf S=
treif wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Since the 3.12-rc5 kernel does not work I dec=
ided to give the 3.8<br>
&gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; try. The issue with this one is that the linu=
x-ti-staging_3.8.bbrecipe<br>
&gt; &gt; &gt; &gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot;uIma=
ge&quot;. However, the u-boot<br>
&gt; &gt; &gt; &gt; &gt; environment<br>
&gt; &gt; &gt; &gt; &gt; &gt; has now moved on to using zImage which conseq=
uently means u-boot<br>
&gt; &gt; &gt; will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &quot;=
uImage&quot; was hacked into the<br>
&gt; &gt; &gt; &gt; &gt; &gt; linux-ti-staging_3.8.bb&lt;http://linux-ti-st=
aging_3.8.bb&gt; recipe but whoever did it did not think<br>
&gt; &gt; &gt; about<br>
&gt; &gt; &gt; &gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I did =
not try it but it should<br>
&gt; &gt; &gt; &gt; &gt; &gt; normally have no effect. Since there is no de=
pendency of the u-boot<br>
&gt; &gt; &gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; &gt; &gt; on the kernel image types changes to the kern=
el image type for newer<br>
&gt; &gt; &gt; &gt; &gt; &gt; versions of the kernel then automatically mea=
ns that it must be<br>
&gt; &gt; &gt; changed<br>
&gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I mocked around with the u-boot environment a=
nd booted the 3.8 uImage<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernel. To my surprise the 3.8 kernel from th=
e TI staging repository<br>
&gt; &gt; &gt; &gt; &gt; fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; with the exact same problem and stops booting=
 with a kernel not<br>
&gt; &gt; &gt; syncing<br>
&gt; &gt; &gt; &gt; &gt; &gt; message during the init calls. Apparently a p=
atch must have been<br>
&gt; &gt; &gt; applied<br>
&gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; the kernel repo that breaks it. It has nothin=
g possibly to do with<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; build system.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I would appreciate any hints to get this kern=
el built and boot on the<br>
&gt; &gt; &gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Strei=
f<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;rstreif@linuxfoundation.org&lt;mailto:rst=
reif@linuxfoundation.org&gt;&gt;wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel again b=
ut it still stalls during<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; initialization. I attached the boot log.=
 I don't know much about<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; platform details but maybe that's an iss=
ue you know about.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D &quot;1.21.0&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING&nbsp;&nbsp; =3D &quo=
t;Fedora-18&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D &quot;arm-poky-linux-gnueabi&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;am335x-evm&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D=
 &quot;1.5&#43;snapshot-20131019&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp=
; =3D &quot;armv7a vfp neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D &quot;vfp-neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &quot;master:c11504664990f007c3903d349e7cc135a904f8e2&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &quot;master:f8903f53db717294d63a8d79b5ef7ca34b3c189e&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.stre=
if@linux.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.53=
7.6646&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Events Schedule:&nbsp; event=
s.linuxfoundation.org&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Training Schedule: training.=
linuxfoundation.org&lt;http://training.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; _____________________________________________=
__<br>
&gt; &gt; &gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yo=
ctoproject.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/lis=
tinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.streif@linux.c=
om&gt;<br>
&gt; &gt; &gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.537.6646&gt;=
<br>
&gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Linux Foundation Events Schedule:&nbsp; events.linuxfou=
ndation.org&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; Linux Foundation Training Schedule: training.linuxfound=
ation.org&lt;http://training.linuxfoundation.org&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; The Linux Foundation<br>
&gt; &gt;<br>
&gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.streif@linux.com&gt;<br>
&gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.537.6646&gt;<br>
&gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt;<br>
&gt; &gt; Linux Foundation Events Schedule:&nbsp; events.linuxfoundation.or=
g&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; Linux Foundation Training Schedule: training.linuxfoundation.org&=
lt;http://training.linuxfoundation.org&gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; Message: 2<br>
&gt; Date: Tue, 22 Oct 2013 15:37:32 -0400<br>
&gt; From: Denys Dmytriyenko &lt;denys@ti.com&lt;mailto:denys@ti.com&gt;&gt=
;<br>
&gt; To: Rudolf Streif &lt;rstreif@linuxfoundation.org&lt;mailto:rstreif@li=
nuxfoundation.org&gt;&gt;<br>
&gt; Cc: meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br=
>
&gt; Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
&gt; Message-ID: &lt;20131022193732.GC9301@edge&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;<br>
&gt; And just to double-check here as well - you did try all the binaries I=
 sent<br>
&gt; you, including MLO, u-boot, zImage and DTB, right?<br>
&gt;<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Oct 21, 2013 at 11:19:35PM &#43;0100, Rudolf Streif wrote:<br>
&gt; &gt; Thanks, Denys.<br>
&gt; &gt;<br>
&gt; &gt; Interesting point about gcc. It's version 4.8.1 which is the defa=
ult for<br>
&gt; &gt; poky master. Which is what I used all along.<br>
&gt; &gt;<br>
&gt; &gt; Thanks for sending your binaries. They fail too with the exact sa=
me<br>
&gt; &gt; problem. See attached log. I found [1] on gmane which exactly des=
cribes the<br>
&gt; &gt; problem I am seeing.<br>
&gt; &gt;<br>
&gt; &gt; If that is the case then I was wondering why my earlier builds wi=
th<br>
&gt; &gt; 3.12-rc3 actually worked. And I tried them again and they are now=
 failing<br>
&gt; &gt; too. Of course I don't know anything about the specifics of the g=
pio and<br>
&gt; &gt; the timers on the chip but it looks like a weird hardware initial=
ization<br>
&gt; &gt; condition. And I don't know if the proposed patch in [1] was ever=
<br>
&gt; &gt; incorporated in your kernel tree.<br>
&gt; &gt;<br>
&gt; &gt; I don't think it's the hardware (or at least not alone) because t=
he SD that<br>
&gt; &gt; ships with it with the 3.2 kernel works just fine.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Rudi<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; [1]&nbsp; <a href=3D"http://permalink.gmane.org/gmane.linux.ports=
.arm.omap/96044">http://permalink.gmane.org/gmane.linux.ports.arm.omap/9604=
4</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko &lt;denis@den=
ix.org&lt;mailto:denis@denix.org&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; Rudi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As we discussed earlier today, let my send you my binaries f=
or the kernel<br>
&gt; &gt; &gt; and<br>
&gt; &gt; &gt; u-boot to try on your board. I just wanted to ask you about =
the toolchain<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; you used to build yours. In our builds we use Linaro gcc-4.7=
 hardfp<br>
&gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; and I vaguely remember hearing about some problems with the =
recent gcc-4.8<br>
&gt; &gt; &gt; toolchain from oe-core... I'm wondering if you are having th=
e same issue.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Denys<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrot=
e:<br>
&gt; &gt; &gt; &gt; Since the 3.12-rc5 kernel does not work I decided to gi=
ve the 3.8 kernel<br>
&gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; try. The issue with this one is that the linux-ti-stagi=
ng_3.8.bb&lt;http://linux-ti-staging_3.8.bb&gt; recipe<br>
&gt; &gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot;uImage&quot;. =
However, the u-boot<br>
&gt; &gt; &gt; environment<br>
&gt; &gt; &gt; &gt; has now moved on to using zImage which consequently mea=
ns u-boot will not<br>
&gt; &gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &quot;uImage&quo=
t; was hacked into the<br>
&gt; &gt; &gt; &gt; linux-ti-staging_3.8.bb&lt;http://linux-ti-staging_3.8.=
bb&gt; recipe but whoever did it did not think about<br>
&gt; &gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I did not try it=
 but it should<br>
&gt; &gt; &gt; &gt; normally have no effect. Since there is no dependency o=
f the u-boot<br>
&gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; on the kernel image types changes to the kernel image t=
ype for newer<br>
&gt; &gt; &gt; &gt; versions of the kernel then automatically means that it=
 must be changed<br>
&gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I mocked around with the u-boot environment and booted =
the 3.8 uImage<br>
&gt; &gt; &gt; &gt; kernel. To my surprise the 3.8 kernel from the TI stagi=
ng repository<br>
&gt; &gt; &gt; fails<br>
&gt; &gt; &gt; &gt; with the exact same problem and stops booting with a ke=
rnel not syncing<br>
&gt; &gt; &gt; &gt; message during the init calls. Apparently a patch must =
have been applied<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; the kernel repo that breaks it. It has nothing possibly=
 to do with the<br>
&gt; &gt; &gt; &gt; build system.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I would appreciate any hints to get this kernel built a=
nd boot on the<br>
&gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif<br>
&gt; &gt; &gt; &gt; &lt;rstreif@linuxfoundation.org&lt;mailto:rstreif@linux=
foundation.org&gt;&gt;wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel again but it stil=
l stalls during<br>
&gt; &gt; &gt; &gt; &gt; initialization. I attached the boot log. I don't k=
now much about the<br>
&gt; &gt; &gt; &gt; &gt; platform details but maybe that's an issue you kno=
w about.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt; &gt;&gt; BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D &quot;1.21.0&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING&nbsp;&nbsp; =3D &quot;Fedora-1=
8&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D &quot;arm-poky-linux-gnueabi&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;am335x-evm&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D &quot;1.5=
&#43;snapshot-20131019&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D &quo=
t;armv7a vfp neon&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D &quot;vfp-neon&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;master:c11504664990f007c3903d349e7cc135a904=
f8e2&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;master:f8903f53db717294d63a8d79b5ef7ca34b3c=
189e&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;master:9a1dce10bdc9254bb38e0=
e54199f23ae55e209a4&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.streif@linux.c=
om&gt;<br>
&gt; &gt; &gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.537.6646&gt;=
<br>
&gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Linux Foundation Events Schedule:&nbsp; events.linuxfou=
ndation.org&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; Linux Foundation Training Schedule: training.linuxfound=
ation.org&lt;http://training.linuxfoundation.org&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject=
.org&gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta=
-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; The Linux Foundation<br>
&gt; &gt;<br>
&gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.streif@linux.com&gt;<br>
&gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.537.6646&gt;<br>
&gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt;<br>
&gt; &gt; Linux Foundation Events Schedule:&nbsp; events.linuxfoundation.or=
g&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; Linux Foundation Training Schedule: training.linuxfoundation.org&=
lt;http://training.linuxfoundation.org&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; Message: 3<br>
&gt; Date: Tue, 22 Oct 2013 19:52:13 &#43;0000<br>
&gt; From: Vanderpool Josh &lt;Joshua.Vanderpool@raymondcorp.com&lt;mailto:=
Joshua.Vanderpool@raymondcorp.com&gt;&gt;<br>
&gt; To: &quot;meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&=
gt;&quot; &lt;meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&g=
t;&gt;<br>
&gt; Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti(master) core-i=
mage-base<br>
&gt; Message-ID:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;7D1F292BE8E4CC4F93=
079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.local&gt;<br>
&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;<br>
&gt; Thanks for the links Rudi, I looked for the file referenced in [2] &qu=
ot;arch/arm/mach-omap2/cclock33xx_data.c&quot; to see if the patch works bu=
t...<br>
&gt;<br>
&gt; There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-p=
oky-linux-gnueabi/linux-ti-staging/3.11&#43;3.12-rc5-r20a&#43;gitrAUTOINC&#=
43;eb765a394c/git/arch/arm/mach-omap2/cclock3xxx_data.c.<br>
&gt;<br>
&gt; however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/l=
inux-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c<=
br>
&gt;<br>
&gt; So it appears there is mis-match as the patch is in the 3.10 files tha=
t re in the armv7a-vfp-neon-poky-linux-gnueabi directory?<br>
&gt;<br>
&gt; So is this something that is just lost from the 3.12-rc5 kernel and sh=
ouldn't the linux-linc-headers be the version being built?<br>
&gt;<br>
&gt; Unfortunately being inexperienced with the project I am at a loss at h=
ow to fix this but hope this help point someone to the solution.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Josh<br>
&gt;<br>
&gt; ________________________________________<br>
&gt; From: meta-ti-bounces@yoctoproject.org&lt;mailto:meta-ti-bounces@yocto=
project.org&gt; [meta-ti-bounces@yoctoproject.org&lt;mailto:meta-ti-bounces=
@yoctoproject.org&gt;] on behalf of meta-ti-request@yoctoproject.org&lt;mai=
lto:meta-ti-request@yoctoproject.org&gt; [meta-ti-request@yoctoproject.org&=
lt;mailto:meta-ti-request@yoctoproject.org&gt;]<br>
&gt; Sent: Tuesday, October 22, 2013 3:00 PM<br>
&gt; To: meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br=
>
&gt; Subject: meta-ti Digest, Vol 25, Issue 35<br>
&gt;<br>
&gt; Send meta-ti mailing list submissions to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti@yoctoproject.o=
rg&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
&gt;<br>
&gt; To subscribe or unsubscribe via the World Wide Web, visit<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://lis=
ts.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listin=
fo/meta-ti</a><br>
&gt; or, via email, send a message with subject or body 'help' to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-request@yoctop=
roject.org&lt;mailto:meta-ti-request@yoctoproject.org&gt;<br>
&gt;<br>
&gt; You can reach the person managing the list at<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-owner@yoctopro=
ject.org&lt;mailto:meta-ti-owner@yoctoproject.org&gt;<br>
&gt;<br>
&gt; When replying, please edit your Subject line so it is more specific<br=
>
&gt; than &quot;Re: Contents of meta-ti digest...&quot;<br>
&gt;<br>
&gt;<br>
&gt; Today's Topics:<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp; 1. Re: AM335x-SK kernel panic with Poky(master), met=
a-ti(master)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core-image-base (Rudolf Streif)<br=
>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
<br>
&gt;<br>
&gt; Message: 1<br>
&gt; Date: Tue, 22 Oct 2013 18:18:29 &#43;0100<br>
&gt; From: Rudolf Streif &lt;rstreif@linuxfoundation.org&lt;mailto:rstreif@=
linuxfoundation.org&gt;&gt;<br>
&gt; To: Vanderpool Josh &lt;Joshua.Vanderpool@raymondcorp.com&lt;mailto:Jo=
shua.Vanderpool@raymondcorp.com&gt;&gt;<br>
&gt; Cc: &quot;meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&=
gt;&quot; &lt;meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&g=
t;&gt;<br>
&gt; Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti(master) core-i=
mage-base<br>
&gt; Message-ID:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;CA&#43;gsK-pNkDYCc=
ecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.com&lt;mailto:CA%2BgsK-pNk=
DYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.com&gt;&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;iso-8859-1&quot;<br>
&gt;<br>
&gt; Hi Josh,<br>
&gt;<br>
&gt; I am seeing the exact same problem with my am335x-evmsk and the latest=
<br>
&gt; meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].<br=
>
&gt;<br>
&gt; This problem looks like the one posted here [2].<br>
&gt;<br>
&gt; The bad news is I don't have a solution for it. The good news is that =
Denys<br>
&gt; and I are attending the same conference and I keep harassing him about=
 it.<br>
&gt; :)<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Rudi<br>
&gt;<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti/2013-Octob=
er/003519.html">
https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html</=
a><br>
&gt; [2] <a href=3D"http://permalink.gmane.org/gmane.linux.ports.arm.omap/9=
6044">http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044</a><br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh &lt;<br>
&gt; Joshua.Vanderpool@raymondcorp.com&lt;mailto:Joshua.Vanderpool@raymondc=
orp.com&gt;&gt; wrote:<br>
&gt;<br>
&gt; &gt; I am having a similar issue as Rudi.<br>
&gt; &gt; Attached is the bootLog.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Build Configuration:<br>
&gt; &gt; BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;1.=
21.0&quot;<br>
&gt; &gt; BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &qu=
ot;x86_64-linux&quot;<br>
&gt; &gt; NATIVELSBSTRING&nbsp;&nbsp; =3D &quot;Ubuntu-12.04&quot;<br>
&gt; &gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;ar=
m-poky-linux-gnueabi&quot;<br>
&gt; &gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D &quot;am335x-evm&quot;<br>
&gt; &gt; DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =3D &quot;poky&quot;<br>
&gt; &gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D &quot;1.5&#43;snapshot-20131=
022&quot;<br>
&gt; &gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;armv7a vfp neon&q=
uot;<br>
&gt; &gt; TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;vf=
p-neon&quot;<br>
&gt; &gt; meta<br>
&gt; &gt; meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;ma=
ster:505114c13d29799a25379f7ce720d632616d8776&quot;<br>
&gt; &gt; meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D &quot;master:c11504664990f007c3903d349e7cc135a904f8e2&quot;<br>
&gt; &gt; meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D &quot;master:84cd4be2491895b0c3a0af64e4c83d58910d1f6c&quot;<br>
&gt; &gt;<br>
&gt; &gt; Josh Vanderpool<br>
&gt; &gt; Electrical Engineer<br>
&gt; &gt; Control Systems<br>
&gt; &gt; The Raymond Corporation<br>
&gt; &gt; 20 South Canal Street<br>
&gt; &gt; Greene, New York 13778-0130<br>
&gt; &gt; Phone: 607-656-2617<br>
&gt; &gt; Fax: 607-656-4845<br>
&gt; &gt; joshua.vanderpool@raymondcorp.com&lt;mailto:joshua.vanderpool@ray=
mondcorp.com&gt;<br>
&gt; &gt; <a href=3D"http://www.raymondcorp.com">http://www.raymondcorp.com=
</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Confidentiality Notice:<br>
&gt; &gt;<br>
&gt; &gt; The preceding e-mail message (including any attachments) contains=
<br>
&gt; &gt; information that may be confidential, protected by applicable leg=
al<br>
&gt; &gt; privileges, or constitute non-public information. It is intended =
to be<br>
&gt; &gt; conveyed only to the designated recipient(s). If you are not an i=
ntended<br>
&gt; &gt; recipient of this message, please notify the sender by replying t=
o this<br>
&gt; &gt; message and then delete it from your system. Use, dissemination,<=
br>
&gt; &gt; distribution or reproduction of this message by unintended recipi=
ents is<br>
&gt; &gt; not authorized and may be unlawful.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<b=
r>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https=
://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; -------------- next part --------------<br>
&gt; An HTML attachment was scrubbed...<br>
&gt; URL: &lt;<a href=3D"http://lists.yoctoproject.org/pipermail/meta-ti/at=
tachments/20131022/34dc4b0c/attachment-0001.html">http://lists.yoctoproject=
.org/pipermail/meta-ti/attachments/20131022/34dc4b0c/attachment-0001.html</=
a>&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
&gt;<br>
&gt; End of meta-ti Digest, Vol 25, Issue 35<br>
&gt; ***************************************<br>
&gt; Confidentiality Notice:<br>
&gt;<br>
&gt; The preceding e-mail message (including any attachments) contains info=
rmation that may be confidential, protected by applicable legal privileges,=
 or constitute non-public information. It is intended to be conveyed only t=
o the designated recipient(s). If you
 are not an intended recipient of this message, please notify the sender by=
 replying to this message and then delete it from your system. Use, dissemi=
nation, distribution or reproduction of this message by unintended recipien=
ts is<br>
&gt; not authorized and may be unlawful.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; Message: 4<br>
&gt; Date: Tue, 22 Oct 2013 16:16:52 -0400<br>
&gt; From: Denys Dmytriyenko &lt;denys@ti.com&lt;mailto:denys@ti.com&gt;&gt=
;<br>
&gt; To: Rudolf Streif &lt;rstreif@linuxfoundation.org&lt;mailto:rstreif@li=
nuxfoundation.org&gt;&gt;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti@yoctoproject.o=
rg&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
&gt; Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
&gt; Message-ID: &lt;20131022201652.GB404@denix.org&lt;mailto:2013102220165=
2.GB404@denix.org&gt;&gt;<br>
&gt; Content-Type: text/plain; charset=3Dus-ascii<br>
&gt;<br>
&gt; Hey, Rudi,<br>
&gt;<br>
&gt; Just one more quick check about your board - are you sure yours is an =
EVM? Or<br>
&gt; is it an SK-EVM i.e. a &quot;Starter Kit&quot;? Basically, what color =
is the PCB of your<br>
&gt; board - is it green (EVM) or purple (SK)?<br>
&gt;<br>
&gt; For example, here's the EVM:<br>
&gt; <a href=3D"https://plus.google.com/u/0/110579591067038943673/posts/SLB=
35o1JgBu">https://plus.google.com/u/0/110579591067038943673/posts/SLB35o1Jg=
Bu</a><br>
&gt;<br>
&gt; --<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; Huh, I'm wondering if 1.2 is still supported... There were 2.0 an=
d 2.1<br>
&gt; &gt; versions of the silicon and I believe those are the latest ones. =
Need to<br>
&gt; &gt; double-check that.<br>
&gt; &gt;<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Oct 22, 2013 at 08:57:51AM &#43;0100, Rudolf Streif wrote=
:<br>
&gt; &gt; &gt; Where do I find the PG version of the board? The barcode sti=
cker on the<br>
&gt; &gt; &gt; board says rev 1.2.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko &lt;deny=
s@ti.com&lt;mailto:denys@ti.com&gt;&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Now I'm just wondering what PG version of the board you=
've got, if it<br>
&gt; &gt; &gt; &gt; fails in<br>
&gt; &gt; &gt; &gt; the same way with our 3.8 kernel and a known good set o=
f 3.12 images...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 11:19:35PM &#43;0100, Rudolf St=
reif wrote:<br>
&gt; &gt; &gt; &gt; &gt; Thanks, Denys.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Interesting point about gcc. It's version 4.8.1 wh=
ich is the default for<br>
&gt; &gt; &gt; &gt; &gt; poky master. Which is what I used all along.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks for sending your binaries. They fail too wi=
th the exact same<br>
&gt; &gt; &gt; &gt; &gt; problem. See attached log. I found [1] on gmane wh=
ich exactly describes<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; problem I am seeing.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; If that is the case then I was wondering why my ea=
rlier builds with<br>
&gt; &gt; &gt; &gt; &gt; 3.12-rc3 actually worked. And I tried them again a=
nd they are now failing<br>
&gt; &gt; &gt; &gt; &gt; too. Of course I don't know anything about the spe=
cifics of the gpio and<br>
&gt; &gt; &gt; &gt; &gt; the timers on the chip but it looks like a weird h=
ardware initialization<br>
&gt; &gt; &gt; &gt; &gt; condition. And I don't know if the proposed patch =
in [1] was ever<br>
&gt; &gt; &gt; &gt; &gt; incorporated in your kernel tree.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I don't think it's the hardware (or at least not a=
lone) because the SD<br>
&gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; ships with it with the 3.2 kernel works just fine.=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; [1]&nbsp; <a href=3D"http://permalink.gmane.org/gm=
ane.linux.ports.arm.omap/96044">
http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenk=
o &lt;denis@denix.org&lt;mailto:denis@denix.org&gt;&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Rudi,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; As we discussed earlier today, let my send yo=
u my binaries for the<br>
&gt; &gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; u-boot to try on your board. I just wanted to=
 ask you about the<br>
&gt; &gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; &gt; you used to build yours. In our builds we use=
 Linaro gcc-4.7 hardfp<br>
&gt; &gt; &gt; &gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; &gt; and I vaguely remember hearing about some pro=
blems with the recent<br>
&gt; &gt; &gt; &gt; gcc-4.8<br>
&gt; &gt; &gt; &gt; &gt; &gt; toolchain from oe-core... I'm wondering if yo=
u are having the same<br>
&gt; &gt; &gt; &gt; issue.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; Denys<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rud=
olf Streif wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Since the 3.12-rc5 kernel does not work =
I decided to give the 3.8<br>
&gt; &gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; try. The issue with this one is that the=
 linux-ti-staging_3.8.bbrecipe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot=
;uImage&quot;. However, the u-boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; environment<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; has now moved on to using zImage which c=
onsequently means u-boot<br>
&gt; &gt; &gt; &gt; will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &=
quot;uImage&quot; was hacked into the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; linux-ti-staging_3.8.bb&lt;http://linux-=
ti-staging_3.8.bb&gt; recipe but whoever did it did not think<br>
&gt; &gt; &gt; &gt; about<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I=
 did not try it but it should<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; normally have no effect. Since there is =
no dependency of the u-boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; on the kernel image types changes to the=
 kernel image type for newer<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; versions of the kernel then automaticall=
y means that it must be<br>
&gt; &gt; &gt; &gt; changed<br>
&gt; &gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I mocked around with the u-boot environm=
ent and booted the 3.8 uImage<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel. To my surprise the 3.8 kernel fr=
om the TI staging repository<br>
&gt; &gt; &gt; &gt; &gt; &gt; fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; with the exact same problem and stops bo=
oting with a kernel not<br>
&gt; &gt; &gt; &gt; syncing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; message during the init calls. Apparentl=
y a patch must have been<br>
&gt; &gt; &gt; &gt; applied<br>
&gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the kernel repo that breaks it. It has n=
othing possibly to do with<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; build system.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I would appreciate any hints to get this=
 kernel built and boot on the<br>
&gt; &gt; &gt; &gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf =
Streif<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;rstreif@linuxfoundation.org&lt;mailt=
o:rstreif@linuxfoundation.org&gt;&gt;wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel ag=
ain but it still stalls during<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; initialization. I attached the boot=
 log. I don't know much about<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; platform details but maybe that's a=
n issue you know about.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BB_VERSION&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;1.21.0&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BUILD_SYS&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING&nbsp;&nbsp; =3D=
 &quot;Fedora-18&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;arm-poky-linux-gnueabi&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;am335x-evm&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp=
; =3D &quot;1.5&#43;snapshot-20131019&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;=
&nbsp; =3D &quot;armv7a vfp neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_FPU&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;vfp-neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-yocto&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-ti&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &gt; &quot;master:c11504664990f007c3903d349e7cc135a904f8e2&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-oe&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &gt; &quot;master:f8903f53db717294d63a8d79b5ef7ca34b3c189e&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf=
.streif@linux.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.6=
19.537.6646&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Events Schedule:&nbsp; =
events.linuxfoundation.org&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Training Schedule: trai=
ning.linuxfoundation.org&lt;http://training.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ________________________________________=
_______<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-ti@yoctoproject.org&lt;mailto:meta-=
ti@yoctoproject.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.or=
g/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.streif@li=
nux.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.537.664=
6&gt;<br>
&gt; &gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Linux Foundation Events Schedule:&nbsp; events.lin=
uxfoundation.org&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; Linux Foundation Training Schedule: training.linux=
foundation.org&lt;http://training.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; rudolf.streif@linux.com&lt;mailto:rudolf.streif@linux.com&gt=
;<br>
&gt; &gt; &gt; Phone: &#43;1.619.537.6646&lt;tel:%2B1.619.537.6646&gt;<br>
&gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Linux Foundation Events Schedule:&nbsp; events.linuxfoundati=
on.org&lt;http://events.linuxfoundation.org&gt;<br>
&gt; &gt; &gt; Linux Foundation Training Schedule: training.linuxfoundation=
.org&lt;http://training.linuxfoundation.org&gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<b=
r>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https=
://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
&gt;<br>
&gt; End of meta-ti Digest, Vol 25, Issue 36<br>
&gt; ***************************************<br>
&gt; Confidentiality Notice:<br>
&gt;<br>
&gt; The preceding e-mail message (including any attachments) contains info=
rmation that may be confidential, protected by applicable legal privileges,=
 or constitute non-public information. It is intended to be conveyed only t=
o the designated recipient(s). If you
 are not an intended recipient of this message, please notify the sender by=
 replying to this message and then delete it from your system. Use, dissemi=
nation, distribution or reproduction of this message by unintended recipien=
ts is<br>
&gt; not authorized and may be unlawful.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
<br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org&lt;mailto:meta-ti@yoctoproject.org&gt;<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
<br>
<br>
<br>
Confidentiality Notice:<br>
<br>
The preceding e-mail message (including any attachments) contains informati=
on that may be confidential, protected by applicable legal privileges, or c=
onstitute non-public information. It is intended to be conveyed only to the=
 designated recipient(s). If you
 are not an intended recipient of this message, please notify the sender by=
 replying to this message and then delete it from your system. Use, dissemi=
nation, distribution or reproduction of this message by unintended recipien=
ts is
<br>
not authorized and may be unlawful.<br>
<br>
<br>
<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E908EEDDLEE08entticom_--
