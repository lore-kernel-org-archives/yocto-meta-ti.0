Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1338E00B6F; Thu, 24 Aug 2017 13:13:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A50DE0090A
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 13:13:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7OKDYux004132
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 15:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503605614;
	bh=LFE5swy6x1PNQlF3MFV42xzrsgfFQq2SwzW5JIY81N4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dP7jqrRFpp+cX1SIQ3FjPOaCOE9flGwrr5Tdq+ujQuwhFxCm3B2fFi2UB18a1nCz+
	Yee8ySdZ8pk3UaAO6Sjvi3Rbm5wTL6ueRxjRS+1W8K27DL9M88246iV141hfB5OjCN
	CB1Nlp3y0CMRBHqCdbCWWCBTXFYEhoGySxk5b78I=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OKDYOk007564
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 15:13:34 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 24 Aug 2017 15:13:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 24 Aug 2017 15:13:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OKDYvk016513;
	Thu, 24 Aug 2017 15:13:34 -0500
Date: Thu, 24 Aug 2017 16:13:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170824201330.GQ28233@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-37-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-37-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 37/37] audk2g-addon-rtos: Adding rtos recipe for audio addons for k2g
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
X-List-Received-Date: Thu, 24 Aug 2017 20:13:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same comments as for #36.


On Tue, Jul 18, 2017 at 07:03:48PM -0400, Mahesh Radhakrishnan wrote:
> Upstreaming RTOS audio addon software for K2G
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
> v2 - Added summmary
> 
>  recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb | 60 +++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> 
> diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> new file mode 100644
> index 0000000..63271a8
> --- /dev/null
> +++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> @@ -0,0 +1,60 @@
> +SUMMARY = "TI RTOS Audio add-on software for k2g"
> +
> +require recipes-ti/includes/ti-paths.inc
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://audk2gaddonver.h;beginline=8;endline=47;md5=7a3996aaf1a3d3ca87358cf9b89bce3d"
> +
> +COMPATIBLE_MACHINE = "k2g"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +AUDK2G_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/audk2g-addon.git"
> +AUDK2G_ADDON_GIT_PROTOCOL = "git"
> +AUDK2G_ADDON_GIT_BRANCH = "master"
> +AUDK2G_ADDON_GIT_DESTSUFFIX = "git/ti/addon/audk2g"
> +
> +# Below commit ID corresponds to "DEV.AUDK2G.01.04.00.00"
> +AUDK2G_ADDON_SRCREV = "815180b45ceb1fa3c110f9979106c7f5aa8b3ca2"
> +
> +BRANCH = "${AUDK2G_ADDON_GIT_BRANCH}"
> +SRC_URI = "${AUDK2G_ADDON_GIT_URI};destsuffix=${AUDK2G_ADDON_GIT_DESTSUFFIX};protocol=${AUDK2G_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${AUDK2G_ADDON_SRCREV}"
> +PV = "01.04.00.00"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git/ti/addon/audk2g"
> +
> +DEPENDS = " ti-cgt6x-native \
> +            ti-sysbios \
> +            ti-xdctools \
> +            ti-pdk-build-rtos \
> +            common-csl-ip-rtos \
> +            gpio-lld-rtos \
> +            i2c-lld-rtos \
> +            board-rtos \
> +"
> +
> +export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> +export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
> +
> +export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
> +
> +export PDK_AUDK2G_ROOT_PATH = "${WORKDIR}/git"
> +
> +do_compile() {
> +    cd ${S}
> +
> +    make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
> +}
> +
> +do_install() {
> +    cd ${S}
> +
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/audk2g
> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

