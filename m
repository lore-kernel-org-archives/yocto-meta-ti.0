Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4B45E00D03; Tue, 24 Oct 2017 09:38:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAD98E00CF2
	for <meta-ti@yoctoproject.org>; Tue, 24 Oct 2017 09:38:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9OGcW7u017315
	for <meta-ti@yoctoproject.org>; Tue, 24 Oct 2017 11:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508863112;
	bh=WHRwFFo22ovh2EqXUQsGJqBCkZ0PBwGI0p0R/fPiGfg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=i3qDboFn4u9tgpff6apT9THMXDQE+4Z8xcBf/aRiWciAcH3mZtXk0oYKUDocrAEpv
	DYncKwmKG0WYVLRPQ87D9YBGp57UQc0K3HhjwZEIb/5O4ZNylXhICmljTw1ol+2Lt6
	Mto4sc/Y4SJ2dQeVnR72i9ezRYb18gOCOefkpg2U=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9OGcWpn011529
	for <meta-ti@yoctoproject.org>; Tue, 24 Oct 2017 11:38:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 24 Oct 2017 11:38:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 24 Oct 2017 11:38:31 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9OGcVOZ029735;
	Tue, 24 Oct 2017 11:38:31 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1508857626-39935-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bd325a37-1d14-2ce6-8b5a-00ddf34a1f68@ti.com>
Date: Tue, 24 Oct 2017 12:38:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508857626-39935-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] edma3-lld: Updating the revision to 02.12.05.30
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
X-List-Received-Date: Tue, 24 Oct 2017 16:38:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


Acked-by: Jacob Stiffler <j-stiffler@ti.com>


On 10/24/2017 11:07 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/edma3-lld/edma3-lld.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
> index 5ff7927..d0bc0b9 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld.inc
> +++ b/recipes-bsp/edma3-lld/edma3-lld.inc
> @@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
>   EDMA3_LLD_GIT_PROTOCOL = "git"
>   EDMA3_LLD_GIT_BRANCH = "master"
>   
> -# Below commit ID corresponds to new eng version
> -EDMA3_LLD_SRCREV = "60cb2bbdd8e494334994dd49559bc27cd9a40b32"
> +# Below commit ID corresponds to version 2.12.05.30
> +EDMA3_LLD_SRCREV = "30cce115bda9001bc40c68e3788bbd1b3741569e"
>   
>   BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
>   SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   SRCREV = "${EDMA3_LLD_SRCREV}"
>   
> -PV = "2.12.03.28"
> +PV = "2.12.05.30"
>   INC_PR = "r0"


