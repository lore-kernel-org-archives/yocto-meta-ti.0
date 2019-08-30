Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AB3DE00E0D; Fri, 30 Aug 2019 10:36:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DDDFE00C25
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 10:36:20 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UHaKM7045663
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 12:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567186580;
	bh=VPgk/NYAZ8ZTy3hu4SEOIhn61+WqZu//isqbH2PHysA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JpacxRRz2t4JDyeZH8uhWmjTWm3NR3G6mmFmOSB5uLWnHnXxbLei4QGmBPuHwIINS
	Oaa0cqB8ta5Y72DoglY1yeSKeivJGgH4CoSHot9QaA5x3z3NNiPLVc48GIqBtnLGT6
	EiXudM2v1OzrkSewNpFHr5rnDTR3B0fcd8dJH2Ck=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UHaK0i000459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 12:36:20 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 12:36:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 12:36:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UHaJfl077642;
	Fri, 30 Aug 2019 12:36:20 -0500
Date: Fri, 30 Aug 2019 13:36:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190830173619.GN3307@beryl>
References: <1567185058-17876-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1567185058-17876-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master/thud][PATCH v2] am65xx, j7-evm: add secondary serial console for Jailhouse
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
X-List-Received-Date: Fri, 30 Aug 2019 17:36:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Perfect!
Merged everything to thud-next for testing, thanks!


On Fri, Aug 30, 2019 at 01:10:58PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
> * update commit message
> * add SERIAL_CONSOLES_CHECK
> 
>  conf/machine/am65xx-evm.conf | 3 ++-
>  conf/machine/j7-evm.conf     | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
> index 27bb0b0..15bffde 100644
> --- a/conf/machine/am65xx-evm.conf
> +++ b/conf/machine/am65xx-evm.conf
> @@ -8,7 +8,8 @@ MACHINE_FEATURES += "touchscreen"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  
> -SERIAL_CONSOLES = "115200;ttyS2"
> +SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index ca594e8..7b11ba7 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/k3.inc
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  
> -SERIAL_CONSOLES = "115200;ttyS2"
> +SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  KERNEL_DEVICETREE = " \
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

