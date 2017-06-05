Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD2FAE00BB5; Mon,  5 Jun 2017 15:33:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AD40E00BBD
	for <meta-ti@yoctoproject.org>; Mon,  5 Jun 2017 15:32:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55MWVeC025384
	for <meta-ti@yoctoproject.org>; Mon, 5 Jun 2017 17:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496701951;
	bh=SflIDZI0IaXA6fciHBMLAMetza3MjfxYb+TPrpdfOh8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BJUiGssIIhzA0vL05HnHETx8OdKlF19OI4UzhxifYfbj8WoWu9RpEDM6h/SVfl3yN
	ewwmMIdJd7JrYF7prr0ZZPbxXUdkzYzOLnMH5JWsCJVqRB+S6h+Liex5wpLaGNimDE
	WgDUgLpqqC8QdsSjrhhAmB/l6ns1y3I+03BNPWa4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55MWV27032467
	for <meta-ti@yoctoproject.org>; Mon, 5 Jun 2017 17:32:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 17:32:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55MWUVK030933;
	Mon, 5 Jun 2017 17:32:30 -0500
Date: Mon, 5 Jun 2017 18:32:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170605223214.GW9756@edge>
References: <20170605144709.3342-1-dmurphy@ti.com>
	<20170605144709.3342-2-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170605144709.3342-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] uboot-ti-staging: update to ti2017.02-rc1 tag
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
X-List-Received-Date: Mon, 05 Jun 2017 22:33:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Dan,

This commit doesn't seem to exist and it breaks the build.


On Mon, Jun 05, 2017 at 09:47:08AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
> index c0d81b7d..5114fe31 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r4"
> +PR = "r5"
>  
>  BRANCH = "ti-u-boot-2017.01"
>  
> -SRCREV = "9fd60700db4562ffac00317a9a44761b8c3255f1"
> +SRCREV = "5147c6edfb017e6cd337c5c13a5b5af2bc2c2654"
> -- 
> 2.12.2
> 

