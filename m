Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 677A0E01770
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 07:11:07 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA6FB5jQ028992;
	Wed, 6 Nov 2013 09:11:05 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA6FB5XJ007503;
	Wed, 6 Nov 2013 09:11:05 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 6 Nov 2013 09:11:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA6FB4F0025752;
	Wed, 6 Nov 2013 09:11:05 -0600
Date: Wed, 6 Nov 2013 10:11:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Baptiste Durand <baptiste.durand@gmail.com>
Message-ID: <20131106151104.GC24696@edge>
References: <245245F712CBF74D865D90E99497849F06357480@mail-3.tvm.nestgroup.net>
	<4FEDAB2D-AA9F-499E-BDF0-8012EE7CE508@ti.com>
	<CAB0T2v-Tf+j56YKrUvV7npQ8Jk2HnE43HA6kJh0J+FEs7rEyJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB0T2v-Tf+j56YKrUvV7npQ8Jk2HnE43HA6kJh0J+FEs7rEyJQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meat-ti(master) kernel not working with meta-ivi
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
X-List-Received-Date: Wed, 06 Nov 2013 15:11:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 06, 2013 at 02:26:11PM +0100, Baptiste Durand wrote:
> Hi,
> 
> I already saw this issue (=> https://github.com/baillaw/meta-x10/issues) :
> please  try to add
> GCCVERSION="4.7%" in  your local.conf.
> 
> GCC 4.8 seems to build uncorrectly the kernel for pandaboard.

Indeed, the issue with gcc-4.8 was fixed in kernel 3.9+

There are some patches available that you can backport on top of 3.8 to get 
gcc-4.8 working:

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2915/focus=2921

-- 
Denys


> 2013/11/6 Heroor, Siddharth <heroor@ti.com>
> 
> >  Hi Jithin,
> >
> >  Please comments below.
> >
> > --Sid
> >
> > On 06-Nov-2013, at 5:33 pm, "Jithin Raj" <jithin.raj@nestgroup.net> wrote:
> >
> >   Hi,
> >
> >
> >
> > I am trying to build the yocto based meta-ivi (5.0), meta-ti for
> > Pandaboard.
> >
> > For building  I used the below procedure
> >
> >
> >
> > 1) git clone git://git.yoctoproject.org/poky
> >
> >    cd poky
> >
> >    git checkout dora
> >
> >    cd -
> >
> > 2) git clone git://git.yoctoproject.org/meta-ivi
> >
> >    cd meta-ivi
> >
> >    git checkout 5.0
> >
> >    cd -
> >
> > 3) git clone git://git.yoctoproject.org/meta-ti
> >
> >
> >
> > 4) source poky/oe-init-build-env
> >
> >
> >
> > 5) modified the bblayer.conf like this.
> >
> >     BBLAYERS ?= " \
> >
> >      /home/sfm/yocto/building/poky/meta \
> >
> >      /home/sfm/yocto/building/poky/meta-yocto \
> >
> >      /home/sfm/yocto/building/meta-ivi \
> >
> >      /home/sfm/yocto/building/meta-ti \
> >
> >
> >
> > 6) modified the local.config with
> >
> >                 MACHINE?=pandaboard
> >
> >
> >
> > 7) Add INCOMPATIBLE_LICENSE = "GPLv3" in COREBASE/build/conf/local.conf
> > file.
> >
> >
> >
> > 8) Set DISTRO ?= "poky-ivi-systemd" in COREBASE/build/conf/local.conf file.
> >
> >
> >
> > 9) bitbake gemini-image
> >
> >
> >
> > Once all the generated files are copied to the SD card I switched on the
> > pandaboard es.
> >
> > The pandaboard es is hanging while its loading the kernel. Please find log
> > here:
> >
> >
> >  Please also see if core-minimal and sato images are booting. There isn't
> > much active work happening on panda board and so could you check if a
> > kernel.org is booting fine?
> >
> >
> >
> >
> > *U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)*
> >
> > *Texas Instruments OMAP4460 ES1.1        *
> >
> > *OMAP SD/MMC: 0                          *
> >
> > *reading u-boot.img                      *
> >
> > *reading u-boot.img*
> >
> >
> >
> >
> >
> > *U-Boot 2011.12 (Nov 05 2013 - 14:12:29)*
> >
> >
> >
> > *CPU  : OMAP4460 ES1.1*
> >
> > *Board: OMAP4 Panda*
> >
> > *I2C:   ready*
> >
> > *DRAM:  1 GiB*
> >
> > *MMC:   OMAP SD/MMC: 0*
> >
> > *Using default environment*
> >
> >
> >
> > *In:    serial*
> >
> > *Out:   serial*
> >
> > *Err:   serial*
> >
> > *Hit any key to stop autoboot:  0 *
> >
> > *reading boot.scr*
> >
> >
> >
> > *338 bytes read*
> >
> > *Running bootscript from mmc0 ...*
> >
> > *## Executing script at 82000000*
> >
> > *reading uImage*
> >
> >
> >
> > *4333848 bytes read*
> >
> > *## Booting kernel from Legacy Image at 80000000 ...*
> >
> > *   Image Name:   Linux-3.4.11*
> >
> > *   Image Type:   ARM Linux Kernel Image (uncompressed)*
> >
> > *   Data Size:    4333784 Bytes = 4.1 MiB*
> >
> > *   Load Address: 80008000*
> >
> > *   Entry Point:  80008000*
> >
> > *   Verifying Checksum ... OK*
> >
> > *   Loading Kernel Image ... OK*
> >
> > *OK*
> >
> >
> >
> > *Starting kernel ...*
> >
> >
> >
> > *Uncompressing Linux... done, booting the kernel.*
> >
> >
> >
> > After this nothing is displayed.
> >
> >
> >
> > I have few doubts in this procedure.
> >
> >
> >
> > 1)      *which branch of meta-ti I have to use for dora branch*?
> > (currently am using the master branch).
> >
> >
> >  Master should be fine for Dora. Please also checkout the specific
> > commits from poky as mentioned in meta-ivi.
> >
> >   2)      *Do the master branch will work with all the poky branches*(like dora, dylan?
> >
> >
> >  There should be Dylan branch on meta-ti that you can checkout.
> >
> >           3)    *Do I need to do any other modification in any file to
> > work with pandaboard*?.
> >
> >
> >  I haven't tried panda recently but I could try it out early next week
> > and respond.
> >
> >
> >
> > Thanks in advance.
> >
> >
> >
> > *Thanks & regards*
> >
> > *Jithin Raj*
> >
> >
> >
> > ***** Confidentiality Statement/Disclaimer *****
> >
> > This message and any attachments is intended for the sole use of the
> > intended recipient. It may contain confidential information. Any
> > unauthorized use, dissemination or modification is strictly prohibited. If
> > you are not the intended recipient, please notify the sender immediately
> > then delete it from all your systems, and do not copy, use or print.
> > Internet communications are not secure and it is the responsibility of the
> > recipient to make sure that it is virus/malicious code exempt.
> > The company/sender cannot be responsible for any unauthorized alterations
> > or modifications made to the contents. If you require any form of
> > confirmation of the contents, please contact the company/sender. The
> > company/sender is not liable for any errors or omissions in the content of
> > this message.
> >
> >  _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> 
> 
> -- 
> Baptiste DURAND

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


