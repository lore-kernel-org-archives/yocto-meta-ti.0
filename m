Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D06FDE00953; Wed, 29 Mar 2017 17:12:18 -0700 (PDT)
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A8EAE00901
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 17:12:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2U0BdlL024018;
	Wed, 29 Mar 2017 19:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490832699;
	bh=ePbLP5CpxQ2iaVZJDnIzDsnCJdKt7B73JE0hbfZz78g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GrmhXwnOfPmKxDElqXczxDGq26STyMQ3ZG4g2IXBWSGYkZHk3jd4zY4HeVMhLhrOK
	2F77HxXgUUY62iTf3tJeI9QvNksBesq0nd8fW3Jv2ZUB5C/J2KZCTEUZPo6x4ldnu3
	UbQ/Z0kTuWsKJkjlQd0tHsgV6TSJFYiYyORk5nFw=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2U0BdoJ025313;
	Wed, 29 Mar 2017 19:11:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 19:11:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2U0BcHd007822;
	Wed, 29 Mar 2017 19:11:38 -0500
Date: Wed, 29 Mar 2017 20:11:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170330001138.GJ11364@edge>
References: <1490576320-39277-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1490576320-39277-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] openmp-rtos: calls doxygen, depend on doxygen-native
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
X-List-Received-Date: Thu, 30 Mar 2017 00:12:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK due to dependencies - will have to figure our something else.


On Sun, Mar 26, 2017 at 08:58:38PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-ti/openmp-rtos/openmp-rtos_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index 5bf902b..a798985 100644
> --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -19,7 +19,7 @@ SRCREV = "a9aae66f792e999dafbd2e0bd834f98122398c4c"
>  
>  LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
>  
> -DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
> +DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native doxygen-native"
>  DEPENDS_append_k2hk-evm = " qmss-lld-rtos cppi-lld-rtos"
>  DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
>  DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
> -- 
> 2.7.4
> 

