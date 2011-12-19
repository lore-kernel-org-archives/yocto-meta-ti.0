Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 413DAE00305
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 12:14:09 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.48.17.70])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWG0078EW7H3LU0@vms173013.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 19 Dec 2011 14:14:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1FACB200A1; Mon,
	19 Dec 2011 14:37:50 -0500 (EST)
Date: Mon, 19 Dec 2011 14:37:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111219193749.GA6128@denix.org>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christopher Larson <chris_larson@mentor.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/5] linux.inc: If the kernel has CONFIG_KERNEL_LZO=y, it may well attempt to use the 'lzop' utility to do the lzo compression, but we should not be relying on that utility being installed on the build machine.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 20:14:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 19, 2011 at 05:15:36PM +0100, Koen Kooi wrote:
> From: Christopher Larson <chris_larson@mentor.com>

First, a minor nagging - can the commit message be a little shorter? :)

linux.inc: If the kernel has CONFIG_KERNEL_LZO=y, it may well attempt to use
the 'lzop' utility to do the lzo compression, but we should not be relying on
that utility being installed on the build machine.


> This currently affects the linux-omap4 build for omap4430-panda.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-kernel/linux/linux.inc |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
> index 9650e68..e8a754f 100644
> --- a/recipes-kernel/linux/linux.inc
> +++ b/recipes-kernel/linux/linux.inc
> @@ -264,3 +264,14 @@ pkg_postrm_kernel-devicetree () {
>  	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove devicetree devicetree-${KERNEL_VERSION} || true
>  }
>  
> +# Automatically depend on lzop-native if CONFIG_KERNEL_LZO is enabled
> +python () {
> +    try:
> +        defconfig = bb.fetch2.localpath('file://defconfig', d)

Second, this will only work with single-config kernels. I guess we'll have to
adopt it for multi-kernel.inc later...


> +    except bb.fetch2.FetchError:
> +        pass
> +    else:
> +        if 'CONFIG_KERNEL_LZO=y\n' in open(defconfig).readlines():
> +            depends = d.getVar('DEPENDS', False)
> +            d.setVar('DEPENDS', depends + ' lzop-native')
> +}
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

