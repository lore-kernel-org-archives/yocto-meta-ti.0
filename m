Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4195.1624943780236482195
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 22:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=aoS7qaNn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T5GJPG016303;
	Tue, 29 Jun 2021 00:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624943779;
	bh=yX/fOa13tpjZmo0GTCMDEgJQeSGXqPYAS3erasrbP3E=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aoS7qaNnfYJ0jonZQRmSZskEKEILbYxw58oZcc++QmMbRZJYwIisDkgTiL1EszzCi
	 mxslVYK3ZwpHdUovipD8Ws13rjpUDR5824Tr1MVC4tn9A7REhh2W9TqdQ//dgCBu/g
	 MCvLgzFI2Wv4nBArOiSicHSrPXMnN3+lNHJUDyUM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T5GJXk096279
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 00:16:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 00:16:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 00:16:19 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T5GGXt016905;
	Tue, 29 Jun 2021 00:16:17 -0500
Subject: Re: [dunfell/master PATCH] conf: j7-evm: Add j721e eaik dtb to KERNEL_DEVICETREE
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Sinthu Raja <sinthu.raja@ti.com>
References: <20210628194426.5468-1-sinthu.raja@ti.com>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <37e50fe5-5900-0d87-607e-0dd626fae0f1@ti.com>
Date: Tue, 29 Jun 2021 10:46:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210628194426.5468-1-sinthu.raja@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 15T5GJPG016303
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 29/06/21 1:14 am, Sinthu Raja wrote:
> J721E EdgeAI Kit (EAIK) is a low cost, small form factor board designed
> for TI=E2=80=99s J721E SoC. TI=E2=80=99s J721E SoC comprises of dual co=
re A72, high
> performance vision accelerators, video codec accelerators, latest C71x
> and C66x DSP, high bandwidth real-time IPs for capture and display,
> GPU, dedicated safety island and security accelerators.
>=20
> J721E EAIK supports the following interfaces:
> * 4 GB LPDDR4 RAM
> * x1 Gigabit Ethernet interface
> * x1 USB 3.0 Type-C port
> * x3 USB 3.0 Type-A ports
> * x1 PCIe M.2 E Key
> * x1 PCIe M.2 M Key
> * x2 CSI2 Camera interface (RPi and TI Camera connector)
> * 40-pin Raspberry Pi compatible GPIO header
>=20
> J721e EVM and EAIK uses the unified bootloader. Add j721e eaik dtb
> for machine=3Dj721e-evm
>=20
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh
