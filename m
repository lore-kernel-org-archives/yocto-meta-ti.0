Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.80.1607114024417868200
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 12:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EXttrt+/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4KXh2B085829;
	Fri, 4 Dec 2020 14:33:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607114023;
	bh=95akozCOp+A+07ZMdg4Llzv4TSeF0okI+iBckEJPM8w=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=EXttrt+/+XdnyS6mgZ4zNqSTeBL2FfJEtxSE0RNit/kJ3shyCB117ZY+hX8NenmBO
	 /WTQBxmGg5ehZDWlmdCXfFHuodhV/Ac4WY0GAZzfaxKKAN3HiRtsO2nHp/gp14aT5+
	 iWgeRVzmTkzupLBr0uvyK0DpHCKiwfBVAg3cNDFQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4KXhqk065967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Dec 2020 14:33:43 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 14:33:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 14:33:43 -0600
Received: from [10.250.68.46] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4KXgsF065361;
	Fri, 4 Dec 2020 14:33:42 -0600
Subject: Re: [dunfell/master PATCH] Revert "u-boot-ti-staging_2020.01: Fix build on hosts with gcc10 on them"
To: <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Khem Raj <raj.khem@gmail.com>
References: <20201204202816.16990-1-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <b7560c02-8c13-50bd-be51-4ca719c3fc0d@ti.com>
Date: Fri, 4 Dec 2020 14:33:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204202816.16990-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/4/20 2:28 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> This reverts commit 83f29e8b99144b69ed51ff69f41ab5a50f00fc5f.
> 
> The mentioned fix is now pulled to ti-u-boot.git in
> ti-u-boot-2020.01 branch
> commit a6904f563f ("Remove redundant YYLOC global declaration")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  ...e-redundant-YYLOC-global-declaration.patch | 28 -------------------
>  .../u-boot/u-boot-ti-staging_2020.01.bb       |  4 +--
>  2 files changed, 1 insertion(+), 31 deletions(-)
>  delete mode 100644 recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
> 
> diff --git a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
> deleted file mode 100644
> index 4973ea9d..00000000
> --- a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From b436a29de12d3f1da579edf3e3d4d42a60b9e58a Mon Sep 17 00:00:00 2001
> -From: Peter Robinson <pbrobinson@gmail.com>
> -Date: Thu, 30 Jan 2020 09:37:15 +0000
> -Subject: [PATCH] Remove redundant YYLOC global declaration
> -
> -Same as the upstream fix for building dtc with gcc 10.
> -
> -Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/018921ee79d3f30893614b3b2b63b588d8544f73]
> -Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ----
> - scripts/dtc/dtc-lexer.l | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
> -index fd825ebba6..24af549977 100644
> ---- a/scripts/dtc/dtc-lexer.l
> -+++ b/scripts/dtc/dtc-lexer.l
> -@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
> - #include "srcpos.h"
> - #include "dtc-parser.tab.h"
> - 
> --YYLTYPE yylloc;
> - extern bool treesource_error;
> - 
> - /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
> --- 
> -2.29.2
> -
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 29fa6ee6..991ba0ca 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,9 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r23"
> +PR = "r22"
>  
>  BRANCH = "ti-u-boot-2020.01"
>  
>  SRCREV = "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"

Please resubmit after updating the SRCREV that includes the picked up patch
along with the rest of the changes..

regards
Suman

> -
> -SRC_URI += "file://0001-Remove-redundant-YYLOC-global-declaration.patch"
> 

