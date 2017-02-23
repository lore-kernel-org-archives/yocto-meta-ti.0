Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 349B9E00AC0; Thu, 23 Feb 2017 12:34:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4234E009F4
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2017 12:34:31 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1NKYU4f004198
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2017 14:34:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1NKYU8m005995
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2017 14:34:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Feb 2017 14:34:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1NKYTEF020156;
	Thu, 23 Feb 2017 14:34:29 -0600
Date: Thu, 23 Feb 2017 15:34:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170223203429.GH26872@edge>
References: <1487869509-2979-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <1487869509-2979-1-git-send-email-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] conf: am43: Add hdmi dtb file to Device tree files
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
X-List-Received-Date: Thu, 23 Feb 2017 20:34:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Dan,

Thanks for the patch. Please see below.


On Thu, Feb 23, 2017 at 11:05:09AM -0600, Dan Murphy wrote:
> AM43x was missing the hdmi dtb file in the
> KERNEL_DEVICETREE variable.  Adding this in allows for
> a copy to deploy directory.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  conf/machine/include/ti43x.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index 8f2e11f..cf3ef2f 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>  
>  KERNEL_IMAGETYPE = "zImage"
>  
> -KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
> +KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb am437x-gp-evm-hdmi.dtb"

Can you please add new entry right after the other gp-evm is and before sk. Thanks.


>  UBOOT_ARCH = "arm"
>  UBOOT_MACHINE = "am43xx_evm_config"
> -- 
> 2.7.3
> 

