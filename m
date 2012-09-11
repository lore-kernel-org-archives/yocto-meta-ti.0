Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EF23E00346
	for <meta-ti@yoctoproject.org>; Tue, 11 Sep 2012 09:46:41 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MA700AXT2L8WR74@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 11 Sep 2012 11:46:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 45B2F20088; Tue,
	11 Sep 2012 12:46:20 -0400 (EDT)
Date: Tue, 11 Sep 2012 12:46:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20120911164620.GB5256@denix.org>
References: <1347210467-19332-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1347210467-19332-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Use 'packagegroup' instead of 'task'
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
X-List-Received-Date: Tue, 11 Sep 2012 16:46:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Sep 09, 2012 at 10:07:47AM -0700, Khem Raj wrote:
> bring recipes in sync with OE-Core, task bbclass
> is now replaced by packagegroup.
> 
> and task recipes are now called packagegroup_something
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-kernel/linux/multi-kernel.inc              |    2 +-
>  recipes-misc/images/cloud9-gfx-image.bb            |    2 +-
>  recipes-misc/images/cloud9-gnome-image.bb          |    2 +-
>  recipes-misc/images/cloud9-image.bb                |    2 +-
>  recipes-misc/images/ti-hw-bringup-image.bb         |    2 +-
>  .../packagegroup-ti-drivers.bb}                    |    2 +-
>  .../packagegroup-ti-test.bb}                       |    2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>  rename recipes-misc/{tasks/task-ti-drivers.bb => packagegroup/packagegroup-ti-drivers.bb} (96%)
>  rename recipes-ti/{tasks/task-ti-test.bb => packagegroup/packagegroup-ti-test.bb} (92%)
> 
> diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
> index 04bc987..96d6121 100644
> --- a/recipes-kernel/linux/multi-kernel.inc
> +++ b/recipes-kernel/linux/multi-kernel.inc
> @@ -117,5 +117,5 @@ do_deploy_append () {
>  
>  }
>  
> -do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"
> +do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"

Why is this changed? Isn't gcc${KERNEL_CCSUFFIX} no longer useful?

-- 
Denys

