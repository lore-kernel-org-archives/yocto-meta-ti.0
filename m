Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9732AE002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:51:57 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8I0pvq1027555
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:51:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8I0pvYg008863
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:51:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 17 Sep 2012 19:51:56 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8I0puvl008128	for
	<meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:51:56 -0500
Date: Mon, 17 Sep 2012 20:51:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20120918005156.GF1708@edge>
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
X-List-Received-Date: Tue, 18 Sep 2012 00:51:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This one is also a trivial change - regardless of whether this recipe stays or 
goes, the change is only cosmetic, as it removes duplicate that is already 
included in the base systemd-image recipe. Any objections for me pushing it in?

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

