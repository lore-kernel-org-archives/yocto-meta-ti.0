Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14784.1603298964008469106
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 09:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QSwLhtaV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LGnMK0018085
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2020 11:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603298962;
	bh=o28yhnVGfpxBDzemW0naX/Wos7ZGBJtrCnpUXEP9uls=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QSwLhtaVfFBdUv9lXX0XeYM2a5bN/F0CVx5JRBgganRgI7rJeAdwn0D/Aq9OB17wn
	 KKpynoYUCt4uaYTcOgoNNFjpqDj+jz4/GxqvC1vikUvpGNvt4kd0Xhz/wCcsyV6w/e
	 xtUR6aZP38RvCAQFKnvB2oZy0XPNp1jdtcNmRds8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LGnM12061259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2020 11:49:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 11:49:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 11:49:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LGnMtY025518;
	Wed, 21 Oct 2020 11:49:22 -0500
Date: Wed, 21 Oct 2020 12:49:22 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] distroless/poky-master: Update openembedded branch to master from dunfell
Message-ID: <20201021164922.GI14852@beryl>
References: <20201021154900.24080-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201021154900.24080-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Wrong list

On Wed, Oct 21, 2020 at 10:49:00AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  configs/poky-master-config.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index 1298a050d48f..be724b100a3c 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -2,7 +2,7 @@
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
>  poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-python:meta-oe
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-python:meta-oe
>  meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
>  meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -- 
> 2.28.0.585.ge1cfff676549
> 
