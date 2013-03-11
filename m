Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A176E00738
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:34:29 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJI0056JMKTD8E0@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Mar 2013 16:34:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 26155200A9; Mon,
	11 Mar 2013 17:34:04 -0400 (EDT)
Date: Mon, 11 Mar 2013 17:34:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130311213404.GD31635@denix.org>
References: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
	<1363032215-12645-2-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1363032215-12645-2-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/5] linux-ti-staging: use setup-defconfig
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
X-List-Received-Date: Mon, 11 Mar 2013 21:34:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 11, 2013 at 03:03:32PM -0500, Chase Maupin wrote:
> * Use the setup-defconfig.inc functionality to specify the in
>   kernel tree defconfig file to use rather than hard coding it
>   in the do_configure step.
> * This is to make it easier to modify which configs are use by
>   other layers as well as supporting additional machines which
>   may not use omap2plus_defconfig as needed.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging/defconfig |    1 +
>  recipes-kernel/linux/linux-ti-staging_git.bb    |   15 +++++----------
>  2 files changed, 6 insertions(+), 10 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-ti-staging/defconfig
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-staging/defconfig
> new file mode 100644
> index 0000000..926b35a
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=omap2plus_defconfig

Do we want this defconfig to be in linux-ti-staging/ti33x to be SoC-specific? 
I see omap5 also uses the same omap2plus_defconfig, so maybe not...

-- 
Denys


> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
> index 8cc7206..2581409 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -6,6 +6,7 @@ KERNEL_IMAGETYPE = "uImage"
>  
>  inherit kernel
>  require recipes-kernel/linux/linux-dtb.inc
> +require recipes-kernel/linux/setup-defconfig.inc
>  
>  # Stage the power management firmware before building the kernel
>  DEPENDS += "am33x-cm3"
> @@ -23,17 +24,11 @@ SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
>  PV = "3.8.2"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
>  
> -SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
> -
> -do_setup_defconfig() {
> -        :
> -}
> -
> -do_configure() {
> -    oe_runmake omap2plus_defconfig
> -}
> +SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
> +           file://defconfig \
> +          "
>  
>  # Copy the am33x-cm3 firmware if it is available
>  do_compile_prepend() {
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

