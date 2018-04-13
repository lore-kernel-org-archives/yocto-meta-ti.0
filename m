Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABA5AE00944; Fri, 13 Apr 2018 11:24:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 523D2E005A9
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 11:24:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DIO9Jf020771
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 13:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523643849;
	bh=yOxSD4jqyNv3mB/38NysZ4yfV590fOQHxsndNDVd8Ag=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XK3XvDRw2ZgNGBz5KKLdO4vGwmJmEV/yiHgEGMk5ZIPF1DB/OS7tTi/cD5maCjgVJ
	2CTO7p/wHy1DwhDlj2Ue+dPDeDv3uILXcs85nghAlKQRJnSeJ27v1sZ7fHjIOHH6vo
	sgWXJPgNVIAOn6hpTQE3VtmMJ+1n7N81rfnNrAbQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DIO9pF007400
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 13:24:09 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 13:24:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 13:24:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DIO8ID013525;
	Fri, 13 Apr 2018 13:24:08 -0500
Date: Fri, 13 Apr 2018 14:24:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180413182408.GA7580@edge>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 00/23] TI RTOS Updates
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
X-List-Received-Date: Fri, 13 Apr 2018 18:24:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks Jake and Mahesh! I'll merge the series to rocko-next and give it a try.


On Fri, Apr 13, 2018 at 01:01:56PM -0400, Jacob Stiffler wrote:
> 
> Mahesh Radhakrishnan (23):
>   common-csl-ip: Updating to version 03.03.00.10
>   emac-lld-rtos: Updating to version 01.00.03.10A
>   edma3-lld:Updating to version 02.12.05.30C
>   fatfs-rtos: Updating to version 01.00.00.09
>   gpio-lld-rtos: Updating to version 01.00.00.10
>   i2c-lld-rtos: Updating to version 01.00.00.10 & dependency updates
>   icss-emac-lld: Updating to version 01.00.00.11B
>   mcasp-lld-rtos: Update to version 01.01.00.09
>   mcbsp-lld-rtos:Updating to version 01.00.00.09
>   mmcsd-lld-rtos: Update to version 01.00.00.11
>   pcie-lld-rtos: Update to version 02.02.00.12
>   pruss-lld: Updating to version 01.00.00.09A
>   pm-lld-rtos: Updating to version 01.04.00.04 & 01.08.00.17 for
>     am57xx/dra7xx
>   sa-lld: Updating to version 03.00.00.20
>   serdes-diag-rtos: Update to version 01.00.00.10
>   spi-lld-rtos: Update to version 01.00.00.10A
>   uart-lld-rtos: Updating to version 01.00.00.10A
>   usb-lld-rtos: Update to version 01.00.00.13
>   board-rtos: Updating to version 01.00.10.00A
>   transport-rtos: Udpate to version 1.0.0.11A
>   osal: Update to version 01.00.00.10A
>   starterware:starterware-rtos: Udpate to version 02.01.01.06C & rtos
>     updates
>   ti-pdk-build-rtos: Updating to version 01.00.00.08E which uses make
>     install internally
> 
>  recipes-bsp/board-rtos/board-rtos_git.bb           |  13 +-
>  .../common-csl-ip/common-csl-ip-rtos_git.bb        |   2 +-
>  recipes-bsp/common-csl-ip/common-csl-ip.inc        |   6 +-
>  recipes-bsp/edma3-lld/edma3-lld.inc                |   6 +-
>  recipes-bsp/emac-lld/emac-lld-rtos_git.bb          |   6 +-
>  recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb           |   6 +-
>  recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb          |   6 +-
>  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  12 +-
>  recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |   6 +-
>  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb        |   6 +-
>  recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb        |   6 +-
>  recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb        |   6 +-
>  recipes-bsp/osal/osal.inc                          |   6 +-
>  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb          |   6 +-
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb              |  12 +-
>  recipes-bsp/pruss-lld/pruss-lld.inc                |   6 +-
>  recipes-bsp/sa-lld/sa-lld.inc                      |   6 +-
>  recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb    |   6 +-
>  recipes-bsp/spi-lld/spi-lld-rtos_git.bb            |   6 +-
>  recipes-bsp/starterware/starterware-rtos_git.bb    |   7 +-
>  recipes-bsp/starterware/starterware.inc            |   6 +-
>  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb    |   2 +-
>  recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb   |   2 +-
>  recipes-bsp/transport-rtos/nimu-rtos_git.bb        |   2 +-
>  recipes-bsp/transport-rtos/transport.inc           |   6 +-
>  recipes-bsp/uart-lld/uart-lld-rtos_git.bb          |   6 +-
>  recipes-bsp/usb-lld/usb-lld-rtos_git.bb            |   6 +-
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   | 199 +--------------------
>  28 files changed, 97 insertions(+), 268 deletions(-)
> 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

