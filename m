Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E685E01745
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 13:36:18 -0700 (PDT)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id r9MKa5dI028091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 15:36:18 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.106]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Tue, 22 Oct 2013 16:36:14
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: AM335x EVM and core-image-sato 
Thread-Index: AQHOz2ZZYQWus7FbhUyIq98gl7is2A==
Date: Tue, 22 Oct 2013 20:36:13 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.203]
MIME-Version: 1.0
X-MessageScreenMessageID: 1382474178.436527.1642.2394275855
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
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
X-List-Received-Date: Tue, 22 Oct 2013 20:36:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ  no A=
 or B after the AM335x.

________________________________________
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org]=
 on behalf of meta-ti-request@yoctoproject.org [meta-ti-request@yoctoproj=
ect.org]
Sent: Tuesday, October 22, 2013 4:17 PM
To: meta-ti@yoctoproject.org
Subject: meta-ti Digest, Vol 25, Issue 36

Send meta-ti mailing list submissions to
        meta-ti@yoctoproject.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://lists.yoctoproject.org/listinfo/meta-ti
or, via email, send a message with subject or body 'help' to
        meta-ti-request@yoctoproject.org

You can reach the person managing the list at
        meta-ti-owner@yoctoproject.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of meta-ti digest..."


Today's Topics:

   1. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
   2. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
   3. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
      core-image-base (Vanderpool Josh)
   4. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)


----------------------------------------------------------------------

Message: 1
Date: Tue, 22 Oct 2013 15:36:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] AM335x EVM and core-image-sato
Message-ID: <20131022193620.GB9301@edge>
Content-Type: text/plain; charset=3D"us-ascii"

Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1
versions of the silicon and I believe those are the latest ones. Need to
double-check that.

Denys


On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> Where do I find the PG version of the board? The barcode sticker on the=

> board says rev 1.2.
>
>
> On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com> wrot=
e:
>
> > Now I'm just wondering what PG version of the board you've got, if it=

> > fails in
> > the same way with our 3.8 kernel and a known good set of 3.12 images.=
=2E.
> >
> >
> > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > Thanks, Denys.
> > >
> > > Interesting point about gcc. It's version 4.8.1 which is the defaul=
t for
> > > poky master. Which is what I used all along.
> > >
> > > Thanks for sending your binaries. They fail too with the exact same=

> > > problem. See attached log. I found [1] on gmane which exactly descr=
ibes
> > the
> > > problem I am seeing.
> > >
> > > If that is the case then I was wondering why my earlier builds with=

> > > 3.12-rc3 actually worked. And I tried them again and they are now f=
ailing
> > > too. Of course I don't know anything about the specifics of the gpi=
o and
> > > the timers on the chip but it looks like a weird hardware initializ=
ation
> > > condition. And I don't know if the proposed patch in [1] was ever
> > > incorporated in your kernel tree.
> > >
> > > I don't think it's the hardware (or at least not alone) because the=
 SD
> > that
> > > ships with it with the 3.2 kernel works just fine.
> > >
> > > Cheers,
> > > Rudi
> > >
> > >
> > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > >
> > >
> > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.or=
g>
> > wrote:
> > >
> > > > Rudi,
> > > >
> > > > As we discussed earlier today, let my send you my binaries for th=
e
> > kernel
> > > > and
> > > > u-boot to try on your board. I just wanted to ask you about the
> > toolchain
> > > > that
> > > > you used to build yours. In our builds we use Linaro gcc-4.7 hard=
fp
> > > > toolchain
> > > > and I vaguely remember hearing about some problems with the recen=
t
> > gcc-4.8
> > > > toolchain from oe-core... I'm wondering if you are having the sam=
e
> > issue.
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > Since the 3.12-rc5 kernel does not work I decided to give the 3=
=2E8
> > kernel
> > > > a
> > > > > try. The issue with this one is that the linux-ti-staging_3.8.b=
brecipe
> > > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-boo=
t
> > > > environment
> > > > > has now moved on to using zImage which consequently means u-boo=
t
> > will not
> > > > > find the kernel file.
> > > > >
> > > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked into=
 the
> > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think=

> > about
> > > > > u-boot. Does zImage not work with 3.8? I did not try it but it =
should
> > > > > normally have no effect. Since there is no dependency of the u-=
boot
> > > > recipes
> > > > > on the kernel image types changes to the kernel image type for =
newer
> > > > > versions of the kernel then automatically means that it must be=

> > changed
> > > > for
> > > > > the previous versions too.
> > > > >
> > > > > I mocked around with the u-boot environment and booted the 3.8 =
uImage
> > > > > kernel. To my surprise the 3.8 kernel from the TI staging repos=
itory
> > > > fails
> > > > > with the exact same problem and stops booting with a kernel not=

> > syncing
> > > > > message during the init calls. Apparently a patch must have bee=
n
> > applied
> > > > to
> > > > > the kernel repo that breaks it. It has nothing possibly to do w=
ith
> > the
> > > > > build system.
> > > > >
> > > > > I would appreciate any hints to get this kernel built and boot =
on the
> > > > board.
> > > > >
> > > > > Thanks,
> > > > > Rudi
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > <rstreif@linuxfoundation.org>wrote:
> > > > >
> > > > > > Denys,
> > > > > >
> > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls du=
ring
> > > > > > initialization. I attached the boot log. I don't know much ab=
out
> > the
> > > > > > platform details but maybe that's an issue you know about.
> > > > > >
> > > > > > Thanks,
> > > > > > Rudi
> > > > > >
> > > > > >
> > > > > >
> > > > > >>
> > > > > >> [1]
> > > > > >> Build Configuration:
> > > > > >> BB_VERSION        =3D "1.21.0"
> > > > > >> BUILD_SYS         =3D "x86_64-linux"
> > > > > >> NATIVELSBSTRING   =3D "Fedora-18"
> > > > > >> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> > > > > >> MACHINE           =3D "am335x-evm"
> > > > > >> DISTRO            =3D "poky"
> > > > > >> DISTRO_VERSION    =3D "1.5+snapshot-20131019"
> > > > > >> TUNE_FEATURES     =3D "armv7a vfp neon"
> > > > > >> TARGET_FPU        =3D "vfp-neon"
> > > > > >> meta-yocto        =3D
> > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > >> meta-ti           =3D
> > "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > >> meta-oe           =3D
> > "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > >> meta              =3D
> > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > >>
> > > > > >>
> > > > > >
> > > > > >
> > > > > >
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
> > > > > rudolf.streif@linux.com
> > > > > Phone: +1.619.537.6646
> > > > > Skype: rudolfstreif
> > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > >
> > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > > Linux Foundation Training Schedule: training.linuxfoundation.or=
g
> > > >
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
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
> > > rudolf.streif@linux.com
> > > Phone: +1.619.537.6646
> > > Skype: rudolfstreif
> > > PGP: RSA 2048/2048 D6E7D28B
> > >
> > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > Linux Foundation Training Schedule: training.linuxfoundation.org
> >
> >
> >
>
>
> --
> --
> *Rudolf J. Streif*
> Director of Embedded Solutions
> The Linux Foundation
>
> rudolf.streif@linux.com
> Phone: +1.619.537.6646
> Skype: rudolfstreif
> PGP: RSA 2048/2048 D6E7D28B
>
> Linux Foundation Events Schedule:  events.linuxfoundation.org
> Linux Foundation Training Schedule: training.linuxfoundation.org


------------------------------

Message: 2
Date: Tue, 22 Oct 2013 15:37:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] AM335x EVM and core-image-sato
Message-ID: <20131022193732.GC9301@edge>
Content-Type: text/plain; charset=3D"us-ascii"

And just to double-check here as well - you did try all the binaries I se=
nt
you, including MLO, u-boot, zImage and DTB, right?

Denys


On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> Thanks, Denys.
>
> Interesting point about gcc. It's version 4.8.1 which is the default fo=
r
> poky master. Which is what I used all along.
>
> Thanks for sending your binaries. They fail too with the exact same
> problem. See attached log. I found [1] on gmane which exactly describes=
 the
> problem I am seeing.
>
> If that is the case then I was wondering why my earlier builds with
> 3.12-rc3 actually worked. And I tried them again and they are now faili=
ng
> too. Of course I don't know anything about the specifics of the gpio an=
d
> the timers on the chip but it looks like a weird hardware initializatio=
n
> condition. And I don't know if the proposed patch in [1] was ever
> incorporated in your kernel tree.
>
> I don't think it's the hardware (or at least not alone) because the SD =
that
> ships with it with the 3.2 kernel works just fine.
>
> Cheers,
> Rudi
>
>
> [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
>
>
> On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org> w=
rote:
>
> > Rudi,
> >
> > As we discussed earlier today, let my send you my binaries for the ke=
rnel
> > and
> > u-boot to try on your board. I just wanted to ask you about the toolc=
hain
> > that
> > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > toolchain
> > and I vaguely remember hearing about some problems with the recent gc=
c-4.8
> > toolchain from oe-core... I'm wondering if you are having the same is=
sue.
> >
> > --
> > Denys
> >
> >
> > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8 k=
ernel
> > a
> > > try. The issue with this one is that the linux-ti-staging_3.8.bb re=
cipe
> > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-boot
> > environment
> > > has now moved on to using zImage which consequently means u-boot wi=
ll not
> > > find the kernel file.
> > >
> > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked into the=

> > > linux-ti-staging_3.8.bb recipe but whoever did it did not think abo=
ut
> > > u-boot. Does zImage not work with 3.8? I did not try it but it shou=
ld
> > > normally have no effect. Since there is no dependency of the u-boot=

> > recipes
> > > on the kernel image types changes to the kernel image type for newe=
r
> > > versions of the kernel then automatically means that it must be cha=
nged
> > for
> > > the previous versions too.
> > >
> > > I mocked around with the u-boot environment and booted the 3.8 uIma=
ge
> > > kernel. To my surprise the 3.8 kernel from the TI staging repositor=
y
> > fails
> > > with the exact same problem and stops booting with a kernel not syn=
cing
> > > message during the init calls. Apparently a patch must have been ap=
plied
> > to
> > > the kernel repo that breaks it. It has nothing possibly to do with =
the
> > > build system.
> > >
> > > I would appreciate any hints to get this kernel built and boot on t=
he
> > board.
> > >
> > > Thanks,
> > > Rudi
> > >
> > >
> > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > <rstreif@linuxfoundation.org>wrote:
> > >
> > > > Denys,
> > > >
> > > > I recompiled the 3.12-rc5 kernel again but it still stalls during=

> > > > initialization. I attached the boot log. I don't know much about =
the
> > > > platform details but maybe that's an issue you know about.
> > > >
> > > > Thanks,
> > > > Rudi
> > > >
> > > >
> > > >
> > > >>
> > > >> [1]
> > > >> Build Configuration:
> > > >> BB_VERSION        =3D "1.21.0"
> > > >> BUILD_SYS         =3D "x86_64-linux"
> > > >> NATIVELSBSTRING   =3D "Fedora-18"
> > > >> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> > > >> MACHINE           =3D "am335x-evm"
> > > >> DISTRO            =3D "poky"
> > > >> DISTRO_VERSION    =3D "1.5+snapshot-20131019"
> > > >> TUNE_FEATURES     =3D "armv7a vfp neon"
> > > >> TARGET_FPU        =3D "vfp-neon"
> > > >> meta-yocto        =3D "master:9a1dce10bdc9254bb38e0e54199f23ae55=
e209a4"
> > > >> meta-ti           =3D "master:c11504664990f007c3903d349e7cc135a9=
04f8e2"
> > > >> meta-oe           =3D "master:f8903f53db717294d63a8d79b5ef7ca34b=
3c189e"
> > > >> meta              =3D "master:9a1dce10bdc9254bb38e0e54199f23ae55=
e209a4"
> > > >>
> > > >>
> > > >
> > > >
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
> > > rudolf.streif@linux.com
> > > Phone: +1.619.537.6646
> > > Skype: rudolfstreif
> > > PGP: RSA 2048/2048 D6E7D28B
> > >
> > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > Linux Foundation Training Schedule: training.linuxfoundation.org
> >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
>
>
> --
> --
> *Rudolf J. Streif*
> Director of Embedded Solutions
> The Linux Foundation
>
> rudolf.streif@linux.com
> Phone: +1.619.537.6646
> Skype: rudolfstreif
> PGP: RSA 2048/2048 D6E7D28B
>
> Linux Foundation Events Schedule:  events.linuxfoundation.org
> Linux Foundation Training Schedule: training.linuxfoundation.org




------------------------------

Message: 3
Date: Tue, 22 Oct 2013 19:52:13 +0000
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
        meta-ti(master) core-image-base
Message-ID:
        <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.=
local>

Content-Type: text/plain; charset=3D"us-ascii"

Thanks for the links Rudi, I looked for the file referenced in [2] "arch/=
arm/mach-omap2/cclock33xx_data.c" to see if the patch works but...

There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-poky=
-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a394c=
/git/arch/arm/mach-omap2/cclock3xxx_data.c.

however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/linu=
x-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c

So it appears there is mis-match as the patch is in the 3.10 files that r=
e in the armv7a-vfp-neon-poky-linux-gnueabi directory?

So is this something that is just lost from the 3.12-rc5 kernel and shoul=
dn't the linux-linc-headers be the version being built?

Unfortunately being inexperienced with the project I am at a loss at how =
to fix this but hope this help point someone to the solution.

Regards,
Josh

________________________________________
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org]=
 on behalf of meta-ti-request@yoctoproject.org [meta-ti-request@yoctoproj=
ect.org]
Sent: Tuesday, October 22, 2013 3:00 PM
To: meta-ti@yoctoproject.org
Subject: meta-ti Digest, Vol 25, Issue 35

Send meta-ti mailing list submissions to
        meta-ti@yoctoproject.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://lists.yoctoproject.org/listinfo/meta-ti
or, via email, send a message with subject or body 'help' to
        meta-ti-request@yoctoproject.org

You can reach the person managing the list at
        meta-ti-owner@yoctoproject.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of meta-ti digest..."


Today's Topics:

   1. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
      core-image-base (Rudolf Streif)


----------------------------------------------------------------------

Message: 1
Date: Tue, 22 Oct 2013 18:18:29 +0100
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
        meta-ti(master) core-image-base
Message-ID:
        <CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.c=
om>
Content-Type: text/plain; charset=3D"iso-8859-1"

Hi Josh,

I am seeing the exact same problem with my am335x-evmsk and the latest
meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].

This problem looks like the one posted here [2].

The bad news is I don't have a solution for it. The good news is that Den=
ys
and I are attending the same conference and I keep harassing him about it=
=2E
:)

Cheers,
Rudi


[1]
https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html=

[2] http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044


On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh <
Joshua.Vanderpool@raymondcorp.com> wrote:

> I am having a similar issue as Rudi.
> Attached is the bootLog.
>
>
> Build Configuration:
> BB_VERSION        =3D "1.21.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-12.04"
> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> MACHINE           =3D "am335x-evm"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.5+snapshot-20131022"
> TUNE_FEATURES     =3D "armv7a vfp neon"
> TARGET_FPU        =3D "vfp-neon"
> meta
> meta-yocto        =3D "master:505114c13d29799a25379f7ce720d632616d8776"=

> meta-ti           =3D "master:c11504664990f007c3903d349e7cc135a904f8e2"=

> meta-qt5          =3D "master:84cd4be2491895b0c3a0af64e4c83d58910d1f6c"=

>
> Josh Vanderpool
> Electrical Engineer
> Control Systems
> The Raymond Corporation
> 20 South Canal Street
> Greene, New York 13778-0130
> Phone: 607-656-2617
> Fax: 607-656-4845
> joshua.vanderpool@raymondcorp.com
> http://www.raymondcorp.com
>
>
> Confidentiality Notice:
>
> The preceding e-mail message (including any attachments) contains
> information that may be confidential, protected by applicable legal
> privileges, or constitute non-public information. It is intended to be
> conveyed only to the designated recipient(s). If you are not an intende=
d
> recipient of this message, please notify the sender by replying to this=

> message and then delete it from your system. Use, dissemination,
> distribution or reproduction of this message by unintended recipients i=
s
> not authorized and may be unlawful.
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/2013102=
2/34dc4b0c/attachment-0001.html>

------------------------------

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


End of meta-ti Digest, Vol 25, Issue 35
***************************************
Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is
not authorized and may be unlawful.





------------------------------

Message: 4
Date: Tue, 22 Oct 2013 16:16:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>,
        meta-ti@yoctoproject.org
Subject: Re: [meta-ti] AM335x EVM and core-image-sato
Message-ID: <20131022201652.GB404@denix.org>
Content-Type: text/plain; charset=3Dus-ascii

Hey, Rudi,

Just one more quick check about your board - are you sure yours is an EVM=
? Or
is it an SK-EVM i.e. a "Starter Kit"? Basically, what color is the PCB of=
 your
board - is it green (EVM) or purple (SK)?

For example, here's the EVM:
https://plus.google.com/u/0/110579591067038943673/posts/SLB35o1JgBu

--
Denys



On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:
> Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1
> versions of the silicon and I believe those are the latest ones. Need t=
o
> double-check that.
>
> Denys
>
>
> On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > Where do I find the PG version of the board? The barcode sticker on t=
he
> > board says rev 1.2.
> >
> >
> > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com> wr=
ote:
> >
> > > Now I'm just wondering what PG version of the board you've got, if =
it
> > > fails in
> > > the same way with our 3.8 kernel and a known good set of 3.12 image=
s...
> > >
> > >
> > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > Thanks, Denys.
> > > >
> > > > Interesting point about gcc. It's version 4.8.1 which is the defa=
ult for
> > > > poky master. Which is what I used all along.
> > > >
> > > > Thanks for sending your binaries. They fail too with the exact sa=
me
> > > > problem. See attached log. I found [1] on gmane which exactly des=
cribes
> > > the
> > > > problem I am seeing.
> > > >
> > > > If that is the case then I was wondering why my earlier builds wi=
th
> > > > 3.12-rc3 actually worked. And I tried them again and they are now=
 failing
> > > > too. Of course I don't know anything about the specifics of the g=
pio and
> > > > the timers on the chip but it looks like a weird hardware initial=
ization
> > > > condition. And I don't know if the proposed patch in [1] was ever=

> > > > incorporated in your kernel tree.
> > > >
> > > > I don't think it's the hardware (or at least not alone) because t=
he SD
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
> > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.=
org>
> > > wrote:
> > > >
> > > > > Rudi,
> > > > >
> > > > > As we discussed earlier today, let my send you my binaries for =
the
> > > kernel
> > > > > and
> > > > > u-boot to try on your board. I just wanted to ask you about the=

> > > toolchain
> > > > > that
> > > > > you used to build yours. In our builds we use Linaro gcc-4.7 ha=
rdfp
> > > > > toolchain
> > > > > and I vaguely remember hearing about some problems with the rec=
ent
> > > gcc-4.8
> > > > > toolchain from oe-core... I'm wondering if you are having the s=
ame
> > > issue.
> > > > >
> > > > > --
> > > > > Denys
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > Since the 3.12-rc5 kernel does not work I decided to give the=
 3.8
> > > kernel
> > > > > a
> > > > > > try. The issue with this one is that the linux-ti-staging_3.8=
=2Ebbrecipe
> > > > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-b=
oot
> > > > > environment
> > > > > > has now moved on to using zImage which consequently means u-b=
oot
> > > will not
> > > > > > find the kernel file.
> > > > > >
> > > > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked in=
to the
> > > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not thi=
nk
> > > about
> > > > > > u-boot. Does zImage not work with 3.8? I did not try it but i=
t should
> > > > > > normally have no effect. Since there is no dependency of the =
u-boot
> > > > > recipes
> > > > > > on the kernel image types changes to the kernel image type fo=
r newer
> > > > > > versions of the kernel then automatically means that it must =
be
> > > changed
> > > > > for
> > > > > > the previous versions too.
> > > > > >
> > > > > > I mocked around with the u-boot environment and booted the 3.=
8 uImage
> > > > > > kernel. To my surprise the 3.8 kernel from the TI staging rep=
ository
> > > > > fails
> > > > > > with the exact same problem and stops booting with a kernel n=
ot
> > > syncing
> > > > > > message during the init calls. Apparently a patch must have b=
een
> > > applied
> > > > > to
> > > > > > the kernel repo that breaks it. It has nothing possibly to do=
 with
> > > the
> > > > > > build system.
> > > > > >
> > > > > > I would appreciate any hints to get this kernel built and boo=
t on the
> > > > > board.
> > > > > >
> > > > > > Thanks,
> > > > > > Rudi
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > <rstreif@linuxfoundation.org>wrote:
> > > > > >
> > > > > > > Denys,
> > > > > > >
> > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls =
during
> > > > > > > initialization. I attached the boot log. I don't know much =
about
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
> > > > > > rudolf.streif@linux.com
> > > > > > Phone: +1.619.537.6646
> > > > > > Skype: rudolfstreif
> > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > >
> > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org=

> > > > > > Linux Foundation Training Schedule: training.linuxfoundation.=
org
> > > > >
> > > > > > _______________________________________________
> > > > > > meta-ti mailing list
> > > > > > meta-ti@yoctoproject.org
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
> > > > rudolf.streif@linux.com
> > > > Phone: +1.619.537.6646
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org
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
> > rudolf.streif@linux.com
> > Phone: +1.619.537.6646
> > Skype: rudolfstreif
> > PGP: RSA 2048/2048 D6E7D28B
> >
> > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > Linux Foundation Training Schedule: training.linuxfoundation.org
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>


------------------------------

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


End of meta-ti Digest, Vol 25, Issue 36
***************************************
Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.




