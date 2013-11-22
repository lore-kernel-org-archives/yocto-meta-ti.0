Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F388E006E6
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 11:22:47 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMJMkFS020222
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 13:22:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMJMkxO015240
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 13:22:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 13:22:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMJMkEe010142;
	Fri, 22 Nov 2013 13:22:46 -0600
Date: Fri, 22 Nov 2013 14:22:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131122192245.GD690@edge>
References: <1385136047-15830-1-git-send-email-fcooper@ti.com>
	<1385136047-15830-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385136047-15830-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] machine config: Use Graphics SDK 05.00.00.01 by default on AM335x and AM43x
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
X-List-Received-Date: Fri, 22 Nov 2013 19:22:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 22, 2013 at 10:00:47AM -0600, Franklin S. Cooper Jr wrote:
> * The latest Graphics SDK is required for the 3.12 kernel being used by AM335x
>   and AM43x machines.
> * Set the preferred version to insure that the proper version of the graphics
>   sdk is being used.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  conf/machine/include/ti33x.inc |    3 +++
>  conf/machine/include/ti43x.inc |    3 +++
>  2 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index af340d2..8cdf580 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -23,6 +23,9 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>  
> +PREFERRED_VERSION_libgles-omap3 = "5.00.00.01"
> +PREFERRED_VERSION_omap3-sgx-modules = "5.00.00.01"

I'm worried about setting specific preferred versions in the machine configs - 
it doesn't look very scalable...

I'm willing to suggest to drop all DEFAULT_PREFERENCE = "-1" from the 
corresponding recipes and let the build pick the latest "compatible" version, 
unless overwritten by a distro with own PREFERRED_VERSION.

The only drawback I see is that some people still use 4.05 Gfx SDK on omap3 
and beagleboard, as that version had the best x11 support (or the least 
broken).

So, we can fix that particular issue by adding DEFAULT_PREFERENCE_omap3 = "99" 
to that recipe to bump it up.

Or, if not removing DEFAULT_PREFERENCE = "-1" from all Gfx SDK recipes, then 
just add overrides for ti33x and ti43x to bump the preference in 5.00.00.01 
recipe only...

Thoughts?

-- 
Denys


>  KERNEL_IMAGETYPE = "zImage"
>  
>  UBOOT_ARCH = "arm"
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index d9bfd25..948fd99 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -23,6 +23,9 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>  
> +PREFERRED_VERSION_libgles-omap3 = "5.00.00.01"
> +PREFERRED_VERSION_omap3-sgx-modules = "5.00.00.01"
> +
>  KERNEL_IMAGETYPE = "zImage"
>  
>  UBOOT_ARCH = "arm"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

