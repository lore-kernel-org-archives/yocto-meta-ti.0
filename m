Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5487DE00846; Tue, 23 Sep 2014 09:22:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DE12E00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 09:21:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NGLvIJ012461
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:21:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGLvSP024537
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:21:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:21:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGLug3013502;
	Tue, 23 Sep 2014 11:21:56 -0500
Date: Tue, 23 Sep 2014 12:21:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923162156.GQ6303@edge>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-4-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1411488036-32089-4-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [for master 3/6] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Tue, 23 Sep 2014 16:22:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 23, 2014 at 09:30:33PM +0530, Karthik Ramanan wrote:
> * This includes the error handling support.
> * Minor bug fixes
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb |   36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> 
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> new file mode 100644
> index 0000000..f32d228
> --- /dev/null
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "Firmware for IPU "

What kind of firmware for IPU this is? It doesn't need to be very detailed, 
but spelling out some generic "purpose" of the firmware would be nice.


> +LICENSE = "TI-TSPA"
> +
> +
> +LIC_FILES_CHKSUM_dra7xx-evm = "file://MMIP-${PV}-Manifest.doc;md5=8206ccaf28c2932afb5afd9c9575287c"
> +LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRC_URI = ""
> +SRC_URI_append_dra7xx-evm = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-${MACHINE}-3.00.06.00.tar.gz;protocol=ftp;name=${MACHINE}"
> +
> +SRC_URI_append_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"

Why not set SRC_URI_dra7xx-evm and SRC_URI_omap5-evm directly?


> +# DRA7xx checksums
> +SRC_URI[dra7xx-evm.md5sum] = "8e1ae40eb10d631318d001463fa11d79"
> +SRC_URI[dra7xx-evm.sha256sum] = "30c275146c34d11dbc2dfd568f0bbc3098a13cd981eee8a7a9766cb07d2f1ca5"
> +
> +# OMAP5 checksums
> +SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
> +SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
> +
> +S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
> +
> +TARGET_dra7xx-evm = "dra7-ipu2-fw.xem4"
> +TARGET_omap5-evm = "ducati-m3-core0.xem3"
> +
> +do_install() {
> +        mkdir -p ${D}${base_libdir}/firmware
> +        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
> +}
> +
> +FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> +
> +PR = "r2"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

