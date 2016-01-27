Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCE5AE0090E; Wed, 27 Jan 2016 11:24:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A550E00838
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 11:24:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJOGmp005504
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 13:24:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJOGnO026067
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 13:24:16 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:24:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJOFd4028544;
	Wed, 27 Jan 2016 13:24:15 -0600
Date: Wed, 27 Jan 2016 14:23:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20160127192359.GR11314@edge>
References: <20151218010723.30EA852A14@arago-project.org>
	<20160126010013.GS11314@edge>
	<4F9216F96E5DF9428610502835A9F490582E3A28@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F490582E3A28@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Sam Nelson : linux-ti-staging: Work around to avoid race condition with external module
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
X-List-Received-Date: Wed, 27 Jan 2016 19:24:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! Would you be submitting the corresponding patch? :)


On Wed, Jan 27, 2016 at 01:54:43PM -0500, Nelson, Sam wrote:
> Yes, this workaround needs to be copied to 4.1 recipe as well.  (As the 
> problem itself will still exist in fido and the issue is not kernel 
> specific)
> With regards,
> Sam
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Monday, January 25, 2016 8:00 PM
> > To: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] Sam Nelson : linux-ti-staging: Work around to avoid race
> > condition with external module
> > 
> > Sam,
> > 
> > Is this still a problem on 4.1 kernel? Do we need to copy this work around to
> > 4.1 recipe in Fido branch?
> > 
> > 
> > On Fri, Dec 18, 2015 at 01:07:23AM +0000, Arago Project git wrote:
> > > Module: meta-ti
> > > Branch: fido
> > > Commit: 4f542c3fe47a8c6be195b3c97fd83efbf930bb70
> > > URL:    http://arago-project.org/git/meta-
> > ti.git?a=commit;h=4f542c3fe47a8c6be195b3c97fd83efbf930bb70
> > >
> > > Author: Sam Nelson <sam.nelson@ti.com>
> > > Date:   Mon Dec 14 17:47:48 2015 +0000
> > >
> > > linux-ti-staging: Work around to avoid race condition with external module
> > >
> > > - Currently there is an issue with compiling external kernel module
> > > which depends on symbols from another kernel module which is part of the
> > > list of modules configured to be built as modules in the default config.
> > > - This work around allows to avoid the issue by copying the module
> > > symbols to the kernel directory after making the kernel modules build.
> > > - This issue is already fixed in oe-core: master branch as of date
> > > - This is just work around before updating to latest oe-core
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >
> > > ---
> > >
> > >  recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++++
> > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> > kernel/linux/linux-ti-staging_3.14.bb
> > > index 54530e4..88950ae 100644
> > > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > @@ -65,3 +65,7 @@ KERNEL_GIT_PROTOCOL = "git"
> > >  SRC_URI +=
> > "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}
> > \
> > >              file://defconfig \
> > >             "
> > > +
> > > +do_compile_kernelmodules_append() {
> > > +	cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> > > +}
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

