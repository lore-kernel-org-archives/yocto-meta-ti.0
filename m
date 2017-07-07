Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDD2EE00B57; Fri,  7 Jul 2017 07:42:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BAD2E007D4
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 07:42:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67EgGdE023131
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 09:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499438536;
	bh=fiG5dNjwTht8bAYJC3kH8DnpavI0Je/MFzQjFEgAcBA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=YfoGGyzN4pFADjX5V4qzv6lnW9OPM9uPz76NrIuAU44EPvkfe0tbv2+5gSDsxaO4z
	d5kt2aCQw48H6sANoyoiNWbwrmKzn/ypvZkNq7B9sn7VtJoVjR2y2auO3pXashzGT9
	aCnPyvwn2lNr45nVDJabbjWiYb8b1X9Uq5rVMj3Y=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67EgGcG021169
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 09:42:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 09:42:15 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67EgFr3032705;
	Fri, 7 Jul 2017 09:42:15 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1499381369-60942-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <466e0e78-00d1-347a-36ec-fa2139c32b69@ti.com>
Date: Fri, 7 Jul 2017 10:42:15 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499381369-60942-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] cmb-addon-rtos: Add rtos recipe for cmb-addon
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
X-List-Received-Date: Fri, 07 Jul 2017 14:42:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can this use the ti-pdk.bbclass?


On 7/6/2017 6:49 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 67 +++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
>
> diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> new file mode 100644
> index 0000000..55769ec
> --- /dev/null
> +++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> @@ -0,0 +1,67 @@
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
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
> +
> +export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
> +
> +LIMSOCS_k2g = "k2g"
> +LIMBOARDS_k2g = "evmK2G"
> +LIMSOCS_omapl137-evm = "omapl137"
> +LIMBOARDS_omapl137-evm = "evmOMAPL137"
> +
> +export PDK_CMB_ROOT_PATH = "${WORKDIR}/git"
> +
> +do_compile() {
> +    cd ${S}
> +
> +    make release LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> +}
> +
> +do_install() {
> +    cd ${S}
> +
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb
> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"


