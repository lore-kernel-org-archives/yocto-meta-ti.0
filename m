Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2892E01438
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 23:16:55 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8E6Gt0D006920
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:16:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8E6GtQN022012
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:16:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 14 Sep 2012 01:16:54 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8E6Gsqp020729	for
	<meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:16:55 -0500
Date: Fri, 14 Sep 2012 02:16:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20120914061653.GB26968@edge>
References: <1347603239-10221-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1347603239-10221-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] ti-hw-bringup-image: remove duplicate timestamp-service, as it's in systemd-image
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
X-List-Received-Date: Fri, 14 Sep 2012 06:16:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This is a single patch, not 1/2 in a series, as Subject suggests, sorry.

-- 
Denys


On Fri, Sep 14, 2012 at 02:13:59AM -0400, Denys Dmytriyenko wrote:
> Since systemd-image from meta-angstrom already includes timestamp-service, remove
> the duplicate from ti-hw-bringup-image recipe, which uses the former as a base.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-misc/images/ti-hw-bringup-image.bb |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
> index e8dd5ed..62b4c73 100644
> --- a/recipes-misc/images/ti-hw-bringup-image.bb
> +++ b/recipes-misc/images/ti-hw-bringup-image.bb
> @@ -23,7 +23,6 @@ IMAGE_INSTALL += " \
>  	bc \
>  	packagegroup-ti-test \
>  	kernel-modules \
> -	timestamp-service \
>  	${EXTRA_MACHINE_IMAGE_INSTALL} \
>  "
>  
> -- 
> 1.7.8.6
> 

