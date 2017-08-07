Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4F86E00B8D; Mon,  7 Aug 2017 12:18:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 720B7E00B53
	for <meta-ti@yoctoproject.org>; Mon,  7 Aug 2017 12:18:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v77JI1jp008583
	for <meta-ti@yoctoproject.org>; Mon, 7 Aug 2017 14:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502133481;
	bh=+965S5BMnVZGby2QwYUYg+23fXRAk4qDjudAvXMGVR0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=W3L/C0Y2gCGWP5GXAwwEDBTKFc2SPUCN5j+5z5saO7hBe8I9mWg1he+3vH5JNARNL
	f8OKZdc9oT6MsdDDkrUps53UoCYPIhw0CxBypmGXVodLUsmQZs4TdkWp4yEfjDY7Ub
	Ew6wym4gTVkgFlE5syDYA1+HHURcED2cXs69DRtE=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v77JI1Yk028229
	for <meta-ti@yoctoproject.org>; Mon, 7 Aug 2017 14:18:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Aug 2017 14:18:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v77JI1wQ031285;
	Mon, 7 Aug 2017 14:18:01 -0500
Date: Mon, 7 Aug 2017 15:17:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170807191757.GK11104@edge>
References: <1501797001-35113-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1501797001-35113-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-pdk-bbclass: Enabling support for pru firmware builds
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
X-List-Received-Date: Mon, 07 Aug 2017 19:18:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 03, 2017 at 05:50:01PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  classes/ti-pdk.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 62a4b06..1753969 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -5,7 +5,10 @@ inherit perlnative
>  
>  DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
>  
> -DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> +DEPENDS_append_omap-a15 = " ti-cgt-arm-native ti-cgt-pru-native"


> +DEPENDS_append_k2g = "ti-cgt-pru-native"
> +DEPENDS_append_ti33x = "ti-cgt-pru-native"
> +DEPENDS_append_ti43x = "ti-cgt-pru-native"

These lines ^^^ corrupt the DEPENDS variable when they append new values w/o 
whitespaces.


>  DEPENDS_remove_ti33x = "ti-cgt6x-native"
>  DEPENDS_remove_ti43x = "ti-cgt6x-native"
>  DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> @@ -41,6 +44,7 @@ export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
>  export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
>  export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
>  export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
>  
>  export ROOTDIR = "${B}"
>  export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> @@ -53,7 +57,7 @@ export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
>  TI_PDK_XDCMAKE ?= "1"
>  
>  # By default, only build the cores with available toolchains
> -TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host"
> +TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
>  TI_PDK_LIMIT_SOCS ?= ""
>  TI_PDK_LIMIT_BOARDS ?= ""
>  TI_PDK_MAKE_TARGET ?= "release"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

