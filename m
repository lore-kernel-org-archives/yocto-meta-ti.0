Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36769E007B9; Fri,  3 Oct 2014 15:21:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6466BE00781
	for <meta-ti@yoctoproject.org>; Fri,  3 Oct 2014 15:20:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s93MKw53032049
	for <meta-ti@yoctoproject.org>; Fri, 3 Oct 2014 17:20:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s93MKvPL025133
	for <meta-ti@yoctoproject.org>; Fri, 3 Oct 2014 17:20:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 3 Oct 2014 17:20:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s93MKvc3001125;
	Fri, 3 Oct 2014 17:20:57 -0500
Date: Fri, 3 Oct 2014 18:20:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141003222056.GB32107@edge>
References: <1412374480-29133-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412374480-29133-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] common-csl-ip: (ti-csl) Move from meta-arago to here
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
X-List-Received-Date: Fri, 03 Oct 2014 22:21:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, it's called ti-csl in meta-arago, so you are not just moving it to 
meta-ti as is, but also renaming it... Anyway, I'll take it this way. Just 
make sure your other dependencies don't expect ti-csl, but common-csl-ip from 
now on.


On Fri, Oct 03, 2014 at 06:14:39PM -0400, Sam Nelson wrote:
> - Moved from meta-arago
> - This package provides chip support library interface files
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> - Moving  from meta-arago to meta-ti based on review comments
> ---
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.bb |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip.bb
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.bb b/recipes-bsp/common-csl-ip/common-csl-ip.bb
> new file mode 100644
> index 0000000..fb5e6f8
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "TI CSL"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +ALLOW_EMPTY_${PN} = "1"
> +
> +PR = "r0"
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
> +SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    install -d ${D}${includedir}/ti/csl
> +    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
> +    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
> +}
> +
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

