Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 026B1E00723
	for <meta-ti@yoctoproject.org>; Sat, 22 Feb 2014 20:51:01 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1F0081LMSKGBO0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 22 Feb 2014 22:50:50 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BB23120565; Sat,
	22 Feb 2014 23:50:44 -0500 (EST)
Date: Sat, 22 Feb 2014 23:50:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-id: <20140223045044.GX22890@denix.org>
References: <1393129856-9624-1-git-send-email-sam.nelson@ti.com>
MIME-version: 1.0
In-reply-to: <1393129856-9624-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-keystone: Update latest tag
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
X-List-Received-Date: Sun, 23 Feb 2014 04:51:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Feb 22, 2014 at 11:30:56PM -0500, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Not sure whether need a PR bump

Yes, this one usually needs. Well, your SRCREV went up in both cases, so will 
still work w/o a PR bump, but it's still a good idea to bump PR when updating 
SRCREV only and PV stays the same. Kernel recipes have MACHINE_KERNEL_PR_append 
for that.

-- 
Denys


> ---
> ---
>  recipes-kernel/linux/linux-keystone-rt_3.10.bb |    4 ++--
>  recipes-kernel/linux/linux-keystone_3.10.bb    |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> index 9c2f904..3965dfa 100644
> --- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> @@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> -#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
> -SRCREV = "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
> +#This commit corresponds to "K2_RT_LINUX_03.10.10_14.02"
> +SRCREV = "c78aa253ac385faae8b6c845a388e215395a8010"
>  PV = "3.10.10"
>  
>  BRANCH = "master-rt"
> diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
> index 2384ede..f063c0c 100644
> --- a/recipes-kernel/linux/linux-keystone_3.10.bb
> +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> @@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> -#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> -SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> +#This commit corresponds to "K2_LINUX_03.10.10_14.02"
> +SRCREV = "93515476b357304e6fc075c004a1cfa91a0751d0"
>  PV = "3.10.10"
>  
>  BRANCH = "master"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

