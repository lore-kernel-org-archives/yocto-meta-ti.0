Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6074DE00BAF; Fri, 30 Jun 2017 12:57:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E300E00B9F
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 12:57:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5UJv9DQ028111
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 14:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498852629;
	bh=TKmtTf0F/axAx7Eaqv0JVcseUZ6K68IcptaVz0c7LDI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=v1YSy0RnAYVO5LxVJpBLJ/O+U7arhFmV3o8Dhn5D0wMl1CXesuZYAep8ROXqvoXil
	DW4yMZ76mjJWiJwtPEekeUzakYOcqp18Srf62aYDEiI+B+DFE0fSuVymd2Y335Sb3W
	F7hwv/OZ4+V8+p6mfO82/TGXlrbyvmN9LoTN/Xv0=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5UJv4vC022125
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 14:57:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Jun 2017 14:57:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5UJv3t5023898;
	Fri, 30 Jun 2017 14:57:03 -0500
Date: Fri, 30 Jun 2017 15:57:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20170630195701.GX14665@edge>
References: <1498850969-38948-1-git-send-email-m-radhakrishnan2@ti.com>
	<20170630193150.GU14665@edge>
	<5130E41A1BA9D145BA0F3B18D5CFB0A74379818A@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <5130E41A1BA9D145BA0F3B18D5CFB0A74379818A@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] common-csl-ip: Update for CSL version 3.3.0.7 and support for ti33x, ti43x & omap
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
X-List-Received-Date: Fri, 30 Jun 2017 19:57:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 30, 2017 at 03:40:03PM -0400, Radhakrishnan, Mahesh wrote:
> Hi Denys,
>  Yes. I meant omapl1. Shall I re-submit the patch with these corrections?

Yes please

> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, June 30, 2017 3:32 PM
> To: Radhakrishnan, Mahesh
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] common-csl-ip: Update for CSL version 3.3.0.7 and support for ti33x, ti43x & omap
> 
> On Fri, Jun 30, 2017 at 03:29:29PM -0400, Mahesh Radhakrishnan wrote:
> > Update for CSL version 3.3.0.7 and support for ti33x,ti43x & omap
> 
> Thanks. Did you mean omapl1 in the description?
> Also, you don't have to duplicate the same text in subject and body of the patch - both will be in the commit log, which is redundant.
> 
> 
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-bsp/common-csl-ip/common-csl-ip.inc | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > index cac0b93..71ef9e9 100644
> > --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > @@ -2,9 +2,9 @@ DESCRIPTION = "Chip support library low level interface"
> >  LICENSE = "BSD-3-Clause"
> >  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> >  
> > -COMPATIBLE_MACHINE = "keystone|dra7xx"
> > +COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
> >  
> > -PV = "03.03.00.06C"
> > +PV = "03.03.00.07B"
> >  INC_PR = "r0"
> >  
> >  CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> > @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
> >  CSL_GIT_BRANCH = "master"
> >  CSL_GIT_DESTSUFFIX = "git"
> >  
> > -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.06C"
> > -CSL_SRCREV = "ce2bbf96b08fa69eda7bfc92aa7760b7ca70dddf"
> > +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.07B"
> > +CSL_SRCREV = "28dbc2f4b0b06b29ac4e962a9494987d242b48b5"
> >  
> >  BRANCH="${CSL_GIT_BRANCH}"
> >  SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

