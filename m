Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFA7FE00524; Tue, 22 Jul 2014 12:33:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DC2FE00342
	for <meta-ti@yoctoproject.org>; Tue, 22 Jul 2014 12:33:41 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6MJXd9l009627;
	Tue, 22 Jul 2014 14:33:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MJXdWb001195;
	Tue, 22 Jul 2014 14:33:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 22 Jul 2014 14:33:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MJXdXg031490;
	Tue, 22 Jul 2014 14:33:39 -0500
Date: Tue, 22 Jul 2014 15:33:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140722193338.GZ15788@edge>
References: <1405985363-21671-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6E78E6@DFLE08.ent.ti.com>
	<20140722145714.GY15788@edge>
	<8F29D6B095ED194EA1980491A5E029710C6E7A32@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E7A32@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] u-boot: update to 2014.07 release version
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
X-List-Received-Date: Tue, 22 Jul 2014 19:33:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 22, 2014 at 11:14:22AM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, July 22, 2014 9:57 AM
> > To: Cooper Jr., Franklin
> > Cc: Denys Dmytriyenko; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
> > 
> > On Tue, Jul 22, 2014 at 02:54:38PM +0000, Cooper Jr., Franklin wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Monday, July 21, 2014 6:29 PM
> > > > To: meta-ti@yoctoproject.org
> > > > Subject: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  recipes-bsp/u-boot/u-boot_2014.07.bb | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > > b/recipes-bsp/u-boot/u- boot_2014.07.bb index 9da6f7d..593c445
> > > > 100644
> > > > --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > > +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > > @@ -13,15 +13,14 @@ LIC_FILES_CHKSUM =
> > > > "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> > > >
> > > >  # This is still an RC so set the PV accordingly to allow proper
> > > > version  # ordering when the RC is dropped.
> > > [Franklin] This comment can also be deleted.
> > 
> > Right, missed that.
> > 
> > 
> > > > -PV = "2014.04+2014.07-rc3"
> > > > -PR = "r0"
> > > [Franklin] If you're going to create a v2 anyway then it would be nice
> > > to leave the PR
> > 
> > I'm dropping it on purpose here.

> [Franklin] Not a big deal since its functionally equivalent but you mind 
> sharing why?

Simply to follow upstream. In this day and age you no longer need to bump PR 
for Bitbake to notice the recipe change and re-build it, as it was required 
before. There are some corner cases, where you have to manually increment it, 
but in most cases Bitbake is smart enough to rebuild the package automatically 
when the recipe changes.

Now, there's a runtime upgrade path issue for when you need to upgrade binary 
packages from one revision to another, when the version doesn't change. But 
that is now handled by PR services, that should be controlled and handled by a 
distro. We can enable local PR service in Arago, but honestly we are not doing 
a real distribution with the proper upgrade path, so it's not so critical and 
not necessary to have a centralized PR server...

-- 
Denys


> > > > +PV = "2014.07"
> > > >
> > > >  SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
> > > >
> > > >  BRANCH ?= "master"
> > > >
> > > > -# Corresponds to tag v2014.07-rc3
> > > > -SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> > > > +# Corresponds to tag v2014.07
> > > > +SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> > > >
> > > >  SPL_BINARY = "MLO"
> > > >  SPL_UART_BINARY = "u-boot-spl.bin"
> > > > --
> > > > 2.0.2
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

