Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15E1FE00AA2; Mon,  1 May 2017 12:10:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75439E00546
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:10:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41JA6ON021962
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493665806;
	bh=dsVT5YJ1x7Jigb236E6W9tHdd5o+TwyO5qylYvR7BVw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kTzgV32TP5KP/Hn1+Mw0oMQMhpWBSTEUpZu4KYBMlkgcRjAGmezxAQI0/b9y+4U5c
	C7uxag/CmoDvy76AUdHyyieq0EWgmWxdGGraj+svJ0YgVwpn3YBwxoTVspLMMm94xQ
	qGpwR1YxZciizwyaRaRHwZBVv7oBEYdvkN9zZEQU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JA1fa029218
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:10:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:10:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JA1on016803;
	Mon, 1 May 2017 14:10:01 -0500
Date: Mon, 1 May 2017 15:10:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170501190959.GU31608@edge>
References: <20170501190150.4110-1-dmurphy@ti.com>
	<20170501190150.4110-4-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170501190150.4110-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [v2 PATCH 4/4] boot-monitor: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:10:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 01, 2017 at 02:01:50PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - No changes
> 
>  recipes-bsp/boot-monitor/boot-monitor_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index e4ea67f6..1b6f3206 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  DEPENDS = "u-boot-mkimage-native"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
> -SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"

Can you also remove the corresponding patch file please? ^^^


>  PV = "4.0+git${SRCPV}"
>  
> @@ -16,7 +15,7 @@ BRANCH = "master"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
> +SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
>  
>  BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
>  
> -- 
> 2.12.2
> 

