Return-Path: <miroslav.kes@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA634E0030A; Fri, 11 Jul 2014 08:09:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (miroslav.kes[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F8FBE002AC
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 08:09:49 -0700 (PDT)
Received: by mail-ig0-f177.google.com with SMTP id r10so1082880igi.16
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=mWMKa+tTJ7p5V0yLqprtpEKHNVfttffO8gjlOQXxSW8=;
	b=f+TKOi9x1XNlBFettfKuQPk+d+sQv1sz0+lysm2XOoYbRQvxXrpQrrq6RUb8ByN2AZ
	6fWCDrM+ia2CjvirzGnPo/MzlGx4/hBdwtIYZOvx0Mu3OyaEOIHiF+B3Wr5D8LjqWzCQ
	tiZOr0ASVuHy6p/k5DJXfTjFhU/0A4UdgsDya9xljivDjjW8+RLv183R5DeeZTmu3YEh
	v2kVdjyazE13GhT5w1oP9McZC8qVU9r06b9JNa/tvocEV9lDbY2gPdJygDODkHCk9Hp0
	/wHJ7z/2XmWFrTL9oy69aNaJuUBjk9IYIW14z8Plm/ODWrqfLAOGGaFLxkeyqCghqK4C
	lTAQ==
X-Received: by 10.50.80.116 with SMTP id q20mr5397339igx.22.1405091389091;
	Fri, 11 Jul 2014 08:09:49 -0700 (PDT)
Received: from [10.70.136.159] ([205.175.202.247])
	by mx.google.com with ESMTPSA id v4sm6690994igk.10.2014.07.11.08.09.47
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Jul 2014 08:09:48 -0700 (PDT)
Message-ID: <53BFFE2D.10600@gmail.com>
Date: Fri, 11 Jul 2014 17:09:33 +0200
From: =?windows-1252?Q?Miroslav_Ke=9A?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <53BAA233.4030803@gmail.com>
	<B0581B5571079145BA1CD78C126DBDE732074600@DLEE08.ent.ti.com>,
	<53BBC7F2.50803@gmail.com>
	<B0581B5571079145BA1CD78C126DBDE7320765DF@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE7320765DF@DLEE08.ent.ti.com>
Subject: Re: BeagleBoard / Beagleboard-xM build
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
X-List-Received-Date: Fri, 11 Jul 2014 15:09:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit


I'm still confused concerning the correct approach for building a distroless image.

In this response ...
https://lists.yoctoproject.org/pipermail/meta-ti/2014-July/004863.html

to a recent post, Maupin says that the kernel provider should be defined by the distribution.

But if I compare the conf/machine/beagleboard.conf in danny and daisy branches, the danny version includes

PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"

while in the daisy (and also master) version there is nothing like that.

Could someone answer the first 2 questions my original post?

Thanks

Mira

On 07/08/2014 03:41 PM, Dmytriyenko, Denys wrote:
> Sorry, missed it was BeagleBoard and 3.2 kernel...
>
>
> Sent from my Android phone using TouchDown (www.nitrodesk.com)
>
> -----Original Message-----
> *From:* Miroslav Keš [miroslav.kes@gmail.com]
> *Received:* Tuesday, 08 Jul 2014, 6:29
> *To:* Dmytriyenko, Denys [denys@ti.com]; meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> *Subject:* Re: [meta-ti] BeagleBoard / Beagleboard-xM build
>
> On 07/07/14 15:54, Dmytriyenko, Denys wrote:
> > Missing DTB files:
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/README.hardware#n190
> >
> >
> Denys,
>
> The hardware README note in your link is related to BeagleBone. Is the DTB true also for BeagleBoard?
> I'm asking because my BeagleBoard build doesn't produce any .dtb image. Should it create one?
>
> Thanks
>
> Mira
> > Sent from my Android phone using TouchDown (www.nitrodesk.com <http://www.nitrodesk.com>)
> >
> > -----Original Message-----
> > *From:* Miroslav Keš [miroslav.kes@gmail.com]
> > *Received:* Monday, 07 Jul 2014, 9:36
> > *To:* meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> > *Subject:* [meta-ti] BeagleBoard / Beagleboard-xM build
> >
> > Hi!
> >
> > I tried to build the kernel plus core-image-minimal for BeagleBoard using just
> >
> > BBLAYERS ?= " \
> >   ${OEBASE}/meta-ti \
> >   ${OEBASE}/openembedded-core/meta \
> >   "
> > The build completed OK but the boot process hangs on both BeagleBoard and Beagleboard-xM after
> > the "booting the kernel" message (see the output bellow).
> >
> > I have spent 3 days googling on potential reasons. I found some people having similar problems but it looks like the kernel debugging options are turned on in the kernel configuration and the ttyO2 should be OK for kernel 3.2.28
> >
> > I would appreciate if someone could answer these questions:
> >
> > 1) Is it good idea trying to build the BeagleBoard distro using just meta-ti and openembedded-core (i.e. without Angstrom)?
> > 2) Is there particular combination of meta-ti and openembedded-core versions that should be used?
> > 3) What is the relationship between meta-ti and meta-beagleboard (it looks like meta-ti supports beagleboards while meta-beagleboard supports beaglebone)
> >
> > Any hints would be really welcome
> >
> > Mira
> >
> > ---------------------------------------------------------------------
> >
> > Welcome to minicom 2.6
> >
> > OPTIONS: I18n
> > Compiled on Nov 18 2013, 11:01:02.
> > Port /dev/ttyS0
> >
> > Press CTRL-A Z for help on special keys
> >
> > ...40V...þ
> > U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)
> > Texas Instruments Revision detection unimplemented
> > OMAP SD/MMC: 0
> > reading u-boot.img
> > reading u-boot.img
> >
> >
> > U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)
> >
> > OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
> > OMAP3 Beagle board + LPDDR/NAND
> > I2C:   ready
> > DRAM:  256 MiB
> > WARNING: Caches not enabled
> > NAND:  256 MiB
> > MMC:   OMAP SD/MMC: 0
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Beagle Rev C1/C2/C3
> > timed out in wait_for_pin: I2C_STAT=0
> > I2C read: I/O error
> > Unrecognized expansion board: 0
> > timed out in wait_for_pin: I2C_STAT=0
> > I2C read: I/O error
> > Unrecognized expansion board: 0
> > Die ID #5ac400030000000004013f8901001001
> > Net:   Net Initialization Skipped
> > No ethernet found.
> > Hit any key to stop autoboot:  0
> > OMAP3 beagleboard.org # mmc rescan
> > OMAP3 beagleboard.org # setenv bootargs console=ttyO2,115200n8 root=/dev/mmcblk0p2 rw rootdelay=1
> > OMAP3 beagleboard.org # fatload mmc 0:1 0x80000000  uImage
> > reading uImage
> >
> > 4337768 bytes read
> > OMAP3 beagleboard.org # bootm 0x80000000
> > ## Booting kernel from Legacy Image at 80000000 ...
> >    Image Name:   Linux-3.2.28
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    4337704 Bytes = 4.1 MiB
> >    Load Address: 80008000
> >    Entry Point:  80008000
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ... OK
> > OK
> >
> > Starting kernel ...
> >
> > Uncompressing Linux... done, booting the kernel.
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>


