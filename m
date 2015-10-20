Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E947E0086D; Tue, 20 Oct 2015 10:56:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E4E5E00708
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 10:56:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9KHuRVE008232
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 12:56:27 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9KHuRgh022256
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 12:56:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 20 Oct 2015 12:56:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9KHuREp024179;
	Tue, 20 Oct 2015 12:56:27 -0500
Date: Tue, 20 Oct 2015 13:56:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20151020175611.GM5620@edge>
References: <1445283698-10019-1-git-send-email-sam.nelson@ti.com>
	<20151019210941.GJ5620@edge>
	<4F9216F96E5DF9428610502835A9F49058240523@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058240523@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-softhsmv2: Update to new version 1.3.0.4
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
X-List-Received-Date: Tue, 20 Oct 2015 17:56:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 20, 2015 at 12:10:56PM -0400, Nelson, Sam wrote:
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, October 19, 2015 5:10 PM
> > To: Nelson, Sam
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] ti-softhsmv2: Update to new version 1.3.0.4
> > 
> > On Mon, Oct 19, 2015 at 03:41:38PM -0400, Sam Nelson wrote:
> > > - Update License checksum
> > 
> > Don't take license changes lightly - please confirm the LICENSE field itself
> > hasn't changed and it's still OSRB approved.
> 
> Yes.  The updated text is part of the software manifest approved by OSRB. 
> The LICENSE field itself does not need to be updated as the new license text added is also based on GPLv2.

Thanks!


> > > - Skip PR
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-
> > softhsmv2/ti-softhsmv2_git.bb
> > > index 329fbaa..c1e1654 100644
> > > --- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > > +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION = "TI softhsmv2 package"
> > >  LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR |
> > Zlib"
> > > -LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
> > > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=664f3daf042b19d634189e709d5d558e"
> > >  SECTION = "libs"
> > >
> > >  mntdir = "/mnt"
> > > @@ -12,10 +12,9 @@ COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
> > >
> > >  BRANCH="master"
> > >  SRC_URI = "git://git.ti.com/keystone-linux/ti-
> > softhsmv2.git;protocol=git;branch=${BRANCH}"
> > > -#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
> > > -SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
> > > -PV = "1.3.0.1"
> > > -PR = "r1"
> > > +#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
> > > +SRCREV = "c2688afb9373309751e640088705cb739997665d"
> > > +PV = "1.3.0.4"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

