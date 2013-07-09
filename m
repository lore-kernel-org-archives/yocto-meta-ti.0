Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F89AE01405
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 21:15:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r694FFOe006031
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2013 23:15:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r694FF16029744
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2013 23:15:15 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 23:15:15 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r694FDhW003869;	Mon, 8 Jul 2013 23:15:14 -0500
Message-ID: <51DB8E51.5040309@ti.com>
Date: Tue, 9 Jul 2013 09:45:13 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <20130701154106.GA934@ti.com>
In-Reply-To: <20130701154106.GA934@ti.com>
Subject: Re: [PATCHv3] gbm: Add TI staging tree
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
X-List-Received-Date: Tue, 09 Jul 2013 04:15:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/1/2013 9:11 PM, Siddharth Heroor wrote:
> * This is the gbm frontend used by (for example) weston
>   compositor to load the GLES stack, and retrieve the
>   backing buffer objects behind an eglImage (created
>   with EGL_WAYLAND_BUFFER_WL), etc.  The frontend is really
>   just a backend loader and shim. The backend library must
>   be provided by the GLES implementation.
> * The original libgbm is actually part of mesa but in the TI
>   stack this is implemented as a separate and standalone package
>   hosted at git://git.ti.com/glsdk/libgbm.git
> * In the Danny branch, oe-core/meta/recipes-graphics/mesa
>   has 8.0.0 as its version. For the GLSDK stack, the libgbm
>   is more in line with 9.0.0 mesa. The goal is to move over
>   to mesa for libgbm in future.
> 
> v2:
> * Cleaned up description and rewrote the commit.
> 
> v3:
> 
> * Rename as libgbm-glsdk to avoid clash with mesa-libgbm.

Ping! Any updates on this patch?

> 
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes-graphics/gbm/libgbm-glsdk.inc      |   11 +++++++++++
>  recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb |    7 +++++++
>  2 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-graphics/gbm/libgbm-glsdk.inc
>  create mode 100644 recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
> 
> diff --git a/recipes-graphics/gbm/libgbm-glsdk.inc b/recipes-graphics/gbm/libgbm-glsdk.inc
> new file mode 100644
> index 0000000..2f3893e
> --- /dev/null
> +++ b/recipes-graphics/gbm/libgbm-glsdk.inc
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Userspace interface for the kernel GBM services."
> +HOMEPAGE = "http://git.ti.com"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
> +PROVIDES = "libgbm"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +inherit autotools pkgconfig
> diff --git a/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb b/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
> new file mode 100644
> index 0000000..e1e6adb
> --- /dev/null
> +++ b/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
> @@ -0,0 +1,7 @@
> +require libgbm-glsdk.inc
> +
> +SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
> 


