Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1479.1625774524049563905
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 13:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eNJvGKYp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168K22L0062408;
	Thu, 8 Jul 2021 15:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625774522;
	bh=8pbVp2E3RjJDLEiXXJ2aCv8IpApR+jlb/89MbrChYSw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eNJvGKYpYquz1nGe1w3YS+BkpfPGqg+5aifPeqJlFRkKj/QaB/WPsEsLfWoevym71
	 Fte7yA0ugRBN/VnimxubNmdKMb4CmQKMklLozFyW9FBRiw7AknCqNJsq6CDvhPgiRT
	 DBbX0KoJU4I1ylrPOR/GAFZ/pyZqhT1YiwIS6aMw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168K22cC082127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 15:02:02 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 15:02:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 15:02:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 168K21Uu075749;
	Thu, 8 Jul 2021 15:02:01 -0500
Date: Thu, 8 Jul 2021 15:02:01 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH 0/4] 08.00.00.002 release update
Message-ID: <20210708200201.j2eularl5vero3zx@flagstone>
References: <20210708051232.10077-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210708051232.10077-1-yogeshs@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 05:12-20210708, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Changes to fix the kernel, u-boot and firmware to 08.00.00.002 release
> tag. 
> 
> Yogesh Siraswar (4):
>   linux-ti-staging: Update to 08.00.00.002 release tag
>   linux-ti-staging-rt: Update to 08.00.00.002 release tag
>   u-boot-ti-staging: Update to 08.00.00.002 release tag
>   ti-sci-fw: Update linux firmware repo to 08.00.00.002
> 
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc              | 2 +-
>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
>  recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
I dont think this series is sufficient (ti-ipc and ti-prueth pending),
but for these specific patches:

Reviewed-by: Nishanth Menon <nm@ti.com>
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
