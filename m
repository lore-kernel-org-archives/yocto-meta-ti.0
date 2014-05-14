Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B42BBE00724; Wed, 14 May 2014 11:43:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 813CDE0053B
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 11:42:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4EIgwlY023850
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 13:42:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EIgwCQ029019
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 13:42:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 May 2014 13:42:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EIgwXu011518;
	Wed, 14 May 2014 13:42:58 -0500
Date: Wed, 14 May 2014 14:42:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20140514184257.GP18053@edge>
References: <1400009529-12246-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400009529-12246-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone: u-boot: change UBOOT_MACHINE name to "k2hk_evm_config"
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
X-List-Received-Date: Wed, 14 May 2014 18:43:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 13, 2014 at 03:32:09PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  conf/machine/include/keystone.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index b961ad3..63f069c 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -12,7 +12,7 @@ MACHINE_KERNEL_PR = "r7"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> -UBOOT_MACHINE = "tci6638_evm_config"
> +UBOOT_MACHINE = "k2hk_evm_config"

What's the difference? Which one do you use for MCSDK builds? Are all the 
versions and variants covered by that config?


>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

