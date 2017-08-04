Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8912DE00C5C; Fri,  4 Aug 2017 15:16:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5625BE00B67
	for <meta-ti@yoctoproject.org>; Fri,  4 Aug 2017 15:16:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v74MG5qW025152
	for <meta-ti@yoctoproject.org>; Fri, 4 Aug 2017 17:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501884965;
	bh=ol2a4el40vNp5ePVrz7nXVISyXyzK5O4X+YSRK5q7CA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rtTF4wjwqaH8EwSohGQs2MEQR15lqcQi5rJEo7yCK1mx9smn9HuQoD3K3YrkxS9/P
	qPFH2+OTAskjVTxs/pAsuaZVxQEazRW2V73hzIpfJZGlZsHRJhp/R2MVayD852RkR8
	ZMp6Es4mzNtfb09tUMJg0m0QbC2x1u219Wg3csaw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v74MG5b8010407
	for <meta-ti@yoctoproject.org>; Fri, 4 Aug 2017 17:16:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 4 Aug 2017 17:16:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v74MG5Bi027515;
	Fri, 4 Aug 2017 17:16:05 -0500
Date: Fri, 4 Aug 2017 18:16:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20170804221601.GG11104@edge>
References: <1501566306-14838-1-git-send-email-i-pang@ti.com>
	<1501566306-14838-2-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1501566306-14838-2-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v4 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
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
X-List-Received-Date: Fri, 04 Aug 2017 22:16:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

These look great! Merged to next-rel, thanks!

On Tue, Aug 01, 2017 at 12:45:04AM -0500, Ivan Pang wrote:
> This recipe specifically installs the 7.x.x series of TI CGT6x.
> 
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb | 41 +++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb b/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
> new file mode 100644
> index 0000000..7bb4c75
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "TI DSP Code Generation Tools"
> +DESCRIPTION = "Texas Instrument (TI) Code Generation Tools are custom \
> +utilities targeted for TI embedded processors. This Digital Signal \
> +Processor (DSP) suite contains tools needed to create and debug \
> +applications for the C6000 DSP family. This includes tools such as: \
> +compiler, linker, assembler, etc. This also includes C runtime \
> +libraries and standard header files needed to produce a working DSP application."
> +
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "TI-TSPA"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> +
> +S = "${WORKDIR}/c6000_7.4.16"
> +
> +inherit native
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-unpack.inc
> +
> +BINFILE = "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
> +BINFILE_NAME = "cgt6x_7.4.16_x86_installer"
> +TI_BIN_UNPK_ARGS = "--prefix ${WORKDIR} --mode unattended"
> +TI_BIN_UNPK_CMDS=""
> +
> +SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
> +
> +SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] = "21ca55c5b1f6b2d8d4fb7570d5eb5513"
> +SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] = "baa0d1ef20397383f99f45068a6d160963a01419d42fbbb851263b54c91df82f"
> +
> +do_install() {
> +    install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
> +    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
> +}
> +
> +FILES_${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN} += "arch staticdev"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

