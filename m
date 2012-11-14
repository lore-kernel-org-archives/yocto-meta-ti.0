Return-Path: <flavio.alves@gmail.com>
Received: from mail-ia0-f176.google.com (mail-ia0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0E18E0142C
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 17:10:31 -0800 (PST)
Received: by mail-ia0-f176.google.com with SMTP id h11so6496437iae.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 17:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6OjU+CO+cBkroXsEGHtN0+b8AOVbg4YoRgMORY3I82M=;
	b=l1ZvkmIbUFB+maSTx0x9MaEcHPPfSj8jiWpxxU+LOClkPV4fBZMli3qrCEjlzDmHis
	+SBbXsDJQ9Tw18G51vkHuJ5ZIbE1I8wNEHzGJSwJz/tXvT9jkoLuSy3926bj8/pEAfk+
	CTAaSJwfjS1C/98l3OZBcw8rWn90nS7yCr8tf7gi6Nxj8E+qpDrRFLQbZJGI92WL8qz9
	13fDjWzA3ls8bCdttTjdZgaQqvX+QiR/6vv3WE1PaA1otovfUIkECeVeFEXY5L8KUshf
	/ahbESJJEduE7Pul1Iee7BhkxsHPnvmOtQy1WVwqu+ysUg9V9bQUD44jQcIC8kNStmBc
	OLgA==
MIME-Version: 1.0
Received: by 10.50.0.180 with SMTP id 20mr362235igf.43.1352855431147; Tue, 13
	Nov 2012 17:10:31 -0800 (PST)
Received: by 10.42.24.212 with HTTP; Tue, 13 Nov 2012 17:10:31 -0800 (PST)
In-Reply-To: <50A2C0E8.9030300@r-finger.com>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
	<20121113154444.GB12650@edge>
	<CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
	<50A2C0E8.9030300@r-finger.com>
Date: Tue, 13 Nov 2012 23:10:31 -0200
Message-ID: <CAFNBftdZC1BUCUA+zonbgkFshzft=ba=BYyTBKFKTXBOo_DVsA@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Wed, 14 Nov 2012 01:10:32 -0000
Content-Type: multipart/alternative; boundary=e89a8f502fae67ef4e04ce6a337d

--e89a8f502fae67ef4e04ce6a337d
Content-Type: text/plain; charset=ISO-8859-1

2012/11/13 Tomas Frydrych <tf+lists.yocto@r-finger.com>

> On 13/11/12 21:25, Flavio Castro Alves Filho wrote:
> > 2012/11/13 Denys Dmytriyenko <denys@ti.com>
> >>>>> Why can't you put meta-ti in front of meta-yocto in Denzil? Works
> >> just fine.
> >
> > I did that here and it doens't work.
>
> As I explained earlier, for Denzil the order makes no real difference.
> Just delete meta-yocto/conf/machine/beagleboard.conf.
>

I did this and it worked.


>
> But this has been all sorted out in the Danny release by splitting out
> the bsp stuff into meta-yocto-bsp; if you are creating a new set up you
> would be better to use Danny anyway.
>
> Tomas
>
> --
> http://sleepfive.com
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>


Now I'm facing a compilation issue in ti-dsplink recipe. It's a compilation
issue.

Here it is the error message (sorry for the bad log. I had to use external
access using a putty on Windows this time).

/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_ringio.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/.
>/dev/null
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
"" "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_ringio.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_mpcs.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/.
>/dev/null
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
"" "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_mpcs.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_mpcs_os.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/.
>/dev/null
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
"" "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_mpcs_os.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_mplist.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/.
>/dev/null
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
"" "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_mplist.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_pool.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/.
>/dev/null
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
"" "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_pool.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_notify.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/.
>/dev/null
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
"" "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/_notify.h
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal
>/dev/null
| [API                 ] ------- OBJECT ---------------- DEBUG
--------------
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api"
"make -C
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api
-f
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/Linux/OMAP3530/
compile.mk objdeb VERBOSE=0" ""
| make[1]: Entering directory
`/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api'
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD"
""  "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD"
| echo Fetching the configuration file CFG_OMAP3530_SHMEM.c ...
| Fetching the configuration file CFG_OMAP3530_SHMEM.c ...
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/all/CFG_OMAP3530_SHMEM.c
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD/.
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD"
""  "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD"
| echo Fetching the configuration file CFG_Linux.c ...
| Fetching the configuration file CFG_Linux.c ...
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/all/CFG_Linux.c
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD/.
| /usr/bin/perl
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/
runif.pl LINUX "exist
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD"
""  "mkdir -p
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD"
| echo Fetching the configuration file CFG_ARM.c ...
| Fetching the configuration file CFG_ARM.c ...
| cp
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/all/CFG_ARM.c
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD/.
| echo Compiling CFG_system.c...
| Compiling CFG_system.c...
| /arm-poky-linux-gnueabi-gcc -g -DOS_LINUX -DMAX_DSPS=1 -DMAX_PROCESSORS=2
-DID_GPP=1 -DOMAP3530 -DPROC_COMPONENT -DPOOL_COMPONENT -DNOTIFY_COMPONENT
-DMPCS_COMPONENT -DRINGIO_COMPONENT -DMPLIST_COMPONENT -DMSGQ_COMPONENT
-DMSGQ_ZCPY_LINK -DCHNL_COMPONENT -DCHNL_ZCPY_LINK -DZCPY_LINK
-DKFILE_DEFAULT -DOMAP3530 -DOMAP3530_PHYINTERFACE=SHMEM_INTERFACE
-DGPP_SWI_MODE
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/inc
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/inc/usr
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/inc/sys/Linux
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/inc/sys/Linux/2.6.18
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/Linux
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gERROR:
Function failed: do_compile (see
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/temp/log.do_compile.4141
for further information)
|
nueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api/Linux/2.6.18
-I/home/flavio/toolchains/git/arm-2009q1-203/arm-none-linux-gnueabi/libc/usr/include
-I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER
-I/home/flavio/toolchains/git/arm-2009q1-203/arm-none-linux-gnueabi/libc/usr/include
-Wall -c   -D_REENTRANT -DTRACE_USER -DDDSP_DEBUG
-DKBUILD_BASENAME=CFG_system
-o/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/API/OBJ/DEBUG/CFG_system.o
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD/CFG_system.c
| make[1]: /arm-poky-linux-gnueabi-gcc: Command not found
| make[1]: ***
[/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD/CFG_system.c.deb]
Error 127
| make[1]: Leaving directory
`/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api'
| make: *** [objdeb] Error 2
NOTE: package ti-dsplink-1_1_65_00_03-r121j: task do_compile: Failed
ERROR: Task 256 (/home/prjs/tk0001/philinux/meta-ti/recipes-ti/dsplink/
ti-dsplink_1.65.00.03.bb, do_compile) failed with exit code '1'
Waiting for 1 running tasks to finish:
0: ti-linuxutils-1_2_26_01_02-r121e do_make_scripts (pid 4142)
NOTE: package ti-linuxutils-1_2_26_01_02-r121e: task do_make_scripts:
Succeeded
NOTE: Tasks Summary: Attempted 670 tasks of which 668 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /home/prjs/tk0001/philinux/meta-ti/recipes-ti/dsplink/
ti-dsplink_1.65.00.03.bb, do_compile
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

I'm using Ubuntu 12.04 to build. Is it a problem? Should I need some
special configuration in my Ubuntu in order to have it working?

Best regards,

Flavio

-- 
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

--e89a8f502fae67ef4e04ce6a337d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2012/11/1=
3 Tomas Frydrych <span dir=3D"ltr">&lt;<a href=3D"mailto:tf+lists.yocto@r-f=
inger.com" target=3D"_blank">tf+lists.yocto@r-finger.com</a>&gt;</span><br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
On 13/11/12 21:25, Flavio Castro Alves Filho wrote:<br>
<div class=3D"im">&gt; 2012/11/13 Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enys@ti.com">denys@ti.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; Why can&#39;t you put meta-ti in front of meta-yocto i=
n Denzil? Works<br>
&gt;&gt; just fine.<br>
&gt;<br>
&gt; I did that here and it doens&#39;t work.<br>
<br>
</div>As I explained earlier, for Denzil the order makes no real difference=
.<br>
Just delete meta-yocto/conf/machine/beagleboard.conf.<br></blockquote><div>=
<br>I did this and it worked.<br>=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">

<br>
But this has been all sorted out in the Danny release by splitting out<br>
the bsp stuff into meta-yocto-bsp; if you are creating a new set up you<br>
would be better to use Danny anyway.<br>
<span class=3D""><font color=3D"#888888"><br>
Tomas<br>
<br>
--<br>
<a href=3D"http://sleepfive.com" target=3D"_blank">http://sleepfive.com</a>=
<br>
</font></span><div class=3D""><div class=3D"h5">___________________________=
____________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br><br>Now I&#39;m facing a compilation iss=
ue in ti-dsplink recipe. It&#39;s a compilation issue.<br><br>Here it is th=
e error message (sorry for the bad log. I had to use external access using =
a putty on Windows this time).<br>
<br>/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_l=
inux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0 &gt;/=
dev/null<br>| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/b=
eagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1=
_65_00_03/dsplink/gpp/src/api/_ringio.h /home/prjs/tk0001/philinux/philinux=
-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_0=
3-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/. &gt;/dev/=
null<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot; &quot;&quot; &q=
uot;mkdir -p /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagl=
eboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_=
00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot;<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_ringio.h /home/prjs/tk0001/philinux/philinux-beagleboard=
/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dspl=
ink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0 =
&gt;/dev/null<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_mpcs.h /home/prjs/tk0001/philinux/philinux-beagleboard/t=
mp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplin=
k_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/. &gt;/dev/null<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot; &quot;&quot; &q=
uot;mkdir -p /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagl=
eboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_=
00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot;<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_mpcs.h /home/prjs/tk0001/philinux/philinux-beagleboard/t=
mp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplin=
k_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0 &g=
t;/dev/null<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_mpcs_os.h /home/prjs/tk0001/philinux/philinux-beagleboar=
d/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsp=
link_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/. &gt;/dev/null<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot; &quot;&quot; &q=
uot;mkdir -p /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagl=
eboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_=
00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot;<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_mpcs_os.h /home/prjs/tk0001/philinux/philinux-beagleboar=
d/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsp=
link_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0=
 &gt;/dev/null<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_mplist.h /home/prjs/tk0001/philinux/philinux-beagleboard=
/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dspl=
ink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/. &gt;/dev/null<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot; &quot;&quot; &q=
uot;mkdir -p /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagl=
eboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_=
00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot;<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_mplist.h /home/prjs/tk0001/philinux/philinux-beagleboard=
/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dspl=
ink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0 =
&gt;/dev/null<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_pool.h /home/prjs/tk0001/philinux/philinux-beagleboard/t=
mp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplin=
k_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/. &gt;/dev/null<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot; &quot;&quot; &q=
uot;mkdir -p /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagl=
eboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_=
00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot;<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_pool.h /home/prjs/tk0001/philinux/philinux-beagleboard/t=
mp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplin=
k_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0 &g=
t;/dev/null<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_notify.h /home/prjs/tk0001/philinux/philinux-beagleboard=
/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dspl=
ink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER/. &gt;/dev/null<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot; &quot;&quot; &q=
uot;mkdir -p /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagl=
eboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_=
00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal&quot;<br>
| cp /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/src/api/_notify.h /home/prjs/tk0001/philinux/philinux-beagleboard=
/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dspl=
ink_linux_1_65_00_03/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal=A0 =
&gt;/dev/null<br>
| [API=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ] ------- OBJECT ---=
------------- DEBUG --------------<br>| /usr/bin/perl /home/prjs/tk0001/phi=
linux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/bin/<a href=3D"=
http://runif.pl">runif.pl</a> LINUX &quot;exist /home/prjs/tk0001/philinux/=
philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1=
_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/src/api&quot; &quot;ma=
ke -C /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-=
poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/d=
splink/gpp/src/api -f=A0 /home/prjs/tk0001/philinux/philinux-beagleboard/tm=
p/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink=
_linux_1_65_00_03/dsplink/make/Linux/OMAP3530/<a href=3D"http://compile.mk"=
>compile.mk</a> objdeb VERBOSE=3D0&quot; &quot;&quot;<br>
| make[1]: Entering directory `/home/prjs/tk0001/philinux/philinux-beaglebo=
ard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/d=
splink_linux_1_65_00_03/dsplink/gpp/src/api&#39;<br>| /usr/bin/perl /home/p=
rjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gn=
ueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/make/b=
in/<a href=3D"http://runif.pl">runif.pl</a> LINUX &quot;exist /home/prjs/tk=
0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/=
ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD=
&quot; &quot;&quot;=A0 &quot;mkdir -p /home/prjs/tk0001/philinux/philinux-b=
eagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-=
r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD&quot;<br>
| echo Fetching the configuration file CFG_OMAP3530_SHMEM.c ...<br>| Fetchi=
ng the configuration file CFG_OMAP3530_SHMEM.c ...<br>| cp /home/prjs/tk000=
1/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-=
dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/all/CFG_=
OMAP3530_SHMEM.c=A0 /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/wor=
k/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linu=
x_1_65_00_03/dsplink/config/BUILD/.<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/config/BUILD&quot; &quot;&quot;=A0 &quot;mkdir -p /home/prjs/tk0=
001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/t=
i-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD&=
quot;<br>
| echo Fetching the configuration file CFG_Linux.c ...<br>| Fetching the co=
nfiguration file CFG_Linux.c ...<br>| cp /home/prjs/tk0001/philinux/philinu=
x-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_=
03-r121j/dsplink_linux_1_65_00_03/dsplink/config/all/CFG_Linux.c=A0 /home/p=
rjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gn=
ueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config=
/BUILD/.<br>
| /usr/bin/perl /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_=
65_00_03/dsplink/make/bin/<a href=3D"http://runif.pl">runif.pl</a> LINUX &q=
uot;exist /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/config/BUILD&quot; &quot;&quot;=A0 &quot;mkdir -p /home/prjs/tk0=
001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/t=
i-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD&=
quot;<br>
| echo Fetching the configuration file CFG_ARM.c ...<br>| Fetching the conf=
iguration file CFG_ARM.c ...<br>| cp /home/prjs/tk0001/philinux/philinux-be=
agleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r=
121j/dsplink_linux_1_65_00_03/dsplink/config/all/CFG_ARM.c=A0 /home/prjs/tk=
0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/=
ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD=
/.<br>
| echo Compiling CFG_system.c...<br>| Compiling CFG_system.c...<br>| /arm-p=
oky-linux-gnueabi-gcc -g -DOS_LINUX -DMAX_DSPS=3D1 -DMAX_PROCESSORS=3D2 -DI=
D_GPP=3D1 -DOMAP3530 -DPROC_COMPONENT -DPOOL_COMPONENT -DNOTIFY_COMPONENT -=
DMPCS_COMPONENT -DRINGIO_COMPONENT -DMPLIST_COMPONENT -DMSGQ_COMPONENT -DMS=
GQ_ZCPY_LINK -DCHNL_COMPONENT -DCHNL_ZCPY_LINK -DZCPY_LINK -DKFILE_DEFAULT =
-DOMAP3530 -DOMAP3530_PHYINTERFACE=3DSHMEM_INTERFACE -DGPP_SWI_MODE -I/home=
/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-=
gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/=
inc -I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-=
poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/d=
splink/gpp/inc/usr -I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/wo=
rk/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_lin=
ux_1_65_00_03/dsplink/gpp/inc/sys/Linux -I/home/prjs/tk0001/philinux/philin=
ux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00=
_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/inc/sys/Linux/2.6.18 -I/home=
/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-=
gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp/=
src/api -I/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beaglebo=
ard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_=
03/dsplink/gpp/src/api/Linux -I/home/prjs/tk0001/philinux/philinux-beaglebo=
ard/tmp/work/beagleboard-poky-linux-gERROR: Function failed: do_compile (se=
e /home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky=
-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/temp/log.do_compile.4141 for f=
urther information)<br>
| nueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dsplink/gpp=
/src/api/Linux/2.6.18 -I/home/flavio/toolchains/git/arm-2009q1-203/arm-none=
-linux-gnueabi/libc/usr/include -I/home/prjs/tk0001/philinux/philinux-beagl=
eboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121=
j/dsplink_linux_1_65_00_03/dsplink/gpp/BUILD/INCLUDE/USER -I/home/flavio/to=
olchains/git/arm-2009q1-203/arm-none-linux-gnueabi/libc/usr/include -Wall -=
c=A0=A0 -D_REENTRANT -DTRACE_USER -DDDSP_DEBUG -DKBUILD_BASENAME=3DCFG_syst=
em -o/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-p=
oky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/ds=
plink/gpp/BUILD/API/OBJ/DEBUG/CFG_system.o /home/prjs/tk0001/philinux/phili=
nux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_0=
0_03-r121j/dsplink_linux_1_65_00_03/dsplink/config/BUILD/CFG_system.c<br>
| make[1]: /arm-poky-linux-gnueabi-gcc: Command not found<br>| make[1]: ***=
 [/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky=
-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/dsplink_linux_1_65_00_03/dspli=
nk/config/BUILD/CFG_system.c.deb] Error 127<br>
| make[1]: Leaving directory `/home/prjs/tk0001/philinux/philinux-beagleboa=
rd/tmp/work/beagleboard-poky-linux-gnueabi/ti-dsplink-1_1_65_00_03-r121j/ds=
plink_linux_1_65_00_03/dsplink/gpp/src/api&#39;<br>| make: *** [objdeb] Err=
or 2<br>
NOTE: package ti-dsplink-1_1_65_00_03-r121j: task do_compile: Failed<br>ERR=
OR: Task 256 (/home/prjs/tk0001/philinux/meta-ti/recipes-ti/dsplink/<a href=
=3D"http://ti-dsplink_1.65.00.03.bb">ti-dsplink_1.65.00.03.bb</a>, do_compi=
le) failed with exit code &#39;1&#39;<br>
Waiting for 1 running tasks to finish:<br>0: ti-linuxutils-1_2_26_01_02-r12=
1e do_make_scripts (pid 4142)<br>NOTE: package ti-linuxutils-1_2_26_01_02-r=
121e: task do_make_scripts: Succeeded<br>NOTE: Tasks Summary: Attempted 670=
 tasks of which 668 didn&#39;t need to be rerun and 1 failed.<br>
<br>Summary: 1 task failed:<br>=A0 /home/prjs/tk0001/philinux/meta-ti/recip=
es-ti/dsplink/<a href=3D"http://ti-dsplink_1.65.00.03.bb">ti-dsplink_1.65.0=
0.03.bb</a>, do_compile<br>Summary: There was 1 WARNING message shown.<br>S=
ummary: There was 1 ERROR message shown, returning a non-zero exit code.<br=
>
<br>I&#39;m using Ubuntu 12.04 to build. Is it a problem? Should I need som=
e special configuration in my Ubuntu in order to have it working?<br><br>Be=
st regards,<br><br>Flavio<br clear=3D"all"><br>-- <br>Flavio de Castro Alve=
s Filho<br>
<br><a href=3D"mailto:flavio.alves@gmail.com" target=3D"_blank">flavio.alve=
s@gmail.com</a><div><a href=3D"http://www.linuxembarcado.com" target=3D"_bl=
ank">www.linuxembarcado.com</a><br>Twitter: <a href=3D"http://twitter.com/#=
!/fraviofii" target=3D"_blank">http://twitter.com/#!/fraviofii</a><br>
</div><div>LinkedIn profile: <a href=3D"http://www.linkedin.com/in/flavioca=
stroalves" target=3D"_blank">www.linkedin.com/in/flaviocastroalves</a></div=
><br>
</div>

--e89a8f502fae67ef4e04ce6a337d--
