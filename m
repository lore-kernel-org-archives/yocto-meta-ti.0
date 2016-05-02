Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D666EE00B52; Mon,  2 May 2016 10:14:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 971F0E0077F
	for <meta-ti@yoctoproject.org>; Mon,  2 May 2016 10:14:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u42HEqUW021662
	for <meta-ti@yoctoproject.org>; Mon, 2 May 2016 12:14:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42HEq2G009985
	for <meta-ti@yoctoproject.org>; Mon, 2 May 2016 12:14:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 May 2016 12:14:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42HEpfe007011;
	Mon, 2 May 2016 12:14:51 -0500
Date: Mon, 2 May 2016 13:14:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160502171436.GI1546@edge>
References: <20160428190038.C1285529EF@arago-project.org>
	<4B26FB5A64EBA14C87266869E037F9581426AD99@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581426AD99@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Sam Nelson : cmem: Update to new eng version 4.11.00.00_eng
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
X-List-Received-Date: Mon, 02 May 2016 17:14:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

I don't think anything was removed or disabled in meta-ti. Other than that, 
yes, in due time cmem dependencies will be re-enabled in meta-arago.

-- 
Denys


On Mon, May 02, 2016 at 10:32:26AM -0400, Stiffler, Jacob wrote:
> Denys,
> 
> Now that the build issue with CMEM has been resolved, will you be reverting 
> the hacks to remove everything that depended on CMEM?
> 
> Thank you,
> Jake
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Arago Project git
> > Sent: Thursday, April 28, 2016 3:01 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] Sam Nelson : cmem: Update to new eng version
> > 4.11.00.00_eng
> > 
> > Module: meta-ti
> > Branch: master
> > Commit: 257a370e7aec4a8954e79697deafec2cd7c2301d
> > URL:    http://arago-project.org/git/meta-
> > ti.git?a=commit;h=257a370e7aec4a8954e79697deafec2cd7c2301d
> > 
> > Author: Sam Nelson <sam.nelson@ti.com>
> > Date:   Thu Apr 28 00:19:45 2016 +0000
> > 
> > cmem: Update to new eng version 4.11.00.00_eng
> > 
> > Resolves issues with kernel version 4.4
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> >  recipes-bsp/cmem/cmem.inc |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > index 19d333c..413f925 100644
> > --- a/recipes-bsp/cmem/cmem.inc
> > +++ b/recipes-bsp/cmem/cmem.inc
> > @@ -4,10 +4,10 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM =
> > "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a6
> > 36c91aed4b02ac1"
> > 
> >  BRANCH ?= "lu-next"
> > -# This corresponds to version 4.10.02.05_eng -SRCREV =
> > "8df44102413c2d653341c5b7e6caee882e206d8c"
> > +# This corresponds to version 4.11.00.00_eng SRCREV =
> > +"852e97b5584cbdb6aa0fdef02a7c4e245409bcb6"
> > 
> > -PV = "4.10.02.05+git${SRCPV}"
> > +PV = "4.11.00.00+git${SRCPV}"
> > 
> >  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> > 
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

