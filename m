Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BB63E013B8
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 21:51:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r614pl8k014169
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 23:51:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r614plOF014171
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 23:51:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 30 Jun 2013 23:51:46 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r614pkPj001631;
	Sun, 30 Jun 2013 23:51:46 -0500
Date: Mon, 1 Jul 2013 00:51:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130701045146.GC3707@edge>
References: <20130627171636.GA7291@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961D1CF@DLEE11.ent.ti.com>
	<20130627191748.GD30195@edge> <51CD548A.806@ti.com>
	<7D46E86EC0A8354091174257B2FED101596206E4@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596206E4@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] libdrm: Add GLSDK specific staging tree for omap-a15
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
X-List-Received-Date: Mon, 01 Jul 2013 04:51:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 28, 2013 at 07:25:04AM -0400, Maupin, Chase wrote:
> 
> >> Well, if every time you update SRCREV you also increment the
> >first letter, it
> >> will work as expected - so the comment is kind of correct... :)
> >>
> >
> >Right, I just followed the existing kernel recipes for convention.
> >Would
> >the convention change between a kernel recipe (like
> >recipes-kernel/linux/linux-ti-staging_3.8.bb) where we have both
> >SRCPV
> >and the first letter, compared to userspace recipes which point to
> >git
> >trees for versions?
> 
> The kernel ones were to append the MACHINE_KERNEL_PR that was set with the 
> letter.  The SRCPV use was also nice to make it easier to know which 
> commitid was being used during the kernel build.
> 
> >>> That being said if you were going to overlay this recipe the PR
> >should be
> >>> something like
> >>>
> >>> PR = "${INC_PR}.0"
> >>>
> >>> Right now you are appending to the default since PR is not
> >defined.  With a
> >>> bbappend you should append a -arago flag.
> >>>
> >>> So this comes back to why no bbappend?  Is it because the base
> >version in
> >>> oe-core is 2.4.39 and not 2.4.41?  Can you not append the _git
> >version of
> >>> the recipe and update the PV appropriately?
> >>>
> >
> >That's also possible but the question I have is what's the
> >preferred
> >convention?
> >
> >All the GLSDK trees are on git. The choice really is between
> >having a
> >since .bbappend for each of the trees with an explicit PV and bump
> >the
> >PV everytime we update to latest on upstream *OR* have a recipe
> >for the
> >version and submit a new recipe when we update to latest.
> >
> >I can submit a v2 once I understand the expected convention to be
> >followed.
> 
> I get your point on clarity so I'm OK with a version specific addition.  You 
> may have answered this before but what is the difference between your libdrm 
> and the libdrm upstream?  Are your patches going upstream to the main libdrm 
> so that going forward you can drop this recipe for a new version?
> 
> Denys, refresh my memory if we are doing a version but we are also changing 
> things in our trees don't we normally do this as something like ti-libdrm 
> and set the PROVIDES, etc for libdrm?  This was to distinguish between 
> libdrv 2.4.41 for example and what TI is calling 2.4.41 right?  Or do you 
> just want to do 2.4.41+?  What is your preferrence?

From my past discussions with Nicolas, TI's libdrm is quite close to the 
upstream and the patches are meant to be upstreamed eventually. So, 
technically it's not a complete fork and having a full replacement like 
ti-libdrm is not really necessary here. I'm fine with providing own 
libdrm-2.4.41 recipe for now.

-- 
Denys

