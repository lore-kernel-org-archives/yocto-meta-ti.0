Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01ADAE0097C; Tue, 21 Aug 2018 17:55:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87D36E008D9
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 17:55:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7M0tUBr109765
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 19:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534899330;
	bh=P6c+5KKrcaTH0vCGLTvQTZf5eXRxMaS/XNceoOWtAFg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=h5QF8Xzn969I644fFja7qsdPa13YQAsqASZ0mqT9jUVxZvBbCAOFztm4FfusqHji8
	mtA6xKy3Htl8h0hK9aLvZB/i5QC1c5dymyT7wrXK5NCPyEgOCZDUBWOErMR3TGyNly
	Ul7RSD8i/QAEGZetk+kglo6etERLdUcD33ew9dpg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7M0tUNb013414
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 19:55:30 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 19:55:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 19:55:29 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7M0tTK0032621;
	Tue, 21 Aug 2018 19:55:29 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>, Denys
	Dmytriyenko <denys@ti.com>
References: <1534899193-58792-1-git-send-email-sam.nelson@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <34be7042-7ddb-bfa7-89f5-6b86cad93d8c@ti.com>
Date: Tue, 21 Aug 2018 19:55:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534899193-58792-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko][PATCH v3] cmem: Update to new version 4.15.00.02
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
X-List-Received-Date: Wed, 22 Aug 2018 00:55:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/21/2018 07:53 PM, Sam Nelson wrote:
> Has fix for mmap issues with latest kernel 4.14.x
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>

Thanks, looks good now.

Reviewed-by: Suman Anna <s-anna@ti.com>

Denys,
Please pick this up for 2018.03-rc4.

regards
Suman

> 
> ---
> Change from previous version of patch
> Changed branch to master
> ---
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/cmem/cmem.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index 695432a..11cebe8 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -4,10 +4,10 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
>  
>  BRANCH = "master"
> -# This corresponds to version 4.15.00.01
> -SRCREV = "000038a65af9428b559de5e00e4a7588892ad7b0"
> +# This corresponds to version 4.15.00.02
> +SRCREV = "0f39ed469f7c327cb0b03139976b511c337c7f6a"
>  
> -PV = "4.15.00.01+git${SRCPV}"
> +PV = "4.15.00.02+git${SRCPV}"
>  
>  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>  
> 


