Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 459E9E00B9C; Fri, 21 Jun 2019 15:04:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F7D4E00B33
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 15:04:20 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LM4KxT116542
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 17:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561154660;
	bh=ZaNpw/7CRMYa1ghsDPFrNEiBXFrfFJOJIg/w4WBw1YQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=D4/4JMrxatsn4J7WAJAKyfvmGX7Y7dmLzM19/TCB/cemxobh4dLPujjkFbUZ7iZlN
	gwUCz3HQrW44oTAcAPHcG7a2XntiA+gXj0SvgZ+FI2K52Ntm/cLY8JDLJPC7ckIu/1
	EK4JEBgnCM2NclHTKzePq2EQMT8E7sUpVDvjGZkE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LM4KOK072683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 17:04:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 17:04:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 17:04:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LM4JkJ048255;
	Fri, 21 Jun 2019 17:04:19 -0500
Date: Fri, 21 Jun 2019 18:04:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Angela Stegmaier <angelabaker@ti.com>
Message-ID: <20190621220419.GO4849@beryl>
References: <1561069977-5243-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
In-Reply-To: <1561069977-5243-1-git-send-email-angelabaker@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud][PATCH] vxd-dec-fw: Add the recipe for vxd-dec-fw
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
X-List-Received-Date: Fri, 21 Jun 2019 22:04:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks. Overall patches look fine. May I suggest putting all 3 of the recipes 
into a single directory? Say, recipes-bsp/ti-img-encode-decode/ with FW, 
kernel module and test app recipes in there. There are many other cases of 
such placement in meta-ti, especially LLDs. Also, can extract common pieces 
(like SRC_URI) into a shared .inc file, if needed.

Denys


On Thu, Jun 20, 2019 at 05:32:57PM -0500, Angela Stegmaier wrote:
> Add the firmware packaging recipe for the video decoder
> for J721E devices.
> 
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
>  recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
> 
> diff --git a/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
> new file mode 100644
> index 0000000..e8a1f72
> --- /dev/null
> +++ b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Video Decoding Firmware Packaging recipe"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84ca7278930db001870686ad997d6bb1"
> +
> +PROTOCOL = "git"

Where's this variable used?


> +BRANCH = "master"
> +SRCREV = "0acbf1d0a7c7eaca0ef14c1a30ce313ea82147e5"
> +
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +PV = "1.0-git${SRCPV}"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +VXD_FW_DIR = "${S}/decoder/firmware/"
> +
> +# make sure that lib/firmware, and all its contents are part of the package
> +FILES_${PN} += "${base_libdir}/firmware"
> +
> +do_install() {
> +  install -d ${D}${base_libdir}/firmware
> +  install -m 0755 ${VXD_FW_DIR}/pvdec_full_bin.fw ${D}${base_libdir}/firmware
> +}
> +
> +# This is used to prevent the build system to strip the executables
> +INHIBIT_PACKAGE_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> +INSANE_SKIP_${PN} += "arch"
> +
> +# we don't want to configure and build the source code
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

