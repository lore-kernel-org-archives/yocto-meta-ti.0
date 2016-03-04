Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB8EBE00BE2; Fri,  4 Mar 2016 13:48:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E536E00B89
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 13:48:48 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24LmlR8016678
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 15:48:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24LmlMg025861
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 15:48:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 15:48:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24LmjJ7012454;
	Fri, 4 Mar 2016 15:48:46 -0600
Date: Fri, 4 Mar 2016 16:48:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160304214829.GI7505@edge>
References: <1457045511-16254-1-git-send-email-sam.nelson@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814248BC0@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814248BC0@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] multiprocmgr: Update to new verison 3.0.1.0
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
X-List-Received-Date: Fri, 04 Mar 2016 21:48:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Heh, good catch - I totally missed the empty SRCREV, as it was hidden behind 
the very descriptive DEV tag... :)

-- 
Denys


On Fri, Mar 04, 2016 at 09:44:56PM +0000, Stiffler, Jacob wrote:
> The SRCREV was removed by this patch!
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> > Sent: Thursday, March 03, 2016 5:52 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] multiprocmgr: Update to new verison 3.0.1.0
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > 
> > ---
> > Note:
> > The changes in this version needs corresponding
> > change in kernel version and hence need to be
> > coordinated
> > 
> > ---
> > ---
> >  recipes-ti/multiprocmgr/multiprocmgr.inc | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-
> > ti/multiprocmgr/multiprocmgr.inc
> > index 122ac0f..915ac7a 100644
> > --- a/recipes-ti/multiprocmgr/multiprocmgr.inc
> > +++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
> > @@ -8,11 +8,11 @@ MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-
> > linux/multi-proc-manager.git"
> >  MULTIPROCMGR_GIT_PROTOCOL = "git"
> >  MULTIPROCMGR_GIT_BRANCH = "master"
> > 
> > -# The following commits correspond to DEV.MPM-3.00.00.02
> > -MULTIPROCMGR_SRCREV = "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
> > +# The following commits correspond to DEV.MPM-3.00.01.00
> > +MULTIPROCMGR_SRCREV = ""
> ^^^^^^^^^^^^
> 
> 
> > 
> > -PV = "3.0.0.2"
> > -INC_PR = "r2"
> > +PV = "3.0.1.0"
> > +INC_PR = "r0"
> > 
> >  BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
> >  SRC_URI =
> > "${MULTIPROCMGR_GIT_URI};protocol=${MULTIPROCMGR_GIT_PROTOCOL};
> > branch=${BRANCH}"
> > --
> > 1.9.1
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

