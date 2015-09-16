Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80854E00C89; Wed, 16 Sep 2015 07:06:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DFD3E00B74
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:06:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GE6I5d006233
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 09:06:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GE6Inn009197
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 09:06:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 09:06:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GE6IhD002263;
	Wed, 16 Sep 2015 09:06:18 -0500
Date: Wed, 16 Sep 2015 10:06:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150916140602.GD18085@edge>
References: <1442411634-1732-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1442411634-1732-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ipumm-fw: Update to 3.00.09.01
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
X-List-Received-Date: Wed, 16 Sep 2015 14:06:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Do we really need 5th version of ipumm-fw? Can we remove old ones?

On Wed, Sep 16, 2015 at 09:53:54AM -0400, Jacob Stiffler wrote:
> ---
>  recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
> 
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
> new file mode 100644
> index 0000000..f537179
> --- /dev/null
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
> @@ -0,0 +1,35 @@
> +python __anonymous() {
> +    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
> +    if not features:
> +        return
> +    if "mmip" not in features:
> +        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
> +}
> +
> +DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
> +LICENSE = "TI-TSPA"
> +
> +LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=5803e271087f74d03239d868bebcc2c7"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +RDEPENDS_${PN} = " libdce"
> +
> +SRC_URI = "http://downloads.ti.com/infotainment/esd/jacinto6/glsdk/ipumm/3_00_09_01/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
> +
> +SRC_URI[md5sum] = "bf15624e26bdef4dbb67b98ccd8b9754"
> +SRC_URI[sha256sum] = "e70a38b62e3e4d11d5ce68f0980de4df5256bd597068f179e220fa5afcd065fe"
> +
> +S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
> +
> +TARGET = "dra7-ipu2-fw.xem4"
> +
> +do_install() {
> +        mkdir -p ${D}${base_libdir}/firmware
> +        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
> +}
> +
> +FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> +
> +PR = "r0"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

