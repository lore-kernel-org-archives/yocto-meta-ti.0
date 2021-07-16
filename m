Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3482.1626422696209414961
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 01:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O705A0Fm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vigneshr@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16G84skI076493;
	Fri, 16 Jul 2021 03:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626422694;
	bh=/qXS4BeQPce7VBo3BJKgUS19KfNURyADiVU/5+4+jzo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=O705A0FmBCAubVVt3fRbD2mpsAHghcsmMG2l6I9vIKtKFJ/4yvU+MJA339a7lHLZs
	 9YWT7SG9I3Y8snUkTWow8WcccizXZZHbYPsXPMA+xcorlkTX1bmns2qHaHEQ0Wa40w
	 DpQIRAtlIqGl3K9ISjc7EilC9XQ9JtD3j9Aqyq7E=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16G84saI081225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 03:04:54 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 03:04:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 03:04:54 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16G84p6K059505;
	Fri, 16 Jul 2021 03:04:52 -0500
Subject: Re: [EXTERNAL] [meta-ti][dunfell/master][PATCH] ti-rtos-firmware: update the source to ti-linux-firmware
To: <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210715203300.13364-1-yogeshs@ti.com>
From: "Vignesh Raghavendra" <vigneshr@ti.com>
Message-ID: <1e859761-1cf6-25ca-47ca-5ac3e9353c6b@ti.com>
Date: Fri, 16 Jul 2021 13:34:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715203300.13364-1-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/16/21 2:03 AM, Yogesh Siraswar via lists.yoctoproject.org wrote:
> This is temporary change to pick the 08.00.00.026 firmware from
> ti-linux-firmware repos:

ti-eth is @ 08.00.00.029 -> how is that taken care of?

> 1) Using the ti-sci-fw to pick the latest firmware and support AUTOREV

I thought we did not do AUTOREV on master branch in order for builds to
be reproducible?

> 2) Kept the destination folder name same to avoid wide-spead changes to
> other recipes. Since that will be changed as part of over-all clean-up
> 
> TODO:
> 1) Re-structure rtos firmware repo and update all dependent firmware recipes.
> 2) Fix the destination folder name to match src folder
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>

Regards
Vignesh

