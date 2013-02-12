Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B005E00498
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 20:25:13 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI30007RAXLEDX6@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Feb 2013 22:25:03 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5A7A1200A9; Mon,
	11 Feb 2013 23:24:57 -0500 (EST)
Date: Mon, 11 Feb 2013 23:24:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: fcooperjr27@gmail.com
Message-id: <20130212042457.GB29903@denix.org>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1360631082-29015-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/7] machine config: Correct SERIAL_CONSOLE variable for am3517-evm and am37x-evm
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
X-List-Received-Date: Tue, 12 Feb 2013 04:25:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

The entire set looks fine to me - I'll give it a closer look tomorrow and try 
to push shortly after.

-- 
Denys


On Mon, Feb 11, 2013 at 07:04:36PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * When testing on am37x-evm I noticed that no prompt to login was ever shown
>   when connected via serial port.
> * I finally noticed that the SERIAL_CONSOLE variable was set incorrectly and
>   didn't match the value in the old Arago layer.
> * After using the values specific in the machine file in the Arago layer I was
>   able to login via serial port.
> * This has been verified on both the am37x-evm and am3517-evm.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  conf/machine/am3517-evm.conf |    2 +-
>  conf/machine/am37x-evm.conf  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> index e817069..536d337 100644
> --- a/conf/machine/am3517-evm.conf
> +++ b/conf/machine/am3517-evm.conf
> @@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
>  IMAGE_FSTYPES += "ubi tar.gz"
>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>  
> -SERIAL_CONSOLE = "115200 ttyS2"
> +SERIAL_CONSOLE = "115200 ttyO2"
>  USE_VT = "2"
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> index 9a1acb4..866abc5 100644
> --- a/conf/machine/am37x-evm.conf
> +++ b/conf/machine/am37x-evm.conf
> @@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
>  IMAGE_FSTYPES += "ubi tar.gz"
>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>  
> -SERIAL_CONSOLE = "115200 ttyS0"
> +SERIAL_CONSOLE = "115200 ttyO0"
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

