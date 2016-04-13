Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F34EE00E1F; Wed, 13 Apr 2016 13:38:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFAA3E00833
	for <meta-ti@yoctoproject.org>; Wed, 13 Apr 2016 13:38:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3DKcUnT010926;
	Wed, 13 Apr 2016 15:38:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3DKcUMh012778;
	Wed, 13 Apr 2016 15:38:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 13 Apr 2016 15:38:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3DKcUci008473;
	Wed, 13 Apr 2016 15:38:30 -0500
Date: Wed, 13 Apr 2016 16:38:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Andrea Galbusera <gizero@gmail.com>
Message-ID: <20160413203814.GF10048@edge>
References: <20160401184034.BB0ED529EF@arago-project.org>
	<CAC+thW1YUq9_xg2ubfhu2Yb+dcwTSnwTVrVj9_GGY=SwM1Q3hA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC+thW1YUq9_xg2ubfhu2Yb+dcwTSnwTVrVj9_GGY=SwM1Q3hA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Arago Project git <git@arago-project.org>
Subject: Re: Denys Dmytriyenko : linux: remove old and outdated kernel recipes and configs
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
X-List-Received-Date: Wed, 13 Apr 2016 20:38:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 04, 2016 at 11:58:57AM +0200, Andrea Galbusera wrote:
> Hi,
> 
> On Fri, Apr 1, 2016 at 8:40 PM, Arago Project git <git@arago-project.org> wrote:
> > Module: meta-ti
> > Branch: master
> > Commit: 8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
> > URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
> >
> > Author: Denys Dmytriyenko <denys@ti.com>
> > Date:   Thu Mar 31 21:53:58 2016 +0000
> >
> > linux: remove old and outdated kernel recipes and configs
> 
> This patch seems to break the build at least for some machines, which
> still prefer such outdated kernel recipes. This is the case i.e. for
> those machines that include either conf/machine/include/davinci.inc or
> conf/machine/include/omap3.inc. Just noticed it while trying to build
> a basic image for omap-l138 for a possible revamp of an old
> arago-based project. What are the plans for those machine? Are they in
> the way to be dropped? What's the suggested layer stack to start from
> for a "modern" system for an l138 system?

I guess I can point those machines to linux-ti-staging.

Of course, if one still needs the original kernel support for those platforms, 
the best approach is to use one of the old branches that had it - mixing very 
old kernel with a new system components is just asking for trouble.

Otherwise using either latest linux-ti-staging or even mainline would be 
recommended. Especially since there's some (although "best effort") work being 
done to update kernel support for those outdated platforms by adding Device 
Tree support etc...

-- 
Denys


> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > ---
> >
> >  recipes-kernel/linux/linux-keystone-3.13/defconfig |    1 -
> >  recipes-kernel/linux/linux-keystone-rt/defconfig   |    1 -
> >  recipes-kernel/linux/linux-keystone-rt_3.10.bb     |   33 -----
> >  recipes-kernel/linux/linux-keystone/defconfig      |    1 -
> >  recipes-kernel/linux/linux-keystone_3.10.bb        |   33 -----
> >  recipes-kernel/linux/linux-keystone_3.13.bb        |   34 -----
> >  recipes-kernel/linux/linux-mainline/defconfig      |    1 -
> >  recipes-kernel/linux/linux-mainline_3.14.bb        |   41 ------
> >  recipes-kernel/linux/linux-ti-glsdk/defconfig      |    1 -
> >  recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |   32 -----
> >  .../linux/linux-ti-staging-3.14/configs/systest    |    1 -
> >  .../linux/linux-ti-staging-3.14/defconfig          |    1 -
> >  recipes-kernel/linux/linux-ti-staging_3.14.bb      |   67 ----------
> >  recipes-kernel/linux/multi-kernel.inc              |  140 --------------------
> >  .../linux/sitara-linux-ti-staging-3.14/defconfig   |    1 -
> >  .../linux/sitara-linux-ti-staging_3.14.bb          |   51 -------
> >  16 files changed, 0 insertions(+), 439 deletions(-)
> >
> > Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
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

