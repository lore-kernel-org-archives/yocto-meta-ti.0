Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A39EE00BC0; Tue, 25 Jul 2017 07:28:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23DBFE00B76
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 07:28:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6PESDZ1024911
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500992893;
	bh=HthhVV7yUOacooOzPwvsbtmO0fsJAWWQvixKg5ePTro=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=UmBLmIovsxofbkXLC9ujICp+bkqXEK1rEAyZr+pJrUNWE6JT5dKCdAsJwAL99OoEj
	wE+2VCxxRosUJcBS6zQcGc+C53kZRnrNhCnsx1mwth8sn+FjJNUU8WLURR3fkNr6Ks
	XinpZc9uNzh+WpFKK9nzIeGEh9MLMDhtuXnFkuyQ=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PESD6d022884
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:28:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Jul 2017 09:28:12 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PESCiX014863;
	Tue, 25 Jul 2017 09:28:12 -0500
To: Ivan Pang <i-pang@ti.com>, <meta-ti@yoctoproject.org>
References: <1500935470-11179-1-git-send-email-i-pang@ti.com>
	<1500935470-11179-3-git-send-email-i-pang@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e924bf12-8207-df2d-d17d-6fada235e684@ti.com>
Date: Tue, 25 Jul 2017 10:28:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500935470-11179-3-git-send-email-i-pang@ti.com>
Subject: Re: [PATCH 3/4] mad-utils-rtos: added recipe for MAD utils
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
X-List-Received-Date: Tue, 25 Jul 2017 14:28:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/24/2017 6:31 PM, Ivan Pang wrote:
> This recipe adds the Multicore Application Deployment (MAD)
> utility for c665x-evm and c667x-evm.
>
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>   recipes-bsp/mad-utils/mad-utils-rtos_git.bb | 66 +++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
>   create mode 100644 recipes-bsp/mad-utils/mad-utils-rtos_git.bb
>
> diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> new file mode 100644
> index 0000000..0fab610
> --- /dev/null
> +++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> @@ -0,0 +1,66 @@
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
> +CLEANBROKEN = "1"

Is CLEANBROKEN needed? I do not see a Makefile in the 'S' directory.

> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "2458510f76eddfa837c2b83448965e233156944b"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git"
> +
> +export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
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
> +    cp mal/malLib/build/Makefile mal/malLib/build/Makefile_save
> +    sed -i "s@cl6x@${C6X_BASE_DIR}/bin/cl6x@g" mal/malLib/build/Makefile
> +    sed -i "s@ar6x@${C6X_BASE_DIR}/bin/ar6x@g" mal/malLib/build/Makefile
> +    sed -i "s@strip6x@${C6X_BASE_DIR}/bin/strip6x@g" mal/malLib/build/Makefile
> +    cp mal/malApp/build/Makefile mal/malApp/build/Makefile_save
> +    sed -i "s@cl6x@${C6X_BASE_DIR}/bin/cl6x@g" mal/malApp/build/Makefile
> +    sed -i "s@ar6x@${C6X_BASE_DIR}/bin/ar6x@g" mal/malApp/build/Makefile
> +    sed -i "s@strip6x@${C6X_BASE_DIR}/bin/strip6x@g" mal/malApp/build/Makefile
> +    cp nmlLoader/build/Makefile nmlLoader/build/Makefile_save
> +    sed -i "s@cl6x@${C6X_BASE_DIR}/bin/cl6x@g" nmlLoader/build/Makefile
> +    sed -i "s@ar6x@${C6X_BASE_DIR}/bin/ar6x@g" nmlLoader/build/Makefile
> +    sed -i "s@strip6x@${C6X_BASE_DIR}/bin/strip6x@g" nmlLoader/build/Makefile

I think that it would be cleaner to prepend PATH with 
'${C6X_BASE_DIR}/bin'. Then you do not need to modify the makefile and 
then undo the modifications.

> +    for e in ${ENDIAN}
> +    do
> +        mkdir -p bin/${DEVICE}/${e}
> +        make -C mal/malLib/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
> +        make -C mal/malApp/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
> +        cp mal/malApp/build/mal_app.exe bin/${DEVICE}/${e}
> +        make -C nmlLoader/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
> +        cp nmlLoader/build/nml.exe bin/${DEVICE}/${e}
> +    done
> +    mv -f mal/malLib/build/Makefile_save mal/malLib/build/Makefile
> +    mv -f mal/malApp/build/Makefile_save mal/malApp/build/Makefile
> +    mv -f nmlLoader/build/Makefile_save nmlLoader/build/Makefile
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


