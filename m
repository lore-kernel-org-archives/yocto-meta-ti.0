Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.11826.1625602365600873804
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 13:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MGSQXg8P;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 166KCfRb012945;
	Tue, 6 Jul 2021 15:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625602361;
	bh=2TVFKy0WhJnBmj9N1aFUgzkCzRNz5b8eTELiJYVlVdA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MGSQXg8PGK4C1y61jlaVTTVCNyTOVwRih5laqhJ5KsIXWdy5lQ+BOon6iCY2CM9AZ
	 V8eKSVKJiH2YvmzTQhxh8X6tRR3OGXQJxoO67NubIIDMJCqIqwxcbcfnZ/lg8g8xMh
	 40dcFOIdcwUJydGestoOtyd6VTCz54CrPmJIC9Ps=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 166KCfOf046686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jul 2021 15:12:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 15:12:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 15:12:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 166KCffP023868;
	Tue, 6 Jul 2021 15:12:41 -0500
Date: Tue, 6 Jul 2021 15:12:41 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Tom Rini <trini@konsulko.com>
CC: Denys Dmytriyenko <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.07 release
Message-ID: <20210706201241.q6cgwqqa2ngrabmt@confusion>
References: <20210706152747.31291-1-nm@ti.com>
 <20210706195339.GQ1528@denix.org>
 <20210706200635.GG9516@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20210706200635.GG9516@bill-the-cat>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:06-20210706, Tom Rini wrote:
> On Tue, Jul 06, 2021 at 03:53:39PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jul 06, 2021 at 10:27:47AM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> > > Update u-boot recipe to be on the bleeding upstream tag.
> > 
> > Is this the official release commit? Bleeding might be slightly confusing...
> 
> It is, so perhaps a slightly cleaner phrasing is in order.

Thanks, yes, that is misleading. respinning a v2 out in a moment..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
