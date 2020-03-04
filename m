Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.16877.1583350644507664156
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 11:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FVJu8S+2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 024JbNeX117933;
	Wed, 4 Mar 2020 13:37:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583350643;
	bh=ljKN9K65JL9/G/GHv7t6N9OU7RM5MFVpj2TIy4DqINw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FVJu8S+2MuO+XcW1yHQ0Dv+5e/pcIbmqV5D8R+nZdUCGs4Wn+gqcct8dmaJG8F5WS
	 YhXTjLM0kJwVnBEUGMGi2BJidsug8q2UaXVMfxWP6ln1r0bJ6k8tqn0jY5TnVnlR/Q
	 d5WYFg6oDVbjUH+e1ltKrreGo92ziC4YB8vJRhII=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 024JbMQ0002068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Mar 2020 13:37:22 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 13:37:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 13:37:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 024JbM75030375;
	Wed, 4 Mar 2020 13:37:22 -0600
Date: Wed, 4 Mar 2020 14:37:22 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <nikhil.nd@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus PATCH v1 1/2] recipes-bsp: jailhouse: Update tty for j7-evm jailhouse
Message-ID: <20200304193722.GO2466@beryl>
References: <20200304193347.15094-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200304193347.15094-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks.

On Thu, Mar 05, 2020 at 01:03:46AM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Latest upstream jailhouse uses ttyS3 as the console for
> inmate cell. Update the recipe to pass the correct cmdline.
> 
> Override only for j7-evm
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index a4ee2fc7..1273c57d 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -59,7 +59,8 @@ INITRAMFS_IMAGE ?= ""
>  JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
>  
>  JH_CMDLINE ?= ""
> -JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
> +JH_CMDLINE_am65xx ?= "console=ttyS1,115200n8"
> +JH_CMDLINE_j7-evm ?= "console=ttyS3,115200n8"

Will this break am65?


>  do_configure() {
>  	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
> -- 
> 2.17.1
> 
