Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.856.1603907981626932004
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 10:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a73tVZkg;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: denys@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8E29438C11F9
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 10:59:40 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SHxexA089774
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 12:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603907980;
	bh=RyLkb6GXBvobDc7irUI7zsYXAy9lbJ4Pcj0vBLaLzXM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=a73tVZkgtix+MuWxTQ90ItrtZdcwlfhlcHJ3wtk/uJFfSENlbbfGiJ8NdJGNTQJC/
	 Crq784fzeerqejlR13WQ9Ow3ENHWOPBjWxQomsz2aCTgrCYt6i1Mg8U41KwiaIyT74
	 H8fJdbxIEkWk8IpdihEuxytInUsV+biaZlFRxwO4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SHxdjS024630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 12:59:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 12:59:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 12:59:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SHxdrl120459;
	Wed, 28 Oct 2020 12:59:39 -0500
Date: Wed, 28 Oct 2020 13:59:39 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull general toolchain support
Message-ID: <20201028175939.GZ19741@beryl>
References: <20201028173608.10421-1-g-tammana@ti.com>
 <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
MIME-Version: 1.0
In-Reply-To: <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 28, 2020 at 12:54:02PM -0500, Dan Murphy wrote:
> Gowtham
> 
> On 10/28/20 12:36 PM, Gowtham Tammana wrote:
> >The patch for supporting the general toolchain is pulled into the repo.
> >Removing it here from the recipe.
> >
> >Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> >---
> >v2: fix email in signoff
> >
> >  .../0001-km-support-general-toolchain.patch   | 56 -------------------
> 
> Did you use "git rm" to remove the file? This looks weird that the file
> changed then got deleted
> 
> Generally we should just see
> 
>  delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch

Seems fine to me - 56 lines removed.
The other change is for the recipe to remove the extra patch from SRC_URI...

-- 
Denys
