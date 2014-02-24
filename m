Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6667E008D5
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 09:41:03 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1OHf1qW016622
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 11:41:02 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OHf1Dc010588
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 11:41:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Feb 2014 11:41:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OHf167027749;
	Mon, 24 Feb 2014 11:41:01 -0600
Date: Mon, 24 Feb 2014 12:41:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20140224174100.GD18510@edge>
References: <1393129856-9624-1-git-send-email-sam.nelson@ti.com>
	<20140223045044.GX22890@denix.org>
	<4F9216F96E5DF9428610502835A9F49057F3D4D9@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49057F3D4D9@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-keystone: Update latest tag
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
X-List-Received-Date: Mon, 24 Feb 2014 17:41:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Feb 23, 2014 at 08:47:51AM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Saturday, February 22, 2014 11:51 PM
> > To: Nelson, Sam
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] linux-keystone: Update latest tag
> > 
> > On Sat, Feb 22, 2014 at 11:30:56PM -0500, Sam Nelson wrote:
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >
> > > ---
> > > Not sure whether need a PR bump
> > 
> > Yes, this one usually needs. Well, your SRCREV went up in both cases, so will
> > still work w/o a PR bump, but it's still a good idea to bump PR when updating
> > SRCREV only and PV stays the same. Kernel recipes have
> > MACHINE_KERNEL_PR_append
> > for that.

> [Sam] Thanks for the clarification. So in this case even though the 
> MACHINE_KERNEL_PR_append went up due to the git commit change,
> It is recommended to bump PR explicitly in this case from 
> MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}" to MACHINE_KERNEL_PR_append = 
> "b+gitr${SRCPV}".
>  Please confirm. 

Yes, in this particular case it's not strictly required, as I explained just 
above, but it's a good practice to do it anyway when changing SRCREV for 
consistency and to not miss the next time when it's really needed.


> > > ---
> > > ---
> > >  recipes-kernel/linux/linux-keystone-rt_3.10.bb |    4 ++--
> > >  recipes-kernel/linux/linux-keystone_3.10.bb    |    4 ++--
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-
> > kernel/linux/linux-keystone-rt_3.10.bb
> > > index 9c2f904..3965dfa 100644
> > > --- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> > > +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> > > @@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-
> > evm.dtb"
> > >
> > >  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> > >
> > > -#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
> > > -SRCREV = "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
> > > +#This commit corresponds to "K2_RT_LINUX_03.10.10_14.02"
> > > +SRCREV = "c78aa253ac385faae8b6c845a388e215395a8010"
> > >  PV = "3.10.10"
> > >
> > >  BRANCH = "master-rt"
> > > diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-
> > kernel/linux/linux-keystone_3.10.bb
> > > index 2384ede..f063c0c 100644
> > > --- a/recipes-kernel/linux/linux-keystone_3.10.bb
> > > +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> > > @@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-
> > evm.dtb"
> > >
> > >  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> > >
> > > -#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> > > -SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> > > +#This commit corresponds to "K2_LINUX_03.10.10_14.02"
> > > +SRCREV = "93515476b357304e6fc075c004a1cfa91a0751d0"
> > >  PV = "3.10.10"
> > >
> > >  BRANCH = "master"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >

