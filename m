Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5795E00CB0; Thu, 27 Jul 2017 13:20:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17F8EE00B8E
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 13:20:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RKJrdY032092
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 15:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501186793;
	bh=3ZY6mehXxzULNquJ4c6i66aXvFzK68rCcZcixwE6jWc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CTpDR+4itCGl8V+MDn//KBe+r8CFKHjQJOKP5uPMDraZRbcpiMbWGlI3lPFvFjTfP
	YsDow55AvnrZi8s8P1dE/YTseJb6xZ/xsiHIXeRrgyOPJzXwOBbycmwHY/TOGJjyYM
	G0RGBLYYfMYwQTef9jxoal6FSaezezpl+IWkT3I8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RKJmLn027232
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 15:19:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 15:19:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RKJl3U029492;
	Thu, 27 Jul 2017 15:19:47 -0500
Date: Thu, 27 Jul 2017 16:19:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20170727201944.GJ18367@edge>
References: <1501016801-28357-1-git-send-email-i-pang@ti.com>
	<1501016801-28357-3-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1501016801-28357-3-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 27 Jul 2017 20:20:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 25, 2017 at 04:06:40PM -0500, Ivan Pang wrote:
> This recipe adds the Multicore Application Deployment (MAD) utility
> for c665x-evm and c667x-evm.
> 
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-bsp/mad-utils/mad-utils-rtos_git.bb | 50 +++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> 
> diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> new file mode 100644
> index 0000000..50045ce
> --- /dev/null
> +++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> @@ -0,0 +1,50 @@

Missing SUMMARY/DESCRIPTION


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

Same comment about host contamination warning due to preserved ownership of 
files.


> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
> +
> +INSANE_SKIP_${PN} += "arch staticdev ldflags file-rdeps"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

