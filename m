Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E287E007EB; Wed, 22 Oct 2014 09:48:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9E1AE00799
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 09:48:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9MGmZpd028573
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 11:48:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MGmZed020783
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 11:48:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 11:48:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MGmZJQ031718;
	Wed, 22 Oct 2014 11:48:35 -0500
Date: Wed, 22 Oct 2014 12:48:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20141022164834.GK25408@edge>
References: <1413213179-7250-1-git-send-email-a0393906@ti.com>
	<1413213179-7250-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1413213179-7250-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Wed, 22 Oct 2014 16:48:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 13, 2014 at 08:42:59PM +0530, Karthik Ramanan wrote:
> * This includes the error handling support.
> * Minor bug fixes

Karthik,

Quick question - is there a separate download link for am57xx-evm or should 
dra7xx-evm one be used for it?

-- 
Denys


> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  ...umm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} |   25 ++++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>  rename recipes-bsp/ipumm-fw/{ipumm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} (53%)
> 
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> similarity index 53%
> rename from recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
> rename to recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> index 7f67c39..5049945 100644
> --- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> @@ -6,26 +6,22 @@ python __anonymous() {
>          raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
>  }
>  
> -DESCRIPTION = "Firmware for IPU "
> -
> +DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
>  LICENSE = "TI-TSPA"
> -LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=64ca6f9d7e5243b8a4084eb918a543bc"
> +
> +LIC_FILES_CHKSUM_dra7xx-evm = "file://MMIP-${PV}-Manifest.doc;md5=8206ccaf28c2932afb5afd9c9575287c"
>  LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "dra7xx-evm|omap5-evm"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -# Need to set the PLATFORM variable since now multiple MACHINEs are sharing
> -# a common named tarball
> -PLATFORM = "UNKNOWN"
> -PLATFORM_dra7xx = "dra7xx-evm"
> -PLATFORM_omap5-evm = "omap5-evm"
> +SRC_URI_dra7xx-evm = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-${MACHINE}-3.00.06.00.tar.gz;protocol=ftp;name=${MACHINE}"
>  
> -SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${PLATFORM}-3.00.04.02.tar.gz;protocol=http;name=${PLATFORM}"
> +SRC_URI_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
>  
>  # DRA7xx checksums
> -SRC_URI[dra7xx-evm.md5sum] = "da04c03b0fd57901e8283afa80f81379"
> -SRC_URI[dra7xx-evm.sha256sum] = "0b26fd13f9c318b52c18b9bff56862ef1f58a768b19285b87c035e65bc828ddc"
> +SRC_URI[dra7xx-evm.md5sum] = "8e1ae40eb10d631318d001463fa11d79"
> +SRC_URI[dra7xx-evm.sha256sum] = "30c275146c34d11dbc2dfd568f0bbc3098a13cd981eee8a7a9766cb07d2f1ca5"
>  
>  # OMAP5 checksums
>  SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
> @@ -33,7 +29,7 @@ SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da
>  
>  S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
>  
> -TARGET_dra7xx = "dra7-ipu2-fw.xem4"
> +TARGET_dra7xx-evm = "dra7-ipu2-fw.xem4"
>  TARGET_omap5-evm = "ducati-m3-core0.xem3"
>  
>  do_install() {
> @@ -42,3 +38,6 @@ do_install() {
>  }
>  
>  FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> +
> +PR = "r1"
> +
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

