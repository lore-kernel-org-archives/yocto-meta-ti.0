Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F019E00D00; Fri, 13 Oct 2017 09:49:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBED0E00CFE
	for <meta-ti@yoctoproject.org>; Fri, 13 Oct 2017 09:49:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9DGnM1W001677;
	Fri, 13 Oct 2017 11:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507913362;
	bh=omLz7G+n38AuoZF+31JjsKvYCjNVl+npN1OxzRTLvis=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=s57Auvpv+r+nP1LRdOtiMMrmumNv5AJHe98xtMod8HQFSC2l7n5W6DZzQ4q7o+C9K
	fvw5vFXT5ZJ9Y4iM/MC5JGD+Aw69EWZPI4fHoeX7UxugTVmcLrg06+uOP+dKfUPxAg
	r5l2ipOJxs2s+YQ54yonuQVFVrGV8NpyBvCheLzs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9DGnMwI030568;
	Fri, 13 Oct 2017 11:49:22 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 13 Oct 2017 11:49:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 13 Oct 2017 11:49:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9DGnMuN031097;
	Fri, 13 Oct 2017 11:49:22 -0500
Date: Fri, 13 Oct 2017 12:49:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20171013164906.GH16210@edge>
References: <1507842509-789-1-git-send-email-denis@denix.org>
	<1507842509-789-5-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1507842509-789-5-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][PATCH 5/5] FIXME: ti-sgx-ddk-km: bypass gcc7 fallthrough check
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
X-List-Received-Date: Fri, 13 Oct 2017 16:49:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 12, 2017 at 05:08:29PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> index 0e5411f..8515239 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> @@ -33,6 +33,8 @@ TARGET_PRODUCT_ti43x = "ti437x"
>  
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
>  
> +KERNEL_CC += "-Wimplicit-fallthrough=0"

Well, this flag is gcc7-specific and breaks gcc6 builds... :(


> +
>  do_compile_prepend() {
>      cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
>  }
> -- 
> 2.7.4
> 

