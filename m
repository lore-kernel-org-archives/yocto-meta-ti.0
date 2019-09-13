Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 461EDE00D94; Fri, 13 Sep 2019 06:26:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C50F3E00798
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 06:26:11 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDQBY3050636
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 08:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568381171;
	bh=J+SERjIRPdJZsIQ7kvC+GxOCyTjMBqgA+QY58qeqnGk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=XXTUXtTp/v2EYLq/r+SCTNQT13VlwmW7g0J7EhqULZtXEhOiUBRii/+RrDT4ByNXf
	lm6OtzD03W0mHe1mW+bz0uAZXYstLtkchWNmfDth14qsUT7YZA8P4+44fKm76a3VhY
	nlKleLYxnLe7gVPjHiqTAfEQM+pA8keifwvfChJk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDQBkS002129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 08:26:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 08:26:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 08:26:10 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DDQA2I121781;
	Fri, 13 Sep 2019 08:26:10 -0500
To: Tinku Mannan <tmannan@ti.com>, <meta-ti@yoctoproject.org>
References: <1568325355-7502-1-git-send-email-tmannan@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <151f022f-507d-8c74-639d-deb6273afdb1@ti.com>
Date: Fri, 13 Sep 2019 09:26:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568325355-7502-1-git-send-email-tmannan@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] emac-lld-rtos: Adding trace-rtos as a dependency for k3 devices
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
X-List-Received-Date: Fri, 13 Sep 2019 13:26:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thanks,

Jake

On 9/12/2019 5:55 PM, Tinku Mannan wrote:
> ---
>   recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> index 2af38b9..bbf56b4 100644
> --- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> +++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> @@ -18,7 +18,7 @@ DEPENDS_append_ti43x = " starterware-rtos"
>   DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
>   
>   DEPENDS_remove_k3 = "board-rtos "
> -DEPENDS_append_k3 = " udma-lld-rtos "
> +DEPENDS_append_k3 = " udma-lld-rtos trace-rtos"
>   
>   # Build with make instead of XDC
>   TI_PDK_XDCMAKE = "0"

