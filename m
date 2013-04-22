Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AE4EE006F9
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 12:30:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLO008NL8UO94M3@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 22 Apr 2013 14:30:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 745B020173; Mon,
	22 Apr 2013 15:30:24 -0400 (EDT)
Date: Mon, 22 Apr 2013 15:30:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130422193024.GA28316@denix.org>
References: <1366647702-24282-1-git-send-email-fcooper@ti.com>
	<1366647702-24282-3-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1366647702-24282-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] u-boot-am33x: Update u-boot recipe to 2013.01.01
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
X-List-Received-Date: Mon, 22 Apr 2013 19:30:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 22, 2013 at 11:21:42AM -0500, Franklin S. Cooper Jr wrote:
> * Update to latest version of u-boot that supports the 3.2 kernel.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-am33x_2012.10.bb    |   17 -----------------
>  recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |   20 ++++++++++++++++++++
>  2 files changed, 20 insertions(+), 17 deletions(-)
>  delete mode 100644 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
>  create mode 100644 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> 
> diff --git a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> deleted file mode 100644
> index 7320e02..0000000
> --- a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -require u-boot-ti.inc
> -
> -DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> -
> -COMPATIBLE_MACHINE = "ti33x|omap3"

You are removing the old 2012.10 recipe that is also used for "omap3" SoCs. 
Since you are adding the new one only for "ti33x" SoCs, there won't be any 
compatible u-boot for AM37x...


> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -PR = "r7+gitr${SRCPV}"
> -
> -SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
> -
> -BRANCH = "amsdk-05.06.00.00"
> -
> -SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
> -
> -SPL_BINARY = "MLO"
> diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> new file mode 100644
> index 0000000..19ec34e
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> @@ -0,0 +1,20 @@
> +require u-boot-ti.inc
> +
> +DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> +
> +COMPATIBLE_MACHINE = "ti33x"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +PR = "r5+gitr${SRCPV}"
> +
> +SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
> +
> +# This version of u-boot is meant for 3.2 kernel which doesn't support device tree.
> +BRANCH = "ti-u-boot-2013.01.01-amsdk-05.07.00.00"
> +
> +# Commit corresponds to tag "v2013.01.01_amsdk-05.07.00.00"
> +SRCREV = "8eb15a787c558fee98b0fa2a66ff0849c732edcc"
> +
> +# Set the name of the SPL that will built so that it is also packaged with u-boot.
> +SPL_BINARY = "MLO"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

