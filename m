Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A255E01755; Tue,  5 Jun 2018 11:40:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 351 seconds by postgrey-1.32 at yocto-www;
	Tue, 05 Jun 2018 11:40:47 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD599E0152A
	for <meta-ti@yoctoproject.org>; Tue,  5 Jun 2018 11:40:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DFB7F20BEB;
	Tue,  5 Jun 2018 18:34:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2P6-_bczFgQH; Tue,  5 Jun 2018 18:34:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE10A2085B;
	Tue,  5 Jun 2018 18:34:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2A2B9163483; Tue,  5 Jun 2018 14:34:53 -0400 (EDT)
Date: Tue, 5 Jun 2018 14:34:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180605183453.GB19965@denix.org>
References: <20180605144512.28829-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180605144512.28829-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, timothy.mertz@garmin.com
Subject: Re: [morty/rocko/master][PATCH] ti-xdctools-common: Add XDC tools to -dev package
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
X-List-Received-Date: Tue, 05 Jun 2018 18:40:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Do you still need this on morty?

On Tue, Jun 05, 2018 at 09:45:12AM -0500, Joshua Watt wrote:
> b42044aaf removed the XDC tools from the main package, but this broke
> the ability to include the XDC tools in an SDK. Add the tools back to
> the -dev package. Also fix up INSANE_SKIP.
> 
> Change-Id: I902cc1a841e40c1a3bdc5286d03f999276119052
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  recipes-ti/devtools/ti-xdctools-common.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
> index d2d0df45..a3949cad 100644
> --- a/recipes-ti/devtools/ti-xdctools-common.inc
> +++ b/recipes-ti/devtools/ti-xdctools-common.inc
> @@ -13,12 +13,14 @@ do_install() {
>      cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
>  }
>  
> +FILES_${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
> +
>  BBCLASSEXTEND = "native nativesdk"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN} = "installed-vs-shipped"
> +INSANE_SKIP_${PN}-dev = "libdir dev-elf arch file-rdeps"
>  
>  # Prevent internal libs from getting picked up
>  PRIVATE_LIBS = " \
> -- 
> 2.17.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

