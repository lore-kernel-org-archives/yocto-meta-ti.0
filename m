Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E541AE014EE
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 15:52:59 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKP00GFFBK2FOK1@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 03 Apr 2013 17:52:51 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A6954201CA; Wed,
	03 Apr 2013 18:52:48 -0400 (EDT)
Date: Wed, 03 Apr 2013 18:52:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130403225248.GE31233@denix.org>
References: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
	<1365008161-14609-2-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1365008161-14609-2-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] ti33x: Add DTB filter for building SDKs
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
X-List-Received-Date: Wed, 03 Apr 2013 22:53:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 03, 2013 at 11:56:01AM -0500, Chase Maupin wrote:
> * Add a DTB_FILTER variable to only package the am335x DTB files
>   in the SDK.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/include/ti33x.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index e8aa2ba..50844d1 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -25,6 +25,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> +DTB_FILTER = "am335x"

I'm not sure about adding a new variable to meta-ti that is only used in tisdk 
part of meta-arago... Any other options?


>  UBOOT_ARCH = "arm"
>  UBOOT_MACHINE = "am335x_evm_config"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

