Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8E30E0097C; Tue, 21 Aug 2018 16:25:36 -0700 (PDT)
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
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59470E008D9
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 16:25:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LNPZkn094370
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 18:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534893935;
	bh=+T/nLbdRX5ErVzH4LP3GsnneIJLjJRsyQM7ZGqNBr0Q=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BkgXKlPNh5ph5UjNBaqGPe4uXgWvAXpNyH7DV5k+PWDdsg+RSfTypM/75LA8yVeUH
	KOEuUsRpgcwtjs7T38PSOnDcXop5doZvg7ldhxdzZ9jpVYDZx5iwBbELifW2a4BUmP
	S/RfRSg7OPDoz4oeajp67VQOB52LEDcfKt69ihJ0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LNPZdX022380
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 18:25:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 18:25:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 18:25:35 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LNPZIm032043;
	Tue, 21 Aug 2018 18:25:35 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>
References: <1534893639-56217-1-git-send-email-sam.nelson@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <0e065867-4ef0-53d4-a1a9-bb924f5197cf@ti.com>
Date: Tue, 21 Aug 2018 18:25:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534893639-56217-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko][PATCH] cmem: Update to new version 4.15.00.02
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
X-List-Received-Date: Tue, 21 Aug 2018 23:25:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Sam,

On 08/21/2018 06:20 PM, Sam Nelson wrote:
> Has fix for mmap issues with latest kernel 4.14.x
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/cmem/cmem.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index 1b9c06b..a60ce52 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
>  
> -BRANCH = "ipc-next"
> +BRANCH = "lu-next"

Any reason, why master is not updated to lu-next?

>  # This corresponds to version 4.15.00.02
>  SRCREV = "0f39ed469f7c327cb0b03139976b511c337c7f6a"

Hmm, do you have a local commit that this needs to be squashed to?

The following are the existing lines in this file on rocko branch,

BRANCH = "master"
# This corresponds to version 4.15.00.01
SRCREV = "000038a65af9428b559de5e00e4a7588892ad7b0"

regards
Suman

