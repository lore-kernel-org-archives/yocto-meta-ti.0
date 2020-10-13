Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.6961.1602625865695183398
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 14:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BJiWcoio;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DLp4A3042503;
	Tue, 13 Oct 2020 16:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602625864;
	bh=9fFpOrJLSYiZrrD7+GEbfIk4EJOUpnSnr2JgP1O+tuw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BJiWcoiozh0jyam35PTngjPIkueyB7TAHj1G1WfiLSGvf4DfWYLt3OWK7uQ8T9lHw
	 Zylk6YkDiipj9+R39NyotLSysINU6ZoqYOs+++HMPy0SkqOvVdYG7mM5qQL8PcmKYT
	 QvTJ1kGF+3WeeHBC4QcgxJCK1DXMLEahPB40CDmo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DLp4vX095648
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Oct 2020 16:51:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 16:51:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 16:51:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DLp3Yr125750;
	Tue, 13 Oct 2020 16:51:04 -0500
Date: Tue, 13 Oct 2020 17:51:03 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
Message-ID: <20201013215103.GF14852@beryl>
References: <20201013214911.339265-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201013214911.339265-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2020 at 02:49:11PM -0700, Khem Raj wrote:
> latest OE-core does not promote using trailing slash to make pseudo's
> life easier

This should be fine.


> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
> v2: Strip slash from S if it exists
> 
>  classes/ti-pdk-fetch.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> index 0c9879be..cacd71a4 100644
> --- a/classes/ti-pdk-fetch.bbclass
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -15,7 +15,7 @@ TI_PDK_SOURCE_PN = "ti-pdk-source"
>  TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
>  TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
>  
> -S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
> +S = "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
>  
>  # Hard-link only required sources from PDK
>  python do_unpack_append() {
> -- 
> 2.28.0
> 

> 
> 
> 

