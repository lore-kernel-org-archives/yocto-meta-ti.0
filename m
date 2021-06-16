Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7340.1623849512698052490
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 06:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qc0I/zOd;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5EA8A38C08A0
	for <meta-ti@yoctoproject.org>; Wed, 16 Jun 2021 13:18:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15GDIQ7f054435;
	Wed, 16 Jun 2021 08:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623849506;
	bh=nlnEs1OplhmE4NpNRv8xikZlVX5PA8IN4CVMAd6arU4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qc0I/zOdShhyjozJuMlvAROXszgR7hXu/kndbhGFFQ9x7Q48iM0l9jbPGfgDNQF0D
	 apl4QolRvruz4AZmbsZuxH9n6vcSEKyVcQbZ04BuJGoV89KXpsAQ6IU6UJJYuImhZ0
	 6heXpOW7PvuPygRngpm0pVYi/PyLD/XlIL8BGfTQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15GDIQik010074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Jun 2021 08:18:26 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 16
 Jun 2021 08:18:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 16 Jun 2021 08:18:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15GDIPfb076466;
	Wed, 16 Jun 2021 08:18:26 -0500
Date: Wed, 16 Jun 2021 18:48:24 +0530
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master 0/2] Remove Jailhouse support
Message-ID: <20210616131824.7w7scyvkykd7acn7@NiksLab>
References: <20210615111244.24807-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210615111244.24807-1-nikhil.nd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:42-20210615, Nikhil Devshatwar wrote:
> This series removes the Jailhouse and corresponding recipes from
> meta-ti
> 
> Nikhil Devshatwar (2):
>   recipes-bsp: ivshmem: Remove ivshmem packages
>   recipes-kernel: jailhouse: Remove jailhouse recipe
> 
>  .../ivshmem-uio/ivshmem-uio-driver_git.bb     |  29 ---
>  .../ivshmem-uio/ivshmem-uio-tests_git.bb      |  23 ---
>  recipes-kernel/jailhouse/jailhouse-arch.inc   |  22 ---
>  ...hebang-in-helper-scripts-for-python3.patch |  56 ------
>  recipes-kernel/jailhouse/jailhouse_git.bb     | 168 ------------------
>  5 files changed, 298 deletions(-)
>  delete mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>  delete mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb
>  delete mode 100644 recipes-kernel/jailhouse/jailhouse-arch.inc
>  delete mode 100644 recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
>  delete mode 100644 recipes-kernel/jailhouse/jailhouse_git.bb
> 

I am not sure why the emails were sent twice.
Ignore the second copy

Regards,
Nikhil D

> -- 
> 2.17.1
> 
