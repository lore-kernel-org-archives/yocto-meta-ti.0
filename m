Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 252A4E00C48; Fri, 28 Aug 2015 09:21:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6EFEE006BC
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 09:21:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7SGLjul021122
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 11:21:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7SGLinR022049
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 11:21:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 28 Aug 2015 11:21:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7SGLiAY004415;
	Fri, 28 Aug 2015 11:21:44 -0500
Date: Fri, 28 Aug 2015 12:21:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150828162129.GI26662@edge>
References: <1440731769-15759-1-git-send-email-h-gou@ti.com>
	<1440731769-15759-4-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1440731769-15759-4-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] libdrm: add ti33x and ti43x to COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 28 Aug 2015 16:21:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hongmei, Karthik, Nikhil,

Ok, this is not going to scale. Why do we still use an ancient (2.5yo) version 
of libdrm? As far as I can see, this fork only has couple own patches (test 
enablement and debianization) and few more backports from upstream.

Please, extract the relevant patches (just kmstest AFAICS) and apply it/them 
to the latest available upstream version of libdrm. This old version was once 
a short-term exception to dra7 platform, but with this change it now becomes 
the default and it has to be done properly then.

-- 
Denys


On Thu, Aug 27, 2015 at 11:16:09PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  recipes-graphics/drm/libdrm_2.4.41.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
> index 0150632..dc1fbe1 100644
> --- a/recipes-graphics/drm/libdrm_2.4.41.bb
> +++ b/recipes-graphics/drm/libdrm_2.4.41.bb
> @@ -2,7 +2,7 @@ require recipes-graphics/drm/libdrm.inc
>  
>  FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> @@ -15,6 +15,6 @@ SRC_URI += "file://installtests-ti.patch \
>              file://GNU_SOURCE_definition.patch \
>             "
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  S = "${WORKDIR}/git"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

