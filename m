Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E420E00C45; Thu, 31 Aug 2017 09:37:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24236E00C01
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 09:37:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VGbsuo017123
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 11:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504197474;
	bh=0SfJ2by5pNI0Lmwjtc1/LojYwFPhRrxLouBAcI3XZFQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YzyCilbKZiAFv051KEbLdD0jJWn+wCB+ko8AyW2dwevSOdeFlSQQuZHUAiiqEX81W
	nr204sxzr3N+U8jYZGKDN5z2ayR6agD3hPnvs46/Cxt/APiVcGLbyz4el2H283zl38
	p4u6Dk6Pm+2QfjoQKUQO6zGe16u90LxYnb3Stb4A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VGbsLT004881
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 11:37:54 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 11:37:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 11:37:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VGbrQA001554;
	Thu, 31 Aug 2017 11:37:53 -0500
Date: Thu, 31 Aug 2017 12:37:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20170831163749.GY8304@edge>
References: <1504129361-28557-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1504129361-28557-1-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] nativesdk-dspcoreparse: added recipe for nativesdk-dspcoreparse
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
X-List-Received-Date: Thu, 31 Aug 2017 16:37:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 30, 2017 at 04:42:41PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  .../multiprocmgr/nativesdk-dspcoreparse_git.bb     | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb
> 
> diff --git a/recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb b/recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb
> new file mode 100644
> index 0000000..63cf937
> --- /dev/null
> +++ b/recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "DSP coredump parse utility"
> +DESCRIPTION = "The DSP coredump parse (dspcoreparse) utility is a part\
> +of the Multi-Proc Manager (MPM). This utility is used to provide\
> +information upon a DSP core crash or unexpected runtime termination."
> +
> +require recipes-ti/includes/ti-paths.inc
> +include recipes-ti/multiprocmgr/multiprocmgr.inc
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://dspcoreparse.c;beginline=1;endline=31;md5=7c271e4a6bd961947bce20c7fe5f86fe"
> +BRANCH = "master"
> +
> +SRC_URI = "git://git.ti.com/sdk-tools/dspcoreparse.git;protocol=git;branch=${BRANCH}"
> +
> +# Below commit ID corresponds to "DSPCOREPARSE.01.00.00.00A"
> +SRCREV = "b692b85a33052a5c736cd538eedf178d45bd4e4e"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile () {
> +  # Not building anything and using checked in binary file for now
> +  echo "Nothing to compile"
> +}
> +
> +do_install () {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${MPM_INSTALL_DIR_RECIPE}/utils/dspcoreparse
> +    cp ${CP_ARGS} ${S}/* -d ${D}${MPM_INSTALL_DIR_RECIPE}/utils/dspcoreparse/
> +}
> +
> +PACKAGES =+ "${PN}-src"

^^^ Nope


> +FILES_${PN}-dev = "${MPM_INSTALL_DIR_RECIPE}/utils"

Isn't it a binary? Why do you put it into ${PN}-dev?


> +FILES_${PN}-src = "${S}/*"

^^^ Can't do that.


> +FILES_${PN}-dbg = "${MPM_INSTALL_DIR_RECIPE}/utils/dspcoreparse/.debug"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +INSANE_SKIP_${PN}-dev = "arch file-rdeps"
> +INSANE_SKIP_${PN}-src = "arch file-rdeps"
> +INSANE_SKIP_${PN} = "arch file-rdeps"
> +INSANE_SKIP_${PN}-dbg = "arch file-rdeps"
> +
> +ALLOW_EMPTY_${PN} = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

