Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB1FAE01750
	for <meta-ti@yoctoproject.org>; Wed, 23 Oct 2013 09:32:16 -0700 (PDT)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id r9NGWC6n019799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Oct 2013 11:32:12 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.106]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Wed, 23 Oct 2013 12:32:11
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "rstreif@linuxfoundation.org"
	<rstreif@linuxfoundation.org>
Thread-Topic: [meta-ti] AM335x EVM and core-image-sato
Thread-Index: AQHOz3YCLi+stx+MBUi9/IGvCrfrc5oBpl+AgAABzQCAANOOYg==
Date: Wed, 23 Oct 2013 16:32:10 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
	<20131022222813.GA9802@edge>,
	<CA+gsK-oiA9pOpFrietcPdF-qLYH6Uzv0OHmYYyzXS0Lk9Yy7ZA@mail.gmail.com>,
	<B0581B5571079145BA1CD78C126DBDE72E903AFC@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E903AFC@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.203]
MIME-Version: 1.0
X-MessageScreenMessageID: 1382545935.329997.1642.3986046990
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
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
X-List-Received-Date: Wed, 23 Oct 2013 16:32:19 -0000
X-Groupsio-MsgNum: 3580
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9USNYGRMBX4raymo_"

--_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9USNYGRMBX4raymo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attached is a boot log from a working version done back the 7th of Octobe=
r 3.12.rc3.
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
CC: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]; meta-ti@yoctopro=
ject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] AM335x EVM and core-image-sato

Denys,

Sorry, yes, the board I have is a am335x_evmsk. I forgot to write it out =
correctly in the subject line. it's a purple board. I have been using the=
 correct device tree file all along.

The board revision is 1.2B. The CPU is XAM3359ZCZ. On boot the kernel rep=
orts:

[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D1=
0c53c7d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing ins=
truction cache
[    0.000000] Machine: am335xevm
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AM335X ES1.0 (sgx neon )

Maybe that helps you to determine what CPU revision that is.

I built a 3.2.0 kernel with core-image-sato and it works just fine (after=
 enabling tmpdevfs support in the kernel).

It may will be a combination of that hardware with the newer kernel versi=
ons. I just bought the board a couple of weeks ago from DigiKey. If it is=
 an older CPU revision then they are apparently selling older stock.

If the CPU revision not being supported by the newer kernel is indeed the=
 root cause of the issue then this may become frustrating for more users.=
 There is no way that a user can reasonably find out that the kernel does=
 not boot because of the CPU revision. I don't know what has changed betw=
een the CPU revisions but I would think that the kernel should support al=
l of them.

Cheers,
Rudi




On Tue, Oct 22, 2013 at 11:28 PM, Denys Dmytriyenko <denys@ti.com<mailto:=
denys@ti.com>> wrote:
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
> From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoproj=
ect.org> [meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctopr=
oject.org>] on behalf of meta-ti-request@yoctoproject.org<mailto:meta-ti-=
request@yoctoproject.org> [meta-ti-request@yoctoproject.org<mailto:meta-t=
i-request@yoctoproject.org>]
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
>         meta-ti-request@yoctoproject.org<mailto:meta-ti-request@yoctopr=
oject.org>
>
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org<mailto:meta-ti-owner@yoctoprojec=
t.org>
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
> To: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoun=
dation.org>>
> Cc: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
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
> > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com<mai=
lto:denys@ti.com>> wrote:
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
org<mailto:denis@denix.org>>
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
> > > > > > linux-ti-staging_3.8.bb<http://linux-ti-staging_3.8.bb> recip=
e but whoever did it did not think
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
> > > > > > <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoundation.o=
rg>>wrote:
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
> > > > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > > > Skype: rudolfstreif
> > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > >
> > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org=
<http://events.linuxfoundation.org>
> > > > > > Linux Foundation Training Schedule: training.linuxfoundation.=
org<http://training.linuxfoundation.org>
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
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<htt=
p://events.linuxfoundation.org>
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org<=
http://training.linuxfoundation.org>
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
> > Linux Foundation Events Schedule:  events.linuxfoundation.org<http://=
events.linuxfoundation.org>
> > Linux Foundation Training Schedule: training.linuxfoundation.org<http=
://training.linuxfoundation.org>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 22 Oct 2013 15:37:32 -0400
> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> To: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoun=
dation.org>>
> Cc: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
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
> > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org<=
mailto:denis@denix.org>> wrote:
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
> > > > try. The issue with this one is that the linux-ti-staging_3.8.bb<=
http://linux-ti-staging_3.8.bb> recipe
> > > > explicitly sets KERNEL_IMAGETYPE=3D"uImage". However, the u-boot
> > > environment
> > > > has now moved on to using zImage which consequently means u-boot =
will not
> > > > find the kernel file.
> > > >
> > > > I do not know why KERNEL_IMAGETYPE =3D "uImage" was hacked into t=
he
> > > > linux-ti-staging_3.8.bb<http://linux-ti-staging_3.8.bb> recipe bu=
t whoever did it did not think about
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
> > > > <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoundation.org>>=
wrote:
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
> > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<htt=
p://events.linuxfoundation.org>
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org<=
http://training.linuxfoundation.org>
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
> > Linux Foundation Events Schedule:  events.linuxfoundation.org<http://=
events.linuxfoundation.org>
> > Linux Foundation Training Schedule: training.linuxfoundation.org<http=
://training.linuxfoundation.org>
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 22 Oct 2013 19:52:13 +0000
> From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com<mailto:Joshua.=
Vanderpool@raymondcorp.com>>
> To: "meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>" <meta-t=
i@yoctoproject.org<mailto:meta-ti@yoctoproject.org>>
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
> From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoproj=
ect.org> [meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctopr=
oject.org>] on behalf of meta-ti-request@yoctoproject.org<mailto:meta-ti-=
request@yoctoproject.org> [meta-ti-request@yoctoproject.org<mailto:meta-t=
i-request@yoctoproject.org>]
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
>         meta-ti-request@yoctoproject.org<mailto:meta-ti-request@yoctopr=
oject.org>
>
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org<mailto:meta-ti-owner@yoctoprojec=
t.org>
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
> From: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfo=
undation.org>>
> To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com<mailto:Joshua.Va=
nderpool@raymondcorp.com>>
> Cc: "meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>" <meta-t=
i@yoctoproject.org<mailto:meta-ti@yoctoproject.org>>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail=
=2Ecom<mailto:CA%2BgsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.=
gmail.com>>
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
> Joshua.Vanderpool@raymondcorp.com<mailto:Joshua.Vanderpool@raymondcorp.=
com>> wrote:
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
> > joshua.vanderpool@raymondcorp.com<mailto:joshua.vanderpool@raymondcor=
p.com>
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
> > meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
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
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
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
> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> To: Rudolf Streif <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoun=
dation.org>>,
>         meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022201652.GB404@denix.org<mailto:20131022201652.GB404=
@denix.org>>
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
> > > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com<m=
ailto:denys@ti.com>> wrote:
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
x.org<mailto:denis@denix.org>>
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
> > > > > > > linux-ti-staging_3.8.bb<http://linux-ti-staging_3.8.bb> rec=
ipe but whoever did it did not think
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
> > > > > > > <rstreif@linuxfoundation.org<mailto:rstreif@linuxfoundation=
=2Eorg>>wrote:
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
> > > > > > > rudolf.streif@linux.com<mailto:rudolf.streif@linux.com>
> > > > > > > Phone: +1.619.537.6646<tel:%2B1.619.537.6646>
> > > > > > > Skype: rudolfstreif
> > > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > > >
> > > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.o=
rg<http://events.linuxfoundation.org>
> > > > > > > Linux Foundation Training Schedule: training.linuxfoundatio=
n.org<http://training.linuxfoundation.org>
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
> > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org<h=
ttp://events.linuxfoundation.org>
> > > > > Linux Foundation Training Schedule: training.linuxfoundation.or=
g<http://training.linuxfoundation.org>
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
> > > Linux Foundation Events Schedule:  events.linuxfoundation.org<http:=
//events.linuxfoundation.org>
> > > Linux Foundation Training Schedule: training.linuxfoundation.org<ht=
tp://training.linuxfoundation.org>
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
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti





Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9USNYGRMBX4raymo_
Content-Type: application/octet-stream; name="bootLog 1.5"
Content-Description: bootLog 1.5
Content-Disposition: attachment; filename="bootLog 1.5"; size=15335;
	creation-date="Wed, 23 Oct 2013 16:31:57 GMT";
	modification-date="Wed, 23 Oct 2013 16:31:57 GMT"
Content-Transfer-Encoding: base64

DQpVLUJvb3QgU1BMIDIwMTMuMTAtcmM0IChPY3QgMDcgMjAxMyAtIDExOjAzOjExKQ0KcmVhZGlu
ZyBhcmdzDQpzcGw6IGVycm9yIHJlYWRpbmcgaW1hZ2UgYXJncywgZXJyIC0gLTENCnJlYWRpbmcg
dS1ib290LmltZw0KcmVhZGluZyB1LWJvb3QuaW1nDQoNCg0KVS1Cb290IDIwMTMuMTAtcmM0IChP
Y3QgMDcgMjAxMyAtIDExOjAzOjExKQ0KDQpJMkM6ICAgcmVhZHkNCkRSQU06ICAyNTYgTWlCDQpX
QVJOSU5HOiBDYWNoZXMgbm90IGVuYWJsZWQNCk5BTkQ6ICAwIE1pQg0KTU1DOiAgIE9NQVAgU0Qv
TU1DOiAwLCBPTUFQIFNEL01NQzogMQ0KKioqIFdhcm5pbmcgLSByZWFkZW52KCkgZmFpbGVkLCB1
c2luZyBkZWZhdWx0IGVudmlyb25tZW50DQoNCk5ldDogICA8ZXRoYWRkcj4gbm90IHNldC4gVmFs
aWRhdGluZyBmaXJzdCBFLWZ1c2UgTUFDDQpjcHN3LCB1c2JfZXRoZXINCkhpdCBhbnkga2V5IHRv
IHN0b3AgYXV0b2Jvb3Q6ICAxIAgICCAwIA0KbW1jMCBpcyBjdXJyZW50IGRldmljZQ0KU0QvTU1D
IGZvdW5kIG9uIGRldmljZSAwDQpyZWFkaW5nIHVFbnYudHh0DQoqKiBVbmFibGUgdG8gcmVhZCBm
aWxlIHVFbnYudHh0ICoqDQo0NDIwMDY0IGJ5dGVzIHJlYWQgaW4gNDg3IG1zICg4LjcgTWlCL3Mp
DQozNDQ4MSBieXRlcyByZWFkIGluIDM0IG1zICg5OTAuMiBLaUIvcykNCiMjIEJvb3Rpbmcga2Vy
bmVsIGZyb20gTGVnYWN5IEltYWdlIGF0IDgwMjAwMDAwIC4uLg0KICAgSW1hZ2UgTmFtZTogICBM
aW51eC0zLjEyLjAtcmMzDQogICBJbWFnZSBUeXBlOiAgIEFSTSBMaW51eCBLZXJuZWwgSW1hZ2Ug
KHVuY29tcHJlc3NlZCkNCiAgIERhdGEgU2l6ZTogICAgNDQyMDAwMCBCeXRlcyA9IDQuMiBNaUIN
CiAgIExvYWQgQWRkcmVzczogODAwMDgwMDANCiAgIEVudHJ5IFBvaW50OiAgODAwMDgwMDANCiAg
IFZlcmlmeWluZyBDaGVja3N1bSAuLi4gT0sNCiMjIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9i
IGF0IDgwZjgwMDAwDQogICBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBhdCAweDgwZjgwMDAw
DQogICBMb2FkaW5nIEtlcm5lbCBJbWFnZSAuLi4gT0sNCiAgIFVzaW5nIERldmljZSBUcmVlIGlu
IHBsYWNlIGF0IDgwZjgwMDAwLCBlbmQgODBmOGI2YjANCg0KU3RhcnRpbmcga2VybmVsIC4uLg0K
DQpbICAgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAweDANClsgICAg
MC4wMDAwMDBdIExpbnV4IHZlcnNpb24gMy4xMi4wLXJjMyAobnJvZ2Vyc0B1c255Z3JwYzA3NDky
KSAoZ2NjIHZlcnNpb24gNC44LjEgKEdDQykgKSAjMSBTTVAgTW9uIE9jdCA3IDEwOjQ0OjQ5IEVE
VCAyMDEzDQpbICAgIDAuMDAwMDAwXSBDUFU6IEFSTXY3IFByb2Nlc3NvciBbNDEzZmMwODJdIHJl
dmlzaW9uIDIgKEFSTXY3KSwgY3I9MTBjNTNjN2QNClsgICAgMC4wMDAwMDBdIENQVTogUElQVCAv
IFZJUFQgbm9uYWxpYXNpbmcgZGF0YSBjYWNoZSwgVklQVCBhbGlhc2luZyBpbnN0cnVjdGlvbiBj
YWNoZQ0KWyAgICAwLjAwMDAwMF0gTWFjaGluZTogR2VuZXJpYyBBTTMzWFggKEZsYXR0ZW5lZCBE
ZXZpY2UgVHJlZSksIG1vZGVsOiBUSSBBTTMzNXggRVZNLVNLDQpbICAgIDAuMDAwMDAwXSBjbWE6
IENNQTogcmVzZXJ2ZWQgMTYgTWlCIGF0IDhlODAwMDAwDQpbICAgIDAuMDAwMDAwXSBNZW1vcnkg
cG9saWN5OiBFQ0MgZGlzYWJsZWQsIERhdGEgY2FjaGUgd3JpdGViYWNrDQpbICAgIDAuMDAwMDAw
XSBDUFU6IEFsbCBDUFUocykgc3RhcnRlZCBpbiBTVkMgbW9kZS4NClsgICAgMC4wMDAwMDBdIEFN
MzM1WCBFUzEuMCAoc2d4IG5lb24gKQ0KWyAgICAwLjAwMDAwMF0gUEVSQ1BVOiBFbWJlZGRlZCA5
IHBhZ2VzL2NwdSBAYzExOWMwMDAgczE0MDE2IHI4MTkyIGQxNDY1NiB1MzY4NjQNClsgICAgMC4w
MDAwMDBdIEJ1aWx0IDEgem9uZWxpc3RzIGluIFpvbmUgb3JkZXIsIG1vYmlsaXR5IGdyb3VwaW5n
IG9uLiAgVG90YWwgcGFnZXM6IDY0NzY4DQpbICAgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFuZCBs
aW5lOiBjb25zb2xlPXR0eU8wLDExNTIwMG44IHJvb3Q9L2Rldi9tbWNibGswcDIgcm8gcm9vdGZz
dHlwZT1leHQ0IHJvb3R3YWl0DQpbICAgIDAuMDAwMDAwXSBQSUQgaGFzaCB0YWJsZSBlbnRyaWVz
OiAxMDI0IChvcmRlcjogMCwgNDA5NiBieXRlcykNClsgICAgMC4wMDAwMDBdIERlbnRyeSBjYWNo
ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDMyNzY4IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzKQ0KWyAg
ICAwLjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxNjM4NCAob3JkZXI6
IDQsIDY1NTM2IGJ5dGVzKQ0KWyAgICAwLjAwMDAwMF0gTWVtb3J5OiAyMjc3MDRLLzI2MTEyMEsg
YXZhaWxhYmxlICg1NzM3SyBrZXJuZWwgY29kZSwgNjY0SyByd2RhdGEsIDIyMTJLIHJvZGF0YSwg
NDE3SyBpbml0LCA1NTI4SyBic3MsIDMzNDE2SyByZXNlcnZlZCwgMEsgaGlnaG1lbSkNClsgICAg
MC4wMDAwMDBdIFZpcnR1YWwga2VybmVsIG1lbW9yeSBsYXlvdXQ6DQpbICAgIDAuMDAwMDAwXSAg
ICAgdmVjdG9yICA6IDB4ZmZmZjAwMDAgLSAweGZmZmYxMDAwICAgKCAgIDQga0IpDQpbICAgIDAu
MDAwMDAwXSAgICAgZml4bWFwICA6IDB4ZmZmMDAwMDAgLSAweGZmZmUwMDAwICAgKCA4OTYga0Ip
DQpbICAgIDAuMDAwMDAwXSAgICAgdm1hbGxvYyA6IDB4ZDA4MDAwMDAgLSAweGZmMDAwMDAwICAg
KCA3NDQgTUIpDQpbICAgIDAuMDAwMDAwXSAgICAgbG93bWVtICA6IDB4YzAwMDAwMDAgLSAweGQw
MDAwMDAwICAgKCAyNTYgTUIpDQpbICAgIDAuMDAwMDAwXSAgICAgcGttYXAgICA6IDB4YmZlMDAw
MDAgLSAweGMwMDAwMDAwICAgKCAgIDIgTUIpDQpbICAgIDAuMDAwMDAwXSAgICAgbW9kdWxlcyA6
IDB4YmYwMDAwMDAgLSAweGJmZTAwMDAwICAgKCAgMTQgTUIpDQpbICAgIDAuMDAwMDAwXSAgICAg
ICAudGV4dCA6IDB4YzAwMDgwMDAgLSAweGMwN2NiODA4ICAgKDc5NTEga0IpDQpbICAgIDAuMDAw
MDAwXSAgICAgICAuaW5pdCA6IDB4YzA3Y2MwMDAgLSAweGMwODM0NmMwICAgKCA0MTgga0IpDQpb
ICAgIDAuMDAwMDAwXSAgICAgICAuZGF0YSA6IDB4YzA4MzYwMDAgLSAweGMwOGRjMDgwICAgKCA2
NjUga0IpDQpbICAgIDAuMDAwMDAwXSAgICAgICAgLmJzcyA6IDB4YzA4ZGMwODAgLSAweGMwZTQy
MmUwICAgKDU1Mjkga0IpDQpbICAgIDAuMDAwMDAwXSBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVu
dGF0aW9uLg0KWyAgICAwLjAwMDAwMF0gCVJDVSByZXN0cmljdGluZyBDUFVzIGZyb20gTlJfQ1BV
Uz0yIHRvIG5yX2NwdV9pZHM9MS4NClsgICAgMC4wMDAwMDBdIE5SX0lSUVM6MTYgbnJfaXJxczox
NiAxNg0KWyAgICAwLjAwMDAwMF0gSVJROiBGb3VuZCBhbiBJTlRDIGF0IDB4ZmEyMDAwMDAgKHJl
dmlzaW9uIDUuMCkgd2l0aCAxMjggaW50ZXJydXB0cw0KWyAgICAwLjAwMDAwMF0gVG90YWwgb2Yg
MTI4IGludGVycnVwdHMgb24gMSBhY3RpdmUgY29udHJvbGxlcg0KWyAgICAwLjAwMDAwMF0gT01B
UCBjbG9ja2V2ZW50IHNvdXJjZTogdGltZXIyIGF0IDI0MDAwMDAwIEh6DQpbICAgIDAuMDAwMDAw
XSBzY2hlZF9jbG9jazogMzIgYml0cyBhdCAyNE1IeiwgcmVzb2x1dGlvbiA0MW5zLCB3cmFwcyBl
dmVyeSAxNzg5NTZtcw0KWyAgICAwLjAwMDAwMF0gT01BUCBjbG9ja3NvdXJjZTogdGltZXIxIGF0
IDI0MDAwMDAwIEh6DQpbICAgIDAuMDAwMDAwXSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNl
IDgweDMwDQpbICAgIDAuMDAwMDAwXSBMb2NrIGRlcGVuZGVuY3kgdmFsaWRhdG9yOiBDb3B5cmln
aHQgKGMpIDIwMDYgUmVkIEhhdCwgSW5jLiwgSW5nbyBNb2xuYXINClsgICAgMC4wMDAwMDBdIC4u
LiBNQVhfTE9DS0RFUF9TVUJDTEFTU0VTOiAgOA0KWyAgICAwLjAwMDAwMF0gLi4uIE1BWF9MT0NL
X0RFUFRIOiAgICAgICAgICA0OA0KWyAgICAwLjAwMDAwMF0gLi4uIE1BWF9MT0NLREVQX0tFWVM6
ICAgICAgICA4MTkxDQpbICAgIDAuMDAwMDAwXSAuLi4gQ0xBU1NIQVNIX1NJWkU6ICAgICAgICAg
IDQwOTYNClsgICAgMC4wMDAwMDBdIC4uLiBNQVhfTE9DS0RFUF9FTlRSSUVTOiAgICAgMTYzODQN
ClsgICAgMC4wMDAwMDBdIC4uLiBNQVhfTE9DS0RFUF9DSEFJTlM6ICAgICAgMzI3NjgNClsgICAg
MC4wMDAwMDBdIC4uLiBDSEFJTkhBU0hfU0laRTogICAgICAgICAgMTYzODQNClsgICAgMC4wMDAw
MDBdICBtZW1vcnkgdXNlZCBieSBsb2NrIGRlcGVuZGVuY3kgaW5mbzogMzY5NSBrQg0KWyAgICAw
LjAwMDAwMF0gIHBlciB0YXNrLXN0cnVjdCBtZW1vcnkgZm9vdHByaW50OiAxMTUyIGJ5dGVzDQpb
ICAgIDAuMDAxMjA2XSBDYWxpYnJhdGluZyBkZWxheSBsb29wLi4uIDQ3Ni43NyBCb2dvTUlQUyAo
bHBqPTIzODM4NzIpDQpbICAgIDAuMTA5NDM3XSBwaWRfbWF4OiBkZWZhdWx0OiAzMjc2OCBtaW5p
bXVtOiAzMDENClsgICAgMC4xMDk5MjRdIFNlY3VyaXR5IEZyYW1ld29yayBpbml0aWFsaXplZA0K
WyAgICAwLjExMDA5NV0gTW91bnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA1MTINClsgICAg
MC4xMzg5ODFdIENQVTogVGVzdGluZyB3cml0ZSBidWZmZXIgY29oZXJlbmN5OiBvaw0KWyAgICAw
LjE0MDcxN10gQ1BVMDogdGhyZWFkIC0xLCBjcHUgMCwgc29ja2V0IC0xLCBtcGlkciAwDQpbICAg
IDAuMTQwODAyXSBTZXR0aW5nIHVwIHN0YXRpYyBpZGVudGl0eSBtYXAgZm9yIDB4YzA1NzJkYTgg
LSAweGMwNTcyZTE4DQpbICAgIDAuMTQ0MjM4XSBCcm91Z2h0IHVwIDEgQ1BVcw0KWyAgICAwLjE0
NDI2MF0gU01QOiBUb3RhbCBvZiAxIHByb2Nlc3NvcnMgYWN0aXZhdGVkLg0KWyAgICAwLjE0NDI3
M10gQ1BVOiBBbGwgQ1BVKHMpIHN0YXJ0ZWQgaW4gU1ZDIG1vZGUuDQpbICAgIDAuMTQ3NTg0XSBk
ZXZ0bXBmczogaW5pdGlhbGl6ZWQNClsgICAgMC4xNTg5MzJdIFZGUCBzdXBwb3J0IHYwLjM6IGlt
cGxlbWVudG9yIDQxIGFyY2hpdGVjdHVyZSAzIHBhcnQgMzAgdmFyaWFudCBjIHJldiAzDQpbICAg
IDAuMjQwNTM0XSBvbWFwX2h3bW9kOiBkZWJ1Z3NzOiBfd2FpdF90YXJnZXRfZGlzYWJsZSBmYWls
ZWQNClsgICAgMC4yNDYzNzJdIHBpbmN0cmwgY29yZTogaW5pdGlhbGl6ZWQgcGluY3RybCBzdWJz
eXN0ZW0NClsgICAgMC4yNTE2NjhdIHJlZ3VsYXRvci1kdW1teTogbm8gcGFyYW1ldGVycw0KWyAg
ICAwLjI1ODU4MV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNg0KWyAgICAwLjI2
NTgzNV0gRE1BOiBwcmVhbGxvY2F0ZWQgMjU2IEtpQiBwb29sIGZvciBhdG9taWMgY29oZXJlbnQg
YWxsb2NhdGlvbnMNClsgICAgMC4yODMzNDddIHBsYXRmb3JtIG1wdS4xOiBGSVhNRTogY2xvY2st
bmFtZSAnZmNrJyBET0VTIE5PVCBleGlzdCBpbiBkdCENClsgICAgMC4yODY3NjVdIHBsYXRmb3Jt
IDQ5MDAwMDAwLmVkbWE6IEZJWE1FOiBjbG9jay1uYW1lICdmY2snIERPRVMgTk9UIGV4aXN0IGlu
IGR0IQ0KWyAgICAwLjI5MjUyMF0gT01BUCBHUElPIGhhcmR3YXJlIHZlcnNpb24gMC4xDQpbICAg
IDAuMzA2NzI2XSBwbGF0Zm9ybSA0ODA2MDAwMC5tbWM6IEZJWE1FOiBjbG9jay1uYW1lICdmY2sn
IERPRVMgTk9UIGV4aXN0IGluIGR0IQ0KWyAgICAwLjMyMjM1OV0gcGxhdGZvcm0gNDgwM2MwMDAu
bWNhc3A6IEZJWE1FOiBjbG9jay1uYW1lICdmY2snIERPRVMgTk9UIGV4aXN0IGluIGR0IQ0KWyAg
ICAwLjMyNjQ2NF0gRFNTIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBTb0MNClsgICAgMC4zMjY0ODdd
IE5vIEFUQUdzPw0KWyAgICAwLjMyNjUwNF0gaHctYnJlYWtwb2ludDogZGVidWcgYXJjaGl0ZWN0
dXJlIDB4NCB1bnN1cHBvcnRlZC4NClsgICAgMC40MDY1MjRdIGJpbzogY3JlYXRlIHNsYWIgPGJp
by0wPiBhdCAwDQpbICAgIDAuNDUzNDczXSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5l
LjA6IFRJIEVETUEgRE1BIGVuZ2luZSBkcml2ZXINClsgICAgMC40NTU4NDJdIHZiYXQ6IDUwMDAg
bVYgDQpbICAgIDAuNDU3MDE5XSBsaXMzX3JlZzogbm8gcGFyYW1ldGVycw0KWyAgICAwLjQ2NjQ1
OV0gU0NTSSBzdWJzeXN0ZW0gaW5pdGlhbGl6ZWQNClsgICAgMC40NzEyNDldIHVzYmNvcmU6IHJl
Z2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiZnMNClsgICAgMC40NzE3ODVdIHVzYmNv
cmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgaHViDQpbICAgIDAuNDcyNjQ5XSB1
c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBkZXZpY2UgZHJpdmVyIHVzYg0KWyAgICAwLjQ3NTQzMV0g
b21hcF9pMmMgNDRlMGIwMDAuaTJjOiBjb3VsZCBub3QgZmluZCBwY3RsZGV2IGZvciBub2RlIC9w
aW5tdXhANDRlMTA4MDAvcGlubXV4X2kyYzBfcGlucywgZGVmZXJyaW5nIHByb2JlDQpbICAgIDAu
NDc1NDg1XSBwbGF0Zm9ybSA0NGUwYjAwMC5pMmM6IERyaXZlciBvbWFwX2kyYyByZXF1ZXN0cyBw
cm9iZSBkZWZlcnJhbA0KWyAgICAwLjQ4NDkxNV0gU3dpdGNoZWQgdG8gY2xvY2tzb3VyY2UgdGlt
ZXIxDQpbICAgIDAuNjUwODY5XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDINClsg
ICAgMC42NTMwOTZdIFRDUCBlc3RhYmxpc2hlZCBoYXNoIHRhYmxlIGVudHJpZXM6IDIwNDggKG9y
ZGVyOiAyLCAxNjM4NCBieXRlcykNClsgICAgMC42NTMzMTVdIFRDUCBiaW5kIGhhc2ggdGFibGUg
ZW50cmllczogMjA0OCAob3JkZXI6IDQsIDczNzI4IGJ5dGVzKQ0KWyAgICAwLjY1NDI2M10gVENQ
OiBIYXNoIHRhYmxlcyBjb25maWd1cmVkIChlc3RhYmxpc2hlZCAyMDQ4IGJpbmQgMjA0OCkNClsg
ICAgMC42NTQ0OTddIFRDUDogcmVubyByZWdpc3RlcmVkDQpbICAgIDAuNjU0NTMwXSBVRFAgaGFz
aCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAyLCAyMDQ4MCBieXRlcykNClsgICAgMC42NTUw
MTNdIFVEUC1MaXRlIGhhc2ggdGFibGUgZW50cmllczogMjU2IChvcmRlcjogMiwgMjA0ODAgYnl0
ZXMpDQpbICAgIDAuNjU2NTQxXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDENClsg
ICAgMC42NTgzNTFdIFJQQzogUmVnaXN0ZXJlZCBuYW1lZCBVTklYIHNvY2tldCB0cmFuc3BvcnQg
bW9kdWxlLg0KWyAgICAwLjY1ODM3N10gUlBDOiBSZWdpc3RlcmVkIHVkcCB0cmFuc3BvcnQgbW9k
dWxlLg0KWyAgICAwLjY1ODM5MV0gUlBDOiBSZWdpc3RlcmVkIHRjcCB0cmFuc3BvcnQgbW9kdWxl
Lg0KWyAgICAwLjY1ODQwNF0gUlBDOiBSZWdpc3RlcmVkIHRjcCBORlN2NC4xIGJhY2tjaGFubmVs
IHRyYW5zcG9ydCBtb2R1bGUuDQpbICAgIDAuNjYxMDczXSBOZXRXaW5kZXIgRmxvYXRpbmcgUG9p
bnQgRW11bGF0b3IgVjAuOTcgKGRvdWJsZSBwcmVjaXNpb24pDQpbICAgIDAuODU4MjM0XSBWRlM6
IERpc2sgcXVvdGFzIGRxdW90XzYuNS4yDQpbICAgIDAuODU4NTIzXSBEcXVvdC1jYWNoZSBoYXNo
IHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyIDAsIDQwOTYgYnl0ZXMpDQpbICAgIDAuODYxNDE5
XSBORlM6IFJlZ2lzdGVyaW5nIHRoZSBpZF9yZXNvbHZlciBrZXkgdHlwZQ0KWyAgICAwLjg2MTkz
OV0gS2V5IHR5cGUgaWRfcmVzb2x2ZXIgcmVnaXN0ZXJlZA0KWyAgICAwLjg2MTk2M10gS2V5IHR5
cGUgaWRfbGVnYWN5IHJlZ2lzdGVyZWQNClsgICAgMC44NjIxMDddIGpmZnMyOiB2ZXJzaW9uIDIu
Mi4gKE5BTkQpIChTVU1NQVJZKSAgwqkgMjAwMS0yMDA2IFJlZCBIYXQsIEluYy4NClsgICAgMC44
NjI2NTJdIG1zZ21uaSBoYXMgYmVlbiBzZXQgdG8gNDc2DQpbICAgIDAuODY3MDE5XSBpbyBzY2hl
ZHVsZXIgbm9vcCByZWdpc3RlcmVkDQpbICAgIDAuODY3MDUwXSBpbyBzY2hlZHVsZXIgZGVhZGxp
bmUgcmVnaXN0ZXJlZA0KWyAgICAwLjg2NzE1MF0gaW8gc2NoZWR1bGVyIGNmcSByZWdpc3RlcmVk
IChkZWZhdWx0KQ0KWyAgICAwLjg3MTM5Nl0gcGluY3RybC1zaW5nbGUgNDRlMTA4MDAucGlubXV4
OiAxNDIgcGlucyBhdCBwYSBmOWUxMDgwMCBzaXplIDU2OA0KWyAgICAwLjg4NjI5OF0gU2VyaWFs
OiA4MjUwLzE2NTUwIGRyaXZlciwgNCBwb3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZA0KWyAgICAw
Ljg5NTYxNl0gNDRlMDkwMDAuc2VyaWFsOiB0dHlPMCBhdCBNTUlPIDB4NDRlMDkwMDAgKGlycSA9
IDg4LCBiYXNlX2JhdWQgPSAzMDAwMDAwKSBpcyBhIE9NQVAgVUFSVDANClsgICAgMS41MzE1ODdd
IGNvbnNvbGUgW3R0eU8wXSBlbmFibGVkDQpbICAgIDEuNTQxMTA5XSBvbWFwX3JuZyA0ODMxMDAw
MC5ybmc6IE9NQVAgUmFuZG9tIE51bWJlciBHZW5lcmF0b3IgdmVyLiAyMA0KWyAgICAxLjU4MjU2
MF0gYnJkOiBtb2R1bGUgbG9hZGVkDQpbICAgIDEuNjA2ODgzXSBsb29wOiBtb2R1bGUgbG9hZGVk
DQpbICAgIDEuNjE5Njk2XSBtdGRvb3BzOiBtdGQgZGV2aWNlIChtdGRkZXY9bmFtZS9udW1iZXIp
IG11c3QgYmUgc3VwcGxpZWQNClsgICAgMS42MzY2NDddIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3
IGludGVyZmFjZSBkcml2ZXIgYXNpeA0KWyAgICAxLjY0MjgzOF0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBheDg4MTc5XzE3OGENClsgICAgMS42NTAzNDRdIHVzYmNv
cmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgY2RjX2V0aGVyDQpbICAgIDEuNjU3
MzAzXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHI4MTV4DQpbICAg
IDEuNjYzNjA4XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHNtc2M5
NXh4DQpbICAgIDEuNjcwMjY1XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJp
dmVyIG5ldDEwODANClsgICAgMS42NzY4MTddIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVy
ZmFjZSBkcml2ZXIgY2RjX3N1YnNldA0KWyAgICAxLjY4MzQ4OV0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB6YXVydXMNClsgICAgMS42OTAxODVdIHVzYmNvcmU6IHJl
Z2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgY2RjX25jbQ0KWyAgICAxLjcwMDEzN10gZWhj
aV9oY2Q6IFVTQiAyLjAgJ0VuaGFuY2VkJyBIb3N0IENvbnRyb2xsZXIgKEVIQ0kpIERyaXZlcg0K
WyAgICAxLjcwNzMyMV0gZWhjaS1vbWFwOiBPTUFQLUVIQ0kgSG9zdCBDb250cm9sbGVyIGRyaXZl
cg0KWyAgICAxLjcxNTAxN10gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZl
ciBjZGNfd2RtDQpbICAgIDEuNzIxNTIxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZh
Y2UgZHJpdmVyIHVzYi1zdG9yYWdlDQpbICAgIDEuNzI4NzM5XSB1c2Jjb3JlOiByZWdpc3RlcmVk
IG5ldyBpbnRlcmZhY2UgZHJpdmVyIHVzYnRlc3QNClsgICAgMS43MzczMjVdIG1vdXNlZGV2OiBQ
Uy8yIG1vdXNlIGRldmljZSBjb21tb24gZm9yIGFsbCBtaWNlDQpbICAgIDEuNzUwMjY1XSBvbWFw
X3J0YyA0NGUzZTAwMC5ydGM6IHJ0YyBjb3JlOiByZWdpc3RlcmVkIDQ0ZTNlMDAwLnJ0YyBhcyBy
dGMwDQpbICAgIDEuNzU4MDAxXSA0NGUzZTAwMC5ydGM6IGFscmVhZHkgcnVubmluZw0KWyAgICAx
Ljc2Mzc4OF0gaTJjIC9kZXYgZW50cmllcyBkcml2ZXINClsgICAgMS43Njg0NTFdIERyaXZlciBm
b3IgMS13aXJlIERhbGxhcyBuZXR3b3JrIHByb3RvY29sLg0KWyAgICAxLjc3OTgwMF0gb21hcF93
ZHQ6IE9NQVAgV2F0Y2hkb2cgVGltZXIgUmV2IDB4MDE6IGluaXRpYWwgdGltZW91dCA2MCBzZWMN
ClsgICAgMS43OTE1MDFdIGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUuMDogYWxsb2Nh
dGVkIGNoYW5uZWwgZm9yIDA6MjUNClsgICAgMS43OTg5MzddIGVkbWEtZG1hLWVuZ2luZSBlZG1h
LWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNoYW5uZWwgZm9yIDA6MjQNClsgICAgMS44MDYyOTFd
IG9tYXBfaHNtbWMgNDgwNjAwMDAubW1jOiB2bW1jIHJlZ3VsYXRvciBtaXNzaW5nDQpbICAgIDEu
ODEyNDkwXSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IGZyZWVpbmcgY2hhbm5l
bCBmb3IgMjQNClsgICAgMS44MTkzMzldIGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUu
MDogZnJlZWluZyBjaGFubmVsIGZvciAyNQ0KWyAgICAxLjgyNjI2Nl0gcGxhdGZvcm0gNDgwNjAw
MDAubW1jOiBEcml2ZXIgb21hcF9oc21tYyByZXF1ZXN0cyBwcm9iZSBkZWZlcnJhbA0KWyAgICAx
Ljg0MTAwNF0gbGVkdHJpZy1jcHU6IHJlZ2lzdGVyZWQgdG8gaW5kaWNhdGUgYWN0aXZpdHkgb24g
Q1BVcw0KWyAgICAxLjg0OTE5M10gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRy
aXZlciB1c2JoaWQNClsgICAgMS44NTUxMzddIHVzYmhpZDogVVNCIEhJRCBjb3JlIGRyaXZlcg0K
WyAgICAxLjg2MjU1MF0gb3Byb2ZpbGU6IG5vIHBlcmZvcm1hbmNlIGNvdW50ZXJzDQpbICAgIDEu
ODcwNDQ4XSBvcHJvZmlsZTogdXNpbmcgdGltZXIgaW50ZXJydXB0Lg0KWyAgICAxLjg3NjAxMl0g
VENQOiBjdWJpYyByZWdpc3RlcmVkDQpbICAgIDEuODc5NTA1XSBJbml0aWFsaXppbmcgWEZSTSBu
ZXRsaW5rIHNvY2tldA0KWyAgICAxLjg4NDEyNV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZh
bWlseSAxNw0KWyAgICAxLjg4ODk3OV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAx
NQ0KWyAgICAxLjg5NDA2N10gS2V5IHR5cGUgZG5zX3Jlc29sdmVyIHJlZ2lzdGVyZWQNClsgICAg
MS44OTg3NTZdIFRodW1iRUUgQ1BVIGV4dGVuc2lvbiBzdXBwb3J0ZWQuDQpbICAgIDEuOTE3MTk5
XSB0cHM2NTkxMCAwLTAwMmQ6IE5vIGludGVycnVwdCBzdXBwb3J0LCBubyBjb3JlIElSUQ0KWyAg
ICAxLjkzMTAyM10gdnJ0YzogMTgwMCBtViANClsgICAgMS45MzQzNjBdIHZydGM6IHN1cHBsaWVk
IGJ5IHZiYXQNClsgICAgMS45NDE3MDRdIHZpbzogYXQgMTUwMCBtViANClsgICAgMS45NDUxMTNd
IHZpbzogc3VwcGxpZWQgYnkgdmJhdA0KWyAgICAxLjk1MjE0NV0gdmRkX21wdTogOTEyIDwtLT4g
MTMxMiBtViBhdCAxMTM3IG1WIA0KWyAgICAxLjk1NzM4N10gdmRkX21wdTogc3VwcGxpZWQgYnkg
dmJhdA0KWyAgICAxLjk2NDYyOV0gdmRkX2NvcmU6IDkxMiA8LS0+IDExNTAgbVYgYXQgMTEzNyBt
ViANClsgICAgMS45NzAwMThdIHZkZF9jb3JlOiBzdXBwbGllZCBieSB2YmF0DQpbICAgIDEuOTc2
OTA0XSB2ZGQzOiA1MDAwIG1WIA0KWyAgICAxLjk4MjQyMl0gdmRpZzE6IGF0IDE4MDAgbVYgDQpb
ICAgIDEuOTg1OTg5XSB2ZGlnMTogc3VwcGxpZWQgYnkgdmJhdA0KWyAgICAxLjk5MjU1MV0gdmRp
ZzI6IGF0IDE4MDAgbVYgDQpbICAgIDEuOTk2MDQ1XSB2ZGlnMjogc3VwcGxpZWQgYnkgdmJhdA0K
WyAgICAyLjAwMjYyOV0gdnBsbDogYXQgMTgwMCBtViANClsgICAgMi4wMDY0MjVdIHZwbGw6IHN1
cHBsaWVkIGJ5IHZiYXQNClsgICAgMi4wMTMzNDFdIHZkYWM6IGF0IDE4MDAgbVYgDQpbICAgIDIu
MDE2Nzk5XSB2ZGFjOiBzdXBwbGllZCBieSB2YmF0DQpbICAgIDIuMDIzMzQ2XSB2YXV4MTogYXQg
MTgwMCBtViANClsgICAgMi4wMjY5MDVdIHZhdXgxOiBzdXBwbGllZCBieSB2YmF0DQpbICAgIDIu
MDMzNDg4XSB2YXV4MjogYXQgMzMwMCBtViANClsgICAgMi4wMzcwMDddIHZhdXgyOiBzdXBwbGll
ZCBieSB2YmF0DQpbICAgIDIuMDQzNTY5XSB2YXV4MzM6IGF0IDMzMDAgbVYgDQpbICAgIDIuMDQ4
MDEzXSB2YXV4MzM6IHN1cHBsaWVkIGJ5IHZiYXQNClsgICAgMi4wNTU2NDBdIHZtbWM6IDE4MDAg
PC0tPiAzMzAwIG1WIGF0IDMzMDAgbVYgDQpbICAgIDIuMDYwNTk2XSB2bW1jOiBzdXBwbGllZCBi
eSB2YmF0DQpbICAgIDIuMDY5ODAwXSBvbWFwX2kyYyA0NGUwYjAwMC5pMmM6IGJ1cyAwIHJldjAu
MTEgYXQgNDAwIGtIeg0KWyAgICAyLjA3NzI1Nl0gZWRtYS1kbWEtZW5naW5lIGVkbWEtZG1hLWVu
Z2luZS4wOiBhbGxvY2F0ZWQgY2hhbm5lbCBmb3IgMDoyNQ0KWyAgICAyLjA4NDQzMl0gZWRtYS1k
bWEtZW5naW5lIGVkbWEtZG1hLWVuZ2luZS4wOiBhbGxvY2F0ZWQgY2hhbm5lbCBmb3IgMDoyNA0K
WyAgICAyLjA5Mjk4Nl0gb21hcF9oc21tYyA0ODA2MDAwMC5tbWM6IHBpbnMgYXJlIG5vdCBjb25m
aWd1cmVkIGZyb20gdGhlIGRyaXZlcg0KWyAgICAyLjIwNDkwNF0gZGF2aW5jaV9tZGlvIDRhMTAx
MDAwLm1kaW86IGRhdmluY2kgbWRpbyByZXZpc2lvbiAxLjYNClsgICAgMi4yMTEzMzFdIGRhdmlu
Y2lfbWRpbyA0YTEwMTAwMC5tZGlvOiBkZXRlY3RlZCBwaHkgbWFzayBmZmZmZmZmYw0KWyAgICAy
LjIyMzAxOV0gbGlicGh5OiA0YTEwMTAwMC5tZGlvOiBwcm9iZWQNClsgICAgMi4yMjc0MTZdIGRh
dmluY2lfbWRpbyA0YTEwMTAwMC5tZGlvOiBwaHlbMF06IGRldmljZSA0YTEwMTAwMC5tZGlvOjAw
LCBkcml2ZXIgQXRoZXJvcyA4MDMxIGV0aGVybmV0DQpbICAgIDIuMjM3NTU0XSBkYXZpbmNpX21k
aW8gNGExMDEwMDAubWRpbzogcGh5WzFdOiBkZXZpY2UgNGExMDEwMDAubWRpbzowMSwgZHJpdmVy
IEF0aGVyb3MgODAzMSBldGhlcm5ldA0KWyAgICAyLjI0NzY4Nl0gRGV0ZWN0ZWQgTUFDSUQgPSBk
NDo5NDphMTo4Mzo0ZDphNw0KWyAgICAyLjI2MDcyNF0gaW5wdXQ6IGdwaW9fYnV0dG9ucy43IGFz
IC9kZXZpY2VzL2dwaW9fYnV0dG9ucy43L2lucHV0L2lucHV0MA0KWyAgICAyLjI3MjMyNV0gb21h
cF9ydGMgNDRlM2UwMDAucnRjOiBzZXR0aW5nIHN5c3RlbSBjbG9jayB0byAyMDEzLTEwLTA3IDE3
OjU3OjM1IFVUQyAoMTM4MTE2ODY1NSkNClsgICAgMi4yODYxNDBdIFdhaXRpbmcgZm9yIHJvb3Qg
ZGV2aWNlIC9kZXYvbW1jYmxrMHAyLi4uDQpbICAgIDIuMjk0NjYzXSBtbWMwOiBob3N0IGRvZXMg
bm90IHN1cHBvcnQgcmVhZGluZyByZWFkLW9ubHkgc3dpdGNoLiBhc3N1bWluZyB3cml0ZS1lbmFi
bGUuDQpbICAgIDIuMzA2NjQzXSBtbWMwOiBuZXcgaGlnaCBzcGVlZCBTREhDIGNhcmQgYXQgYWRk
cmVzcyBhYWFhDQpbICAgIDIuMzE1NzI2XSBtbWNibGswOiBtbWMwOmFhYWEgU1UwOEcgNy40MCBH
aUIgDQpbICAgIDIuMzI2NjEwXSAgbW1jYmxrMDogcDEgcDINClsgICAgMi40MDE5MzhdIEVYVDQt
ZnMgKG1tY2JsazBwMik6IElORk86IHJlY292ZXJ5IHJlcXVpcmVkIG9uIHJlYWRvbmx5IGZpbGVz
eXN0ZW0NClsgICAgMi40MDk4MjVdIEVYVDQtZnMgKG1tY2JsazBwMik6IHdyaXRlIGFjY2VzcyB3
aWxsIGJlIGVuYWJsZWQgZHVyaW5nIHJlY292ZXJ5DQpbICAgIDIuNjIyMzk3XSBFWFQ0LWZzICht
bWNibGswcDIpOiByZWNvdmVyeSBjb21wbGV0ZQ0KWyAgICAyLjYzNjMzM10gRVhUNC1mcyAobW1j
YmxrMHAyKTogbW91bnRlZCBmaWxlc3lzdGVtIHdpdGggb3JkZXJlZCBkYXRhIG1vZGUuIE9wdHM6
IChudWxsKQ0KWyAgICAyLjY0NTExNl0gVkZTOiBNb3VudGVkIHJvb3QgKGV4dDQgZmlsZXN5c3Rl
bSkgcmVhZG9ubHkgb24gZGV2aWNlIDE3OToyLg0KWyAgICAyLjY2MjM1M10gZGV2dG1wZnM6IG1v
dW50ZWQNClsgICAgMi42NjY0NzNdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBtZW1vcnk6IDQxNksg
KGMwN2NjMDAwIC0gYzA4MzQwMDApDQoNSU5JVDogdmVyc2lvbiAyLjg4IGJvb3RpbmcNDQpFcnJv
ciBvcGVuaW5nIC9kZXYvZmIwOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpTdGFydGluZyB1
ZGV2DQpbICAgIDMuNTY3OTkzXSB1ZGV2ZFs3MzRdOiBzdGFydGluZyB2ZXJzaW9uIDE4Mg0KU3Rh
cnRpbmcgQm9vdGxvZyBkYWVtb246IGJvb3Rsb2dkOiBjYW5ub3QgYWxsb2NhdGUgcHNldWRvIHR0
eTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KYm9vdGxvZ2QuDQpbICAgIDQuNjczMDYxXSBF
WFQ0LWZzIChtbWNibGswcDIpOiByZS1tb3VudGVkLiBPcHRzOiBkYXRhPW9yZGVyZWQNCkFMU0E6
IFJlc3RvcmluZyBtaXhlciBzZXR0aW5ncy4uLg0KL3Vzci9zYmluL2Fsc2FjdGw6IGxvYWRfc3Rh
dGU6MTcyOTogTm8gc291bmRjYXJkcyBmb3VuZC4uLg0KQ29uZmlndXJpbmcgbmV0d29yayBpbnRl
cmZhY2VzLi4uIFsgICAgNi4xMzgyNzRdIG5ldCBldGgwOiBpbml0aWFsaXppbmcgY3BzdyB2ZXJz
aW9uIDEuMTIgKDApDQpbICAgIDYuMTQ2NDMxXSBuZXQgZXRoMDogcGh5IGZvdW5kIDogaWQgaXMg
OiAweDRkZDA3NA0KWyAgICA2LjE1MjAxNF0gbmV0IGV0aDA6IHBoeSBmb3VuZCA6IGlkIGlzIDog
MHg0ZGQwNzQNCnVkaGNwYyAodjEuMjEuMSkgc3RhcnRlZA0KU2VuZGluZyBkaXNjb3Zlci4uLg0K
WyAgICA4LjE0NTcxNl0gbGlicGh5OiA0YTEwMTAwMC5tZGlvOjAxIC0gTGluayBpcyBVcCAtIDAv
SGFsZg0KWyAgICA4LjE1MjM4NV0gbGlicGh5OiA0YTEwMTAwMC5tZGlvOjAxIC0gTGluayBpcyBE
b3duDQpTZW5kaW5nIGRpc2NvdmVyLi4uDQpbICAgMTEuMTU1NjI5XSBsaWJwaHk6IDRhMTAxMDAw
Lm1kaW86MDEgLSBMaW5rIGlzIFVwIC0gMTAwMC9GdWxsDQpTZW5kaW5nIGRpc2NvdmVyLi4uDQpO
byBsZWFzZSwgZmFpbGluZw0KU3RhcnRpbmcgcnBjYmluZCBkYWVtb24uLi5ycGNiaW5kOiBjYW5u
b3QgY3JlYXRlIHNvY2tldCBmb3IgdWRwNg0NCnJwY2JpbmQ6IGNhbm5vdCBjcmVhdGUgc29ja2V0
IGZvciB0Y3A2DQ0KZG9uZS4NCg1JTklUOiBFbnRlcmluZyBydW5sZXZlbDogNQ0NClN0YXJ0aW5n
IHN5c3RlbSBtZXNzYWdlIGJ1czogZGJ1cy4NClN0YXJ0aW5nIGFkdmFuY2VkIHBvd2VyIG1hbmFn
ZW1lbnQgZGFlbW9uOiBObyBBUE0gc3VwcG9ydCBpbiBrZXJuZWwNCihmYWlsZWQuKQ0KU3RhcnRp
bmcgc3lzbG9nZC9rbG9nZDogZG9uZQ0KICogU3RhcnRpbmcgQXZhaGkgbUROUy9ETlMtU0QgRGFl
bW9uOiBhdmFoaS1kYWVtb24NCiAgIC4uLmRvbmUuDQpTdGFydGluZyBUZWxlcGhvbnkgZGFlbW9u
DQpTdGFydGluZyBMaW51eCBORkMgZGFlbW9uDQovZXRjL3JjNS5kL1M5NmFtMzM1eC1wbS1maXJt
d2FyZS1sb2FkOiBsaW5lIDQ6IC9zeXMvZGV2aWNlcy9vY3AuMi80NGQwMDAwMC53a3VwX20zL2Zp
cm13YXJlL2FtMzM1eC1wbS1maXJtd2FyZS5iaW4vbG9hZGluZzogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQ0KL2V0Yy9yYzUuZC9TOTZhbTMzNXgtcG0tZmlybXdhcmUtbG9hZDogbGluZSA1OiAv
c3lzL2RldmljZXMvb2NwLjIvNDRkMDAwMDAud2t1cF9tMy9maXJtd2FyZS9hbTMzNXgtcG0tZmly
bXdhcmUuYmluL2RhdGE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCi9ldGMvcmM1LmQvUzk2
YW0zMzV4LXBtLWZpcm13YXJlLWxvYWQ6IGxpbmUgNjogL3N5cy9kZXZpY2VzL29jcC4yLzQ0ZDAw
MDAwLndrdXBfbTMvZmlybXdhcmUvYW0zMzV4LXBtLWZpcm13YXJlLmJpbi9sb2FkaW5nOiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpTdG9wcGluZyBCb290bG9nIGRhZW1vbjogYm9vdGxvZ2Qu
DQpTdGFydGluZyB0Y2YtYWdlbnQ6IE9LDQoNDQpQb2t5IChZb2N0byBQcm9qZWN0IFJlZmVyZW5j
ZSBEaXN0cm8pIDEuNSBhbTMzNXgtZXZtIC9kZXYvdHR5TzANCg0NCg1hbTMzNXgtZXZtIGxvZ2lu
OiA=

--_002_7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9USNYGRMBX4raymo_--
