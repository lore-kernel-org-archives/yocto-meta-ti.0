Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3792E0096A; Mon, 13 Aug 2018 17:59:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B7FDE006D8
	for <meta-ti@yoctoproject.org>; Mon, 13 Aug 2018 17:59:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7E0xIwI010461
	for <meta-ti@yoctoproject.org>; Mon, 13 Aug 2018 19:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534208358;
	bh=Jcqsd4DYH+f4/ZI6lyCM0L62zGxRBsXP0WPU6MTlgPI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=avG5NZIZufYqLqSP3mqlhNnEmNfOIoSuoZEflYgK0VXPE3WllMQ8rY5RKk0g8Nk3P
	MrJPCQdocgAVJlTwkLnT2iEsISzb9BH0IQcZeNPPTz2PLG8MmjLw1z2bMXDueiHlNT
	gLv0DpMO6H+cplyA6rscxPNin9f8NGPCuNTiSAUc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7E0xHme021898
	for <meta-ti@yoctoproject.org>; Mon, 13 Aug 2018 19:59:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 13 Aug 2018 19:59:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 13 Aug 2018 19:59:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7E0xHv2020847;
	Mon, 13 Aug 2018 19:59:17 -0500
Date: Mon, 13 Aug 2018 20:58:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20180814005812.GZ2547@beryl>
References: <1533894889-29809-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1533894889-29809-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.00.12
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
X-List-Received-Date: Tue, 14 Aug 2018 00:59:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 10, 2018 at 05:54:49AM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.73.00.12.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.73.00.12.bb

Same question - do we need to keep around 6.52, 6.46 and 6.33 versions?


> diff --git a/recipes-ti/bios/ti-sysbios_6.73.00.12.bb b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
> new file mode 100644
> index 0000000..b727673
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
> @@ -0,0 +1,15 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV = "6_73_00_12"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=99771475f3621a6bf690df10327eaaa9"
> +
> +SRC_URI[sysbiosbin.md5sum] = "f8ff74bf0cfebdd5689fba843272ac61"
> +SRC_URI[sysbiosbin.sha256sum] = "4fdf76696fb43984a9cae739fd2ee091ca9d031ad0277d2bb94dbb26eae63f43"
> +
> +TI_BIN_UNPK_CMDS = ""
> +TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> +
> +BINFILE = "bios_${PV}.run"
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

