Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64FFCE00A9B; Thu, 31 Aug 2017 06:27:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99D83E0091D
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 06:27:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VDRHfm005195
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504186037;
	bh=0tO872LFLpCIQtMHqq9y7D8hiXnIw3tiVe/VPQAkL2o=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=XNG3a1iaxrBv2xyFSP9PV/eQ0KgFKTMaD/XgjXiiNiLbl5h/RlfCAYnnTCtejlwWF
	KeFeNCGKOyy6Jcj5Udmkrh84vgVkGz+Do2w5NExjGLD+j5Y1s8bM8EUi4ZdHI++ep/
	ieoClf/zZOdjraRd74nmeb8M4T7Noroaz1hv+al0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDRHkM012222
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:27:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 08:27:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 08:27:17 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDRG0V018190;
	Thu, 31 Aug 2017 08:27:17 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
	<1504132936-7725-4-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1fee51ee-5bc9-7f85-6f54-831a49fbaa08@ti.com>
Date: Thu, 31 Aug 2017 09:27:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504132936-7725-4-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v3 4/7] cmb-addon-rtos: Adding CMB rtos recipe
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
X-List-Received-Date: Thu, 31 Aug 2017 13:27:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/30/2017 6:42 PM, Mahesh Radhakrishnan wrote:
> Upstreaming the recipe for Circular Microphone array board (CMB) RTOS
> software
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
>   v3 - Removed redundant code in do_compile & do_install
>   v2 - Added summary
>
>   recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 56 +++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
>
> diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> new file mode 100644
> index 0000000..66d961b
> --- /dev/null
> +++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> @@ -0,0 +1,56 @@
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
> +"
> +
> +export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> +export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
> +export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
> +export PDK_CMB_ROOT_PATH = "${WORKDIR}/git"
> +
> +do_compile() {
> +    make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"

Please use oe_runmake, passing LIMIT_SOCS and LIMIT_BOARDS in EXTRA_OEMAKE.

> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb
> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"


