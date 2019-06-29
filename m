Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 496AAE00B8F; Fri, 28 Jun 2019 20:16:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DDA3E00994
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 20:16:44 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5T3Gh4o027556
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 22:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561778203;
	bh=An4IQ7r30CEgahS0dkl3T7aYODaLIG0v3hWEmlVbF70=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QYyozLX3JVw/4Wmr95XsyjM6ZVRLqr9L8ANFbbHNUQxVRrAKtOXhgAUDhQ0WToj/B
	FJxkKu9EQMZ3yjtkQwplwi5UIu08aYyb8HKDypZQVahFi7t3LGAle4QVvbtG0uCili
	Jasr+HNxRVcCuq4X6k5tXWS+Bk9WY1+eUanEI9VE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5T3Gh8q099386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 22:16:43 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 22:16:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 22:16:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5T3GhWG124648;
	Fri, 28 Jun 2019 22:16:43 -0500
Date: Fri, 28 Jun 2019 23:16:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190629031642.GF21181@beryl>
References: <1561760664-53158-1-git-send-email-m-radhakrishnan2@ti.com>
	<1561760664-53158-3-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1561760664-53158-3-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH 2/4] emac-lld-rtos: SRCREV update to 01.00.03.16A
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
X-List-Received-Date: Sat, 29 Jun 2019 03:16:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please rebase

On Fri, Jun 28, 2019 at 06:24:22PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> index 1232482..13c5c2d 100644
> --- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> +++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> @@ -12,14 +12,14 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
>  EMAC_LLD_GIT_PROTOCOL = "git"
>  EMAC_LLD_GIT_BRANCH = "master"
>  
> -# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16"
> -EMAC_LLD_SRCREV = "f90f832dc63b60b234c3f5ae2ff4d774728e83bf"
> +# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16A"
> +EMAC_LLD_SRCREV = "73511804953577ec36e893498e5d6a4542b74d5c"
>  
>  BRANCH ="${EMAC_LLD_GIT_BRANCH}"
>  SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${EMAC_LLD_SRCREV}"
> -PV = "01.00.03.16"
> +PV = "01.00.03.16A"
>  PR = "r0"
>  
>  DEPENDS_append = " board-rtos osal-rtos"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

