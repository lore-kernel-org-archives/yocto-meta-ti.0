Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.329.1610651906005628296
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=oaRq2HEr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EJIPRG095923
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Jan 2021 13:18:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610651905;
	bh=PCYJ+h6A9xyXixRpdZs3UZ3zxaUPZKXlhRnInsHAtIg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=oaRq2HErOPtJeZKqMGErddhdImTlXjfUi2EUuBvDSpjOIv3Ix3B3yzuGo8ZIns0ax
	 rlKx9bI3z/sDWql9EdkY1RWUzP+M8D4EKWlGeqiFOsbL1TcgEKXM61JdKAtoA4O+mg
	 Jx9I+rRNAK/aaencF/UI6yX9H8+qOIZRGMJoTvqE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EJIPZr102631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Jan 2021 13:18:25 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 Jan 2021 13:18:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 Jan 2021 13:18:25 -0600
Received: from [10.250.36.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EJIOYO051087;
	Thu, 14 Jan 2021 13:18:25 -0600
Subject: Re: [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw to v2020.12
To: <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210114191415.11467-1-praneeth@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <308d68d5-a132-0201-1a48-9ed7de46ab30@ti.com>
Date: Thu, 14 Jan 2021 13:18:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114191415.11467-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 10EJIPRG095923
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Praneeth

On 1/14/21 1:14 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> Update the image gen and linux-firmware commit SHAs so that
> am65x, j7200 and j721e also picks v2020.12 sysfw and the applicable
> DM update on j7200 and j721e based on 07.02.00.05 tag
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-f=
w/ti-sci-fw.inc
> index ae22b7a5..b880e15d 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -3,12 +3,12 @@ SUMMARY =3D "TI SCI firmware (SYSFW)"
>   LICENSE =3D "TI-TFL"
>   LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf9562125928=
8c4a46d76"
>  =20
> -PV =3D "2020.08b"
> +PV =3D "2020.12"
>   PV_am64xx-evm-k3r5 =3D "2020.12"
>  =20

am64xx over ride is no longer needed=C2=A0 so it can be removed.

Dan


