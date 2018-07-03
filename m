Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B7D2E013C5; Tue,  3 Jul 2018 11:02:27 -0700 (PDT)
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
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB6B2E00AAB
	for <meta-ti@yoctoproject.org>; Tue,  3 Jul 2018 11:02:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w63I2PXm001749
	for <meta-ti@yoctoproject.org>; Tue, 3 Jul 2018 13:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530640945;
	bh=bn9UPwkqGLEZbu06CtxF1563y270zPLivYBSiV7m23U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Bks7MoZf9ofbqlQgfDJZZRy2qG+z9rEcX5DsB7pNBDcmQbfct4e829Yym3tyGjPGp
	rWANOa+SGnC1Kpbgwvcwhc21qKg8K15qIcVbjQDaqjXAZkcQG9mtbJc/YNrrpxYlPD
	AJ7de8v/RMKV0dVPknyss7y0+hXfCRr5+452R8mg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63I2PX5018884
	for <meta-ti@yoctoproject.org>; Tue, 3 Jul 2018 13:02:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 3 Jul 2018 13:02:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 3 Jul 2018 13:02:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63I2O9c020428;
	Tue, 3 Jul 2018 13:02:24 -0500
Date: Tue, 3 Jul 2018 14:01:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20180703180134.GD16981@beryl>
References: <20180703160736.15569-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20180703160736.15569-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] u-boot-ti-staging: update to ti2018.02-rc3 tag
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
X-List-Received-Date: Tue, 03 Jul 2018 18:02:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This breaks at least am57xx now - I'm investigating...


On Tue, Jul 03, 2018 at 11:07:35AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> index fc0a10e7..33110c1b 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r13"
> +PR = "r14"
>  
>  BRANCH = "ti-u-boot-2018.01"
>  
> -SRCREV = "e1183b1ef6a3dc5d54603f904307bdbae51f22c3"
> +SRCREV = "d87d0db0acc533e7f9d2711b9cbe1548c7eb9cf9"
> -- 
> 2.17.0.582.gccdcbd54c
> 

