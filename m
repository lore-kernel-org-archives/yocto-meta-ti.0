Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 869B6E00D70; Wed, 13 Dec 2017 18:36:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAB1EE00D6D
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 18:36:29 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBE2aTew000735
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 20:36:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513218989;
	bh=tImHezcM3ai+mIlzdKftC6pnOMyxMUTKwL1TxeykVio=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rJD8xtqQghZLCpH45OQ+yslSJZJPNJBIzycMSh7eQY3JpX1dtIrrEUUnuKWeNBYuy
	NnYwkZJpOCd56vuYKRRQ9MIqX7MFPcWXk+m+x433Lo+MN5gnp8zP1Z6tq4vdTbo7b/
	n2gO+528ZVxhrBWd6ZnwU7eje0MFI+NdZegPTMYg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBE2aTCT014008
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 20:36:29 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 20:36:28 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 20:36:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBE2aSDo010860;
	Wed, 13 Dec 2017 20:36:28 -0600
Date: Wed, 13 Dec 2017 21:36:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20171214023627.GA30822@edge>
References: <1513204522-25862-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1513204522-25862-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] board-rtos:Updating to version 1.0.9.0A
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
X-List-Received-Date: Thu, 14 Dec 2017 02:36:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 13, 2017 at 05:35:22PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/board-rtos/board-rtos_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
> index 37b2a64..ae0ae90 100644
> --- a/recipes-bsp/board-rtos/board-rtos_git.bb
> +++ b/recipes-bsp/board-rtos/board-rtos_git.bb
> @@ -5,21 +5,21 @@ inherit ti-pdk
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=0e3182ba6a963da159c37eafa9752ade"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x""

Typo with two quotes at the end of the line ^^^


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
>  BOARD_GIT_PROTOCOL = "git"
>  BOARD_GIT_BRANCH = "master"
>  
> -# Below commit ID corresponds to "DEV.BOARD.01.00.08.00A"
> -BOARD_SRCREV = "16b4ec027e2b0a3b91105a948d2c2d6db997bee0"
> +# Below commit ID corresponds to "DEV.BOARD.01.00.09.00A"
> +BOARD_SRCREV = "387d77aff6e36af54c239a315cb2d477f1466f4d"
>  
>  BRANCH ="${BOARD_GIT_BRANCH}"
>  SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${BOARD_SRCREV}"
> -PV = "01.00.08.00A"
> +PV = "01.00.09.00A"
>  PR = "r0"
>  
>  DEPENDS_append = " i2c-lld-rtos \
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

