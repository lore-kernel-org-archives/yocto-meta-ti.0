Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C194E00B65; Tue, 27 Jun 2017 09:22:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E924E00B1B
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 09:22:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5RGMHuD000970;
	Tue, 27 Jun 2017 11:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498580537;
	bh=k791N1NjcpVjfRGKlT4BSWctr5toG/tHBxH5XmceF4o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BNyxEAojSPgc91cwRitKQRc208JqxnusaYrGj8WCbtdbTUxN/Eha+KL7xxjExiqGC
	4wnkoEGjfUgJWu2xTObkH087jj6f9HO37zsV6Uk+2J9gTmE/L/cKbIK0D/Rvl7FJ6E
	G/1hyhu5b8nI+bvdLZeJD8JgN27Fwp1K59BJYZK0=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5RGMH6I009678;
	Tue, 27 Jun 2017 11:22:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Jun 2017 11:22:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5RGMGVS021084;
	Tue, 27 Jun 2017 11:22:17 -0500
Date: Tue, 27 Jun 2017 12:22:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kenny Koller <kenny@understoryweather.com>
Message-ID: <20170627162214.GH14665@edge>
References: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
	<20170626185315.GF14665@edge>
	<CAPtqgUzXj_EyGbSWFNxsEyGwBKSH2PV+d7RsvrzPJ_DuGyXVzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPtqgUzXj_EyGbSWFNxsEyGwBKSH2PV+d7RsvrzPJ_DuGyXVzA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: install cannot stat u-boot.img (Pyro)
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
X-List-Received-Date: Tue, 27 Jun 2017 16:22:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, meta-ti is quite active and is current. If by current you mean "pyro" 
branch, then it's not an indication and there was an explanation on the list.

But in general, if you are not using meta-ti layer, why are you posting error 
messages to meta-ti list?


On Tue, Jun 27, 2017 at 04:51:29AM +0000, Kenny Koller wrote:
> I'm not sure if I should be using it. When I look at the meta-ti repository
> it doesn't seem current with the Poky releases. Furthermore it seems that
> meta-yocto-bsp contains recipes for Beaglebone. It's not clear to me which
> layer has a recipe for Das U-Boot.
> 
> All I did was clone Poky. Checkout Pyro. Edited my local.conf to
> MACHINE='beaglebone'. And `bitbake core-image-minimal`.
> 
> On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Do you use meta-ti layer?
> >
> >
> > On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:
> > > Hi,
> > >
> > > I'm using 2.3 to build the minimal Beaglebone Black images.
> > >
> > > I issue the following and get the error below. Is the warning regarding a
> > > missing bootloader config the issue?
> > >
> > > Thanks,
> > >
> > > Kenny
> > >
> > > $ bitbake core-image-minimal
> > >
> > > | INFO: Creating image(s)...
> > > |
> > > | WARNING: bootloader config not specified, using defaults
> > > |
> > > | ERROR: _exec_cmd: install -m 0644 -D
> > > /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img
> > >
> > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebone-20170624014756/tmp.wic.khxryxga/boot/u-boot.img
> > > returned '1' instead of 0
> > > | output: install: cannot stat
> > > '/home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img':
> > No
> > > such file or directory
> > > |
> > > | WARNING: exit code 1 from a shell command.
> > > | ERROR: Function failed: do_image_wic (log file is located at
> > >
> > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
> > > ERROR: Task
> > > (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:
> > do_image_wic)
> > > failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't need to be
> > > rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb
> > :
> > > do_image_wic
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >

