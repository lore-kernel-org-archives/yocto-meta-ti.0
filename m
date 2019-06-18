Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7E87E00D6B; Tue, 18 Jun 2019 15:11:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 337F5E00D00
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 15:11:40 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IMBder009054
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 17:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560895899;
	bh=WC5QTERuOaabNp/56lpSA+onK6+kNbcZZi7IJp3EEig=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nI71N0Y1a0UwyjWTpQOMJVkvZD76YMBkxXlmKPXUxqLQeDTOWzwStHBMGARyv4NRK
	B2AGMd/YsZuOCnHPx4BWbxTkuka7RBiS0cMvDjSPx4GLy+B56zsH/QBaTI1ELmVLUo
	TzJCagoWFVVStjbJAJ7d/K/Cp3xOGPJZHnCnRpCI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IMBdnc017456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 17:11:39 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 17:11:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 17:11:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IMBdT4127489;
	Tue, 18 Jun 2019 17:11:39 -0500
Date: Tue, 18 Jun 2019 18:11:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190618221138.GC32001@beryl>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, rogerq@ti.com
Subject: Re: [master/thud][PATCH 0/5] Build am65xx prueth-fw from source
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
X-List-Received-Date: Tue, 18 Jun 2019 22:11:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

You called the new recipe prueth-fw-am65x_git.bb (with 1 "x") but in 
linux-ti-staging you RDEPENDS on "prueth-fw-am65xx" (with 2 "x").
Since my next builds broke, I'll rebase and drop these patches for now. 
Please test and re-submit the fixes. Thanks.

Denys


On Tue, Jun 18, 2019 at 03:00:13PM -0400, Jacob Stiffler wrote:
> Build prueth-fw for am65xx from sources and remove existing prebuilt
> firmware recipe.
> 
> Jacob Stiffler (5):
>   emac-lld-rtos: update to version 01.00.03.15
>   emac-lld: separate SRC_URI in inc file
>   prueth-fw-am65xx: build am65xx prueth-fw from source
>   linux-ti-staging: switch RDEPENDS to prueth-fw-am65xx
>   prueth-fw-bin: remove prebuilt firmware recipe
> 
>  recipes-bsp/emac-lld/emac-lld-rtos_git.bb     | 18 +++--------
>  recipes-bsp/emac-lld/emac-lld.inc             | 17 +++++++++++
>  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  | 44 +++++++++++++++++++++++++++
>  recipes-bsp/prueth-fw/prueth-fw-bin_git.bb    | 32 -------------------
>  recipes-kernel/linux/linux-ti-staging_4.19.bb |  2 +-
>  5 files changed, 66 insertions(+), 47 deletions(-)
>  create mode 100644 recipes-bsp/emac-lld/emac-lld.inc
>  create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>  delete mode 100644 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
> 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

