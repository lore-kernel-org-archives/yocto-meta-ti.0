Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B485FE00B77; Tue, 27 Jun 2017 10:44:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F4DDE00B2F
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 10:44:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5RHiqPw004000;
	Tue, 27 Jun 2017 12:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498585492;
	bh=f/m2CLwVCt4afXybG45hlu4L/wLXScapao5neos5joQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rYyhmcSyZx/tm39W+s0AgQGx+n13/zlgTRqhXaH5TyMe3MFoAAZWKzD2SLSaEduzu
	WbKn/61TKMCYi/CdmyWD+mFsvp3nAYel0ZEvVTkYyiDLYDR1qUpB3UqDS6gfqD51zJ
	9/cqwejFaZDCzkVVPa4Hmo/+ZvLRVrSEOYmfhteA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5RHiqQA017623;
	Tue, 27 Jun 2017 12:44:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Jun 2017 12:44:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5RHiqHG022584;
	Tue, 27 Jun 2017 12:44:52 -0500
Date: Tue, 27 Jun 2017 13:44:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kenny Koller <kenny@understoryweather.com>
Message-ID: <20170627174450.GJ14665@edge>
References: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
	<20170626185315.GF14665@edge>
	<CAPtqgUzXj_EyGbSWFNxsEyGwBKSH2PV+d7RsvrzPJ_DuGyXVzA@mail.gmail.com>
	<20170627162214.GH14665@edge>
	<CAPtqgUyyRVCsB+ie8Tif6DV7ak-V58ZdoDoED1RBtkTpFseSgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPtqgUyyRVCsB+ie8Tif6DV7ak-V58ZdoDoED1RBtkTpFseSgA@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Jun 2017 17:44:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 27, 2017 at 10:12:12AM -0700, Kenny Koller wrote:
> On Tue, Jun 27, 2017 at 9:22 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Well, meta-ti is quite active and is current. If by current you mean "pyro"
> > branch, then it's not an indication and there was an explanation on the
> > list.
> 
> Yes. I see the activity on this list (no offense meant). New to the list so
> probably missed any explanation.

Activity in git:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/

Reply to "pyro" branch question:
https://lists.yoctoproject.org/pipermail/meta-ti/2017-June/010023.html


> > But in general, if you are not using meta-ti layer, why are you posting
> > error
> > messages to meta-ti list?
> 
> Because it's not clear which layers are required for the Beaglebone build
> (as I mention in my previous response). It occurred to me that perhaps
> meta-ti must be included to build the bootloaders. As far as I can tell
> there is no explicit mention of which layers are required. I think the
> answer is that Poky includes everything that is required but my build
> failed for a reason that was unclear.

Some time ago I gave this explanation of layers for BeagleBone:
https://lists.yoctoproject.org/pipermail/yocto/2014-October/021819.html

Most of that still stands today and both meta-ti and meta-yocto-bsp provide 
own versions of u-boot.


> I can hop off this list if it has nothing to do with the Beaglebone
> processor.

meta-ti has everything to do with BeagleBone, but you are not using it. You 
are using meta-yocto-bsp - it does provide upstream versions of u-boot and the 
linux kernel and normally just works for BeagleBone. What the exact issue with 
"pyro" in your case, I'm not sure.

-- 
Denys


> > On Tue, Jun 27, 2017 at 04:51:29AM +0000, Kenny Koller wrote:
> > > I'm not sure if I should be using it. When I look at the meta-ti
> > repository
> > > it doesn't seem current with the Poky releases. Furthermore it seems that
> > > meta-yocto-bsp contains recipes for Beaglebone. It's not clear to me
> > which
> > > layer has a recipe for Das U-Boot.
> > >
> > > All I did was clone Poky. Checkout Pyro. Edited my local.conf to
> > > MACHINE='beaglebone'. And `bitbake core-image-minimal`.
> > >
> > > On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > > Do you use meta-ti layer?
> > > >
> > > >
> > > > On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:
> > > > > Hi,
> > > > >
> > > > > I'm using 2.3 to build the minimal Beaglebone Black images.
> > > > >
> > > > > I issue the following and get the error below. Is the warning
> > regarding a
> > > > > missing bootloader config the issue?
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Kenny
> > > > >
> > > > > $ bitbake core-image-minimal
> > > > >
> > > > > | INFO: Creating image(s)...
> > > > > |
> > > > > | WARNING: bootloader config not specified, using defaults
> > > > > |
> > > > > | ERROR: _exec_cmd: install -m 0644 -D
> > > > > /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/
> > u-boot.img
> > > > >
> > > > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-
> > linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-
> > image-minimal-image-complete/core-image-minimal-beaglebone-
> > 20170624014756/tmp.wic.khxryxga/boot/u-boot.img
> > > > > returned '1' instead of 0
> > > > > | output: install: cannot stat
> > > > > '/home/ubuntu/yocto/poky/build/tmp/deploy/images/
> > beaglebone/u-boot.img':
> > > > No
> > > > > such file or directory
> > > > > |
> > > > > | WARNING: exit code 1 from a shell command.
> > > > > | ERROR: Function failed: do_image_wic (log file is located at
> > > > >
> > > > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-
> > linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
> > > > > ERROR: Task
> > > > > (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-
> > image-minimal.bb:
> > > > do_image_wic)
> > > > > failed with exit code '1'
> > > > > NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't need
> > to be
> > > > > rerun and 1 failed.
> > > > >
> > > > > Summary: 1 task failed:
> > > > >   /home/ubuntu/yocto/poky/meta/recipes-core/images/core-
> > image-minimal.bb
> > > > :
> > > > > do_image_wic
> > > > > Summary: There was 1 ERROR message shown, returning a non-zero exit
> > code.
> > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > >
> > > >
> >

