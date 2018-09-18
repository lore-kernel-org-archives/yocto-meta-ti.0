Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2310DE00B45; Mon, 17 Sep 2018 17:42:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97A1EE00B21
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2018 17:42:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8I0g3k8046036
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2018 19:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537231323;
	bh=gqsM7k0HPwMf9Ica2mLvsBxLW5lJJIB5m+rAsxMRgn8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=edg/MjWBtowfwrgPjgSzwbdut2KlerQjCIe5qP03RRnIBoqG4BUG6qmwOB06gH5H8
	JOJOAowV6NEg1RniCpzY4MJyWvMcszexrmPMLfq7t+qVh+rckS/ABzCwr1TuM9G0Ym
	cQNQ6PuckOvBxQbAhC1Om/dD3IBenQxk4vurXMq8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8I0g3B1008947
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2018 19:42:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 19:42:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 19:42:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8I0g3Dp014893;
	Mon, 17 Sep 2018 19:42:03 -0500
Date: Mon, 17 Sep 2018 20:40:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180918004042.GI12296@beryl>
References: <1536979805-18343-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536979805-18343-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko][PATCH] ti-cgt-arm: Update to add rtsv7R4_A_le_v3D16_eabi.lib
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
X-List-Received-Date: Tue, 18 Sep 2018 00:42:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 14, 2018 at 10:50:05PM -0400, Sam Nelson wrote:
> rtsv7R4_A_le_v3D16_eabi.lib library is not included in the cgt package.
> This library is built dynamically during linking during a single build.
> Bu in case of parallel make, dynamic creation of libraries causes
> failures.
> Hence building and adding the library to the package.

Is this applicable to all platforms?


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>t
> ---
>  recipes-ti/devtools/ti-cgt-arm.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
> index 436fab1..b9f7566 100644
> --- a/recipes-ti/devtools/ti-cgt-arm.inc
> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> @@ -9,12 +9,20 @@ require recipes-ti/includes/ti-paths.inc
>  
>  S = "${WORKDIR}/ti-cgt-arm-${PV}"
>  
> +PR = "r1"
> +
>  SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
>  
>  BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>  TI_BIN_UNPK_ARGS = "--prefix ${S}"
>  TI_BIN_UNPK_CMDS = ""
>  
> +do_compile_append() {
> +    cd ${S}/ti-cgt-arm_${PV}.LTS
> +    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
> +    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
> +}
> +
>  do_install() {
>      install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>      cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

