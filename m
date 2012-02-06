Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C159E0123F
	for <meta-ti@lists.yoctoproject.org>;
	Sun,  5 Feb 2012 21:14:04 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYY00GB7H73FFN0@vms173003.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Sun, 05 Feb 2012 23:13:52 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DFA94203C6; Mon,
	06 Feb 2012 00:13:50 -0500 (EST)
Date: Mon, 06 Feb 2012 00:13:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <tom.rini@gmail.com>
Message-id: <20120206051350.GD8770@denix.org>
References: <1328309974-12634-1-git-send-email-tom.rini@gmail.com>
MIME-version: 1.0
In-reply-to: <1328309974-12634-1-git-send-email-tom.rini@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] beagleboard: Add fw_env.config
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
X-List-Received-Date: Mon, 06 Feb 2012 05:14:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 03, 2012 at 03:59:34PM -0700, Tom Rini wrote:
> From: Tom Rini <trini@ti.com>
> 
> This adds a fw_env.config file that is valid for BeagleBoard's
> with NAND for U-Boot environment.

Tom,

Does it conflict with NAND-less BB-xm, since all BBs share the same MACHINE 
config and override, hence masking the previously default fw_env.config?

-- 
Denys


> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>  .../u-boot/u-boot/beagleboard/fw_env.config        |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
> 
> diff --git a/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config b/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
> new file mode 100644
> index 0000000..ba8147a
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
> @@ -0,0 +1 @@
> +/dev/mtd5 0x0 0x20000 0x20000
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

