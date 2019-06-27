Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA3D3E00C5C; Thu, 27 Jun 2019 11:53:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 469CDE00A7D
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2019 11:53:35 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RIrZL1047846
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2019 13:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561661615;
	bh=ReICET6xTyzBPTJsaIUNuHqBHzCKvAHQOT9KQwPGuJk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=DMj47XBe1UqeVxS735r3MqH+JLJWm+t4FS8nNuEn22NYdXgKCkk4XdmUDZadmqhbT
	BBxBjGv+4xL/yfsn69Pl6O1vJO0TZ4nUNg3TusMmoWJZydmCGazz5NjDfXGGHb97eQ
	ZsgHlytHeXPpA0I5d9MNKX5GmjR3C4n5qY80UuV8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RIrZTC094569
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2019 13:53:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 27 Jun 2019 13:53:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 27 Jun 2019 13:53:35 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RIrYNR101584;
	Thu, 27 Jun 2019 13:53:35 -0500
To: <meta-ti@yoctoproject.org>
References: <1561564193-15418-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bad00fcb-4f8c-2772-ca0c-6bf3d6d6721e@ti.com>
Date: Thu, 27 Jun 2019 14:53:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561564193-15418-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: Re: [master/thud/ti2019.01][PATCH v3 1/5] emac-lld-rtos: update to version 01.00.03.16
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
X-List-Received-Date: Thu, 27 Jun 2019 18:53:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please apply the patches in this set after applying the RTOS updates [1].

And this patch in particular is a duplicate of [2], so it can be dropped.


Thank you,

Jake


[1] https://lists.yoctoproject.org/pipermail/meta-ti/2019-June/011886.html

[2] https://lists.yoctoproject.org/pipermail/meta-ti/2019-June/011910.html


On 6/26/2019 11:49 AM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v3 changes:
> * update to 1.0.3.16 instead of 1.3.0.15
>
>   recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> index efa4528..1232482 100644
> --- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> +++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> @@ -12,14 +12,14 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
>   EMAC_LLD_GIT_PROTOCOL = "git"
>   EMAC_LLD_GIT_BRANCH = "master"
>   
> -# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.14B"
> -EMAC_LLD_SRCREV = "9ad95cde88aae23aaedf95d2146cab4a388e70d3"
> +# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16"
> +EMAC_LLD_SRCREV = "f90f832dc63b60b234c3f5ae2ff4d774728e83bf"
>   
>   BRANCH ="${EMAC_LLD_GIT_BRANCH}"
>   SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${EMAC_LLD_SRCREV}"
> -PV = "01.00.03.14B"
> +PV = "01.00.03.16"
>   PR = "r0"
>   
>   DEPENDS_append = " board-rtos osal-rtos"

