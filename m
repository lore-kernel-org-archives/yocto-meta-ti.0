Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5705.1602622559147234233
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 13:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=i5Hc3qfr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DKtw3b020677;
	Tue, 13 Oct 2020 15:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602622558;
	bh=G4xZj2E2EGkGjKTAXEtXdzJigHGSrnmUZr0XiYhJpcg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=i5Hc3qfr38EbZD/COo9xfxLTOE2MidW2j+yUmWiQhAP01nQEkcFA6Iu/pTy7XMuQy
	 +31ceYspsEFIc5x89L5jaAXSLp6PNdwAH2QvgqLmlzlHgVUqoaAgcKSfQbaAlQ9xlY
	 0HD6zuak6jOmnxLGg57nz1zJ4J2rycjtcItJdoPk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DKtweD015790
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Oct 2020 15:55:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 15:55:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 15:55:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DKtvsq051306;
	Tue, 13 Oct 2020 15:55:57 -0500
Date: Tue, 13 Oct 2020 16:55:57 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 1/2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
Message-ID: <20201013205557.GB14852@beryl>
References: <20201013183642.267548-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201013183642.267548-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2020 at 11:36:41AM -0700, Khem Raj wrote:
> latest OE-core does not promote using trailing slash to make pseudo's
> life easier
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/ti-pdk-fetch.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> index 0c9879be..4261e86d 100644
> --- a/classes/ti-pdk-fetch.bbclass
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -9,13 +9,13 @@ PV = "${TI_PDK_VERSION}"
>  PE = "2"
>  
>  TI_PDK_COMP ?= ""
> -TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
> +TI_PDK_COMP_PATH = "/${@'${TI_PDK_COMP}'.replace('.','/')}"

This one I don't understand - even when TI_PDK_COMP is empty, 
TI_PDK_COMP_PATH will have a trailing slash, hence S below will 
have it too...

Moreover, below in this class there's this line:

src = os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))

If TI_PDK_COMP_PATH starts with a leading slash, os.path.join treats 
it as absolute and the resulting "src" var will be completely wrong.

So, I believe this change is incorrect.


>  TI_PDK_SOURCE_PN = "ti-pdk-source"
>  TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
>  TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
>  
> -S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
> +S = "${WORKDIR}/git${TI_PDK_COMP_PATH}"
>  
>  # Hard-link only required sources from PDK
>  python do_unpack_append() {
> -- 
> 2.28.0
> 

> 
> 
> 

