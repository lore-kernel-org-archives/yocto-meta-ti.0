Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2A4CE00C80; Thu, 27 Jul 2017 06:19:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CBAAE00C61
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 06:19:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RDJg4R017546
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501161582;
	bh=682o6gx1lbfth1SQxHd6pqeKQYKwNu3iiSbvzD3VGQs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=NQAAwBytAk/fuOWqS9iG8Gx5yN/Zz9c6MwAvow1j88IsiCYT2GufP7mplLx9wzX4L
	jyAE7f9vkHPfySUDjgjk9WJxSIbkgYdIZpe1fAm/bEELa/fAW4CcnxmGvbmjyCpnm+
	sQaQh08Wu2L8V4T/XKkq8NiYrBW2gOQHnzYJgNRo=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDJgKn010225
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:19:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 08:19:41 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDJfDj010620;
	Thu, 27 Jul 2017 08:19:41 -0500
To: Ivan Pang <i-pang@ti.com>, <meta-ti@yoctoproject.org>
References: <1501016801-28357-1-git-send-email-i-pang@ti.com>
	<1501016801-28357-4-git-send-email-i-pang@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <abe53116-1cbc-ecea-98fa-4d13075ea8bc@ti.com>
Date: Thu, 27 Jul 2017 09:19:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501016801-28357-4-git-send-email-i-pang@ti.com>
Subject: Re: [PATCH v2 4/4] ibl-boot-rtos: added recipe for RTOS IBL
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
X-List-Received-Date: Thu, 27 Jul 2017 13:19:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


On 7/25/2017 5:06 PM, Ivan Pang wrote:
> This recipe adds the Intermediate Bootloader (IBL) for c665x-evm
> and c667x-evm.
>
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>   recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb | 57 +++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>   create mode 100644 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
>
> diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> new file mode 100644
> index 0000000..47c6ccd
> --- /dev/null
> +++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> @@ -0,0 +1,57 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://src/ibl.h;beginline=1;endline=34;md5=ee7d7a3305d1e524955996d1c5e31cb9"
> +
> +require recipes-ti/includes/ti-paths.inc
> +
> +DEPENDS = "ti-cgt6x-7-native"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "c66x"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/ibl.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "f7ed32cc8911e3353dd01080da9b725b44a12285"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git"
> +
> +PATH_prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
> +
> +IBLTARGETS = ""
> +IBLTARGETS_c665x-evm = "evm_c6657_i2c"
> +IBLTARGETS_c667x-evm = "evm_c6678_i2c"
> +
> +IBLENDIAN = ""
> +IBLENDIAN_c665x-evm = "little big"
> +IBLENDIAN_c667x-evm = "little big"
> +
> +export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
> +export TOOLSC6X="${C6X_BASE_DIR}"
> +export TOOLSC6XDOS="${C6X_BASE_DIR}"
> +export TOOLSBIOSC6XDOS="${C6X_BASE_DIR}"
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +
> +do_compile() {
> +    cd src/make
> +    for t in ${IBLTARGETS}
> +    do
> +        for e in ${IBLENDIAN}
> +        do
> +            make ${t} ENDIAN=${e} I2C_BUS_ADDR=0x51
> +        done
> +    done
> +    cd -
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
> +    cp -r * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +INSANE_SKIP_${PN} = "arch file-rdeps"


