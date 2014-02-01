Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B29FE0059E
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 21:54:33 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s115sVCW015715
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 23:54:31 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s115sVco030440
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 23:54:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 23:54:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s115sV7N018585;
	Fri, 31 Jan 2014 23:54:31 -0600
Date: Sat, 1 Feb 2014 00:54:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140201055430.GU6814@edge>
References: <1391230078-15052-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391230078-15052-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] keystone: Add pci feature to MACHINE Keystone
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
X-List-Received-Date: Sat, 01 Feb 2014 05:54:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Fri, Jan 31, 2014 at 11:47:58PM -0500, Sam Nelson wrote:
> - Device support pci interface
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
>  -PR incremented
> ---
> ---
>  conf/machine/include/keystone.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index 72e71bf..b961ad3 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
>  PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
>  
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r6"
> +MACHINE_KERNEL_PR = "r7"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
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

