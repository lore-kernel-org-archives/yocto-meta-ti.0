Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1999.1603219423794648672
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 11:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YFtde0iR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09KIhgrh021723;
	Tue, 20 Oct 2020 13:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603219422;
	bh=RSbfP+z9bUo11+WhT+tJ2sWSnn5sRn3Wn2vOCL5MvxE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YFtde0iRLgiDMPmSJMHqaAepIiwHbZGrzII5Y0h2c3XXn1fTqLxedcMfEhJC7AbcD
	 NeiSxHng1uaLKUnauaOtJvCpNFfoggRii5Zs0CAvaYjTOhQGsHCdSXrNl1OtEFcLU7
	 8VIj6+/M+5hxeluSnq11ndi8AnBNVvmVaOAp72b0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09KIhgYl125489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2020 13:43:42 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 13:43:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 13:43:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09KIhf4A128975;
	Tue, 20 Oct 2020 13:43:42 -0500
Date: Tue, 20 Oct 2020 14:43:41 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] layer.conf: Add gatesgarth to LAYERSERIES_COMPAT
Message-ID: <20201020184341.GB14852@beryl>
References: <20201020181601.29276-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201020181601.29276-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 20, 2020 at 11:16:01AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>

Only applicable to master.


> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 7848d196..2393e61a 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
>  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -- 
> 2.29.0
> 

> 
> 
> 

