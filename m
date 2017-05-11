Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CDDBE00B62; Thu, 11 May 2017 15:50:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7FE4E0095F
	for <meta-ti@yoctoproject.org>; Thu, 11 May 2017 15:50:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4BMo2mT013770
	for <meta-ti@yoctoproject.org>; Thu, 11 May 2017 17:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494543002;
	bh=l6VTDvFK5gkWu49h254bdPsX0VnP5GGrM4GVHDLuAyc=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=u4h1c+4bFfg8XRerugv08MDIo2QgOGS/A3w8d3eYs6jzVAmrOYxkBGevgnwYkShVJ
	WIqrjPsN3Z7MXLooGiwuvy9EOYZVaaKN9LydM74E9Pd5GfptuI48VMKmQ+qVAjxhzu
	2YxLh+Siv5f9GYSvcVg75WS+rOU48DLRUQBTJtYw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4BMo17E022300
	for <meta-ti@yoctoproject.org>; Thu, 11 May 2017 17:50:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 11 May 2017 17:50:01 -0500
Received: from [128.247.58.167] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4BMo2Mv019025;
	Thu, 11 May 2017 17:50:02 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <1494542857-5360-1-git-send-email-denys@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <1ea61355-e5f5-ba33-91f8-ffa387163b65@ti.com>
Date: Thu, 11 May 2017 17:50:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1494542857-5360-1-git-send-email-denys@ti.com>
Subject: Re: [morty/master][PATCH] prueth-fw: bump to pick up the correct 3.1.4 binaries
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
X-List-Received-Date: Thu, 11 May 2017 22:50:04 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 05/11/2017 05:47 PM, Denys Dmytriyenko wrote:
> Since no version update, bump the PR explicitly.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Dan Murphy <dmurphy@ti.com>

Thanks Denys,

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  recipes-bsp/prueth-fw/prueth-fw_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
> index 77445e9..e8221ec 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "3.1.4"
> -PR = "r1"
> +PR = "r2"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm|k2g"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "4ed1022c62bfe4ed4c66112024c8ee1301e9439d"
> +SRCREV = "6e1cf7bbc7e8050cb5c64a9098ed0b8a5c9de884"
>  BRANCH ?= "ti-linux-firmware-4.1.y"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> 


