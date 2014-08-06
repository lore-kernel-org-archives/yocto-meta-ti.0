Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 252F5E00566; Wed,  6 Aug 2014 16:13:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 803AEE00559
	for <meta-ti@yoctoproject.org>; Wed,  6 Aug 2014 16:13:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76NDqxl004765
	for <meta-ti@yoctoproject.org>; Wed, 6 Aug 2014 18:13:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NDqZF031582
	for <meta-ti@yoctoproject.org>; Wed, 6 Aug 2014 18:13:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 18:13:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NDqjR013080;
	Wed, 6 Aug 2014 18:13:52 -0500
Date: Wed, 6 Aug 2014 19:13:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140806231351.GM23523@edge>
References: <1407363057-18975-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1407363057-18975-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] am57xx-evm: Update the config name used in U-boot for this board
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
X-List-Received-Date: Wed, 06 Aug 2014 23:13:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 06, 2014 at 05:10:57PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  conf/machine/am57xx-evm.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
> index 56b1873..0beed60 100644
> --- a/conf/machine/am57xx-evm.conf
> +++ b/conf/machine/am57xx-evm.conf
> @@ -8,7 +8,7 @@ IMAGE_FSTYPES += "ubi tar.gz"
>  
>  SERIAL_CONSOLE = "115200 ttyO2"
>  
> -UBOOT_MACHINE = "dra7xx_evm_config"
> +UBOOT_MACHINE = "beagle_x15_config"

What's the actual difference in settings?


>  # UBI information.  Note that this is board and kernel specific.  Changes
>  # in your kernel port may require changes in these variables.  For more
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

