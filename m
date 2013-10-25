Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4002EE0176D
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 05:07:58 -0700 (PDT)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id r9PC7tJd011514
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2013 07:07:55 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.106]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Fri, 25 Oct 2013 08:07:33
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "rstreif@linuxfoundation.org"
	<rstreif@linuxfoundation.org>
Thread-Topic: [meta-ti] AM335x EVM and core-image-sato
Thread-Index: AQHOz3YCLi+stx+MBUi9/IGvCrfrc5oBpl+AgAABzQCAANOOYoAC2ngY
Date: Fri, 25 Oct 2013 12:07:32 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA00009@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
	<20131022222813.GA9802@edge>,
	<CA+gsK-oiA9pOpFrietcPdF-qLYH6Uzv0OHmYYyzXS0Lk9Yy7ZA@mail.gmail.com>,
	<B0581B5571079145BA1CD78C126DBDE72E903AFC@DLEE08.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9@USNYGRMBX4.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FFAB9@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.203]
MIME-Version: 1.0
X-MessageScreenMessageID: 1382702878.331759.1642.3521708039
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
X-List-Received-Date: Fri, 25 Oct 2013 12:07:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

This is the commit of meta-ti that works with the AM335x-SK.

meta-ti           =3D "(nobranch):b739286d690bdaada952a2376bd7aa1ba221bad=
d"

-Josh
________________________________________
From: Vanderpool Josh
Sent: Wednesday, October 23, 2013 12:32 PM
To: Dmytriyenko, Denys; rstreif@linuxfoundation.org
Cc: meta-ti@yoctoproject.org
Subject: RE: [meta-ti] AM335x EVM and core-image-sato

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




