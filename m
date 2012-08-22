Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07670E00283
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:20:53 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MHKcdP005973;
	Wed, 22 Aug 2012 12:20:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MHKcFu000368;
	Wed, 22 Aug 2012 12:20:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 12:20:38 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7MHKcmK029127;
	Wed, 22 Aug 2012 12:20:38 -0500
Date: Wed, 22 Aug 2012 13:20:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120822172038.GE21025@edge>
References: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
	<20120822152450.GA21025@edge>
	<CAMKF1spkEvJNcs4fr75jbM9ByCFU__QfiJfZxQOjOUJ6hDdC0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spkEvJNcs4fr75jbM9ByCFU__QfiJfZxQOjOUJ6hDdC0A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Replace proto= with protocol= in SRC_URI
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
X-List-Received-Date: Wed, 22 Aug 2012 17:20:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2012 at 10:07:30AM -0700, Khem Raj wrote:
> On Wed, Aug 22, 2012 at 8:24 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Wed, Aug 22, 2012 at 07:48:31AM -0700, Khem Raj wrote:
> >> protocol is supported proto is not.
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > So, how many times this needs fixing?
> >
> 
> as many times as stale mirrors
> 
> here is my problem
> 
> 
> [remote "origin"]
>         fetch = +refs/heads/*:refs/remotes/origin/*
>         url = git://github.com/Angstrom-distribution/meta-ti.git
> 
> and master on that mirror is still at
> 
> commit d3ff5630a74640f46ca2ceaef1aa1baa86b9b795
> Author: Andreas M??ller <schnitzeltony@googlemail.com>
> Date:   Mon Jul 9 14:35:36 2012 +0200
> 
>     netbase: follow oe-core to v5.0
> 
>     Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> 
> Koen should angstrom still use meta-ti from github or from git.yp.org
> for angstrom-next ?

Sorry, still not convinced:

https://github.com/Angstrom-distribution/setup-scripts/blob/master/sources/layers.txt
https://github.com/Angstrom-distribution/setup-scripts/blob/next/sources/layers.txt
https://github.com/Angstrom-distribution/setup-scripts/blob/angstrom-v2012.05-yocto1.2/sources/layers.txt

All the branches point to the correct location of meta-ti on git.yp.org

Moreover, it was pointing there since March:

https://github.com/Angstrom-distribution/setup-scripts/commit/edc1ec58f60de2624dd376182e0d1d6c463675a0

I couldn't find in the history when it was ever pointing to that mirror - are 
you sure you didn't make the change yourself?

-- 
Denys


> >> ---
> >>  recipes-bsp/ti/am-sysinfo_svn.bb            |    2 +-
> >>  recipes-ti/dmai/ti-dmai.inc                 |    2 +-
> >>  recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb |    2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
> >> index d4f8740..b73a884 100644
> >> --- a/recipes-bsp/ti/am-sysinfo_svn.bb
> >> +++ b/recipes-bsp/ti/am-sysinfo_svn.bb
> >> @@ -9,7 +9,7 @@ SRCREV = "5"
> >>  PV = "1.0"
> >>  PR = "r1+svnr${SRCPV}"
> >>
> >> -SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
> >> +SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
> >>
> >>  S = "${WORKDIR}/trunk"
> >>
> >> diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
> >> index 23481b7..58955b5 100644
> >> --- a/recipes-ti/dmai/ti-dmai.inc
> >> +++ b/recipes-ti/dmai/ti-dmai.inc
> >> @@ -17,7 +17,7 @@ DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
> >>
> >>  S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
> >>
> >> -SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
> >> +SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
> >>               file://loadmodules-ti-dmai-dm6446_al.sh \
> >>               file://loadmodules-ti-dmai-dm6467_al.sh \
> >>               file://loadmodules-ti-dmai-o3530_al.sh \
> >> diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
> >> index 3d260ed..f314a35 100644
> >> --- a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
> >> +++ b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
> >> @@ -11,7 +11,7 @@ SRCREV = "962"
> >>  # apply patches from tracker 1208 to get zero copy support.
> >>  # https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=TrackerItemEdit&tracker_item_id=1208&start=175
> >>
> >> -SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=https;user=anonymous;pswd='' \
> >> +SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;protocol=https;user=anonymous;pswd='' \
> >>             file://gstreamer-ti-rc.sh \
> >>             file://r962-remove-include-videodev.diff \
> >>             file://gstti-init.service \
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti

