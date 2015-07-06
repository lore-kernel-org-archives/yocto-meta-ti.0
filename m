Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E418E00978; Mon,  6 Jul 2015 08:21:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D43DE004D2
	for <meta-ti@yoctoproject.org>; Mon,  6 Jul 2015 08:21:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t66FLKEH023068
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 10:21:20 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t66FLKgK021689
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 10:21:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 10:21:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t66FLKXJ019568;
	Mon, 6 Jul 2015 10:21:20 -0500
Date: Mon, 6 Jul 2015 11:21:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150706152119.GA9792@edge>
References: <1436169077-6013-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1436169077-6013-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [daisy, master] ipumm-fw: Update download path and checksum
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
X-List-Received-Date: Mon, 06 Jul 2015 15:21:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 06, 2015 at 01:21:17PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
> index 2e43584..821a502 100644
> --- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
> @@ -9,17 +9,17 @@ python __anonymous() {
>  DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
>  LICENSE = "TI-TSPA"
>  
> -LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
> +LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=57d49afcca8f1be47b1c4e79aa06b3ba"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  RDEPENDS_${PN} = "libdce"
>  
> -SRC_URI = "http://arago-project.org/files/short-term/misc/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
> +SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_08_01/exports/
> ipumm-dra7xx-evm-${PV}.tar.gz;protocol=ftp"

Looks good, but are you sure the protocol ^^^ is correct?


> -SRC_URI[md5sum] = "e770dce63fdf218bb19ceb748d9812c0"
> -SRC_URI[sha256sum] = "044d49b77560660bdfc29894e669fe8f70dc467c66b4acb49b24722a0799baa1"
> +SRC_URI[md5sum] = "a1873333e7676ec1b7fcb18fb8b90696"
> +SRC_URI[sha256sum] = "d583d827191a3772f496145cbf81747e10e7ed553d4653379576ac891019d7fb"
>  
>  S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
>  
> @@ -31,3 +31,5 @@ do_install() {
>  }
>  
>  FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> +
> +PR = "r4"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

