Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 071B3E00AA2; Mon,  1 May 2017 11:57:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDA43E00546
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 11:57:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41Iv6ea020708
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 13:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493665026;
	bh=oEvkq2WGxau/QjyL8tgHDmEVtG40RUKIuyU2LxY4ffY=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=kDBN+WbnPsoAiIC+pB8J3hFEsPLJv6TWdNlI6COJ701zWV7voQZPPCBPlFV11tT3u
	lwRL1JBCPLRqdhnueBRd25+s7KIOrBd1TqcsLS9ryKjNlauU+SyZ3HbJFpXZ9fGaBz
	V0F9YVYNKB3OulCHHjFU5RRzmxmipj16wJ0zjGAA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41Iv1Fg016785
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 13:57:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 13:57:01 -0500
Received: from [172.22.109.252] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41Iv1as006765;
	Mon, 1 May 2017 13:57:01 -0500
To: <meta-ti@yoctoproject.org>
References: <20170501183359.1645-1-dmurphy@ti.com>
	<20170501183359.1645-3-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b447a3bd-1025-f6a5-4d2d-bfc8c06d0abc@ti.com>
Date: Mon, 1 May 2017 13:57:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170501183359.1645-3-dmurphy@ti.com>
Subject: Re: [PATCH 3/4] ti-sci-fw: update to the latest 0.1.1-47 version
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
X-List-Received-Date: Mon, 01 May 2017 18:57:21 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 05/01/2017 01:33 PM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index f5706a65..f04008f3 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -3,8 +3,8 @@ DESCRIPTION = "TI SCI firmware"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
>  
> -PV = "0.1.1.37"
> -PR = "r0"
> +PV = "0.1.1.47"
> +PR = "r1"
>  

I forgot to update the srcrev here so I need to send that as v2

>  CLEANBROKEN = "1"
>  
> 


-- 
------------------
Dan Murphy

