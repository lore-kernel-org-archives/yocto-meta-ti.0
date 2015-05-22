Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 264E9E009E5; Fri, 22 May 2015 10:58:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D578BE00945
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 10:58:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4MHwokr007546
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 12:58:50 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4MHwoxo011645
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 12:58:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 22 May 2015 12:58:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4MHwn3P031432;
	Fri, 22 May 2015 12:58:50 -0500
Date: Fri, 22 May 2015 13:58:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150522175849.GB8903@edge>
References: <1431088437-30316-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1431088437-30316-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-cgt6x: Fix installation for native and nativesdk classes.
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
X-List-Received-Date: Fri, 22 May 2015 17:58:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 08, 2015 at 08:33:57AM -0400, Jacob Stiffler wrote:
> * Many RTOS packages assume that the entire cgt is installed in a
>   single directory as opposed to standard install paths.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x_8.0.0.bb |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> index 69c6d60..2353ebd 100644
> --- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> +++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f1563
>  LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
>  
>  PE = "1"
> +PR = "r1"
>  
>  require ../includes/ti-unpack.inc
>  
> @@ -49,6 +50,11 @@ do_install() {
>          install -m 755 ${binfile} ${D}${bindir}
>      done
>  
> +    install -d ${D}${datadir}/ti/cgt-c6x/bin
> +    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
> +        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
> +    done

Would have symlinks worked here as well, instead of duplicating binaries?


>      install -d ${D}${datadir}/ti/cgt-c6x/include
>      for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
>          install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> @@ -102,4 +108,6 @@ do_install_class-target() {
>  
>  FILES_${PN} += "${datadir}/ti/*"
>  
> +FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
> +
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

