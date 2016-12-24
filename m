Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 119CDE0034A; Fri, 23 Dec 2016 18:05:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61793E0030B
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 18:04:57 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBO24uHD021030
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 20:04:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBO24uAL009670
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 20:04:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Dec 2016 20:04:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBO24ujv028662;
	Fri, 23 Dec 2016 20:04:56 -0600
Date: Fri, 23 Dec 2016 21:04:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20161224020455.GF28380@edge>
References: <1482428592-7035-1-git-send-email-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <1482428592-7035-1-git-send-email-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-gc320-driver: add support for RT kernel
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
X-List-Received-Date: Sat, 24 Dec 2016 02:05:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please make sure you are subscribed to the list and can post w/o 
problems - it appears this patch never made it to the list.

-- 
Denys


On Thu, Dec 22, 2016 at 11:43:12AM -0600, Gowtham Tammana wrote:
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index 9344e30..8ad7e4b 100644
> --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  # Need to branch out with ${PV} var
>  BRANCH = "ti-${PV}-k4.4"
>  
> -SRCREV = "7a2b06ad1df46a274336f7ae0e24a9d67e72cd66"
> +SRCREV = "65887c911db495fb66c6847c8b6eadc76c7470f4"
>  
>  SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
>  S = "${WORKDIR}/git/src"
> -- 
> 1.9.1
> 

