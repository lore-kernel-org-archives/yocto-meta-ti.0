Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87912E0083D; Wed, 16 Mar 2016 11:31:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D86A5E0079A
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 11:31:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GIVdAd024740
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 13:31:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIVdwY022015
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 13:31:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 13:31:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIVcDX001163;
	Wed, 16 Mar 2016 13:31:38 -0500
Date: Wed, 16 Mar 2016 14:31:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160316183122.GE29659@edge>
References: <1458078091-26696-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1458078091-26696-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: Fix issues with driver reference in dts entries
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
X-List-Received-Date: Wed, 16 Mar 2016 18:31:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Can you please update the commit log to refer uio instead of linux-ti-staging. 
Thanks.

-- 
Denys


On Tue, Mar 15, 2016 at 05:41:31PM -0400, Sam Nelson wrote:
> Correct incorrect driver compatibility key. uio driver implemented with
> uio-module-drv.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi | 4 ++--
>  recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
> index 36f41b0..052ae97 100644
> --- a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
> +++ b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
> @@ -1,7 +1,7 @@
>  / {
>  	soc {
>  		uio_hyperlink0: hyperlink0 {
> -			compatible = "ti,uio-ti-pdrv";
> +			compatible = "ti,uio-module-drv";
>  			mem  = <0x21400000 0x00001000
>  				0x40000000 0x10000000
>  				0x0231a000 0x00002000>;
> @@ -23,7 +23,7 @@
>  			};
>  		};
>  		uio_srss: srss {
> -			compatible = "ti,uio-ti-pdrv";
> +			compatible = "ti,uio-module-drv";
>  			mem  = <0x02330000 0x0000400>;
>  			clocks=<&clksr>;
>  			interrupts = <0 0x173 0xf01>;
> diff --git a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
> index 0334483..a1b2e07 100644
> --- a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
> +++ b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
> @@ -1,7 +1,7 @@
>  / {
>  	soc {
>  		uio_srss: srss {
> -			compatible = "ti,uio-ti-pdrv";
> +			compatible = "ti,uio-module-drv";
>  			mem  = <0x02330000 0x0000400>;
>  			clocks=<&clksr>;
>  			interrupts = <0 0x173 0xf01>;
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

