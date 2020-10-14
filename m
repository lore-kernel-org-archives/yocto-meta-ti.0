Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.786.1602689715164344275
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=J5/5/H7h;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09EFZE7n030169;
	Wed, 14 Oct 2020 10:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602689714;
	bh=wk1rTwduQBEyv6OvS7Nq4Rkqw1h3kN2ncd6U1cpDd3A=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=J5/5/H7hb6ugXr2jOxJ96Gqj6j3zhlnEJK798O4vhDZIzs9ZudFlSmrB4L0ls17Ru
	 MSwKAgtyFPgOF4NZETgjLjjGYlgVRGoBwuIb7hbakTCk7BI0J/9fbHWp9aaBeMb1cH
	 af+b5BXiYlB8z6AnaalBefBB4oJ66KQQAjWWq32w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09EFZEoG056555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Oct 2020 10:35:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 14
 Oct 2020 10:35:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 14 Oct 2020 10:35:13 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09EFZDCd073140;
	Wed, 14 Oct 2020 10:35:13 -0500
Subject: Re: [meta-ti] [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20201013214911.339265-1-raj.khem@gmail.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com>
Date: Wed, 14 Oct 2020 10:35:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013214911.339265-1-raj.khem@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 09EFZE7n030169
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Khem

On 10/13/20 4:49 PM, Khem Raj wrote:
> latest OE-core does not promote using trailing slash to make pseudo's
> life easier
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Strip slash from S if it exists

There were 2 patches submitted with v1.=C2=A0 Do we just drop the RTOS pa=
tch now?

Dan

