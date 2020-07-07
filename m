Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.20853.1594141827482712953
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 10:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O032ypL4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067HAQAe066758;
	Tue, 7 Jul 2020 12:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594141826;
	bh=79y9z5q6mpROPZncvfxgxXhDE8WjIHM9tdrUpfIIBtE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=O032ypL46D2FzK3+NLuVVswV/6B38m/GaFGp/YNlKZ3INqq+9A0Ar2duYZzO6zNM+
	 dm0GO9CF3bYT976z6+4pjUk9iCqC4kffQC+7DiiU00OFahxiVrOI88PhOxjKaYyep2
	 1MWdUV5NGnMAt8ScotvZScSscdZtVkmj9WuOCq9k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067HAM4Q044754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2020 12:10:22 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 12:10:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 12:10:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067HALAr034786;
	Tue, 7 Jul 2020 12:10:21 -0500
Date: Tue, 7 Jul 2020 13:10:21 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Prasad Jondhale <prasad.jondhale@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        <eth_fw_auto@list.ti.com>
Subject: Re: [[meta-ti][Dunfell][PATCH] cpsw9g-eth-fw: Update to latest] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Message-ID: <20200707171021.GE22569@beryl>
References: <20200707170822.5975-1-prasad.jondhale@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200707170822.5975-1-prasad.jondhale@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[[meta-ti][Dunfell][PATCH] cpsw9g-eth-fw: Update to latest] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest

Please fix your commit log ^^^

On Tue, Jul 07, 2020 at 10:38:22PM +0530, Prasad Jondhale wrote:
> Signed-off-by: Prasad Jondhale <prasad.jondhale@ti.com>
> ---
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 37ba52d0..8cb62b2a 100755
> --- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -11,7 +11,7 @@ inherit update-alternatives
>  
>  PROTOCOL = "git"
>  BRANCH = "master"
> -SRCREV = "afe62ada2e91e2665f597ca16eb3888b752016de"
> +SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
>  
>  SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
> -- 
> 2.17.1
> 
