Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0D51E006CB
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 09:21:34 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH600KIKYUYN490@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 25 Jan 2013 11:21:14 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6420B2011D; Fri,
	25 Jan 2013 12:20:57 -0500 (EST)
Date: Fri, 25 Jan 2013 12:20:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130125172057.GD23977@denix.org>
References: <alpine.DEB.2.02.1301240816240.7586@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1301240816240.7586@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux_3.1.bb: Remove bad line continuation.
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
X-List-Received-Date: Fri, 25 Jan 2013 17:21:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 24, 2013 at 08:16:38AM -0500, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   guessing just a copy and paste error, which currently generates:

No, the recent change in bitbake to handle multiline comments slightly 
different, i.e. stricter...


> "ERROR: There is a confusing multiline, partially commented expression on line 27 of file
> /home/rpjday/oe/dist/layers/meta-ti/recipes-kernel/linux/linux_3.1.bb ().
> Please clarify whether this is all a comment or should be parsed."
> 
>   introduced by commit 9c3a8de11ee9d9d631c2956b845f4c2d32020277
> 
> diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
> index 0ec0d26..8a4d847 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -23,7 +23,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;pro
>              file://defconfig"
> 
>  # Needs refresh:
> -#            file://beagle/0003-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
> +#            file://beagle/0003-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch
> 
> 
>  SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

