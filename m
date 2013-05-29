Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92484E01466
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 14:18:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4TLI6ns028789
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 16:18:07 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4TLI6ts006513
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 16:18:06 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 16:18:06 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4TLI6T9028007;
	Wed, 29 May 2013 16:18:06 -0500
Date: Wed, 29 May 2013 17:18:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Prabindh Sundareson <prabu@ti.com>
Message-ID: <20130529211805.GM4526@edge>
References: <prabu@ti.com>
 <1368809879-27201-8-git-send-email-prabu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1368809879-27201-8-git-send-email-prabu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 08/10] libgles-omap3: Package files with right permission
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
X-List-Received-Date: Wed, 29 May 2013 21:18:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 17, 2013 at 10:27:57PM +0530, Prabindh Sundareson wrote:
> This patch adds the .so library files into the package, with correct
> permissions for startup scripts.
> 
> This is part of a clean up of the Graphics recipe starting from
> 4.09.00.01 version of the Graphics SDK.
> 
> Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> ---
>  recipes-graphics/libgles/libgles-omap3-no-x.inc |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> index 4521d59..5bb257d 100644
> --- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> +++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> @@ -139,6 +139,7 @@ do_install () {
>  	
>  	install -d ${D}${sysconfdir}/init.d/
>  	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
> +	chmod +x ${D}${sysconfdir}/init.d/pvr-init
>  
>  	install -d ${D}${sysconfdir}
>  	echo "[default]" > ${D}${sysconfdir}/powervr.ini
> @@ -285,6 +286,8 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
>  INSANE_SKIP_${PN}-tests = "ldflags"
>  
> +FILES_${PN} += "${libdir}/*.so "
> +FILES_${PN}-dev = "${includedir}"

See my comment for 7/10

>  inherit update-rc.d
>  
>  INITSCRIPT_NAME = "pvr-init"
> -- 
> 1.7.1
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

