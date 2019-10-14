Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4038E00C9B; Mon, 14 Oct 2019 14:33:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41188E00805
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 14:33:01 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ELX0wh033852
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 16:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571088780;
	bh=l00lp8bVXxmXNNJ3bnKev91NRedDB8a00HD/gw0bq9Y=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=vBDf+kyqkcalkEamsnb9VUKlyBwQOyaT1X1DqvU9tlzIAsnjTUPDG+VMLb02WaUI4
	CFLDOfQAdvullgae9tOzuouuf9k7AGGg+0Y57Z7bJaxTRUKwDTs9Vada15LsI4h2Yw
	FPG9jn0p3PyEJD+OveUqhLBGoVfZPct5DaIsRIxo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ELX0Po073359
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 16:33:00 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 14 Oct 2019 16:32:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 14 Oct 2019 16:32:54 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ELWx7F104250;
	Mon, 14 Oct 2019 16:33:00 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1571066901-53634-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8851a39a-c616-7585-fe1b-e7d494c2114c@ti.com>
Date: Mon, 14 Oct 2019 17:32:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571066901-53634-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] mcasp-lld-rtos:SRCREV update to 01.01.00.15C
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
X-List-Received-Date: Mon, 14 Oct 2019 21:33:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thank you,

Jake


On 10/14/2019 11:28 AM, Mahesh Radhakrishnan wrote:
> ---
>   recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> index cdd1027..808a02a 100644
> --- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> +++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> @@ -13,14 +13,14 @@ MCASP_LLD_GIT_PROTOCOL = "git"
>   MCASP_LLD_GIT_BRANCH = "master"
>   MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
>   
> -# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15B"
> -MCASP_LLD_SRCREV = "0322199e23fc90e4acdcd715076bae4e1afabbb7"
> +# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15C"
> +MCASP_LLD_SRCREV = "3b206c0081cc3e78122982948b40a16e2e24522c"
>   
>   BRANCH = "${MCASP_LLD_GIT_BRANCH}"
>   SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${MCASP_LLD_SRCREV}"
> -PV = "01.01.00.15B"
> +PV = "01.01.00.15C"
>   PR = "r0"
>   
>   S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"

