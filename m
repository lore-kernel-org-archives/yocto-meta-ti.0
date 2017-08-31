Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C930BE00A9B; Thu, 31 Aug 2017 06:30:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F25FE0091D
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 06:30:56 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VDUj6s009039
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504186245;
	bh=F+AyG7oK3gBLcfDeZJS05dHbz7Z0NLPQpPeEJ9neBRc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=i9/mcoUmDnaATIt0qM4eC56v7ks+MCbPcNn9sdu1hjfaZXccIoERXXX1/x1zplcCH
	+dXAfadgSV2hQsnQuwTLhENt10l1zErpjksj0P7uZnHuFZH5Zh1/9WPfEy/Jc0jXpT
	Dso1a8n9TexSP0PNvbl2RlinGezqzp600JGhYLAU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDUeNq015148
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:30:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 08:30:39 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 08:30:39 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDUc9g021291;
	Thu, 31 Aug 2017 08:30:39 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
	<1504132936-7725-7-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <181a8f8a-c2c2-cbc2-71aa-507ec0d6e5fd@ti.com>
Date: Thu, 31 Aug 2017 09:30:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504132936-7725-7-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v3 7/7] audk2g-addon-rtos: Adding rtos recipe for audio addons for k2g
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
X-List-Received-Date: Thu, 31 Aug 2017 13:30:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/30/2017 6:42 PM, Mahesh Radhakrishnan wrote:
> Upstreaming RTOS audio addon software for K2G
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
>   v3 - Removed redundant code in do-compile & do-install
>   v2 - Added summary
>
>   recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb | 56 +++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
>
> diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> new file mode 100644
> index 0000000..9e233e2
> --- /dev/null
> +++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> @@ -0,0 +1,56 @@
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
> +    make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"

Same comment as 1/7 and 4/7. Please use oe_runmake

> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/audk2g
> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"


