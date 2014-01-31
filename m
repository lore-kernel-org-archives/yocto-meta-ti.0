Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B27A8E00546
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 15:07:26 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VN7PVi001590
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 17:07:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VN7Pib001266
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 17:07:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 17:07:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VN7OaW031971;
	Fri, 31 Jan 2014 17:07:25 -0600
Date: Fri, 31 Jan 2014 18:07:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140131230724.GM6814@edge>
References: <1391209176-28710-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391209176-28710-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone: Add pci feature to MACHINE Keystone
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
X-List-Received-Date: Fri, 31 Jan 2014 23:07:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2014 at 05:59:36PM -0500, Sam Nelson wrote:
> - Device support pci interface

Ack, but normally you would want to bump MACHINE_KERNEL_PR, which is 
conveniently located in the same .inc file. That way if someone was building 
before and after this change, they'll get the kernel and all external modules 
rebuilt with the change. Otherwise the rebuild won't be triggered, unless you 
change something else in the kernel or do a clean build (which you always do)


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  conf/machine/include/keystone.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index 72e71bf..02bd295 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -20,4 +20,4 @@ UBOOT_LOADADDRESS = "0x80008000"
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  EXTRA_IMAGEDEPENDS += "boot-monitor"
>  
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

