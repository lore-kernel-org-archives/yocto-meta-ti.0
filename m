Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEA6EE00B6C; Thu, 27 Sep 2018 14:38:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ACE7E0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:38:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RLcBtB083366
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538084292;
	bh=siKHigBawKUsSmsVMcW6qDqwMTBher3aAPQy3EeIVK0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uE/CKsHD1NMebnpWLoBsEGQrEqSLcK5ZkHtZu3xwJi0hHm/sfurc7Ok9Bcn2r1cHR
	xDSgYqkyaI003X6hY+AElaO4fSdlRzIwIoLc3FDVsMir8fb7vctapFXh+jQM7Uqo9n
	+sPrdiuuh8iBa0qEkuzpK931MGrp8Pliwo3/dlZU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLcBF2023376
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:38:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:38:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:38:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLcBXd006201;
	Thu, 27 Sep 2018 16:38:11 -0500
Date: Thu, 27 Sep 2018 17:38:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927213811.GO8582@beryl>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-7-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538081009-52859-7-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2 06/30] board-rtos: Update to version 01.00.10.02 and added support to k3
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
X-List-Received-Date: Thu, 27 Sep 2018 21:38:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 04:43:05PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/board-rtos/board-rtos_git.bb | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
> index df3e961..0e253d7 100644
> --- a/recipes-bsp/board-rtos/board-rtos_git.bb
> +++ b/recipes-bsp/board-rtos/board-rtos_git.bb
> @@ -5,22 +5,22 @@ inherit ti-pdk
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc627cefe49eb1c919"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
>  BOARD_GIT_PROTOCOL = "git"
>  BOARD_GIT_BRANCH = "master"
>  
> -# Below commit ID corresponds to "DEV.BOARD.01.00.10.01"
> -BOARD_SRCREV = "983d89de8143645571e7893e95632a8be0fab67e"
> +# Below commit ID corresponds to "DEV.BOARD.01.00.10.02"
> +BOARD_SRCREV = "60bde3650d067e4064f93c292c8d9108aa1bf57b"
>  
>  BRANCH ="${BOARD_GIT_BRANCH}"
>  SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${BOARD_SRCREV}"
> -PV = "01.00.10.01"
> -PR = "r1"
> +PV = "01.00.10.02"
> +PR = "r0"
>  
>  DEPENDS_append = " i2c-lld-rtos \
>                     spi-lld-rtos \
> @@ -63,6 +63,11 @@ DEPENDS_append_dra7xx = " pm-lld-rtos \
>                            mmcsd-lld-rtos \
>  "
>  
> +DEPENDS_append_am65xx-evm = " sciclient-rtos \

_append_k3?


> +                              pm-lld-rtos \
> +"
> +
> +
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

