Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8780AE016B6
	for <meta-ti@yoctoproject.org>; Wed, 23 Oct 2013 04:25:25 -0700 (PDT)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id r9NBPOG2002130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Oct 2013 06:25:24 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.106]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Wed, 23 Oct 2013 07:25:23
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] AM335x EVMSK and core-image-base
Thread-Index: AQHOz+HIJvcJXNO8TUGIBhLsvl+uXw==
Date: Wed, 23 Oct 2013 11:25:22 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF7BB@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.203]
MIME-Version: 1.0
X-MessageScreenMessageID: 1382527525.709457.1642.3371483144
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: AM335x EVMSK and core-image-base
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
X-List-Received-Date: Wed, 23 Oct 2013 11:25:29 -0000
X-Groupsio-MsgNum: 3578
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FF7BBUSNYGRMBX4raymo_"

--_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FF7BBUSNYGRMBX4raymo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

I tried the DTB attached and it has the same result or simlar result.
Attached is the bootlog.


I do see this in the Log=20
One thing to note is when i attempt a reboot using the reset button the S=
D card is locked up and must be taken out and put back in, that explains =
the "CCCCC" at reboot as the Processor attempts to boot from serial port.=


[    0.280000] platform mpu.1: FIXME: clock-name 'fck' DOES NOT exist in =
dt!
[    0.283463] platform 49000000.edma: FIXME: clock-name 'fck' DOES NOT e=
xist in dt!
[    0.288892] OMAP GPIO hardware version 0.1
[    0.303272] platform 48060000.mmc: FIXME: clock-name 'fck' DOES NOT ex=
ist in dt!
[    0.319116] platform 4803c000.mcasp: FIXME: clock-name 'fck' DOES NOT =
exist in dt!


-Josh
________________________________________
From: Denys Dmytriyenko [denys@ti.com]
Sent: Tuesday, October 22, 2013 6:28 PM
To: Vanderpool Josh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] AM335x EVM and core-image-sato

Josh,

Yes, in your case it was clear from the beginning you had a problem with =
SK
and it is kind of known... In Rudi's case he was saying he had an actual =
EVM,
which is known to boot fine at the moment, hence I was confirming with hi=
m.

For your case, please try the DTB file attached. Thanks.

--
Denys


On Tue, Oct 22, 2013 at 08:36:13PM +0000, Vanderpool Josh wrote:
> It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ no =
A or
> B after the AM335x.
>
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.or=
g] on behalf of meta-ti-request@yoctoproject.org [meta-ti-request@yoctopr=
oject.org]
> Sent: Tuesday, October 22, 2013 4:17 PM
> To: meta-ti@yoctoproject.org
> Subject: meta-ti Digest, Vol 25, Issue 36
>
> Send meta-ti mailing list submissions to
>         meta-ti@yoctoproject.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
>         meta-ti-request@yoctoproject.org
>
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org
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
> From: Denys Dmytriyenko <denys@ti.com>
> To: Rudolf Streif <rstreif@linuxfoundation.org>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022193620.GB9301@edge>
> Content-Type: text/plain; charset=3D"us-ascii"
>
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
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 22 Oct 2013 15:37:32 -0400
> From: Denys Dmytriyenko <denys@ti.com>
> To: Rudolf Streif <rstreif@linuxfoundation.org>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022193732.GC9301@edge>
> Content-Type: text/plain; charset=3D"us-ascii"
>
> And just to double-check here as well - you did try all the binaries I =
sent
> you, including MLO, u-boot, zImage and DTB, right?
>
> Denys
>
>
> On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > Thanks, Denys.
> >
> > Interesting point about gcc. It's version 4.8.1 which is the default =
for
> > poky master. Which is what I used all along.
> >
> > Thanks for sending your binaries. They fail too with the exact same
> > problem. See attached log. I found [1] on gmane which exactly describ=
es the
> > problem I am seeing.
> >
> > If that is the case then I was wondering why my earlier builds with
> > 3.12-rc3 actually worked. And I tried them again and they are now fai=
ling
> > too. Of course I don't know anything about the specifics of the gpio =
and
> > the timers on the chip but it looks like a weird hardware initializat=
ion
> > condition. And I don't know if the proposed patch in [1] was ever
> > incorporated in your kernel tree.
> >
> > I don't think it's the hardware (or at least not alone) because the S=
D that
> > ships with it with the 3.2 kernel works just fine.
> >
> > Cheers,
> > Rudi
> >
> >
> > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> >
> >
> > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org>=
 wrote:
> >
> > > Rudi,
> > >
> > > As we discussed earlier today, let my send you my binaries for the =
kernel
> > > and
> > > u-boot to try on your board. I just wanted to ask you about the too=
lchain
> > > that
> > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp=

> > > toolchain
> > > and I vaguely remember hearing about some problems with the recent =
gcc-4.8
> > > toolchain from oe-core... I'm wondering if you are having the same =
issue.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8=
 kernel
> > > a
> > > > try. The issue with this one is that the linux-ti-staging_3.8.bb =
recipe
> > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-boot
> > > environment
> > > > has now moved on to using zImage which consequently means u-boot =
will not
> > > > find the kernel file.
> > > >
> > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked into t=
he
> > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think a=
bout
> > > > u-boot. Does zImage not work with 3.8? I did not try it but it sh=
ould
> > > > normally have no effect. Since there is no dependency of the u-bo=
ot
> > > recipes
> > > > on the kernel image types changes to the kernel image type for ne=
wer
> > > > versions of the kernel then automatically means that it must be c=
hanged
> > > for
> > > > the previous versions too.
> > > >
> > > > I mocked around with the u-boot environment and booted the 3.8 uI=
mage
> > > > kernel. To my surprise the 3.8 kernel from the TI staging reposit=
ory
> > > fails
> > > > with the exact same problem and stops booting with a kernel not s=
yncing
> > > > message during the init calls. Apparently a patch must have been =
applied
> > > to
> > > > the kernel repo that breaks it. It has nothing possibly to do wit=
h the
> > > > build system.
> > > >
> > > > I would appreciate any hints to get this kernel built and boot on=
 the
> > > board.
> > > >
> > > > Thanks,
> > > > Rudi
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > <rstreif@linuxfoundation.org>wrote:
> > > >
> > > > > Denys,
> > > > >
> > > > > I recompiled the 3.12-rc5 kernel again but it still stalls duri=
ng
> > > > > initialization. I attached the boot log. I don't know much abou=
t the
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
> > > > >> meta-yocto        =3D "master:9a1dce10bdc9254bb38e0e54199f23ae=
55e209a4"
> > > > >> meta-ti           =3D "master:c11504664990f007c3903d349e7cc135=
a904f8e2"
> > > > >> meta-oe           =3D "master:f8903f53db717294d63a8d79b5ef7ca3=
4b3c189e"
> > > > >> meta              =3D "master:9a1dce10bdc9254bb38e0e54199f23ae=
55e209a4"
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
> > > > rudolf.streif@linux.com
> > > > Phone: +1.619.537.6646
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > >
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
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
> > rudolf.streif@linux.com
> > Phone: +1.619.537.6646
> > Skype: rudolfstreif
> > PGP: RSA 2048/2048 D6E7D28B
> >
> > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > Linux Foundation Training Schedule: training.linuxfoundation.org
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 22 Oct 2013 19:52:13 +0000
> From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcor=
p.local>
>
> Content-Type: text/plain; charset=3D"us-ascii"
>
> Thanks for the links Rudi, I looked for the file referenced in [2] "arc=
h/arm/mach-omap2/cclock33xx_data.c" to see if the patch works but...
>
> There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-po=
ky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a39=
4c/git/arch/arm/mach-omap2/cclock3xxx_data.c.
>
> however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/li=
nux-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c=

>
> So it appears there is mis-match as the patch is in the 3.10 files that=
 re in the armv7a-vfp-neon-poky-linux-gnueabi directory?
>
> So is this something that is just lost from the 3.12-rc5 kernel and sho=
uldn't the linux-linc-headers be the version being built?
>
> Unfortunately being inexperienced with the project I am at a loss at ho=
w to fix this but hope this help point someone to the solution.
>
> Regards,
> Josh
>
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.or=
g] on behalf of meta-ti-request@yoctoproject.org [meta-ti-request@yoctopr=
oject.org]
> Sent: Tuesday, October 22, 2013 3:00 PM
> To: meta-ti@yoctoproject.org
> Subject: meta-ti Digest, Vol 25, Issue 35
>
> Send meta-ti mailing list submissions to
>         meta-ti@yoctoproject.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
>         meta-ti-request@yoctoproject.org
>
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org
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
> From: Rudolf Streif <rstreif@linuxfoundation.org>
> To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
> Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail=
=2Ecom>
> Content-Type: text/plain; charset=3D"iso-8859-1"
>
> Hi Josh,
>
> I am seeing the exact same problem with my am335x-evmsk and the latest
> meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].
>
> This problem looks like the one posted here [2].
>
> The bad news is I don't have a solution for it. The good news is that D=
enys
> and I are attending the same conference and I keep harassing him about =
it.
> :)
>
> Cheers,
> Rudi
>
>
> [1]
> https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.ht=
ml
> [2] http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
>
>
> On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh <
> Joshua.Vanderpool@raymondcorp.com> wrote:
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
> > meta-yocto        =3D "master:505114c13d29799a25379f7ce720d632616d877=
6"
> > meta-ti           =3D "master:c11504664990f007c3903d349e7cc135a904f8e=
2"
> > meta-qt5          =3D "master:84cd4be2491895b0c3a0af64e4c83d58910d1f6=
c"
> >
> > Josh Vanderpool
> > Electrical Engineer
> > Control Systems
> > The Raymond Corporation
> > 20 South Canal Street
> > Greene, New York 13778-0130
> > Phone: 607-656-2617
> > Fax: 607-656-4845
> > joshua.vanderpool@raymondcorp.com
> > http://www.raymondcorp.com
> >
> >
> > Confidentiality Notice:
> >
> > The preceding e-mail message (including any attachments) contains
> > information that may be confidential, protected by applicable legal
> > privileges, or constitute non-public information. It is intended to b=
e
> > conveyed only to the designated recipient(s). If you are not an inten=
ded
> > recipient of this message, please notify the sender by replying to th=
is
> > message and then delete it from your system. Use, dissemination,
> > distribution or reproduction of this message by unintended recipients=
 is
> > not authorized and may be unlawful.
> >
> >
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20131=
022/34dc4b0c/attachment-0001.html>
>
> ------------------------------
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> End of meta-ti Digest, Vol 25, Issue 35
> ***************************************
> Confidentiality Notice:
>
> The preceding e-mail message (including any attachments) contains infor=
mation that may be confidential, protected by applicable legal privileges=
, or constitute non-public information. It is intended to be conveyed onl=
y to the designated recipient(s). If you are not an intended recipient of=
 this message, please notify the sender by replying to this message and t=
hen delete it from your system. Use, dissemination, distribution or repro=
duction of this message by unintended recipients is
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
> From: Denys Dmytriyenko <denys@ti.com>
> To: Rudolf Streif <rstreif@linuxfoundation.org>,
>         meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022201652.GB404@denix.org>
> Content-Type: text/plain; charset=3Dus-ascii
>
> Hey, Rudi,
>
> Just one more quick check about your board - are you sure yours is an E=
VM? Or
> is it an SK-EVM i.e. a "Starter Kit"? Basically, what color is the PCB =
of your
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
> > Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.=
1
> > versions of the silicon and I believe those are the latest ones. Need=
 to
> > double-check that.
> >
> > Denys
> >
> >
> > On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > > Where do I find the PG version of the board? The barcode sticker on=
 the
> > > board says rev 1.2.
> > >
> > >
> > > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com> =
wrote:
> > >
> > > > Now I'm just wondering what PG version of the board you've got, i=
f it
> > > > fails in
> > > > the same way with our 3.8 kernel and a known good set of 3.12 ima=
ges...
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > > Thanks, Denys.
> > > > >
> > > > > Interesting point about gcc. It's version 4.8.1 which is the de=
fault for
> > > > > poky master. Which is what I used all along.
> > > > >
> > > > > Thanks for sending your binaries. They fail too with the exact =
same
> > > > > problem. See attached log. I found [1] on gmane which exactly d=
escribes
> > > > the
> > > > > problem I am seeing.
> > > > >
> > > > > If that is the case then I was wondering why my earlier builds =
with
> > > > > 3.12-rc3 actually worked. And I tried them again and they are n=
ow failing
> > > > > too. Of course I don't know anything about the specifics of the=
 gpio and
> > > > > the timers on the chip but it looks like a weird hardware initi=
alization
> > > > > condition. And I don't know if the proposed patch in [1] was ev=
er
> > > > > incorporated in your kernel tree.
> > > > >
> > > > > I don't think it's the hardware (or at least not alone) because=
 the SD
> > > > that
> > > > > ships with it with the 3.2 kernel works just fine.
> > > > >
> > > > > Cheers,
> > > > > Rudi
> > > > >
> > > > >
> > > > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/9604=
4
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@deni=
x.org>
> > > > wrote:
> > > > >
> > > > > > Rudi,
> > > > > >
> > > > > > As we discussed earlier today, let my send you my binaries fo=
r the
> > > > kernel
> > > > > > and
> > > > > > u-boot to try on your board. I just wanted to ask you about t=
he
> > > > toolchain
> > > > > > that
> > > > > > you used to build yours. In our builds we use Linaro gcc-4.7 =
hardfp
> > > > > > toolchain
> > > > > > and I vaguely remember hearing about some problems with the r=
ecent
> > > > gcc-4.8
> > > > > > toolchain from oe-core... I'm wondering if you are having the=
 same
> > > > issue.
> > > > > >
> > > > > > --
> > > > > > Denys
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote=
:
> > > > > > > Since the 3.12-rc5 kernel does not work I decided to give t=
he 3.8
> > > > kernel
> > > > > > a
> > > > > > > try. The issue with this one is that the linux-ti-staging_3=
=2E8.bbrecipe
> > > > > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u=
-boot
> > > > > > environment
> > > > > > > has now moved on to using zImage which consequently means u=
-boot
> > > > will not
> > > > > > > find the kernel file.
> > > > > > >
> > > > > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked =
into the
> > > > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not t=
hink
> > > > about
> > > > > > > u-boot. Does zImage not work with 3.8? I did not try it but=
 it should
> > > > > > > normally have no effect. Since there is no dependency of th=
e u-boot
> > > > > > recipes
> > > > > > > on the kernel image types changes to the kernel image type =
for newer
> > > > > > > versions of the kernel then automatically means that it mus=
t be
> > > > changed
> > > > > > for
> > > > > > > the previous versions too.
> > > > > > >
> > > > > > > I mocked around with the u-boot environment and booted the =
3.8 uImage
> > > > > > > kernel. To my surprise the 3.8 kernel from the TI staging r=
epository
> > > > > > fails
> > > > > > > with the exact same problem and stops booting with a kernel=
 not
> > > > syncing
> > > > > > > message during the init calls. Apparently a patch must have=
 been
> > > > applied
> > > > > > to
> > > > > > > the kernel repo that breaks it. It has nothing possibly to =
do with
> > > > the
> > > > > > > build system.
> > > > > > >
> > > > > > > I would appreciate any hints to get this kernel built and b=
oot on the
> > > > > > board.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Rudi
> > > > > > >
> > > > > > >
> > > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > > <rstreif@linuxfoundation.org>wrote:
> > > > > > >
> > > > > > > > Denys,
> > > > > > > >
> > > > > > > > I recompiled the 3.12-rc5 kernel again but it still stall=
s during
> > > > > > > > initialization. I attached the boot log. I don't know muc=
h about
> > > > the
> > > > > > > > platform details but maybe that's an issue you know about=
=2E
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
> > > > > > > rudolf.streif@linux.com
> > > > > > > Phone: +1.619.537.6646
> > > > > > > Skype: rudolfstreif
> > > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > > >
> > > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.o=
rg
> > > > > > > Linux Foundation Training Schedule: training.linuxfoundatio=
n.org
> > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-ti mailing list
> > > > > > > meta-ti@yoctoproject.org
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
> > > > > rudolf.streif@linux.com
> > > > > Phone: +1.619.537.6646
> > > > > Skype: rudolfstreif
> > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > >
> > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > > Linux Foundation Training Schedule: training.linuxfoundation.or=
g
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
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
>
>
> ------------------------------
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> End of meta-ti Digest, Vol 25, Issue 36
> ***************************************
> Confidentiality Notice:
>
> The preceding e-mail message (including any attachments) contains infor=
mation that may be confidential, protected by applicable legal privileges=
, or constitute non-public information. It is intended to be conveyed onl=
y to the designated recipient(s). If you are not an intended recipient of=
 this message, please notify the sender by replying to this message and t=
hen delete it from your system. Use, dissemination, distribution or repro=
duction of this message by unintended recipients is
> not authorized and may be unlawful.
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FF7BBUSNYGRMBX4raymo_
Content-Type: application/octet-stream; name="bootLog"
Content-Description: bootLog
Content-Disposition: attachment; filename="bootLog"; size=16956;
	creation-date="Wed, 23 Oct 2013 11:19:53 GMT";
	modification-date="Wed, 23 Oct 2013 11:19:53 GMT"
Content-Transfer-Encoding: base64

Q0NDQ0NDQ0NDQ0NDQ0NDQw0KVS1Cb290IFNQTCAyMDEzLjEwIChPY3QgMTggMjAxMyAtIDEzOjM4
OjM0KQ0KcmVhZGluZyBhcmdzDQpzcGw6IGVycm9yIHJlYWRpbmcgaW1hZ2UgYXJncywgZXJyIC0g
LTENCnJlYWRpbmcgdS1ib290LmltZw0KcmVhZGluZyB1LWJvb3QuaW1nDQoNCg0KVS1Cb290IDIw
MTMuMTAgKE9jdCAxOCAyMDEzIC0gMTM6Mzg6MzQpDQoNCkkyQzogICByZWFkeQ0KRFJBTTogIDI1
NiBNaUINCldBUk5JTkc6IENhY2hlcyBub3QgZW5hYmxlZA0KTkFORDogIDAgTWlCDQpNTUM6ICAg
T01BUCBTRC9NTUM6IDAsIE9NQVAgU0QvTU1DOiAxDQoqKiogV2FybmluZyAtIHJlYWRlbnYoKSBm
YWlsZWQsIHVzaW5nIGRlZmF1bHQgZW52aXJvbm1lbnQNCg0KTmV0OiAgIDxldGhhZGRyPiBub3Qg
c2V0LiBWYWxpZGF0aW5nIGZpcnN0IEUtZnVzZSBNQUMNCmNwc3csIHVzYl9ldGhlcg0KSGl0IGFu
eSBrZXkgdG8gc3RvcCBhdXRvYm9vdDogIDEgCAgIIDAgDQptbWMwIGlzIGN1cnJlbnQgZGV2aWNl
DQpTRC9NTUMgZm91bmQgb24gZGV2aWNlIDANCnJlYWRpbmcgdUVudi50eHQNCioqIFVuYWJsZSB0
byByZWFkIGZpbGUgdUVudi50eHQgKioNCjQ1MjQzNTIgYnl0ZXMgcmVhZCBpbiA1MTIgbXMgKDgu
NCBNaUIvcykNCjM1MjI1IGJ5dGVzIHJlYWQgaW4gNTMgbXMgKDY0OC40IEtpQi9zKQ0KS2VybmVs
IGltYWdlIEAgMHg4MDIwMDAwMCBbIDB4MDAwMDAwIC0gMHg0NTA5NDAgXQ0KIyMgRmxhdHRlbmVk
IERldmljZSBUcmVlIGJsb2IgYXQgODBmODAwMDANCiAgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBi
bG9iIGF0IDB4ODBmODAwMDANCiAgIFVzaW5nIERldmljZSBUcmVlIGluIHBsYWNlIGF0IDgwZjgw
MDAwLCBlbmQgODBmOGI5OTgNCg0KU3RhcnRpbmcga2VybmVsIC4uLg0KDQpbICAgIDAuMDAwMDAw
XSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAweDANClsgICAgMC4wMDAwMDBdIExpbnV4
IHZlcnNpb24gMy4xMi4wLXJjNSAoam9zaHVhQHVidW50dSkgKGdjYyB2ZXJzaW9uIDQuOC4xIChH
Q0MpICkgIzEgU01QIEZyaSBPY3QgMTggMTM6MDQ6MjkgUERUIDIwMTMNClsgICAgMC4wMDAwMDBd
IENQVTogQVJNdjcgUHJvY2Vzc29yIFs0MTNmYzA4Ml0gcmV2aXNpb24gMiAoQVJNdjcpLCBjcj0x
MGM1M2M3ZA0KWyAgICAwLjAwMDAwMF0gQ1BVOiBQSVBUIC8gVklQVCBub25hbGlhc2luZyBkYXRh
IGNhY2hlLCBWSVBUIGFsaWFzaW5nIGluc3RydWN0aW9uIGNhY2hlDQpbICAgIDAuMDAwMDAwXSBN
YWNoaW5lOiBHZW5lcmljIEFNMzNYWCAoRmxhdHRlbmVkIERldmljZSBUcmVlKSwgbW9kZWw6IFRJ
IEFNMzM1eCBFVk0tU0sNClsgICAgMC4wMDAwMDBdIGNtYTogQ01BOiByZXNlcnZlZCAxNiBNaUIg
YXQgOGU4MDAwMDANClsgICAgMC4wMDAwMDBdIE1lbW9yeSBwb2xpY3k6IEVDQyBkaXNhYmxlZCwg
RGF0YSBjYWNoZSB3cml0ZWJhY2sNClsgICAgMC4wMDAwMDBdIENQVTogQWxsIENQVShzKSBzdGFy
dGVkIGluIFNWQyBtb2RlLg0KWyAgICAwLjAwMDAwMF0gQU0zMzVYIEVTMS4wIChzZ3ggbmVvbiAp
DQpbICAgIDAuMDAwMDAwXSBQRVJDUFU6IEVtYmVkZGVkIDkgcGFnZXMvY3B1IEBjMTE5ZDAwMCBz
MTQ2NTYgcjgxOTIgZDE0MDE2IHUzNjg2NA0KWyAgICAwLjAwMDAwMF0gQnVpbHQgMSB6b25lbGlz
dHMgaW4gWm9uZSBvcmRlciwgbW9iaWxpdHkgZ3JvdXBpbmcgb24uICBUb3RhbCBwYWdlczogNjQ1
MTINClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6IGNvbnNvbGU9dHR5TzAsMTE1
MjAwbjggcm9vdD0vZGV2L21tY2JsazBwMiBybyByb290ZnN0eXBlPWV4dDQgcm9vdHdhaXQNClsg
ICAgMC4wMDAwMDBdIFBJRCBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2
IGJ5dGVzKQ0KWyAgICAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50cmllczog
MzI3NjggKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMpDQpbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNo
ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDE2Mzg0IChvcmRlcjogNCwgNjU1MzYgYnl0ZXMpDQpbICAg
IDAuMDAwMDAwXSBNZW1vcnk6IDIyNjQ2MEsvMjYwMDk2SyBhdmFpbGFibGUgKDU4NzdLIGtlcm5l
bCBjb2RlLCA2NzlLIHJ3ZGF0YSwgMjI2NEsgcm9kYXRhLCA0MThLIGluaXQsIDU1MjhLIGJzcywg
MzM2MzZLIHJlc2VydmVkLCAwSyBoaWdobWVtKQ0KWyAgICAwLjAwMDAwMF0gVmlydHVhbCBrZXJu
ZWwgbWVtb3J5IGxheW91dDoNClsgICAgMC4wMDAwMDBdICAgICB2ZWN0b3IgIDogMHhmZmZmMDAw
MCAtIDB4ZmZmZjEwMDAgICAoICAgNCBrQikNClsgICAgMC4wMDAwMDBdICAgICBmaXhtYXAgIDog
MHhmZmYwMDAwMCAtIDB4ZmZmZTAwMDAgICAoIDg5NiBrQikNClsgICAgMC4wMDAwMDBdICAgICB2
bWFsbG9jIDogMHhkMDgwMDAwMCAtIDB4ZmYwMDAwMDAgICAoIDc0NCBNQikNClsgICAgMC4wMDAw
MDBdICAgICBsb3dtZW0gIDogMHhjMDAwMDAwMCAtIDB4ZDAwMDAwMDAgICAoIDI1NiBNQikNClsg
ICAgMC4wMDAwMDBdICAgICBwa21hcCAgIDogMHhiZmUwMDAwMCAtIDB4YzAwMDAwMDAgICAoICAg
MiBNQikNClsgICAgMC4wMDAwMDBdICAgICBtb2R1bGVzIDogMHhiZjAwMDAwMCAtIDB4YmZlMDAw
MDAgICAoICAxNCBNQikNClsgICAgMC4wMDAwMDBdICAgICAgIC50ZXh0IDogMHhjMDAwODAwMCAt
IDB4YzA3ZmI4NmMgICAoODE0MyBrQikNClsgICAgMC4wMDAwMDBdICAgICAgIC5pbml0IDogMHhj
MDdmYzAwMCAtIDB4YzA4NjQ5NDAgICAoIDQxOSBrQikNClsgICAgMC4wMDAwMDBdICAgICAgIC5k
YXRhIDogMHhjMDg2NjAwMCAtIDB4YzA5MGZlMjAgICAoIDY4MCBrQikNClsgICAgMC4wMDAwMDBd
ICAgICAgICAuYnNzIDogMHhjMDkwZmUyMCAtIDB4YzBlNzYwNjAgICAoNTUyOSBrQikNClsgICAg
MC4wMDAwMDBdIEhpZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24uDQpbICAgIDAuMDAwMDAw
XSAJUkNVIHJlc3RyaWN0aW5nIENQVXMgZnJvbSBOUl9DUFVTPTIgdG8gbnJfY3B1X2lkcz0xLg0K
WyAgICAwLjAwMDAwMF0gTlJfSVJRUzoxNiBucl9pcnFzOjE2IDE2DQpbICAgIDAuMDAwMDAwXSBJ
UlE6IEZvdW5kIGFuIElOVEMgYXQgMHhmYTIwMDAwMCAocmV2aXNpb24gNS4wKSB3aXRoIDEyOCBp
bnRlcnJ1cHRzDQpbICAgIDAuMDAwMDAwXSBUb3RhbCBvZiAxMjggaW50ZXJydXB0cyBvbiAxIGFj
dGl2ZSBjb250cm9sbGVyDQpbICAgIDAuMDAwMDAwXSBPTUFQIGNsb2NrZXZlbnQgc291cmNlOiB0
aW1lcjIgYXQgMjQwMDAwMDAgSHoNClsgICAgMC4wMDAwMDBdIHNjaGVkX2Nsb2NrOiAzMiBiaXRz
IGF0IDI0TUh6LCByZXNvbHV0aW9uIDQxbnMsIHdyYXBzIGV2ZXJ5IDE3ODk1Nm1zDQpbICAgIDAu
MDAwMDAwXSBPTUFQIGNsb2Nrc291cmNlOiB0aW1lcjEgYXQgMjQwMDAwMDAgSHoNClsgICAgMC4w
MDAwMDBdIENvbnNvbGU6IGNvbG91ciBkdW1teSBkZXZpY2UgODB4MzANClsgICAgMC4wMDAwMDBd
IExvY2sgZGVwZW5kZW5jeSB2YWxpZGF0b3I6IENvcHlyaWdodCAoYykgMjAwNiBSZWQgSGF0LCBJ
bmMuLCBJbmdvIE1vbG5hcg0KWyAgICAwLjAwMDAwMF0gLi4uIE1BWF9MT0NLREVQX1NVQkNMQVNT
RVM6ICA4DQpbICAgIDAuMDAwMDAwXSAuLi4gTUFYX0xPQ0tfREVQVEg6ICAgICAgICAgIDQ4DQpb
ICAgIDAuMDAwMDAwXSAuLi4gTUFYX0xPQ0tERVBfS0VZUzogICAgICAgIDgxOTENClsgICAgMC4w
MDAwMDBdIC4uLiBDTEFTU0hBU0hfU0laRTogICAgICAgICAgNDA5Ng0KWyAgICAwLjAwMDAwMF0g
Li4uIE1BWF9MT0NLREVQX0VOVFJJRVM6ICAgICAxNjM4NA0KWyAgICAwLjAwMDAwMF0gLi4uIE1B
WF9MT0NLREVQX0NIQUlOUzogICAgICAzMjc2OA0KWyAgICAwLjAwMDAwMF0gLi4uIENIQUlOSEFT
SF9TSVpFOiAgICAgICAgICAxNjM4NA0KWyAgICAwLjAwMDAwMF0gIG1lbW9yeSB1c2VkIGJ5IGxv
Y2sgZGVwZW5kZW5jeSBpbmZvOiAzNjk1IGtCDQpbICAgIDAuMDAwMDAwXSAgcGVyIHRhc2stc3Ry
dWN0IG1lbW9yeSBmb290cHJpbnQ6IDExNTIgYnl0ZXMNClsgICAgMC4wMDEyMDRdIENhbGlicmF0
aW5nIGRlbGF5IGxvb3AuLi4gNDc2Ljc3IEJvZ29NSVBTIChscGo9MjM4Mzg3MikNClsgICAgMC4x
MDk0MzhdIHBpZF9tYXg6IGRlZmF1bHQ6IDMyNzY4IG1pbmltdW06IDMwMQ0KWyAgICAwLjEwOTk0
OV0gU2VjdXJpdHkgRnJhbWV3b3JrIGluaXRpYWxpemVkDQpbICAgIDAuMTEwMTAyXSBNb3VudC1j
YWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMg0KWyAgICAwLjEzODkzOV0gQ1BVOiBUZXN0aW5n
IHdyaXRlIGJ1ZmZlciBjb2hlcmVuY3k6IG9rDQpbICAgIDAuMTQwNjcxXSBDUFUwOiB0aHJlYWQg
LTEsIGNwdSAwLCBzb2NrZXQgLTEsIG1waWRyIDANClsgICAgMC4xNDA3NTRdIFNldHRpbmcgdXAg
c3RhdGljIGlkZW50aXR5IG1hcCBmb3IgMHhjMDU5NTE2OCAtIDB4YzA1OTUxZDgNClsgICAgMC4x
NDQxNjVdIEJyb3VnaHQgdXAgMSBDUFVzDQpbICAgIDAuMTQ0MTg4XSBTTVA6IFRvdGFsIG9mIDEg
cHJvY2Vzc29ycyBhY3RpdmF0ZWQuDQpbICAgIDAuMTQ0MjAwXSBDUFU6IEFsbCBDUFUocykgc3Rh
cnRlZCBpbiBTVkMgbW9kZS4NClsgICAgMC4xNDc0NjBdIGRldnRtcGZzOiBpbml0aWFsaXplZA0K
WyAgICAwLjE1ODcyNl0gVkZQIHN1cHBvcnQgdjAuMzogaW1wbGVtZW50b3IgNDEgYXJjaGl0ZWN0
dXJlIDMgcGFydCAzMCB2YXJpYW50IGMgcmV2IDMNClsgICAgMC4yNDA3MTRdIG9tYXBfaHdtb2Q6
IGRlYnVnc3M6IF93YWl0X3RhcmdldF9kaXNhYmxlIGZhaWxlZA0KWyAgICAwLjI0NjU4MV0gcGlu
Y3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5jdHJsIHN1YnN5c3RlbQ0KWyAgICAwLjI1MTgzMV0g
cmVndWxhdG9yLWR1bW15OiBubyBwYXJhbWV0ZXJzDQpbICAgIDAuMjU1Nzk3XSBORVQ6IFJlZ2lz
dGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2DQpbICAgIDAuMjYzMTE2XSBETUE6IHByZWFsbG9jYXRl
ZCAyNTYgS2lCIHBvb2wgZm9yIGF0b21pYyBjb2hlcmVudCBhbGxvY2F0aW9ucw0KWyAgICAwLjI4
MDAwMF0gcGxhdGZvcm0gbXB1LjE6IEZJWE1FOiBjbG9jay1uYW1lICdmY2snIERPRVMgTk9UIGV4
aXN0IGluIGR0IQ0KWyAgICAwLjI4MzQ2M10gcGxhdGZvcm0gNDkwMDAwMDAuZWRtYTogRklYTUU6
IGNsb2NrLW5hbWUgJ2ZjaycgRE9FUyBOT1QgZXhpc3QgaW4gZHQhDQpbICAgIDAuMjg4ODkyXSBP
TUFQIEdQSU8gaGFyZHdhcmUgdmVyc2lvbiAwLjENClsgICAgMC4zMDMyNzJdIHBsYXRmb3JtIDQ4
MDYwMDAwLm1tYzogRklYTUU6IGNsb2NrLW5hbWUgJ2ZjaycgRE9FUyBOT1QgZXhpc3QgaW4gZHQh
DQpbICAgIDAuMzE5MTE2XSBwbGF0Zm9ybSA0ODAzYzAwMC5tY2FzcDogRklYTUU6IGNsb2NrLW5h
bWUgJ2ZjaycgRE9FUyBOT1QgZXhpc3QgaW4gZHQhDQpbICAgIDAuMzIzOTc4XSBEU1Mgbm90IHN1
cHBvcnRlZCBvbiB0aGlzIFNvQw0KWyAgICAwLjMyNDAwOF0gTm8gQVRBR3M/DQpbICAgIDAuMzI0
MDI0XSBody1icmVha3BvaW50OiBkZWJ1ZyBhcmNoaXRlY3R1cmUgMHg0IHVuc3VwcG9ydGVkLg0K
WyAgICAwLjQwNDg2OF0gYmlvOiBjcmVhdGUgc2xhYiA8YmlvLTA+IGF0IDANClsgICAgMC40NTE4
OTFdIGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUuMDogVEkgRURNQSBETUEgZW5naW5l
IGRyaXZlcg0KWyAgICAwLjQ1NDI3M10gdmJhdDogNTAwMCBtViANClsgICAgMC40NTU1OTFdIGxp
czNfcmVnOiBubyBwYXJhbWV0ZXJzDQpbICAgIDAuNDY0ODYwXSBTQ1NJIHN1YnN5c3RlbSBpbml0
aWFsaXplZA0KWyAgICAwLjQ2OTA0NV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciB1c2Jmcw0KWyAgICAwLjQ3MDAxNF0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50
ZXJmYWNlIGRyaXZlciBodWINClsgICAgMC40NzA4OTRdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3
IGRldmljZSBkcml2ZXIgdXNiDQpbICAgIDAuNDczNzUxXSBvbWFwX2kyYyA0NGUwYjAwMC5pMmM6
IGNvdWxkIG5vdCBmaW5kIHBjdGxkZXYgZm9yIG5vZGUgL3Bpbm11eEA0NGUxMDgwMC9waW5tdXhf
aTJjMF9waW5zLCBkZWZlcnJpbmcgcHJvYmUNClsgICAgMC40NzM4MDNdIHBsYXRmb3JtIDQ0ZTBi
MDAwLmkyYzogRHJpdmVyIG9tYXBfaTJjIHJlcXVlc3RzIHByb2JlIGRlZmVycmFsDQpbICAgIDAu
NDgzMTA1XSBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSB0aW1lcjENClsgICAgMC42NDgzNDldIE5F
VDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMg0KWyAgICAwLjY1MDUyN10gVENQIGVzdGFi
bGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogMjA0OCAob3JkZXI6IDIsIDE2Mzg0IGJ5dGVzKQ0K
WyAgICAwLjY1MDc0Ml0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjog
NCwgNzM3MjggYnl0ZXMpDQpbICAgIDAuNjUxNjkwXSBUQ1A6IEhhc2ggdGFibGVzIGNvbmZpZ3Vy
ZWQgKGVzdGFibGlzaGVkIDIwNDggYmluZCAyMDQ4KQ0KWyAgICAwLjY1MTkyNl0gVENQOiByZW5v
IHJlZ2lzdGVyZWQNClsgICAgMC42NTE5NjBdIFVEUCBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAo
b3JkZXI6IDIsIDIwNDgwIGJ5dGVzKQ0KWyAgICAwLjY1MjIyMV0gVURQLUxpdGUgaGFzaCB0YWJs
ZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAyLCAyMDQ4MCBieXRlcykNClsgICAgMC42NTM4NDddIE5F
VDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMQ0KWyAgICAwLjY1NjA4Nl0gUlBDOiBSZWdp
c3RlcmVkIG5hbWVkIFVOSVggc29ja2V0IHRyYW5zcG9ydCBtb2R1bGUuDQpbICAgIDAuNjU2MTE0
XSBSUEM6IFJlZ2lzdGVyZWQgdWRwIHRyYW5zcG9ydCBtb2R1bGUuDQpbICAgIDAuNjU2MTI2XSBS
UEM6IFJlZ2lzdGVyZWQgdGNwIHRyYW5zcG9ydCBtb2R1bGUuDQpbICAgIDAuNjU2MTM4XSBSUEM6
IFJlZ2lzdGVyZWQgdGNwIE5GU3Y0LjEgYmFja2NoYW5uZWwgdHJhbnNwb3J0IG1vZHVsZS4NClsg
ICAgMC42NTg4MjVdIE5ldFdpbmRlciBGbG9hdGluZyBQb2ludCBFbXVsYXRvciBWMC45NyAoZG91
YmxlIHByZWNpc2lvbikNClsgICAgMC42NjAxNjFdIFBNOiBMb2FkaW5nIGFtMzM1eC1wbS1maXJt
d2FyZS5iaW4NClsgICAgMC44NjE4MTNdIFZGUzogRGlzayBxdW90YXMgZHF1b3RfNi41LjINClsg
ICAgMC44NjIxMDRdIERxdW90LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMTAyNCAob3JkZXIg
MCwgNDA5NiBieXRlcykNClsgICAgMC44NjUzNTldIE5GUzogUmVnaXN0ZXJpbmcgdGhlIGlkX3Jl
c29sdmVyIGtleSB0eXBlDQpbICAgIDAuODY1ODgxXSBLZXkgdHlwZSBpZF9yZXNvbHZlciByZWdp
c3RlcmVkDQpbICAgIDAuODY1OTA0XSBLZXkgdHlwZSBpZF9sZWdhY3kgcmVnaXN0ZXJlZA0KWyAg
ICAwLjg2NjA0M10gamZmczI6IHZlcnNpb24gMi4yLiAoTkFORCkgKFNVTU1BUlkpICDCqSAyMDAx
LTIwMDYgUmVkIEhhdCwgSW5jLg0KWyAgICAwLjg2NjU5Ml0gbXNnbW5pIGhhcyBiZWVuIHNldCB0
byA0NzQNClsgICAgMC44NzI4OTZdIGlvIHNjaGVkdWxlciBub29wIHJlZ2lzdGVyZWQNClsgICAg
MC44NzI5MjRdIGlvIHNjaGVkdWxlciBkZWFkbGluZSByZWdpc3RlcmVkDQpbICAgIDAuODczMTM3
XSBpbyBzY2hlZHVsZXIgY2ZxIHJlZ2lzdGVyZWQgKGRlZmF1bHQpDQpbICAgIDAuODc3NDc5XSBw
aW5jdHJsLXNpbmdsZSA0NGUxMDgwMC5waW5tdXg6IDE0MiBwaW5zIGF0IHBhIGY5ZTEwODAwIHNp
emUgNTY4DQpbICAgIDAuOTA0NDM4XSBDb25zb2xlOiBzd2l0Y2hpbmcgdG8gY29sb3VyIGZyYW1l
IGJ1ZmZlciBkZXZpY2UgNjB4MzQNClsgICAgMC45MTMxNjddIFNlcmlhbDogODI1MC8xNjU1MCBk
cml2ZXIsIDQgcG9ydHMsIElSUSBzaGFyaW5nIGVuYWJsZWQNClsgICAgMC45MjIyMTldIDQ0ZTA5
MDAwLnNlcmlhbDogdHR5TzAgYXQgTU1JTyAweDQ0ZTA5MDAwIChpcnEgPSA4OCwgYmFzZV9iYXVk
ID0gMzAwMDAwMCkgaXMgYSBPTUFQIFVBUlQwDQpbICAgIDEuNTcwMDIyXSBjb25zb2xlIFt0dHlP
MF0gZW5hYmxlZA0KWyAgICAxLjU4MDAyNl0gb21hcF9ybmcgNDgzMTAwMDAucm5nOiBPTUFQIFJh
bmRvbSBOdW1iZXIgR2VuZXJhdG9yIHZlci4gMjANClsgICAgMS42MjE2MDBdIGJyZDogbW9kdWxl
IGxvYWRlZA0KWyAgICAxLjY0NTk4MV0gbG9vcDogbW9kdWxlIGxvYWRlZA0KWyAgICAxLjY1ODg0
Nl0gbXRkb29wczogbXRkIGRldmljZSAobXRkZGV2PW5hbWUvbnVtYmVyKSBtdXN0IGJlIHN1cHBs
aWVkDQpbICAgIDEuNjc4MDc1XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJp
dmVyIGFzaXgNClsgICAgMS42ODQ4ODldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFj
ZSBkcml2ZXIgYXg4ODE3OV8xNzhhDQpbICAgIDEuNjkxNzk2XSB1c2Jjb3JlOiByZWdpc3RlcmVk
IG5ldyBpbnRlcmZhY2UgZHJpdmVyIGNkY19ldGhlcg0KWyAgICAxLjY5ODg5N10gdXNiY29yZTog
cmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciByODE1eA0KWyAgICAxLjcwNTgyN10gdXNi
Y29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBzbXNjOTV4eA0KWyAgICAxLjcx
MjM1Nl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBuZXQxMDgwDQpb
ICAgIDEuNzE4OTg3XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGNk
Y19zdWJzZXQNClsgICAgMS43MjU4MTddIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFj
ZSBkcml2ZXIgemF1cnVzDQpbICAgIDEuNzMyMjYxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBp
bnRlcmZhY2UgZHJpdmVyIGNkY19uY20NClsgICAgMS43NDIyOTNdIGVoY2lfaGNkOiBVU0IgMi4w
ICdFbmhhbmNlZCcgSG9zdCBDb250cm9sbGVyIChFSENJKSBEcml2ZXINClsgICAgMS43NDk1MThd
IGVoY2ktb21hcDogT01BUC1FSENJIEhvc3QgQ29udHJvbGxlciBkcml2ZXINClsgICAgMS43NTcx
NjddIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgY2RjX3dkbQ0KWyAg
ICAxLjc2MzkxOV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2It
c3RvcmFnZQ0KWyAgICAxLjc3MDc1Ml0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciB1c2J0ZXN0DQpbICAgIDEuNzgxNDYzXSBtb3VzZWRldjogUFMvMiBtb3VzZSBkZXZp
Y2UgY29tbW9uIGZvciBhbGwgbWljZQ0KWyAgICAxLjc5NDk3NF0gb21hcF9ydGMgNDRlM2UwMDAu
cnRjOiBydGMgY29yZTogcmVnaXN0ZXJlZCA0NGUzZTAwMC5ydGMgYXMgcnRjMA0KWyAgICAxLjgw
MjUyNF0gNDRlM2UwMDAucnRjOiBhbHJlYWR5IHJ1bm5pbmcNClsgICAgMS44MDg0NTRdIGkyYyAv
ZGV2IGVudHJpZXMgZHJpdmVyDQpbICAgIDEuODEyNjUzXSBEcml2ZXIgZm9yIDEtd2lyZSBEYWxs
YXMgbmV0d29yayBwcm90b2NvbC4NClsgICAgMS44MjQ3OTRdIG9tYXBfd2R0OiBPTUFQIFdhdGNo
ZG9nIFRpbWVyIFJldiAweDAxOiBpbml0aWFsIHRpbWVvdXQgNjAgc2VjDQpbICAgIDEuODM3NDE2
XSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IGFsbG9jYXRlZCBjaGFubmVsIGZv
ciAwOjI1DQpbICAgIDEuODQ0ODY5XSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6
IGFsbG9jYXRlZCBjaGFubmVsIGZvciAwOjI0DQpbICAgIDEuODUyMTYyXSBvbWFwX2hzbW1jIDQ4
MDYwMDAwLm1tYzogdm1tYyByZWd1bGF0b3IgbWlzc2luZw0KWyAgICAxLjg1ODQzMF0gZWRtYS1k
bWEtZW5naW5lIGVkbWEtZG1hLWVuZ2luZS4wOiBmcmVlaW5nIGNoYW5uZWwgZm9yIDI0DQpbICAg
IDEuODY1MjkzXSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IGZyZWVpbmcgY2hh
bm5lbCBmb3IgMjUNClsgICAgMS44NzIxODRdIHBsYXRmb3JtIDQ4MDYwMDAwLm1tYzogRHJpdmVy
IG9tYXBfaHNtbWMgcmVxdWVzdHMgcHJvYmUgZGVmZXJyYWwNClsgICAgMS44ODcwOThdIGxlZHRy
aWctY3B1OiByZWdpc3RlcmVkIHRvIGluZGljYXRlIGFjdGl2aXR5IG9uIENQVXMNClsgICAgMS44
OTQyNTNdIGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNoYW5u
ZWwgZm9yIDA6MzYNClsgICAgMS45MDE0OTRdIG9tYXAtc2hhbSA1MzEwMDAwMC5zaGFtOiBodyBh
Y2NlbCBvbiBPTUFQIHJldiA0LjMNClsgICAgMS45MTIxMDBdIG9tYXAtYWVzIDUzNTAwMDAwLmFl
czogT01BUCBBRVMgaHcgYWNjZWwgcmV2OiAzLjINClsgICAgMS45MTg0NzZdIGVkbWEtZG1hLWVu
Z2luZSBlZG1hLWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNoYW5uZWwgZm9yIDA6NQ0KWyAgICAx
LjkyNTY1OV0gZWRtYS1kbWEtZW5naW5lIGVkbWEtZG1hLWVuZ2luZS4wOiBhbGxvY2F0ZWQgY2hh
bm5lbCBmb3IgMDo2DQpbICAgIDEuOTM3MjE3XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIHVzYmhpZA0KWyAgICAxLjk0MzI5Nl0gdXNiaGlkOiBVU0IgSElEIGNvcmUg
ZHJpdmVyDQpbICAgIDEuOTUzOTc1XSBvcHJvZmlsZTogbm8gcGVyZm9ybWFuY2UgY291bnRlcnMN
ClsgICAgMS45NjEyNDNdIG9wcm9maWxlOiB1c2luZyB0aW1lciBpbnRlcnJ1cHQuDQpbICAgIDEu
OTY2ODA3XSBUQ1A6IGN1YmljIHJlZ2lzdGVyZWQNClsgICAgMS45NzAzMDNdIEluaXRpYWxpemlu
ZyBYRlJNIG5ldGxpbmsgc29ja2V0DQpbICAgIDEuOTc1MDI4XSBORVQ6IFJlZ2lzdGVyZWQgcHJv
dG9jb2wgZmFtaWx5IDE3DQpbICAgIDEuOTc5Nzk3XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wg
ZmFtaWx5IDE1DQpbICAgIDEuOTg0OTUwXSBLZXkgdHlwZSBkbnNfcmVzb2x2ZXIgcmVnaXN0ZXJl
ZA0KWyAgICAxLjk5MDg1MF0gY3B1IGNwdTA6IGNwdTAgcmVndWxhdG9yIG5vdCByZWFkeSwgcmV0
cnkNClsgICAgMS45OTY0MjddIHBsYXRmb3JtIGNwdWZyZXEtY3B1MC4wOiBEcml2ZXIgY3B1ZnJl
cS1jcHUwIHJlcXVlc3RzIHByb2JlIGRlZmVycmFsDQpbICAgIDIuMDA0NzQ2XSBUaHVtYkVFIENQ
VSBleHRlbnNpb24gc3VwcG9ydGVkLg0KWyAgICAyLjAyMjgwMF0gdHBzNjU5MTAgMC0wMDJkOiBO
byBpbnRlcnJ1cHQgc3VwcG9ydCwgbm8gY29yZSBJUlENClsgICAgMi4wMzc2ODZdIHZydGM6IDE4
MDAgbVYgDQpbICAgIDIuMDQxMjc1XSB2cnRjOiBzdXBwbGllZCBieSB2YmF0DQpbICAgIDIuMDQ5
OTAyXSB2aW86IGF0IDE1MDAgbVYgDQpbICAgIDIuMDUzMzY1XSB2aW86IHN1cHBsaWVkIGJ5IHZi
YXQNClsgICAgMi4wNjAyNTFdIHZkZF9tcHU6IDkxMiA8LS0+IDEzMTIgbVYgYXQgMTEzNyBtViAN
ClsgICAgMi4wNjU1ODNdIHZkZF9tcHU6IHN1cHBsaWVkIGJ5IHZiYXQNClsgICAgMi4wNzI2NjBd
IHZkZF9jb3JlOiA5MTIgPC0tPiAxMTUwIG1WIGF0IDExMzcgbVYgDQpbICAgIDIuMDc4MDQ2XSB2
ZGRfY29yZTogc3VwcGxpZWQgYnkgdmJhdA0KWyAgICAyLjA4NDg4Nl0gdmRkMzogNTAwMCBtViAN
ClsgICAgMi4wOTA0MTBdIHZkaWcxOiBhdCAxODAwIG1WIA0KWyAgICAyLjA5Mzk2OF0gdmRpZzE6
IHN1cHBsaWVkIGJ5IHZiYXQNClsgICAgMi4xMDA1NTJdIHZkaWcyOiBhdCAxODAwIG1WIA0KWyAg
ICAyLjEwNDEwMF0gdmRpZzI6IHN1cHBsaWVkIGJ5IHZiYXQNClsgICAgMi4xMTA3OTldIHZwbGw6
IGF0IDE4MDAgbVYgDQpbICAgIDIuMTE0MjcxXSB2cGxsOiBzdXBwbGllZCBieSB2YmF0DQpbICAg
IDIuMTIwODI1XSB2ZGFjOiBhdCAxODAwIG1WIA0KWyAgICAyLjEyNDI3NF0gdmRhYzogc3VwcGxp
ZWQgYnkgdmJhdA0KWyAgICAyLjEzMDg0Ml0gdmF1eDE6IGF0IDE4MDAgbVYgDQpbICAgIDIuMTM0
Mzc4XSB2YXV4MTogc3VwcGxpZWQgYnkgdmJhdA0KWyAgICAyLjE0MTAwM10gdmF1eDI6IGF0IDMz
MDAgbVYgDQpbICAgIDIuMTQ0NTU2XSB2YXV4Mjogc3VwcGxpZWQgYnkgdmJhdA0KWyAgICAyLjE1
MTEzNV0gdmF1eDMzOiBhdCAzMzAwIG1WIA0KWyAgICAyLjE1NDc1NV0gdmF1eDMzOiBzdXBwbGll
ZCBieSB2YmF0DQpbICAgIDIuMTYxNDE5XSB2bW1jOiAxODAwIDwtLT4gMzMwMCBtViBhdCAzMzAw
IG1WIA0KWyAgICAyLjE2NjUwMF0gdm1tYzogc3VwcGxpZWQgYnkgdmJhdA0KWyAgICAyLjE3NTg4
NV0gb21hcF9pMmMgNDRlMGIwMDAuaTJjOiBidXMgMCByZXYwLjExIGF0IDQwMCBrSHoNClsgICAg
Mi4xODM0NDBdIGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNo
YW5uZWwgZm9yIDA6MjUNClsgICAgMi4xOTA2NTBdIGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1l
bmdpbmUuMDogYWxsb2NhdGVkIGNoYW5uZWwgZm9yIDA6MjQNClsgICAgMi4xOTkyMThdIG9tYXBf
aHNtbWMgNDgwNjAwMDAubW1jOiBwaW5zIGFyZSBub3QgY29uZmlndXJlZCBmcm9tIHRoZSBkcml2
ZXINClsgICAgMi4zMTMwOTNdIGRhdmluY2lfbWRpbyA0YTEwMTAwMC5tZGlvOiBkYXZpbmNpIG1k
aW8gcmV2aXNpb24gMS42DQpbICAgIDIuMzE5NTMzXSBkYXZpbmNpX21kaW8gNGExMDEwMDAubWRp
bzogZGV0ZWN0ZWQgcGh5IG1hc2sgZmZmZmZmZmMNClsgICAgMi4zMzE0NTFdIGxpYnBoeTogNGEx
MDEwMDAubWRpbzogcHJvYmVkDQpbICAgIDIuMzM1ODMyXSBkYXZpbmNpX21kaW8gNGExMDEwMDAu
bWRpbzogcGh5WzBdOiBkZXZpY2UgNGExMDEwMDAubWRpbzowMCwgZHJpdmVyIEF0aGVyb3MgODAz
MSBldGhlcm5ldA0KWyAgICAyLjM0NTk5OV0gZGF2aW5jaV9tZGlvIDRhMTAxMDAwLm1kaW86IHBo
eVsxXTogZGV2aWNlIDRhMTAxMDAwLm1kaW86MDEsIGRyaXZlciBBdGhlcm9zIDgwMzEgZXRoZXJu
ZXQNClsgICAgMi4zNTYxNTddIERldGVjdGVkIE1BQ0lEID0gZDQ6OTQ6YTE6ODM6NGQ6YTcNClsg
ICAgMi4zNjc0NjFdIFVuaGFuZGxlZCBmYXVsdDogZXh0ZXJuYWwgYWJvcnQgb24gbm9uLWxpbmVm
ZXRjaCAoMHgxMDI4KSBhdCAweGZhMWFjMTUwDQpbICAgIDIuMzc1NTI0XSBJbnRlcm5hbCBlcnJv
cjogOiAxMDI4IFsjMV0gU01QIEFSTQ0KWyAgICAyLjM4MDI4N10gTW9kdWxlcyBsaW5rZWQgaW46
DQpbICAgIDIuMzgzNTE0XSBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRl
ZCAzLjEyLjAtcmM1ICMxDQpbICAgIDIuMzkwMTAxXSB0YXNrOiBjZTA4MTQ0MCB0aTogY2UwODIw
MDAgdGFzay50aTogY2UwODIwMDANClsgICAgMi4zOTU3ODVdIFBDIGlzIGF0IGdwaW9fZGVib3Vu
Y2UrMHg3OC8weDEyYw0KWyAgICAyLjQwMDM3OF0gTFIgaXMgYXQgX3Jhd19zcGluX3VubG9ja19p
cnFyZXN0b3JlKzB4NDAvMHg0NA0KWyAgICAyLjQwNjE0MV0gcGMgOiBbPGMwMmY4OTk0Pl0gICAg
bHIgOiBbPGMwNThmNGNjPl0gICAgcHNyOiA2MDAwMDE5Mw0KWyAgICAyLjQwNjE0MV0gc3AgOiBj
ZTA4M2RlMCAgaXAgOiBjZTA4MjAxMCAgZnAgOiBjMDQ1YmZmOA0KWyAgICAyLjQxODE5NF0gcjEw
OiBjZTMzN2MxYyAgcjkgOiAwMDAwMDAwMiAgcjggOiAyMDAwMDExMw0KWyAgICAyLjQyMzY4MV0g
cjcgOiAwMDAwMDBhMCAgcjYgOiAwMDAwMDAwNCAgcjUgOiBjZTE1MGM2OCAgcjQgOiBjZTE1MGM4
OA0KWyAgICAyLjQzMDUzNV0gcjMgOiBmYTFhYzE1MCAgcjIgOiBmYTFhYzAwMCAgcjEgOiBjZTA4
M2RiOCAgcjAgOiAwMDAwMDAwMA0KWyAgICAyLjQzNzM5M10gRmxhZ3M6IG5aQ3YgIElSUXMgb2Zm
ICBGSVFzIG9uICBNb2RlIFNWQ18zMiAgSVNBIEFSTSAgU2VnbWVudCBrZXJuZWwNClsgICAgMi40
NDUxNjFdIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogODAwMDQwMTkgIERBQzogMDAwMDAwMTcN
ClsgICAgMi40NTExOTZdIFByb2Nlc3Mgc3dhcHBlci8wIChwaWQ6IDEsIHN0YWNrIGxpbWl0ID0g
MHhjZTA4MjI0OCkNClsgICAgMi40NTc1MDRdIFN0YWNrOiAoMHhjZTA4M2RlMCB0byAweGNlMDg0
MDAwKQ0KWyAgICAyLjQ2MjA4N10gM2RlMDogYzAyZjg5MWMgY2UxNTBjODggMDAwMDAwMDYgYTAw
MDAxMTMgMDAwMDAwMDAgMDAwMDEzODggY2UzMzQwZTggYzAyZjYxODANClsgICAgMi40NzA2ODBd
IDNlMDA6IGNlMzM3YzQ0IDAwMDAwMDA1IGMwZjg3ZmIwIDAwMDAwMDAxIGNlMzM0MGYwIGMwNDVi
ODI4IGNlMzM0MDUwIDAwMDAwMDAxDQpbICAgIDIuNDc5MjcyXSAzZTIwOiAwMDAwMDAwMyBjZTMz
YTgwMCBjZTMzN2MwMCAwMDAwMDAwMCBjZTMzNDAwMCBjZTE0ZTQxMCBjZTE0ZTQwMCBjZTMzNDA1
MA0KWyAgICAyLjQ4Nzg2M10gM2U0MDogY2UxNGZkYjAgMDAwMDAwMDAgY2UxNGU0MTAgYzBlNjMy
ZjQgY2UxNGU0MTAgMDAwMDAwMDAgMDAwMDAwMDAgYzA4ZjQ3ZDANClsgICAgMi40OTY0NTZdIDNl
NjA6IDAwMDAwMGJkIGNlMDgyMDI4IDAwMDAwMDAwIGMwMzUzMzFjIGMwMzUzMzA0IGMwMzUyMTE0
IGNlMTRlNDEwIGMwOGY0N2QwDQpbICAgIDIuNTA1MDQ5XSAzZTgwOiBjZTE0ZTQ0NCAwMDAwMDAw
MCBjMDgzNzk4YyBjMDM1MjMwOCAwMDAwMDAwMCBjMDhmNDdkMCBjMDM1MjI3NCBjMDM1MDU5OA0K
WyAgICAyLjUxMzY0M10gM2VhMDogY2UwMmEyYTggY2UwZjM3MTAgYzA4ZjQ3ZDAgYzA4ZTIxNDgg
Y2UzMzZjYzAgYzAzNTE4OTggYzA3MWVlZjQgYzA4ZjQ3ZDANClsgICAgMi41MjIyMzhdIDNlYzA6
IDAwMDAwMDA3IGMwOGY0N2QwIDAwMDAwMDA3IGMwOTBmZTQwIGMwOTBmZTQwIGMwMzUyOGUwIDAw
MDAwMDAwIGMwODYwYTc0DQpbICAgIDIuNTMwODMwXSAzZWUwOiAwMDAwMDAwNyBjMDAwODg0OCAw
MDAwMDAwNCBjMDhjMzk0NCBjMDhjMzk0NCA2MDAwMDExMyBjMDJkMzcwMCAwMDAwMDAwMA0KWyAg
ICAyLjUzOTQyM10gM2YwMDogYzA4YzM5NDAgMDAwMDAwMDAgMDAwMDAwMDAgYzA1OGYzOTQgMDAw
MDAwMDIgY2UwODIwMzggYzExOWEyZmUgYzA1ZGM0ZTgNClsgICAgMi41NDgwMTZdIDNmMjA6IDAw
MDAwMGJkIGMwMDY0NzEwIGMwN2NiMzUwIDAwMDAwMDA3IGMxMTlhMzA2IDAwMDAwMDA3IDYwMDAw
MTEzIGMwODYwYTc0DQpbICAgIDIuNTU2NjEwXSAzZjQwOiAwMDAwMDAwNyBjMDkwZmU0MCBjMDkw
ZmU0MCBjMDdmYzUwYyAwMDAwMDBiZCBjMDg0NWQzMCBjMDg0NWQyOCBjMDdmY2JiYw0KWyAgICAy
LjU2NTIwMl0gM2Y2MDogMDAwMDAwMDcgMDAwMDAwMDcgYzA3ZmM1MGMgMDAwMDAwMDAgYzAwNzEw
YWMgN2I2Yjk5YmYgOThmZGVlZmUgMDAwMDAwMDANClsgICAgMi41NzM3OTVdIDNmODA6IGMwNTg0
YjUwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
IGMwNTg0YjU4DQpbICAgIDIuNTgyMzg4XSAzZmEwOiBjZTA4MGE0MCAwMDAwMDAwMCBjMDU4NGI1
MCBjMDAxM2JjOCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KWyAgICAyLjU5
MDk3OV0gM2ZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANClsgICAgMi41OTk1NzBdIDNmZTA6IDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAwMDAwIDdlY2QwMzdmIDc2
OWRmN2U3DQpbICAgIDIuNjA4MTg1XSBbPGMwMmY4OTk0Pl0gKGdwaW9fZGVib3VuY2UrMHg3OC8w
eDEyYykgZnJvbSBbPGMwMmY2MTgwPl0gKGdwaW9fc2V0X2RlYm91bmNlKzB4OTQvMHgxMTgpDQpb
ICAgIDIuNjE3NzkwXSBbPGMwMmY2MTgwPl0gKGdwaW9fc2V0X2RlYm91bmNlKzB4OTQvMHgxMTgp
IGZyb20gWzxjMDQ1YjgyOD5dIChncGlvX2tleXNfcHJvYmUrMHgzYzQvMHg3YzQpDQpbICAgIDIu
NjI3Njc0XSBbPGMwNDViODI4Pl0gKGdwaW9fa2V5c19wcm9iZSsweDNjNC8weDdjNCkgZnJvbSBb
PGMwMzUzMzFjPl0gKHBsYXRmb3JtX2Rydl9wcm9iZSsweDE4LzB4MWMpDQpbICAgIDIuNjM3NTUx
XSBbPGMwMzUzMzFjPl0gKHBsYXRmb3JtX2Rydl9wcm9iZSsweDE4LzB4MWMpIGZyb20gWzxjMDM1
MjExND5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MTA4LzB4MjI0KQ0KWyAgICAyLjY0Nzc4OV0g
WzxjMDM1MjExND5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MTA4LzB4MjI0KSBmcm9tIFs8YzAz
NTIzMDg+XSAoX19kcml2ZXJfYXR0YWNoKzB4OTQvMHg5OCkNClsgICAgMi42NTc3NTNdIFs8YzAz
NTIzMDg+XSAoX19kcml2ZXJfYXR0YWNoKzB4OTQvMHg5OCkgZnJvbSBbPGMwMzUwNTk4Pl0gKGJ1
c19mb3JfZWFjaF9kZXYrMHg2MC8weDk0KQ0KWyAgICAyLjY2NzI2M10gWzxjMDM1MDU5OD5dIChi
dXNfZm9yX2VhY2hfZGV2KzB4NjAvMHg5NCkgZnJvbSBbPGMwMzUxODk4Pl0gKGJ1c19hZGRfZHJp
dmVyKzB4MWQ0LzB4Mjg0KQ0KWyAgICAyLjY3Njg2M10gWzxjMDM1MTg5OD5dIChidXNfYWRkX2Ry
aXZlcisweDFkNC8weDI4NCkgZnJvbSBbPGMwMzUyOGUwPl0gKGRyaXZlcl9yZWdpc3RlcisweDc4
LzB4ZjgpDQpbICAgIDIuNjg2Mzc0XSBbPGMwMzUyOGUwPl0gKGRyaXZlcl9yZWdpc3RlcisweDc4
LzB4ZjgpIGZyb20gWzxjMDAwODg0OD5dIChkb19vbmVfaW5pdGNhbGwrMHhlOC8weDE0YykNClsg
ICAgMi42OTU4OTFdIFs8YzAwMDg4NDg+XSAoZG9fb25lX2luaXRjYWxsKzB4ZTgvMHgxNGMpIGZy
b20gWzxjMDdmY2JiYz5dIChrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDEwNC8weDFjOCkNClsgICAg
Mi43MDYwNTFdIFs8YzA3ZmNiYmM+XSAoa2VybmVsX2luaXRfZnJlZWFibGUrMHgxMDQvMHgxYzgp
IGZyb20gWzxjMDU4NGI1OD5dIChrZXJuZWxfaW5pdCsweDgvMHgxNTApDQpbICAgIDIuNzE1NzU0
XSBbPGMwNTg0YjU4Pl0gKGtlcm5lbF9pbml0KzB4OC8weDE1MCkgZnJvbSBbPGMwMDEzYmM4Pl0g
KHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjKQ0KWyAgICAyLjcyNDYyM10gQ29kZTogZTU5NDMwOWMg
ZTUxNDIwNzAgZTFkMzMxYmUgZTA4MjMwMDMgKGU1OTMyMDAwKSANClsgICAgMi43MzEwNDBdIC0t
LVsgZW5kIHRyYWNlIDM0NWFlYjA0NDFiNTA4MDIgXS0tLQ0KWyAgICAyLjczNjIwNl0gS2VybmVs
IHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhIGV4aXRjb2RlPTB4
MDAwMDAwMGINClsgICAgMi43MzYyMDZdIA0K

--_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FF7BBUSNYGRMBX4raymo_--
