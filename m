Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46563E01388
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 08:24:56 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MFOqbI003602;
	Wed, 22 Aug 2012 10:24:52 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MFOq3I021551;
	Wed, 22 Aug 2012 10:24:52 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 10:24:52 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7MFOqce031969;
	Wed, 22 Aug 2012 10:24:52 -0500
Date: Wed, 22 Aug 2012 11:24:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120822152450.GA21025@edge>
References: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2012 15:24:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2012 at 07:48:31AM -0700, Khem Raj wrote:
> protocol is supported proto is not.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

So, how many times this needs fixing?

-- 
Denys


> ---
>  recipes-bsp/ti/am-sysinfo_svn.bb            |    2 +-
>  recipes-ti/dmai/ti-dmai.inc                 |    2 +-
>  recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
> index d4f8740..b73a884 100644
> --- a/recipes-bsp/ti/am-sysinfo_svn.bb
> +++ b/recipes-bsp/ti/am-sysinfo_svn.bb
> @@ -9,7 +9,7 @@ SRCREV = "5"
>  PV = "1.0"
>  PR = "r1+svnr${SRCPV}"
>  
> -SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
> +SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
>  
>  S = "${WORKDIR}/trunk"
>  
> diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
> index 23481b7..58955b5 100644
> --- a/recipes-ti/dmai/ti-dmai.inc
> +++ b/recipes-ti/dmai/ti-dmai.inc
> @@ -17,7 +17,7 @@ DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
>  
>  S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
>  
> -SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
> +SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
>  		file://loadmodules-ti-dmai-dm6446_al.sh \
>  		file://loadmodules-ti-dmai-dm6467_al.sh \
>  		file://loadmodules-ti-dmai-o3530_al.sh \
> diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
> index 3d260ed..f314a35 100644
> --- a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
> +++ b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
> @@ -11,7 +11,7 @@ SRCREV = "962"
>  # apply patches from tracker 1208 to get zero copy support.
>  # https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=TrackerItemEdit&tracker_item_id=1208&start=175
>  
> -SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=https;user=anonymous;pswd='' \
> +SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;protocol=https;user=anonymous;pswd='' \
>             file://gstreamer-ti-rc.sh \
>             file://r962-remove-include-videodev.diff \
>             file://gstti-init.service \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

