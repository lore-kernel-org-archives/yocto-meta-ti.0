Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67D57E00E27; Thu, 21 Dec 2017 08:16:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C609EE00D07
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 08:16:04 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBLGFs8T012226
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 10:15:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513872954;
	bh=afkTYx8sJOt6/V8pZl06e3cOFBwYNoA+dWTle1MHtIY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zVWAngYrPoqUm5GyJBmSrwz5Aowyb9GL3XcTdwVk4qP2xZLMCCMcYLUtLEBWa7px6
	nIMG5EY4zEL2mP7pkcajxcIQclMLieeZd6AcCi7bIkukO/3T0Y0ULsY3edSyE2HviS
	+LMKoFoE3qkfI2H6u5+SXYUe6njOUkEJKMCIPre0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLGFmtx006875
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 10:15:48 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 21 Dec 2017 10:15:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 21 Dec 2017 10:15:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLGFm5t000616;
	Thu, 21 Dec 2017 10:15:48 -0600
Date: Thu, 21 Dec 2017 11:15:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20171221161547.GD5984@edge>
References: <1513804088-7428-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1513804088-7428-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] nimu-rtos: Adding support for c66x, omapl1 & dra7xx
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
X-List-Received-Date: Thu, 21 Dec 2017 16:16:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 20, 2017 at 04:08:08PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/transport-rtos/nimu-rtos_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> index 5366da7..7f4a00d 100644
> --- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> @@ -22,6 +22,10 @@ DEPENDS_append_k2hk-evm = " pa-lld-rtos"
>  DEPENDS_append_k2e-evm = " pa-lld-rtos"
>  DEPENDS_append_k2l-evm = " pa-lld-rtos"
>  DEPENDS_append_k2g = " emac-lld-rtos"
> +DEPENDS_append_c665x-evm = " emac-lld-rtos"
> +DEPENDS_append_c667x-evm = " pa-lld-rtos"
> +DEPENDS_append_omapl1 = " emac-lld-rtos"
> +DEPENDS_append_dra7xx-evm = " emac-lld-rtos"

Should this be dra7xx or dra7xx-evm?


>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

