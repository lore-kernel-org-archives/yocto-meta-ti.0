Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.816.1612550938677745265
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=v6VV8fw5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115Imvbp091965
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:48:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612550937;
	bh=3Gd/ROAXzIKCmwhVRROIDmk6S6OyZHdCCpWUYV5IeDY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=v6VV8fw57fFqNxmwEo/HhWUF7u0Mh3or1W0VaEQmleBY00x3i0wPoqGm8OnmihKel
	 MMUQO7wl4mYfIQtxKeQRZw0b1tSqyV2uVY0xfV6axllHTzwy4H636Le9WSWXLv3enw
	 Uzkp9MJfTnquCrUrkW874UBaeFRW2npbbXeUbNjg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115Imvmo002570
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:48:57 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:48:57 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:48:56 -0600
Received: from [10.250.39.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115ImuMk115879;
	Fri, 5 Feb 2021 12:48:57 -0600
Subject: Re: [PATCH dunfell/master] machine: am64xx-sk.conf: Add machine definition for AM64xx SK
To: Lokesh Vutla <lokeshvutla@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Praneeth Bajjuri <praneeth@ti.com>
References: <20210205184114.7570-1-lokeshvutla@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <069390dd-917d-5398-8c4b-f82b2e423dfc@ti.com>
Date: Fri, 5 Feb 2021 12:48:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205184114.7570-1-lokeshvutla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 115Imvbp091965
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello

On 2/5/21 12:41 PM, Lokesh Vutla wrote:
> AM642 StarterKit (SK) board is a low cost, small form factor board
> designed for TI=E2=80=99s AM642 SoC. Add machine definition for SK boar=
d.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
> - To be merged only after U-Boot and Kernel gets updated with AM64xx sk
>    platform.

Not really true but up to Praneeth.=C2=A0 The am64xx-sk build will just f=
ail=20
until the kernel and uBoot are updated

Dan

