Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8475FE0071C; Tue, 25 Oct 2016 11:12:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F4C3E006E9
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 11:12:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PICmcv008185
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 13:12:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PIClBC011274
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 13:12:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 13:12:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PIClgn024821;
	Tue, 25 Oct 2016 13:12:47 -0500
Date: Tue, 25 Oct 2016 14:12:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20161025181246.GN12745@edge>
References: <1476362286-27157-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1476362286-27157-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-sgx-ddk-km: remove dependency between user-mode and kernel-mode builds
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
X-List-Received-Date: Tue, 25 Oct 2016 18:12:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

am57xx-evm is now breaking with this at do_compile():

/bin/sh: eurasiacon/binary2_omap_linux_release/target/install.sh: No such file or directory

-- 
Denys


On Thu, Oct 13, 2016 at 06:08:06PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> index 7007c20..d0e9206 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> @@ -25,7 +25,7 @@ BRANCH = "ti-img-sgx/${PV}/k4.4"
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "a5a0fe1799cabfa1278321b667263cf3fa2cf32f"
> +SRCREV = "e68719ba7c54602c710b6615cd665f5b7f47f85e"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

