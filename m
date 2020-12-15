Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2953.1608065636828562037
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 12:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ekAViqNE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFKrukQ102698
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 14:53:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608065636;
	bh=veg5hcYA/Rn0rccZh6JhgxMQ6lwECOFhBw2Xqph0C+8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ekAViqNEvXSxoYqgJKOvDocmVmOTW+JdFi71R6Xsg4Tg11HAISkE+B0tp83UEmohV
	 K/Wz75xLgyYj05NIDWVNXD4RCwaAEbeup8zo0GaS+E27UFEJz97WPFfnzyiQnScFYT
	 M5tYk8mkasONwMi5OQF8FQR0pOT9/1Y5ZQlOsiXE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFKruko112454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 14:53:56 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 14:53:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 14:53:55 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFKrtJ8041142;
	Tue, 15 Dec 2020 14:53:55 -0600
Subject: Re: [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
To: <praneeth@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
 <20201215205138.27986-1-praneeth@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
Date: Tue, 15 Dec 2020 14:53:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215205138.27986-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 0BFKrukQ102698
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Praneeth

On 12/15/20 2:51 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> Update SRCREV to pick latest that includes AM64 support

You are doing just a bit more then this.=C2=A0 What is the "lite" for now=
?

Dan

