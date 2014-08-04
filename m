Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7485DE0079E; Mon,  4 Aug 2014 07:13:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1223EE00799
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 07:13:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74ED7xc027172;
	Mon, 4 Aug 2014 09:13:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74ED7iP005661;
	Mon, 4 Aug 2014 09:13:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 4 Aug 2014 09:13:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74ED6ve014216;
	Mon, 4 Aug 2014 09:13:06 -0500
Date: Mon, 4 Aug 2014 10:13:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140804141306.GP15788@edge>
References: <1407028266-10077-1-git-send-email-denis@denix.org>
	<1407028266-10077-2-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6F1BDF@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6F1BDF@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] linux-ti-staging 3.14: update to latest 3.14.15 plus connectivity changes
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
X-List-Received-Date: Mon, 04 Aug 2014 14:13:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Unfortunately, this breaks Darren's SGX patches... :( Moreover, we already 
pick this update up due to AUTOREV in meta-arago, so nightlies have been 
failing for couple days. Need to look into those patches and update them.


On Mon, Aug 04, 2014 at 01:56:27PM +0000, Cooper Jr., Franklin wrote:
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Saturday, August 02, 2014 8:11 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH 2/2] linux-ti-staging 3.14: update to latest 3.14.15
> > plus connectivity changes
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_3.14.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> > kernel/linux/linux-ti-staging_3.14.bb
> > index c223c88..7abaeac 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > @@ -43,11 +43,11 @@ S = "${WORKDIR}/git"
> > 
> >  BRANCH = "ti-linux-3.14.y"
> > 
> > -SRCREV = "b0fa4f08d72c8723219b5174b5749151b5acaee0"
> > -PV = "3.14.14"
> > +SRCREV = "aa595e6598fc5a722ee653881334d0d8a16477bc"
> > +PV = "3.14.15"
> > 
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > rebuild -MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> >  PR = "${MACHINE_KERNEL_PR}"
> > 
> >  KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
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

