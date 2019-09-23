Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4800CE00805; Mon, 23 Sep 2019 06:04:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7944EE00805
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2019 06:04:24 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ND4NFQ032513
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2019 08:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569243863;
	bh=L1dZhMvPk47P7fiITm7fozr07hJ2DHRwBJ7hTVHwIp4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=XYKFcEWV/vfy9T02Ai1ZW49s551gNo9LimQ+Z/Qqtm91vrWo1OLwISp9yCLUpHZqH
	/uFE/O1b/NL5nDsCg4a6IC6XxCgbQSI00yg8a8YyiQfCHsb+cpIvbG8RJHleJIQt8C
	wdk6DLuOukbG9bLz8x/T7ySFCUqYqNQAkKnJO8YY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ND4NIl048148
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2019 08:04:23 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 08:04:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 08:04:17 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ND4NwK022097;
	Mon, 23 Sep 2019 08:04:23 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1568831810-52021-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f526c7a2-204a-2316-b9a1-e821cc495db2@ti.com>
Date: Mon, 23 Sep 2019 09:04:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568831810-52021-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] sciclient-rtos: SRCREV update
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
X-List-Received-Date: Mon, 23 Sep 2019 13:04:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thank you,

Jake

On 9/18/2019 2:36 PM, Mahesh Radhakrishnan wrote:
> ---
>   recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> index a8dcd56..3453bc9 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -13,14 +13,14 @@ SCICLIENT_GIT_PROTOCOL = "git"
>   SCICLIENT_GIT_BRANCH = "master"
>   
>   # Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.03"
> -SCICLIENT_SRCREV = "c593925c3d9aecf18a8a1834d0eb098851457098"
> +SCICLIENT_SRCREV = "c11ceefc4e4ca820aa1e76292af71680f90e7a63"
>   
>   BRANCH = "${SCICLIENT_GIT_BRANCH}"
>   SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${SCICLIENT_SRCREV}"
>   PV = "01.00.00.03"
> -PR = "r1"
> +PR = "r2"
>   
>   DEPENDS_append = " osal-rtos common-csl-ip-rtos"
>   

