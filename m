Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAB3EE01742
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 12:52:16 -0700 (PDT)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id r9MJqFSl013912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 14:52:16 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.106]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Tue, 22 Oct 2013 15:52:15
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: AM335x-SK kernel panic with Poky(master), meta-ti(master)
	core-image-base
Thread-Index: AQHOz2A0knrytU1jG0OKE/IlDrI4uA==
Date: Tue, 22 Oct 2013 19:52:13 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.203]
MIME-Version: 1.0
X-MessageScreenMessageID: 1382471536.214677.1642.2317156362
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Subject: Re: AM335x-SK kernel panic with Poky(master), meta-ti(master) core-image-base
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
X-List-Received-Date: Tue, 22 Oct 2013 19:52:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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
ction of this message by unintended recipients is=20
not authorized and may be unlawful.




