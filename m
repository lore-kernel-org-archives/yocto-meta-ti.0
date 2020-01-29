Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.69.1580339967178890150
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 15:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=abdoLD6/;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1248AE01663; Wed, 29 Jan 2020 15:19:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A58FE0160D
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 15:19:24 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TNJNHZ086599;
	Wed, 29 Jan 2020 17:19:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580339963;
	bh=45lyJ29gjNRRD0CUg/FItwggqjMyVFWt8IhSONeiL5Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=abdoLD6/Xq0ts3wqHFECBb6C1em/j8c0Mq7aUiwcanOLSEAEXf2dGOdIAbsQsmQAT
	 xN64H5AdtUrkjlNo9Ey7A6fuHmSG+yM1RByomDMR5+QK0x4ZYFdypYxusBrRaGuNmD
	 NTTCQUSv/9XR4+E5K9Zj/47IbVhdcnfkQJ39+NOo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TNJNbP048471
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jan 2020 17:19:23 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 17:19:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 17:19:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TNJN3d078250;
	Wed, 29 Jan 2020 17:19:23 -0600
Date: Wed, 29 Jan 2020 18:19:23 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Peter Griffin <peter.griffin@linaro.org>
CC: <meta-ti@yoctoproject.org>, <andrey.konovalov@linaro.org>
Subject: Re: [PATCH] jailhouse_git: update to inherit python3 classes
Message-ID: <20200129231922.GS3658@beryl>
References: <1580339755-23335-1-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1580339755-23335-1-git-send-email-peter.griffin@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK

On Wed, Jan 29, 2020 at 11:15:55PM +0000, Peter Griffin wrote:
> This avoids the parsing errors, now that python2
> has been removed.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 4186dc3..89833e6 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
>  S = "${WORKDIR}/git"
>  
>  require jailhouse-arch.inc
> -inherit module pythonnative bash-completion deploy setuptools
> +inherit module python3native bash-completion deploy setuptools3
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "(ti-soc)"
> -- 
> 2.7.4
> 
