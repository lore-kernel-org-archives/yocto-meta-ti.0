Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1CC4E0121A
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 11:59:25 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.48.17.70])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWG008E4VIH3QG2@vms173017.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 19 Dec 2011 13:59:11 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A5F6920296; Mon,
	19 Dec 2011 14:40:28 -0500 (EST)
Date: Mon, 19 Dec 2011 14:40:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111219194028.GB6128@denix.org>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
	<1324311340-16981-2-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324311340-16981-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 2/5] ti-xdctools: update to 3.23.00.32
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
X-List-Received-Date: Mon, 19 Dec 2011 19:59:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 19, 2011 at 05:15:37PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/devtools/ti-xdctools.inc           |    6 +-----
>  recipes-ti/devtools/ti-xdctools_3.20.06.81.bb |   14 --------------
>  recipes-ti/devtools/ti-xdctools_3.23.00.32.bb |   11 +++++++++++
>  3 files changed, 12 insertions(+), 19 deletions(-)
>  delete mode 100644 recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
>  create mode 100644 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
> 
> diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
> index 120ebaa..c76ad80 100644
> --- a/recipes-ti/devtools/ti-xdctools.inc
> +++ b/recipes-ti/devtools/ti-xdctools.inc
> @@ -1,11 +1,7 @@
>  DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
>  HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
>  SECTION = "devel"
> -LICENSE = "BSD, GPLv2"
> -
> -LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=eace8fa313a140ef178ecfa0f53cc655"
> -
> -PR = "r2"
> +LICENSE = "BSD & GPLv2"
>  
>  require ../includes/ti-paths.inc
>  require ../includes/ti-staging.inc
> diff --git a/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb b/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
> deleted file mode 100644
> index 45bedaa..0000000
> --- a/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require ti-xdctools.inc
> -
> -PV = "3_20_06_81"
> -
> -# This fixes c6accel, but breaks codec-engine and lpm
> -#SRC_URI += "file://arm-linker-hack.diff"
> -
> -SRC_URI += "file://fix-hardcoded-paths.diff"
> -
> -SRC_URI[xdcbin.md5sum] = "65151268d6be6ad6eb940ef7ed03af16"
> -SRC_URI[xdcbin.sha256sum] = "8ea6b851521ce41fe0b4a349b2d922af7e70f48c50ad9fd21f62627446a834f8"
> -
> -
> -
> diff --git a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
> new file mode 100644
> index 0000000..b2db76c
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
> @@ -0,0 +1,11 @@
> +require ti-xdctools.inc
> +
> +PV = "3_23_00_32"
> +LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=49b2dfbf48860a0da844709c3ce63a9c"
> +
> +SRC_URI += "file://fix-hardcoded-paths.diff"
> +
> +SRC_URI[xdcbin.md5sum] = "263aa11795670265551d36a8c77ad27d"
> +SRC_URI[xdcbin.sha256sum] = "880b4e263850f2a3c0ea7352c5b6e0a86692361e26634c3b70dddc42c71231a5"
> +
> +S = "${WORKDIR}/ti/xdctools_${PV}"
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

