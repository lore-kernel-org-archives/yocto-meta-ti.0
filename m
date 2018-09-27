Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 055ADE00B6C; Thu, 27 Sep 2018 14:36:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67F2BE0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:36:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RLacRD109048
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538084198;
	bh=XlMAFRepWztpyZS1DEjPBzdXuvRI4BUsnaXmPt68DcE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=g/to2EHB1ZgdkD69e9Xd6Wj6r7udoMo35Wkp/V0BLF+fuSI4ldYUWzhhYsCQnvNAS
	9c9cv7RPkwlAPhlCVQhpqVcPWqNtQxq+SzcVMrA4BkPLaxyC7/NC+HZlLEiAsQxHDq
	V0VeAZXrON5bKrcr6B/kTzp6XXpOYVZo+5xn94xQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLac76021463
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:36:38 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:36:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:36:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLacgU004888;
	Thu, 27 Sep 2018 16:36:38 -0500
Date: Thu, 27 Sep 2018 17:36:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927213638.GM8582@beryl>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538081009-52859-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2 01/30] ti-pdk-bbclass: Checking for doxygen support in the correct manner
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
X-List-Received-Date: Thu, 27 Sep 2018 21:36:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 04:43:00PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  classes/ti-pdk.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 0716074..f59969f 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -9,8 +9,8 @@ DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
>  DEPENDS_remove_ti33x = "ti-cgt6x-native"
>  DEPENDS_remove_ti43x = "ti-cgt6x-native"
>  DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> -DEPENDS_remove_am65xx-evm = "gcc-arm-none-eabi-native ti-cgt6x-native"
> -DEPENDS_append_am65xx-evm = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
> +DEPENDS_remove_k3 = "gcc-arm-none-eabi-native ti-cgt6x-native"
> +DEPENDS_append_k3 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> @@ -72,7 +72,7 @@ PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
>  PARALLEL_MAKE = ""
>  
>  def get_doxygen_support(d):
> -    if d.getVar('TI_PDK_DOXYGEN_SUPPORT') == '1':
> +    if d.getVar('TI_PDK_DOXYGEN_SUPPORT', True) == '1':

"Checking for doxygen support in the correct manner"

Why the change?


>          return ''
>      return 'DOXYGEN_SUPPORT=no'
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

