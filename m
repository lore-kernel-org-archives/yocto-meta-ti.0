Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FC7BE00A26; Thu,  5 Nov 2015 11:29:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41879E007DA
	for <meta-ti@yoctoproject.org>; Thu,  5 Nov 2015 11:29:34 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA5JTXG5024150
	for <meta-ti@yoctoproject.org>; Thu, 5 Nov 2015 13:29:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA5JTX6Q021814
	for <meta-ti@yoctoproject.org>; Thu, 5 Nov 2015 13:29:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Nov 2015 13:29:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA5JTTJn026315;
	Thu, 5 Nov 2015 13:29:32 -0600
Date: Thu, 5 Nov 2015 14:29:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20151105192913.GP25957@edge>
References: <1446666795-21381-1-git-send-email-h-gou@ti.com>
	<1446666795-21381-3-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1446666795-21381-3-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap5-sgx-ddk-um-linux: bump SRCREV and other changes to support wayland/DRM on AM4
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
X-List-Received-Date: Thu, 05 Nov 2015 19:29:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 04, 2015 at 02:53:15PM -0500, Hongmei Gou wrote:
> * Support wayland/DRM mode
> * Remove powervr.ini which is no longer needed
> * Add plugins package to include the necessary .so files
> 
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini           |  3 ---
>  recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb    | 10 ++++++++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
>  delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> 
> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> deleted file mode 100644
> index 0657ab8..0000000
> --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -[default]
> -WindowSystem=null_libdrm.so
> -DisableHWTQTextureUpload=1
> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> index cd01d6f..557c442 100644
> --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> @@ -12,14 +12,14 @@ BRANCH_ti43x = "am4/k4.1"
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>  SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
>  SRCREV_ti33x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
> -SRCREV_ti43x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
> +SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
>  
>  INITSCRIPT_NAME = "pvr-init"
>  INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> -PR = "r11"
> +PR = "r12"
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
>  
>  RDEPENDS_${PN} += "libdrm"
> @@ -50,8 +50,14 @@ FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
>  FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
>  FILES_${PN} += "${sysconfdir}/powervr.ini"
>  
> +PACKAGES =+ "${PN}-plugins"
> +FILES_${PN}-plugins = ""

Quick question - have you tried other platforms, like am5, to see if they 
complain about empty ${PN}-plugins package? You may need to set 
ALLOW_EMPTY_${PN}-plugins = "1", if it causes problems.


> +FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
> +RDEPENDS_${PN} += "${PN}-plugins"
> +
>  INHIBIT_PACKAGE_STRIP = "1"
>  
>  INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
> +INSANE_SKIP_${PN}-plugins = "dev-so"
>  
>  CLEANBROKEN = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

