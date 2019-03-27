Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 603D0E00D16; Wed, 27 Mar 2019 13:08:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A929E00872
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2019 13:08:07 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2RK87nd026716
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2019 15:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553717287;
	bh=KM8IKMpeXqVHv22CNnKYZZCbvGFd3MKZJlIkUBOcxiw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=pFv7ivnhthXNGj6AoMwyau7LtvYtDVczl8qB2G1/p5CTGcew8IJ66K2E2v49puOwT
	UHh9iNYQfaC6N2/3IOXo3tCFEYTnZPQs54ahna4TWY9OpVaOQYjBwsqRn4IbpzWw+R
	zE/r0q984VYEf3qluCsr9OxtZn3SCSdXQyFHe2Wk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2RK87W6103523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2019 15:08:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 27 Mar 2019 15:08:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 27 Mar 2019 15:08:07 -0500
Received: from [172.22.104.87] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2RK86na122493;
	Wed, 27 Mar 2019 15:08:06 -0500
To: <meta-ti@yoctoproject.org>
References: <20190327200718.10742-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <efbb5c33-bbf3-75e7-d93a-e70db4543cde@ti.com>
Date: Wed, 27 Mar 2019 15:08:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190327200718.10742-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH 1/2] linux-ti-staging: update to ti2019.00-rc4 tag
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
X-List-Received-Date: Wed, 27 Mar 2019 20:08:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 3/27/19 3:07 PM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
> index 05440e6c..6474f89a 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
>  
>  BRANCH = "ti-rt-linux-4.19.y"
>  
> -SRCREV = "24b7d60eb75b1193fed97f0a275ff47afddb6dc3"
> +SRCREV = "1a4ec38759a01193db742b2ae94ed1cfea59be6d"
>  PV = "4.19.25+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> index 9506fa3e..549af69d 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> @@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-4.19.y"
>  
> -SRCREV = "e7e1c645f0757d6c7d8636b3d8080efa0812f2c8"
> +SRCREV = "451567d437af9f45c9fd319cb77b6fc9b7ef20fa"
>  PV = "4.19.25+git${SRCPV}"
>  

I expect that we will see a PV bump for 2019.01.  Not going to do it until after 2019.00 release.

Dan

>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> 


-- 
------------------
Dan Murphy

