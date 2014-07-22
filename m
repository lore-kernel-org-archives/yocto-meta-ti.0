Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB10CE006ED; Tue, 22 Jul 2014 07:57:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72214E00558
	for <meta-ti@yoctoproject.org>; Tue, 22 Jul 2014 07:57:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6MEvFZj016668;
	Tue, 22 Jul 2014 09:57:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MEvF0v004916;
	Tue, 22 Jul 2014 09:57:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 22 Jul 2014 09:57:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MEvFJn007162;
	Tue, 22 Jul 2014 09:57:15 -0500
Date: Tue, 22 Jul 2014 10:57:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140722145714.GY15788@edge>
References: <1405985363-21671-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6E78E6@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E78E6@DFLE08.ent.ti.com>
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
X-List-Received-Date: Tue, 22 Jul 2014 14:57:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 22, 2014 at 02:54:38PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, July 21, 2014 6:29 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-bsp/u-boot/u-boot_2014.07.bb | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-
> > boot_2014.07.bb
> > index 9da6f7d..593c445 100644
> > --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > @@ -13,15 +13,14 @@ LIC_FILES_CHKSUM =
> > "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> > 
> >  # This is still an RC so set the PV accordingly to allow proper version  #
> > ordering when the RC is dropped.
> [Franklin] This comment can also be deleted.

Right, missed that.


> > -PV = "2014.04+2014.07-rc3"
> > -PR = "r0"
> [Franklin] If you're going to create a v2 anyway then it would be nice to 
> leave the PR

I'm dropping it on purpose here.


> > +PV = "2014.07"
> > 
> >  SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
> > 
> >  BRANCH ?= "master"
> > 
> > -# Corresponds to tag v2014.07-rc3
> > -SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> > +# Corresponds to tag v2014.07
> > +SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> > 
> >  SPL_BINARY = "MLO"
> >  SPL_UART_BINARY = "u-boot-spl.bin"
> > --
> > 2.0.2
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

