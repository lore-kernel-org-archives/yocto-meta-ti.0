Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5AD7E0097D; Wed, 12 Sep 2018 06:27:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 548D7E0090A
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 06:27:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CDRQSJ103313
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 08:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536758846;
	bh=AkjkDobeVamuT4C0aU37aNlGl0Y1rmmHKpvmgns2ffo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=NfBONhVsoflxql8iXGyWm2oWBVsmKx5kiGbjM9WSvQFieMCVH8e9q0EcgUKG+3IYL
	ekBKNV6rFhpmhV/dV0aP78IOJkA9Q5/qPEY5KrhC3YZBo0bK36XzDYfD0x3nrZRYNv
	p6FMWCxn1QQkq+NoJnp69k7TzUtwOUuOGxrHCN7c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CDRQHr004324
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 08:27:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 08:27:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 12 Sep 2018 08:27:26 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CDRQwo024746;
	Wed, 12 Sep 2018 08:27:26 -0500
To: Nick Saulnier <nsaulnier@ti.com>, <meta-ti@yoctoproject.org>
References: <1536612086-3384-1-git-send-email-nsaulnier@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <fafae3e5-a6ac-067b-a3b5-88d20f13ca19@ti.com>
Date: Wed, 12 Sep 2018 09:27:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536612086-3384-1-git-send-email-nsaulnier@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH v1] pru-icss_git.bb: rename PRU_ADC to PRU_ADC_onChip
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
X-List-Received-Date: Wed, 12 Sep 2018 13:27:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/10/2018 4:41 PM, Nick Saulnier wrote:
> TI design TIDA-01555 is added to Processor Linux SDK 5.1 as pru-adc-1.0.
> Rename the PRU SW Support Package example PRU_ADC to PRU_ADC_onChip to prevent
> confusion in the future.
>
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>   recipes-bsp/pru/pru-icss_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 37d6ca97962a..51519b31f079 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -8,10 +8,10 @@ inherit update-alternatives
>   
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "80ea0921bd0024ee5943a19fae1a64ea51d72a50"
> +SRCREV = "f43599464e8e879a127241b68fbeb0abca4cbd9f"
>   
>   PV = "5.3.0"
> -PR = "r1"
> +PR = "r2"
>   
>   require recipes-ti/includes/ti-paths.inc
>   


