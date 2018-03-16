Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35853E00B1A; Fri, 16 Mar 2018 09:59:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F46AE007E1
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 09:59:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGxAks026158
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521219550;
	bh=UQxt5mh2Gvh+hCAYmDcjLdHZsicKS0qRo/QqMcBL478=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rlIGhYxFHMOtoD53MWSeXQdPtdvV7EzvCqkQ6Lz4Vp9gJrcUW9ykfRyfKUYawygGo
	bvIzP79nmctBT1r4HHfHMsw2pwQJcoC0rxiynVtdeXt5wESnRndlNj6z8MZScRN8jp
	8YgKlYwbm9M0QDFy5u+rH1S0hfx67D26oznuEtvE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGxAfs010913
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:59:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:59:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:59:10 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGxAJ2013808;
	Fri, 16 Mar 2018 11:59:10 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1521217083-27445-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <75149b13-3891-1ebd-7b64-ca3e6f3f7aa5@ti.com>
Date: Fri, 16 Mar 2018 12:59:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521217083-27445-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty/rocko/master][PATCH] icss-emac-lld: Updating to version 01.00.00.11B
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
X-List-Received-Date: Fri, 16 Mar 2018 16:59:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

With this patch, icss-emac-lld-rtos fails. It appears an update to 
pruss-lld-rtos will be required before this can be applied.


| "src/icss_emacFwInit.c", line 1395: error #225: function 
"PRUICSS_setIepClkSrc" declared implicitly
| 1 error detected in the compilation of "src/icss_emacFwInit.c".
|
| >> Compilation failure


On 3/16/2018 12:18 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> index 0ec3b2c..0a9efa5 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> @@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
>   ICSS_EMAC_LLD_GIT_BRANCH = "master"
>   ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
>   
> -# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.10A"
> -ICSS_EMAC_LLD_SRCREV = "91f70af3714a823df4f71bde3c4d954728e07856"
> +# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.11B"
> +ICSS_EMAC_LLD_SRCREV = "bd643d75a0322b6ca769d8ecbee310d859c0f761"
>   
>   BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
>   SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
> -PV = "01.00.00.10A"
> +PV = "01.00.00.11B"
>   INC_PR = "r0"
>   
>   S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"


