Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E695E01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:46:30 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IIkTlc010500;
	Mon, 18 Mar 2013 13:46:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IIkTAX026597;
	Mon, 18 Mar 2013 13:46:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 18 Mar 2013 13:46:29 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2IIkSfd032473;
	Mon, 18 Mar 2013 13:46:29 -0500
Date: Mon, 18 Mar 2013 14:46:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130318184628.GK32759@edge>
References: <1363632040-22025-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED10159481C2B@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159481C2B@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] linux-ti-staging: update to the latest merge	of 3.8.3
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
X-List-Received-Date: Mon, 18 Mar 2013 18:46:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 18, 2013 at 06:43:52PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, March 18, 2013 1:41 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH 1/3] linux-ti-staging: update to the
> > latest merge of 3.8.3
> 
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> Although, we may still need to do version specific (non _git) versions of 
> the recipes when there is an official release.

When and if we have a long-term releases of the ti-staging kernel tree, we can 
revisit this. But for now it would be too much churn to rename the recipe 
every week with every next re-merge...

-- 
Denys


> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> > b/recipes-kernel/linux/linux-ti-staging_git.bb
> > index dfef76d..605fbc1 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > @@ -39,11 +39,11 @@ S = "${WORKDIR}/git"
> > 
> >  BRANCH = "ti-linux-3.8.y"
> > 
> > -SRCREV = "e69f39916783a559c499e264359edea315ef44fd"
> > -PV = "3.8.2"
> > +SRCREV = "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
> > +PV = "3.8.3"
> > 
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> > cause a rebuild
> > -MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > 
> >  SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-
> > kernel.git;protocol=git;branch=${BRANCH} \
> >             file://defconfig \
> > --
> > 1.8.1.5
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

