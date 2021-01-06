Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4007.1609909637669498190
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 21:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=KrDP1Q4i;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10657GJ2098985
	for <meta-ti@lists.yoctoproject.org>; Tue, 5 Jan 2021 23:07:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609909636;
	bh=4JVb0fUSBrAZG1NmHqhLY8Z4P8Yn+7YBXBLEvb4g2lg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=KrDP1Q4i5OtwV+dF1yOaB6L9/JOKyESb0yxsTqdooiY1WMzTrWCGnOgYUPA/NPYxw
	 7+bYpFGi5EZ/0HGKUA+Z0/WgXy70Ke2L0FBY2pYcU8HJGMojo7WUcsvsFK/jsJjT0v
	 tefGLZqyZEk3b5vQllRYBvck7HwZeBxMZiajMvQA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10657Gkm120322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 5 Jan 2021 23:07:16 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 5 Jan
 2021 23:07:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 5 Jan 2021 23:07:16 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10657EGQ011015;
	Tue, 5 Jan 2021 23:07:15 -0600
Subject: Re: [PATCH] k3conf: Update to latest commit
To: Dan Murphy <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sekhar Nori <nsekhar@ti.com>
References: <20210105184732.20201-1-lokeshvutla@ti.com>
 <e219b172-a063-49ab-4244-75677251419c@ti.com>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <362c059d-309f-8dd2-0080-d781663d4ac1@ti.com>
Date: Wed, 6 Jan 2021 10:37:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e219b172-a063-49ab-4244-75677251419c@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 10657GJ2098985
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On 06/01/21 1:58 am, Dan Murphy wrote:
> Lokesh
>=20
> On 1/5/21 12:47 PM, Lokesh Vutla wrote:
>> Update k3conf to latest sha, bumping up version to 0.2
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>> =C2=A0 recipes-devtools/k3conf/k3conf_git.bb | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Not a big deal but in the $subject the target branches also needs to be
> identified like dunfell/master

Sure, this applies to both dunfell and master. Will take care of it next =
time. I
hope you will merge this patch.

Thanks and regards,
Lokesh
