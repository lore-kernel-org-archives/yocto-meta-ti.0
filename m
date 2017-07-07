Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B4BAE00B57; Fri,  7 Jul 2017 07:38:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E018E007D4
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 07:38:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67Ec932006578
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 09:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499438289;
	bh=QDZsY1d3nX5X6L+1oes9lRVLpU+2g7aAnLTnbXQBo1I=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=R7psbdiN9aRUebyLlRIs0gHuDJtFii4yrMgBwBxPirbeoiqYw4Z6BBmDlOu0PHU9B
	6PNEIkcdArIfe/jCt2t9ddTrnLdr9SN1hvFmwn4Mdopabo9AkuAO2WAv+WWzLSgZu9
	jjU1sSNwbkb5DOZMqPinrPHR65b7z/+IHS8qW404=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67Ec9Sl016264
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 09:38:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 09:38:09 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67Ec9Oh028657;
	Fri, 7 Jul 2017 09:38:09 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1499380666-60390-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2bbb8fd4-788a-d297-ee5a-e6b84ebb4073@ti.com>
Date: Fri, 7 Jul 2017 10:38:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499380666-60390-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] ti-pdk-setup: Add ti-pdk-setup recipe
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
X-List-Received-Date: Fri, 07 Jul 2017 14:38:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/6/2017 6:37 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb | 104 ++++++++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
>   create mode 100644 recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
>
> diff --git a/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb b/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
> new file mode 100644
> index 0000000..bd66f56
> --- /dev/null
> +++ b/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
> @@ -0,0 +1,104 @@
> +DESCRIPTION = "Package containing scripts to setup the PDK development environment"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://release/full/pdksetupenv.sh;beginline=1;endline=20;md5=1858f90ca160daa7ca1b05dc3e474791"
> +
> +require recipes-ti/includes/ti-paths-append.inc
> +
> +PDK_SETUP_GIT_URI = "git://git@bitbucket.itg.ti.com/processor-sdk/processor-pdk-packages.git"
> +PDK_SETUP_GIT_PROTOCOL = "ssh"
> +PDK_SETUP_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.PDK_PACKAGES.01.00.00.01"
> +PDK_SETUP_SRCREV = "23f310087fded4955d6d64e6df20fd057d1cede8"
> +
> +BRANCH = "${PDK_SETUP_GIT_BRANCH}"
> +SRC_URI = "${PDK_SETUP_GIT_URI};protocol=${PDK_SETUP_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${PDK_SETUP_SRCREV}"
> +PV = "01.00.00.01"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git/"
> +
> +CLEANBROKEN = "1"
> +
> +LIMIT_SOCS_ti33x = "am335x"
> +LIMIT_SOCS_ti43x = "am437x"
> +LIMIT_SOCS_omap-a15 = "am571x am572x"
> +LIMIT_SOCS_dra7xx-evm = "dra72x dra75x dra78x"
> +LIMIT_SOCS_omapl137-evm = "omapl137"
> +LIMIT_SOCS_omapl138-lcdk = "omapl138"
> +LIMIT_SOCS_k2hk-evm = "k2h k2k"
> +LIMIT_SOCS_k2e-evm = "k2e"
> +LIMIT_SOCS_k2l-evm = "k2l"
> +LIMIT_SOCS_k2g = "k2g"
> +LIMIT_SOCS_c665x-evm = "c665x"
> +LIMIT_SOCS_c667x-evm = "c6678"
> +
> +LIMIT_BOARDS_ti33x = "evmAM335x icev2AM335x bbbAM335x skAM335x"
> +LIMIT_BOARDS_ti43x = "evmAM437x idkAM437x skAM437x"
> +LIMIT_BOARDS_omap-a15 = "evmAM572x idkAM571x idkAM572x"
> +LIMIT_BOARDS_dra7xx-evm = "evmDRA72x evmDRA75x evmDRA78x"
> +LIMIT_BOARDS_omapl137-evm = "evmOMAPL137"
> +LIMIT_BOARDS_omapl138-lcdk = "lcdkOMAPL138"
> +LIMIT_BOARDS_k2hk-evm = "evmK2H evmK2K"
> +LIMIT_BOARDS_k2e-evm = "evmK2E"
> +LIMIT_BOARDS_k2l-evm = "evmK2L"
> +LIMIT_BOARDS_k2g = "evmK2G iceK2G"
> +LIMIT_BOARDS_c665x-evm = "evmC6657"
> +LIMIT_BOARDS_c667x-evm = "evmC6678"

LIMIT_BOARDS and LIMIT_SOCS should not need to be set here. They can be 
obtained from the machine configuration as TI_PDK_LIMIT_SOCS and 
TI_PDK_LIMIT_BOARDS.

> +
> +PDK_SOC = "${@'${MACHINE}'.replace('-evm','')}"
> +PDK_SOC_omapl138-lcdk = "${@'${MACHINE}'.replace('-lcdk','')}"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +
> +    install -m 0755 release/full/pdksetupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0755 release/full/pdksetupenv.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0755 release/full/pdkProjectCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0755 release/full/pdkProjectCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0755 release/full/pdkAppImageCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0755 release/full/pdkAppImageCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0755 release/full/macros.ini ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    install -m 0644 release/full/Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +
> +    sed -i -e "s|__PDK_VER__|${PDK_VERSION}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdkProjectCreate.sh
> +    sed -i -e "s|__PDK_VER__|${PDK_VERSION}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdkProjectCreate.bat
> +
> +    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
> +    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
> +    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
> +
> +    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
> +    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
> +    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
> +
> +    TI_PDK_VERSION=`echo ${PDK_VERSION} | sed -e 's|\.|_|g' -e 's|^0||'`
> +
> +    sed -i -e "s|__PDK_SOC__|${PDK_SOC}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
> +    sed -i -e "s|__PDK_VER__|${TI_PDK_VERSION}|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
> +}
> +
> +do_install_append_omapl1() {
> +    sed -i -e "s|c66x|c674x|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
> +    sed -i -e "s|c66x|c674x|g" \
> +        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"


