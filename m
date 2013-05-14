Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24C80E01366
	for <meta-ti@yoctoproject.org>; Tue, 14 May 2013 10:31:47 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMS00B4CU0K1XC0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 14 May 2013 12:31:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2E3352003E; Tue,
	14 May 2013 13:31:31 -0400 (EDT)
Date: Tue, 14 May 2013 13:31:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Prabindh Sundareson <prabu@ti.com>
Message-id: <20130514173131.GD31835@denix.org>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-6-git-send-email-prabu@ti.com>
MIME-version: 1.0
In-reply-to: <1367501964-6294-6-git-send-email-prabu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
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
X-List-Received-Date: Tue, 14 May 2013 17:31:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 02, 2013 at 07:09:20PM +0530, Prabindh Sundareson wrote:
> RPROVIDES specifies the libraries that are dynamically loaded
> at runtime. This patch fixes "no package provides libGLESv2.so" and
> similar errors that occur when including packages like qtbase.

I'm still somewhat not sure about this patch. I know you had this problem with 
Qt5, but I'm wondering if there's a bug with shlib handling in latest OE, as 
you ususally don't need to specify shared libs in RPROVIDES...


> Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> ---
>  recipes-graphics/libgles/libgles-omap3.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
> index d08a04d..c33062a 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -201,6 +201,7 @@ PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so lib
>  PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
>  
> +RPROVIDES_${PN} += "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"
>  
>  PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
>  
> -- 
> 1.7.1
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

