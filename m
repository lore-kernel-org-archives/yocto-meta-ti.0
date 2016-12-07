Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4346EE00CC8; Tue,  6 Dec 2016 17:28:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4365DE009C3
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2016 17:28:35 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB71SZ1W001959
	for <meta-ti@yoctoproject.org>; Tue, 6 Dec 2016 19:28:35 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB71SZN7005639
	for <meta-ti@yoctoproject.org>; Tue, 6 Dec 2016 19:28:35 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 19:28:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB71SYZo024918;
	Tue, 6 Dec 2016 19:28:34 -0600
Date: Tue, 6 Dec 2016 20:28:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20161207012833.GN28380@edge>
References: <1478961971-54163-1-git-send-email-sam.nelson@ti.com>
	<4F9216F96E5DF9428610502835A9F490584E16F9@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F490584F273E@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F490584F273E@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mpm-transport: Update commit id with fixes
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
X-List-Received-Date: Wed, 07 Dec 2016 01:28:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please resubmit it? I already dropped it from patchwork.


On Mon, Nov 28, 2016 at 03:36:52PM +0000, Nelson, Sam wrote:
> This patch is good to go. Previously NAK because of reported failures. Looks like they are false alarm.
> So this patch can be picked up.
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> > Sent: Monday, November 14, 2016 10:49 AM
> > To: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] mpm-transport: Update commit id with fixes
> > 
> > NAK
> > Ignore this.
> > 
> > > -----Original Message-----
> > > From: Nelson, Sam
> > > Sent: Saturday, November 12, 2016 9:46 AM
> > > To: meta-ti@yoctoproject.org
> > > Cc: Nelson, Sam
> > > Subject: [PATCH] mpm-transport: Update commit id with fixes
> > >
> > > Update and fixes to handle different type of memory sections in sysfs
> > > entry or device tree.
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  recipes-ti/mpm-transport/mpm-transport_git.bb | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-
> > > ti/mpm-transport/mpm-transport_git.bb
> > > index 51b5e9e..ee28f2f 100644
> > > --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > @@ -15,11 +15,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  SRC_URI = "git://git.ti.com/keystone-linux/mpm-
> > > transport.git;protocol=git;branch=${BRANCH}"
> > >
> > >  BRANCH = "master"
> > > -# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00 -
> > > SRCREV = "696a9ec37559b671860ef393194c6032b7b6d9ef"
> > > +# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00A
> > > SRCREV
> > > += "7284e75d36b265ef8535d2e2ee54d1f2c700e862"
> > >
> > >  PV = "2.0.2.0"
> > > -PR = "r0"
> > > +PR = "r1"
> > >
> > >  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> > >  EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true
> > > SRIO_TRANSPORT=true"
> > > --
> > > 1.9.1
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

