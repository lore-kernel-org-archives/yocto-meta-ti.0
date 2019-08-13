Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C7A5E00D8F; Tue, 13 Aug 2019 14:34:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14BB6E00C78
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:34:58 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DLYwGv115917
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 16:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565732098;
	bh=G4aNuXY4FwePOAEn6nm2p3pHroUkvDUes0Oq2Vfam9c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oV8soz2Dw/3hiQalPwDBIElsZLIDanNELBmCKeH4AlR/EMUUHzA6SOc86C7jJln6n
	53FNr/9BhCuRl+lEpk3tj1o+05opYOQXY7akh7ZU/1Ax90PG4lC4m2MdLUIcFbw3eh
	VVKRSF2QRxWlDt9Q8yQl8UciglQUtBglLmkoNbEE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DLYwlJ116530
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 16:34:58 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 16:34:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 16:34:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DLYwK2041059;
	Tue, 13 Aug 2019 16:34:58 -0500
Date: Tue, 13 Aug 2019 17:34:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190813213457.GG7130@beryl>
References: <1565731523-46907-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1565731523-46907-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH v2] ti-cgt-7x: Initial version of TI-CGT-C7000 recipe
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
X-List-Received-Date: Tue, 13 Aug 2019 21:34:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 13, 2019 at 05:25:23PM -0400, Mahesh Radhakrishnan wrote:
> This tool is not publically fetchable yet and requires pre-downloading
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  v2 - Changes to remove class-target (LIC_CHECKSUM),updated commit description
> 
>  recipes-ti/devtools/ti-cgt7x_1.1.0.bb | 50 +++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt7x_1.1.0.bb b/recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> new file mode 100644
> index 0000000..465857c
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> @@ -0,0 +1,50 @@
> +DESCRIPTION = "TI DSP Code Generation Tools"

SUMMARY ^


> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +
> +LIC_FILES_CHKSUM = "file://usr/share/doc/ti/cgt-c7x/C7000_1.0.x_CodeGenerationTools_Manifest.htm;md5=3074e433c5d52657076d1d138dfbdaf8"
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
> +BINFILE = "ti_cgt_c7000_${PV}_linux_installer_x86.bin"

Duplicate


> +BINFILE_MD5 = "feb668b4213403c661909adcf65d2ba8"
> +BINFILE_SHA256 = "4a3954c973622c00a9b91fa90473cf921f4b763300b0e7c32735304867856ab8"

These 2 are not used


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
> +do_install_class-target() {
> +    ${WORKDIR}/${BINFILE} --prefix ${D}
> +}

This is rather useless


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

