Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32463E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 09:37:57 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CGbuWj013711;
	Fri, 12 Oct 2012 11:37:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CGbuPW029816;
	Fri, 12 Oct 2012 11:37:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 12 Oct 2012 11:37:55 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9CGbsWL028740;
	Fri, 12 Oct 2012 11:37:55 -0500
Date: Fri, 12 Oct 2012 12:37:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20121012163753.GI26956@edge>
References: <507836EF.8050506@ti.com> <20121012153140.GG26956@edge>
	<50783E2F.4060204@ti.com> <20121012161944.GH26956@edge>
	<507845D9.8040105@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <507845D9.8040105@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Fri, 12 Oct 2012 16:37:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 12, 2012 at 10:31:21AM -0600, Gary Thomas wrote:
> On 2012-10-12 10:19, Denys Dmytriyenko wrote:
> >On Fri, Oct 12, 2012 at 05:58:39PM +0200, Herv? Fache wrote:
> >>On 10/12/2012 05:31 PM, Denys Dmytriyenko wrote:
> >>>On Fri, Oct 12, 2012 at 05:27:43PM +0200, Herv? Fache wrote:
> >>>>Hi guys,
> >>>>
> >>>>I am new to Poky and have created the following recipe:
> >>>>     require recipes-graphics/images/core-image-x11.bb
> >>>>     IMAGE_INSTALL += "omapdrmtest"
> >>>Can you try adding to CORE_IMAGE_EXTRA_INSTALL instead of IMAGE_INSTALL?
> >>>
> >>Thanks a lot, that did it!
> >
> >I'm glad it worked for you.
> >
> >But I'm still baffled why IMAGE_INSTALL didn't work. The only 2 reasons I can
> >see for that are:
> 
> Most likely case is a missing separator.  Since += adds no space, omapdrmtest
> is being glued to whatever is already in that list, making the last two
> packages go missing.  I'll bet that this also works:
>   IMAGE_INSTALL += " omapdrmtest "
> 
> I always add those spaces since they are free :-)

That's not exactly correct. You are mistaking += and =+ with .= and =. :)

+= and =+ append and prepend with spaces, while .= and =. append and prepend 
without spaces:

http://docs.openembedded.org/bitbake/html/ch02.html#id397587

Plus, there's plenty of space already in IMAGE_INSTALL, as it is handled as a 
multi-line assignment with plenty of indentation inside core-image class...

-- 
Denys


> >1. If you made a typo and used '=' instead of '+=', which would re-assign
> >IMAGE_INSTALL, instead of appending to it, losing its current value.
> >
> >2. Or if you tried to append to IMAGE_INSTALL before loading the base image
> >recipe with 'require' (effectively, swapping the 2 lines of your recipe) - in
> >that case you'd append to an empty IMAGE_INSTALL first and inside the
> >core-image class it uses conditional assignment to pre-set that variable with
> >system defaults. But since you already assigned to it early on, it won't be
> >populated with system defaults...
> >
> >Other than that, the example you showed above seems to work for me here...
> >
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

