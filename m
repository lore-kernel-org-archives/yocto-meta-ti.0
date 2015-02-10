Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BE93E008A7; Tue, 10 Feb 2015 12:19:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16F8AE00717
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:18:55 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AKIsLK005513
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 14:18:54 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKIr67012996
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 14:18:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 14:18:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKIq71023792;
	Tue, 10 Feb 2015 14:18:53 -0600
Date: Tue, 10 Feb 2015 15:18:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150210201851.GM13231@edge>
References: <1422910220-24142-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422910220-24142-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] libp11: Add recipe for libp11
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
X-List-Received-Date: Tue, 10 Feb 2015 20:19:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 02, 2015 at 03:50:20PM -0500, Sam Nelson wrote:
> - Provides PKCS11 abstraction library
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/libp11/libp11_git.bb |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-ti/libp11/libp11_git.bb
> 
> diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
> new file mode 100644
> index 0000000..87fc10b
> --- /dev/null
> +++ b/recipes-ti/libp11/libp11_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "PKCS11 abstraction library"
> +LICENSE = "LGPL2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
> +SECTION = "libs"
> +PROVIDES = "libp11"

This line is redundant, although harmless - since the package is called 
libp11, it already PROVIDES the same.


> +inherit autotools pkgconfig
> +
> +DEPENDS = "openssl libtool"
> +RDEPENDS_${PN} = "ti-softhsmv2"
> +
> +SRC_URI = "git://git.ti.com/keystone-linux/libp11.git;protocol=git;branch=${BRANCH}"
> +BRANCH="master"
> +# Following commit corresponds to DEV.LIBP11-01.03.00.00
> +SRCREV = "43c4f63a8d803fde2bcd8e4f8969e5fe9edf0e33"
> +PV = "1.3.0.0"
> +
> +S = "${WORKDIR}/git"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

