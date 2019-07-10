Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C42B2E00D8D; Wed, 10 Jul 2019 13:57:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F829E008E3
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2019 13:57:19 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6AKvJfY112003
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2019 15:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562792239;
	bh=pNuNmsDz4QHzKbFBGEAtbRlvgs2S/h+xRa0kZRAZUR4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BRioZSJlzdz/ZDBSoPHEgu54p5ZF32eAiyzdJezR/XTJwDAv5GVYtoJQ0dblTdk/k
	NlQl+erN42T9BsFhD3TPQQhsYd+4ei0EC9Q0vXSdVEqd08Ci4B7ZpobXfJr/K/QZtr
	D4Oiy9zLWCDIMBOZ3RjTErXpxFuqzqfWiyOEPcug=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6AKvJmH039783
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2019 15:57:19 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 10 Jul 2019 15:57:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 10 Jul 2019 15:57:18 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6AKvIe1046926;
	Wed, 10 Jul 2019 15:57:18 -0500
To: Jacob Stiffler <j-stiffler@ti.com>, <meta-ti@yoctoproject.org>, Denys
	Dmytriyenko <denys@ti.com>
References: <1562790870-6071-1-git-send-email-j-stiffler@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <542eabc3-255c-be23-676a-783e7fee0a05@ti.com>
Date: Wed, 10 Jul 2019 15:57:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562790870-6071-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud][PATCH] emac-lld: bump SRCREV to 01.00.03.16C
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
X-List-Received-Date: Wed, 10 Jul 2019 20:57:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/10/19 3:34 PM, Jacob Stiffler wrote:
> * fix remoteproc firmware loading by truncating .version_string
>   section to 32 bytes
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

Denys,
Please pick this up for thud-next, and I can confirm the ICSSG Ethernet
functional behavior tomorrow with the latest daily build.

regards
Suman

> ---
>  recipes-bsp/emac-lld/emac-lld.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
> index 05bd7a5..55bd3ec 100644
> --- a/recipes-bsp/emac-lld/emac-lld.inc
> +++ b/recipes-bsp/emac-lld/emac-lld.inc
> @@ -2,8 +2,8 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
>  EMAC_LLD_GIT_PROTOCOL = "git"
>  EMAC_LLD_GIT_BRANCH = "master"
>  
> -# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16B"
> -EMAC_LLD_SRCREV = "87ed1e8678c42bb3fdea8f6e7a0197cf159d75b6"
> +# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16C"
> +EMAC_LLD_SRCREV = "ec4a839e5db4b351524b2162d0c5dab8a9da367b"
>  
>  BRANCH ="${EMAC_LLD_GIT_BRANCH}"
>  SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> 


