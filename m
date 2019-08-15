Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15D44E00E0A; Thu, 15 Aug 2019 12:30:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC726E00DE2
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 12:30:48 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7FJUmLs007468
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 14:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565897448;
	bh=qX43pbg4mUsuIdtPUKcR+GB9vUmhPXdBOX1EvgOeDPg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CbEKpry3f1pMeR0ppo4f30zc47/2mHqP7G57k9CuprZaY9acckNOtV2z4UJdPkxrS
	sB18ZCMdW94Ju2BftYqD7MNhh9e53C6kwWaklPJW6+pNGDMSm7aSJlE/VJghStxaOM
	sWV+EWME976QsRutLNcMCbvU2xwSmHsB3hFN8GYg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7FJUmeD016100
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 14:30:48 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 15 Aug 2019 14:30:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 15 Aug 2019 14:30:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7FJUlWU052153;
	Thu, 15 Aug 2019 14:30:47 -0500
Date: Thu, 15 Aug 2019 15:30:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190815193047.GB2365@beryl>
References: <1565745911-62772-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1565745911-62772-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH v3] ti-cgt-7x: Initial version of TI-CGT-C7000 recipe
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
X-List-Received-Date: Thu, 15 Aug 2019 19:30:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks for addressing the comments. Was this tested?

On Tue, Aug 13, 2019 at 09:25:11PM -0400, Mahesh Radhakrishnan wrote:
> This tool is not publically fetchable yet and requires pre-downloading
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  v3 - Removed class-target references,redundant defs,corrected LIC_CHECKSUM file
>  v2 - Changes to remove class-target (LIC_CHECKSUM),updated commit
>  
>  recipes-ti/devtools/ti-cgt7x_1.1.0.bb | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt7x_1.1.0.bb b/recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> new file mode 100644
> index 0000000..233c840
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> @@ -0,0 +1,47 @@
> +SUMMARY = "TI DSP Code Generation Tools"
> +DESCRIPTION = "Texas Instruments (TI) Code Generation Tools are custom \
> +utilities targeted for TI embedded processors. This Digital Signal \
> +Processor (DSP) suite contains tools needed to create and debug \
> +applications for the C7000 DSP family. This includes tools such as: \
> +compiler, linker, assembler, etc. This also includes C runtime \
> +libraries and standard header files needed to produce a working DSP application."
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +
> +LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}/C7000_1.0.x_CodeGenerationTools_Manifest.html;md5=3074e433c5d52657076d1d138dfbdaf8"
> +
> +require recipes-ti/includes/ti-unpack.inc
> +
> +# only x86_64 is supported
> +COMPATIBLE_HOST = "x86_64.*-linux"
> +COMPATIBLE_HOST_class-target = "null"
> +
> +BINFILE = "ti_cgt_c7000_${PV}_linux_installer_x86.bin"
> +BINFILE_NAME = "cgt7x_x86_installer"
> +
> +# Please note, "install.source.dir.local" is not a real URL, below files need to be pre-downloaded
> +SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
> +
> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
> +TI_BIN_UNPK_CMDS = ""
> +
> +SRC_URI[cgt7x_x86_installer.md5sum]    = "feb668b4213403c661909adcf65d2ba8"
> +SRC_URI[cgt7x_x86_installer.sha256sum] = "4a3954c973622c00a9b91fa90473cf921f4b763300b0e7c32735304867856ab8"
> +
> +S = "${WORKDIR}/c7000_${PV}"
> +
> +do_install() {
> +    install -d ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
> +    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
> +}
> +
> +
> +FILES_${PN} += "${TI_CGT7X_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN} += "arch staticdev textrel"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

