Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAF89E00C80; Thu, 27 Jul 2017 06:19:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39B13E00C61
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 06:19:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RDJgVP009871
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501161582;
	bh=i1KydRGUrC1vCcicIW6vXGNCrgwgPZA2Q1bExpikvSo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=btC69BSMYqWdZbN9Un2kV19AbDVCrLiekA2iXy7F/xHKNVOMYF5fijb2lbCh7WJJD
	mwQdnhB5urszWFU7psrO76ELU/QCcgTnSx+blt8E0+9BQeE8o2neonCuNCJXGSJpZQ
	FMSeTNKXYfGDDLXpjtC/n8NjPi8jc9qS7dgWpw7Q=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDJbP3012770
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:19:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 08:19:36 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDJaiF010558;
	Thu, 27 Jul 2017 08:19:36 -0500
To: Ivan Pang <i-pang@ti.com>, <meta-ti@yoctoproject.org>
References: <1501016801-28357-1-git-send-email-i-pang@ti.com>
	<1501016801-28357-3-git-send-email-i-pang@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8cec9f4c-7d63-47cc-4229-24f2139ea316@ti.com>
Date: Thu, 27 Jul 2017 09:19:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501016801-28357-3-git-send-email-i-pang@ti.com>
Subject: Re: [PATCH v2 3/4] mad-utils-rtos: added recipe for MAD utils
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
X-List-Received-Date: Thu, 27 Jul 2017 13:19:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


On 7/25/2017 5:06 PM, Ivan Pang wrote:
> This recipe adds the Multicore Application Deployment (MAD) utility
> for c665x-evm and c667x-evm.
>
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>   recipes-bsp/mad-utils/mad-utils-rtos_git.bb | 50 +++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 recipes-bsp/mad-utils/mad-utils-rtos_git.bb
>
> diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> new file mode 100644
> index 0000000..50045ce
> --- /dev/null
> +++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> @@ -0,0 +1,50 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://README.txt;md5=44b2180aec0657f6b0e42e5611c0bafb"
> +
> +require recipes-ti/includes/ti-paths.inc
> +
> +DEPENDS = "ti-cgt6x-7-native"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "c66x"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "2458510f76eddfa837c2b83448965e233156944b"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git"
> +
> +export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
> +PATH_prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
> +
> +DEVICE = ""
> +DEVICE_c665x-evm = "C6657"
> +DEVICE_c667x-evm = "C6678"
> +
> +ENDIAN = ""
> +ENDIAN_c665x-evm = "little big"
> +ENDIAN_c667x-evm = "little big"
> +
> +do_compile() {
> +    cd mad-loader
> +    for e in ${ENDIAN}
> +    do
> +        mkdir -p bin/${DEVICE}/${e}
> +        make -C mal/malLib/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
> +        make -C mal/malApp/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
> +        cp mal/malApp/build/mal_app.exe bin/${DEVICE}/${e}
> +        make -C nmlLoader/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
> +        cp nmlLoader/build/nml.exe bin/${DEVICE}/${e}
> +    done
> +    cd -
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
> +    cp -r * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
> +
> +INSANE_SKIP_${PN} += "arch staticdev ldflags file-rdeps"


