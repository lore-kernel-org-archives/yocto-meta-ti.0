Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0A07E00ACD; Mon,  1 May 2017 12:10:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFA55E00546
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:10:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41JAoFn022910
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493665850;
	bh=KY1Zl370351Fwqfh0ELgGPqpRtFA06K2last0MX/Ghw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PGr0ND+5ExhZjy7hwOuirs5qbImL01R5v9i3c0GwJN5N9FSy80F+MTyyVR6dSbLiw
	Fn8ys37WTwJHNFyq0CaQqUTIbUuoX9/tjozZJCmmgkrrMxyvULEeZjvqvVk3m6EON9
	fFu/x6FYOxPF5Pm+YQQgvHL+V7zzg6Nrc1u7zAkA=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JAoO8030510
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:10:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:10:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JAn7n017777;
	Mon, 1 May 2017 14:10:49 -0500
Date: Mon, 1 May 2017 15:10:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170501191049.GV31608@edge>
References: <20170501190150.4110-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170501190150.4110-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [v2 PATCH 1/4] linux-ti-staging: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:10:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Dan,

Thanks for the patch set! I only have a small comment for boot-monitor.


On Mon, May 01, 2017 at 02:01:47PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - No changes
> 
>  recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> index ba5b30c4..f156ab1f 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> @@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
>  
>  BRANCH = "ti-rt-linux-4.9.y"
>  
> -SRCREV = "9aca48cec363e084da1a6fef6ca4e16dd6788312"
> +SRCREV = "ca8f5854f1d211373e2bd80307215b086f18cbe1"
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> index ab5852bc..17e5af58 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> @@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-lsk-linux-4.9.y"
>  
> -SRCREV = "36a655ef1ade71c52c52c2e2ba5cb6cbb2e5031a"
> -PV = "4.9.24+git${SRCPV}"
> +SRCREV = "cfe6f9907fd6d84fdcc2728c8ec9c79c07127c2e"
> +PV = "4.9.25+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "c"
> -- 
> 2.12.2
> 

