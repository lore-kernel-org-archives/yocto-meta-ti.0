Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8F5DE007E1; Mon,  9 May 2016 09:59:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 022A4E0077E
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 09:59:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u49GxHDX032722
	for <meta-ti@yoctoproject.org>; Mon, 9 May 2016 11:59:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u49GxHrH017022
	for <meta-ti@yoctoproject.org>; Mon, 9 May 2016 11:59:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 May 2016 11:59:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u49GxGLd024405;
	Mon, 9 May 2016 11:59:17 -0500
Date: Mon, 9 May 2016 12:59:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160509165901.GF16188@edge>
References: <1462811630-25842-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1462811630-25842-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS based on REDEPENDS
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
X-List-Received-Date: Mon, 09 May 2016 16:59:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks fine. What about master?


On Mon, May 09, 2016 at 12:33:50PM -0400, Jacob Stiffler wrote:
> * The omap5-sgx-ddk-um-linux recipe installs pre-built libraries
> * Because of this, the dependencies are given as RDEPENDS as they are
>   not needed for building the recipe
> * However, this may break recipes which depend on
>   omap5-sgx-ddk-um-linux, as the omap5-sgx-ddk-um-linux dependencies
>   may not yet be populated in the sysroot.
> * This resolves the break in the dependency chain by translating the
>   RDEPENDS into a list of DEPENDS
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
> index a79c61f..a4a00b9 100644
> --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
> @@ -19,9 +19,10 @@ INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> -PR = "r8"
> +PR = "r9"
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
>  
> +DEPENDS += "libdrm udev libgbm wayland libffi"
>  RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
>  
>  RREPLACES_${PN} = "libegl libgles1 libgles2"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

