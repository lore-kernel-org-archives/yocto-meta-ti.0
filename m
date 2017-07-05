Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8093E00718; Wed,  5 Jul 2017 08:48:36 -0700 (PDT)
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
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31473E00349
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 08:48:34 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65FmYZ2015898
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 10:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499269714;
	bh=U0U3O7CHFpa3c8ob80dJ9zxH9PbFnukLQ4GbOQ8BOXE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=mcQiXOZEOdudK50oK00Pgxl3QgqhCL2NoRhD8cAOEMMAE/pv8LTurgYTlginfDkXV
	b7yUsABPW8qW/luJ3HXHYo6EYrnMP9y9UmXGOFkCnPnr1/FXpkwI1ZGchkH/f+qSa9
	0OmZdV8/yjChbfhe9ZPUbebobK4hicQ4szfX5cFc=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65FmYUE019761
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 10:48:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 10:48:33 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65FmX4U031830;
	Wed, 5 Jul 2017 10:48:33 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1498854500-43685-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2afa6b07-9fd6-51d8-3ca9-adb837e29916@ti.com>
Date: Wed, 5 Jul 2017 11:48:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1498854500-43685-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] edma3-lld-rtos: Add support for omapl1
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
X-List-Received-Date: Wed, 05 Jul 2017 15:48:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Do you need to add the PLATFORMLIST and TARGETLIST for omapl?


On 6/30/2017 4:28 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> index f524478..a31aa2d 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> @@ -1,11 +1,11 @@
>   require edma3-lld.inc
>   require recipes-ti/includes/ti-paths.inc
>   
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>   
>   DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
>   
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   PLATFORMLIST = ""


