Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28B74E00897; Thu,  5 Feb 2015 07:39:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AE28E00894
	for <meta-ti@yoctoproject.org>; Thu,  5 Feb 2015 07:39:49 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FdmJQ015651
	for <meta-ti@yoctoproject.org>; Thu, 5 Feb 2015 09:39:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FdltV028717
	for <meta-ti@yoctoproject.org>; Thu, 5 Feb 2015 09:39:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 09:39:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FdlR5012214;
	Thu, 5 Feb 2015 09:39:47 -0600
Date: Thu, 5 Feb 2015 10:39:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Message-ID: <20150205153946.GG9943@edge>
References: <1423131050-13022-1-git-send-email-a0393906@ti.com>
	<20150205151445.GD9943@edge>
	<E60A9E1B4132A24DB80BD56ABC92684735048F41@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <E60A9E1B4132A24DB80BD56ABC92684735048F41@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: vpe-tests: Add DEPENDS for the recipe
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
X-List-Received-Date: Thu, 05 Feb 2015 15:39:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 10:24:37AM -0500, Devshatwar, Nikhil wrote:
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Thursday, February 05, 2015 8:45 PM
> > To: R, Karthik
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] vpe-tests: Add DEPENDS for the recipe
> > 
> > On Thu, Feb 05, 2015 at 03:40:50PM +0530, Karthik Ramanan wrote:
> > > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > > ---
> > >  recipes-bsp/vpe-tests/vpe-tests_git.bb |    4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-
> > bsp/vpe-tests/vpe-tests_git.bb
> > > index a8ee7f8..ee91dea 100644
> > > --- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
> > > +++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
> > > @@ -3,6 +3,10 @@ DESCRIPTION = "VPE test program"
> > >  LICENSE = "BSD"
> > >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
> > >
> > > +DEPENDS = "virtual/kernel"
> > 
> > Should it also RDEPENDS on vpdma-fw?
> 
> This is a generic v4l2 m2m test application
> Even though it is used for testing VPE, it does not mandate that has to be run only on VPE
> It works with other m2m devices also, so ideally the vpdma-fw dependency is not needed.

Ok, thanks.


> > > +PR="r1"
> > > +
> > >  COMPATIBLE_MACHINE = "dra7xx"
> > >
> > >  SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

