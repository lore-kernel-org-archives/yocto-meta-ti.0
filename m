Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB8F9E0055C
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 06:53:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKErrMP028134
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 08:53:53 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKErrGX025627
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 08:53:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 08:53:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKErrfX004697;
	Wed, 20 Nov 2013 08:53:53 -0600
Date: Wed, 20 Nov 2013 09:53:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
Message-ID: <20131120145352.GA29952@edge>
References: <20131120103852.GA20454@ti.com>
MIME-Version: 1.0
In-Reply-To: <20131120103852.GA20454@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti: libdce: Library for invoking the hw accelerated codec on IVA-HD.
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
X-List-Received-Date: Wed, 20 Nov 2013 14:53:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

First of all:

Acked-by: Denys Dmytriyenko <denys@ti.com>

Second, couple minor comments:

1. Please use "name: short summary" for the patch subject. No need for nested 
"ti: libdce: ". And the summary could have been shorter - you could have added 
a more expanded description separately...

2. inherit line usually goes after LICENSE, LIC_FILES_CHKSUM. And you are 
missing more generic, but optional SUMMARY, DESCRIPTION,  HOMEPAGE and SECTION

Other than that - very good, I can take it and fix the minor comments myself.

-- 
Denys


On Wed, Nov 20, 2013 at 04:08:52PM +0530, Mrinmayee Hingolikar wrote:
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  recipes-ti/libdce/libdce_git.bb |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 recipes-ti/libdce/libdce_git.bb
> 
> diff --git a/recipes-ti/libdce/libdce_git.bb b/recipes-ti/libdce/libdce_git.bb
> new file mode 100644
> index 0000000..fcb9984
> --- /dev/null
> +++ b/recipes-ti/libdce/libdce_git.bb
> @@ -0,0 +1,14 @@
> +inherit autotools pkgconfig
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
> +
> +PR = "r0"
> +
> +DEPENDS = "libdrm ti-ipc"
> +
> +SRC_URI = "git://git.ti.com/glsdk/libdce2.git;protocol=git"
> +SRCREV = "0aa6627d59a2a7c4837a40fe67f610b3318d23c1"
> +
> +S = "${WORKDIR}/git"
> +EXTRA_OECONF += "IPC_HEADERS=${STAGING_DIR_TARGET}/usr/include/ti/ipc/mm"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

