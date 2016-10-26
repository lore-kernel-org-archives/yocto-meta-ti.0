Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51234E00D5E; Wed, 26 Oct 2016 13:23:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0742E00D59
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 13:23:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9QKNdVg017287
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:23:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9QKNdYT013449
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:23:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Oct 2016 15:23:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9QKNdBQ030602;
	Wed, 26 Oct 2016 15:23:39 -0500
Date: Wed, 26 Oct 2016 16:23:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20161026202338.GB12745@edge>
References: <1477513173-11563-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1477513173-11563-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-gc320-libs: add all libraries to FILES
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
X-List-Received-Date: Wed, 26 Oct 2016 20:23:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 26, 2016 at 04:19:33PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>

Description doesn't explain the reason. It's meant to explain why, not what.


>  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 45c8d51..90b27e9 100644
> --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -26,7 +26,7 @@ python __anonymous() {
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -36,4 +36,6 @@ do_install() {
>      oe_runmake install
>  }
>  
> +FILES_${PN} += "${libdir}/*"

Isn't it the default?


>  INSANE_SKIP_${PN} += "ldflags"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

