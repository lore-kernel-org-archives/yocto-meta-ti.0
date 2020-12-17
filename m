Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2990.1608236638333147847
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 12:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YC4VUpDE;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0E67D38C0871
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 20:23:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHKNqpk091829;
	Thu, 17 Dec 2020 14:23:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608236632;
	bh=FT+DzOeL1ay01TiEMpxipa7I4LpKIVZ7Wgk8k4RwYGk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YC4VUpDEg0Z6t1S4ylmdaGgZySX04ghC4V0VzlKlHK4K+Ioj3CHyRF5ApJXHqcYtx
	 8Yu8qxPs/xmw5E1cFwGGmhOiY+6eM+Kbkxf/HfSlxvHG0zOQSx55XkPmz6ueSfWqsN
	 T3a40ekRgDk3AReacmPBB0edsCqbmLTNK/eGn2PU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHKNqfM112197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Dec 2020 14:23:52 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 14:23:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 14:23:52 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHKNppQ097975;
	Thu, 17 Dec 2020 14:23:52 -0600
Subject: Re: [meta-ti] [dunfell/master] [PATCH v3 09/10] ti-sci-fw: Update image gen and sysfw commit SHA
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@yoctoproject.org>
References: <20201217184929.18031-1-dmurphy@ti.com>
 <20201217184929.18031-9-dmurphy@ti.com> <20201217201655.GX24670@denix.org>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <63bd68a0-7d51-94ab-ee33-8e414a9bea40@ti.com>
Date: Thu, 17 Dec 2020 14:23:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201217201655.GX24670@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 12/17/20 2:16 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 17, 2020 at 12:49:28PM -0600, Dan Murphy via lists.yoctoproject.org wrote:
>> Update the image gen and sysfw commit SHAs.
>> Temporarily pick up the firmware-next branch to get the AM64x firmware.
>> This branch change will need to be reverted once the firmware is merged.
> Don't see firmware-next in the code below.

I will update the message locally and push after builds are done

Dan


