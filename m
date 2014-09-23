Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16597E00846; Tue, 23 Sep 2014 09:15:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D608BE00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 09:15:50 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NGFoSb021016
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:15:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGFo5t019618
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:15:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:15:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGFndh019875;
	Tue, 23 Sep 2014 11:15:49 -0500
Date: Tue, 23 Sep 2014 12:15:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923161549.GN6303@edge>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-3-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1411488036-32089-3-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [for master 2/6] dspdce-fw: Updated dspdce firmware for latest IPC version
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
X-List-Received-Date: Tue, 23 Sep 2014 16:15:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 23, 2014 at 09:30:32PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb |   26 +++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
> 
> diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
> new file mode 100644
> index 0000000..20cd7c8
> --- /dev/null
> +++ b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Firmware for DSP "

^^^ Do you want to clarify what kind of firmware for DSP this is?

Otherwise looks fine.


> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=b8feda5a3ed8197d05993c0d0ff5590e"
> +
> +COMPATIBLE_MACHINE = "dra7xx-evm"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRC_URI = " http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_04/exports/dspdce-${MACHINE}-1.00.00.04.tar.gz;protocol=ftp"
> +
> +S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
> +
> +SRC_URI[md5sum] = "72722b12e90c26a85f7f1b56d749cad0"
> +SRC_URI[sha256sum] = "64057db41dbee5a992db88129a9154f27c67cfbba8efdc0f09b7de38df4d58eb"
> +
> +TARGET = "dra7-dsp1-fw.xe66"
> +
> +do_install() {
> +        mkdir -p ${D}${base_libdir}/firmware
> +        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
> +}
> +
> +FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> +
> +INSANE_SKIP_${PN} = "arch"
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

