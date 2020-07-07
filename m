Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.21066.1594142346661306874
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 10:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P86P4K53;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067HJ55k111437;
	Tue, 7 Jul 2020 12:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594142345;
	bh=dBHcdLJFjHAgL3uryGL7lsz810UyxAb4P78OwXXt7z0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=P86P4K53+Cm4+Sp+4kuz2dpfCGkd9KXM0vGOxni62+yTtbUZbcDHbVf2oWNRo4cl1
	 6oz1foAGyfiMnTU2R98ShIxFJSBVQyeY6noTkdOAWoKy9vExm0t4jwGaOcV32eV0IW
	 yHUlOh5EcOr/s2ssPgBTMB6pxdlYgIf/jrcPn6sQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067HJ5H9055389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2020 12:19:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 12:19:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 12:19:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067HJ5Sx049707;
	Tue, 7 Jul 2020 12:19:05 -0500
Date: Tue, 7 Jul 2020 13:19:05 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Prasad Jondhale <prasad.jondhale@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        <eth_fw_auto@list.ti.com>
Subject: Re: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Message-ID: <20200707171904.GI22569@beryl>
References: <20200707171721.10205-1-prasad.jondhale@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200707171721.10205-1-prasad.jondhale@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest

This is better, but what's with "[[meta-ti][Dunfell/master PATCH v1]"?


On Tue, Jul 07, 2020 at 10:47:21PM +0530, Prasad Jondhale wrote:
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
