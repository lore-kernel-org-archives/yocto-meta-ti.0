Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C4F1E00A0A; Fri, 28 Sep 2018 10:24:55 -0700 (PDT)
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
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E01F8E009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 10:24:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SHOs31118536
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538155494;
	bh=x9G9sIaYdTkDqfCdSCMDBFDU3Jn1ou46OMibWveUniA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RD6lmdg641nA1m2tG4TmSSgPf4zo56hOJ1+KjoHWAjuOUu689AaKwlwwejPEOCGI3
	B4jAja8JCdfum/c+B1BL1Y2IiyK2eN6JBlmzu+wUsc3SCThQQhANa+msM6aBH7ra1q
	IOKCSEJ9vIeD+4X0hKRi04Gj71KMdzpr4AaN6mG4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHOsMv002202
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:24:54 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 12:24:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 12:24:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHOrw6017481;
	Fri, 28 Sep 2018 12:24:53 -0500
Date: Fri, 28 Sep 2018 13:24:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180928172453.GD13888@beryl>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538151990-44823-9-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538151990-44823-9-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v3 08/29] icss-emac-lld: Update to version 01.00.00.13
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
X-List-Received-Date: Fri, 28 Sep 2018 17:24:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 28, 2018 at 12:26:09PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> index d7ca641..0d1afb8 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> @@ -10,7 +10,7 @@ ICSS_EMAC_LLD_GIT_BRANCH = "master"
>  ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
>  
>  # Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.13"
> -ICSS_EMAC_LLD_SRCREV = "a4071ded3edb0cfebaa62b1f1f35686ea24585b1"
> +ICSS_EMAC_LLD_SRCREV = "999692b6d60fd54a0390b1cf4724f1620e757fdf"

Do you also have to bump PV here? The log says update to 01.00.00.13...


>  BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
>  SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

