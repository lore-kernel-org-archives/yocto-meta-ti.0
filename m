Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E892FE0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:06:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU001A8FU7FG73@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 14:06:08 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6A80820092; Tue,
	26 Feb 2013 15:06:07 -0500 (EST)
Date: Tue, 26 Feb 2013 15:06:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: hzhang@ti.com
Message-id: <20130226200607.GN6725@denix.org>
References: <1361908130-27683-1-git-send-email-hzhang@ti.com>
MIME-version: 1.0
In-reply-to: <1361908130-27683-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone-evm config: add ubifs support
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
X-List-Received-Date: Tue, 26 Feb 2013 20:06:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 26, 2013 at 02:48:50PM -0500, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>

I assume you double-checked the actual UBI ARGS values below for the Keystone. 
Other than that looks fine to me - I'll push it shortly.

> ---
>  conf/machine/keystone-evm.conf |   19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
> index e73d84b..3e44ddc 100644
> --- a/conf/machine/keystone-evm.conf
> +++ b/conf/machine/keystone-evm.conf
> @@ -14,7 +14,7 @@ require conf/machine/include/keystone.inc
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
>  
> -IMAGE_FSTYPES += "tar.bz2 cpio"
> +IMAGE_FSTYPES += "ubi tar.bz2 cpio"

BTW, speaking of this - do you still need uncompressed cpio? Last time we 
talked, we were not sure if compressed cpio.gz would be sufficient.


>  SERIAL_CONSOLE = "115200 ttyS0"
>  
> @@ -23,3 +23,20 @@ SYSVINIT_ENABLED_GETTYS = ""
>  UBOOT_MACHINE = "tci6638_evm_config"
>  
>  MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# From dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: logical eraseblock size:    126976 bytes
> +# from ubiattach stdout:
> +# UBI device number 0, total 857 LEBs
> +# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
> +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# from dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> +# UBI: sub-page size:              2048
> +UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
> +
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

