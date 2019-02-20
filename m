Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 388ECE00BB7; Wed, 20 Feb 2019 14:16:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 091E4E0090E
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 14:16:11 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1KMGBnR093129
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 16:16:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550700971;
	bh=NWJqMZML4tCvaT/LTzuxem08lq+23a/K+fAvUKYYbak=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YFtxnsWszjMhs9P4NCB5E8j2tm88SUZx0/diFF4UqQ1nWChKxA+nb3RGbSy/lF93w
	ZW5uhjQppAh1cV+8QdlSImDUI/EZpq8xFaSOzEWVJm6bmU5QmesSut+2TOrYw2XJ5f
	muaWSdg7KxznwBcqYHolloxee/kXCsL/sjKOI+Ng=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1KMGBn3096618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 16:16:11 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 20 Feb 2019 16:16:10 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 20 Feb 2019 16:16:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1KMGAe2019553;
	Wed, 20 Feb 2019 16:16:10 -0600
Date: Wed, 20 Feb 2019 17:16:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20190220221609.GC11501@beryl>
References: <20190218231230.14092-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190218231230.14092-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][PATCH] ti-gc320-driver: move to k4.19
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
X-List-Received-Date: Wed, 20 Feb 2019 22:16:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 18, 2019 at 05:12:30PM -0600, Gowtham Tammana wrote:
>   - Updated the recipe to pick sources for k4.19
>   - Removed the gcc8 workaround patch as the new srcrev include those fixes
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
...
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index 1a6bc5da..551a3512 100644
> --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -9,12 +9,11 @@ MACHINE_KERNEL_PR_append = "e"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  # Need to branch out with ${PV} var
> -BRANCH = "ti-${PV}-k4.14"
> +BRANCH = "ti-${PV}-k4.19"
>  
> -SRCREV = "a36799d9329efcfff19e30e690156d5ebf7e0c55"
> +SRCREV = "9b59e596b4adefabbb686ce8845edef8114558fd"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH} \
> -	file://0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch;striplevel=2"
> +SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}

This change lost the closing quote in SRC_URI, leading to parse errors.
Please at least build-test your patches before submitting them! Thanks.


>  S = "${WORKDIR}/git/src"
>  
> -- 
> 2.20.1
> 

