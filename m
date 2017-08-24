Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78E38E00B3D; Thu, 24 Aug 2017 13:13:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1F75E0090A
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 13:13:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7OKDCTO015922
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 15:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503605592;
	bh=BPTCAPRmlUluyQ95Jm1iVuBMiOjSUg4Rw3MiT7Ibt3c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=p7czytNX+GkJ/jSeQsNYXg/yfCfcW1L0YEi1gY3AMgLyQ1IvHaZPDbguo5z7+Depm
	u5IeYTXfR4EUCj4Z8lpX09PAVwVip617RLUauQ0wgZKr+nU9YFh/OqdIGREcC79s3m
	dCeH7/DGv7TNoM2VrmNtis+X5UZFinoHhg5EV4bA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OKDCiC007291
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 15:13:12 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 24 Aug 2017 15:13:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 24 Aug 2017 15:13:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OKDB6x014033;
	Thu, 24 Aug 2017 15:13:12 -0500
Date: Thu, 24 Aug 2017 16:13:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170824201308.GP28233@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-36-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-36-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 36/37] cmb-addon-rtos: Adding CMB rtos recipe
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
X-List-Received-Date: Thu, 24 Aug 2017 20:13:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 18, 2017 at 07:03:47PM -0400, Mahesh Radhakrishnan wrote:
> Upstreaming the recipe for Circular Microphone array board (CMB) RTOS
> software
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
> v2 - Added summary
> 
>  recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 62 +++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> 
> diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> new file mode 100644
> index 0000000..0ff8bba
> --- /dev/null
> +++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> @@ -0,0 +1,62 @@
> +SUMMARY = "TI RTOS software supporting circular microphone array board"
> +require recipes-ti/includes/ti-paths.inc
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://cmbaddonver.h;beginline=8;endline=47;md5=d0cb159bf210cfafed63042da01c83e0"
> +
> +COMPATIBLE_MACHINE = "k2g|omapl137-evm"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +CMB_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/circmicarray-addon.git"
> +CMB_ADDON_GIT_PROTOCOL = "git"
> +CMB_ADDON_GIT_BRANCH = "master"
> +CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
> +
> +# Below commit ID corresponds to "DEV.CMB.01.01.00.00"
> +CMB_ADDON_SRCREV = "29c05572b82251bac73cd685afcffdb8549eaaaf"
> +
> +SRCREV = "${CMB_ADDON_SRCREV}"
> +PV = "01.01.00.00"
> +PR = "r0"
> +
> +BRANCH = "${CMB_ADDON_GIT_BRANCH}"
> +SRC_URI = "${CMB_ADDON_GIT_URI};destsuffix=${CMB_ADDON_GIT_DESTSUFFIX};protocol=${CMB_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +
> +S = "${WORKDIR}/git/ti/addon/cmb"
> +
> +DEPENDS = " ti-cgt6x-native \
> +            ti-sysbios \
> +            ti-xdctools \
> +            ti-pdk-build-rtos \
> +            common-csl-ip-rtos \
> +            gpio-lld-rtos \
> +            i2c-lld-rtos \
> +            mcasp-lld-rtos \
> +            board-rtos \

Blocked by board-rtos


> +"
> +
> +export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> +export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
> +
> +export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
> +
> +export PDK_CMB_ROOT_PATH = "${WORKDIR}/git"
> +
> +do_compile() {
> +    cd ${S}

Not needed ^


> +    make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
> +}
> +
> +do_install() {
> +    cd ${S}

Not needed ^


> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb
> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;

Is this needed?


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

