Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32B18E01757
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:43:51 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA7Hhped019661;
	Thu, 7 Nov 2013 11:43:51 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7HhoDE030915;
	Thu, 7 Nov 2013 11:43:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Nov 2013 11:43:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7Hho1k017623;
	Thu, 7 Nov 2013 11:43:50 -0600
Date: Thu, 7 Nov 2013 12:43:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131107174349.GQ4510@edge>
References: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] omap3-sgx-modules: Enable is only for relevant machines
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
X-List-Received-Date: Thu, 07 Nov 2013 17:43:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 06, 2013 at 08:52:48PM -0800, Khem Raj wrote:
> When layers is parsed in multi-bsp layer distros and
> a non-omap/non-arm machine is used this causes parse
> failures

Can you be more specific with the parse errors? I don't want a real issue (if 
any) to be simply masked away...


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> index 31c7d4e..79b73cb 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> @@ -10,6 +10,13 @@ BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
>  
>  inherit module
>  
> +COMPATIBLE_HOST_omap3 = ".*"
> +COMPATIBLE_HOST_omap4 = ".*"
> +COMPATIBLE_HOST_ti814x = ".*"
> +COMPATIBLE_HOST_ti816x = ".*"
> +COMPATIBLE_HOST_ti33x = ".*"
> +COMPATIBLE_HOST ?= "(none)"
> +
>  MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -- 
> 1.8.3.2
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

