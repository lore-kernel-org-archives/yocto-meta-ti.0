Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.29.1603221431510944334
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 12:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qQAW1kh9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09KJHA3q041272;
	Tue, 20 Oct 2020 14:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603221430;
	bh=+VnScrR+Mqed5LiMQ7Vd2fkqXoCABK2roVPuhseV/H0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qQAW1kh9l0bWpSzem8IEFpoyWulYfPlHE4byL3L8Uks/bEhqkouCnKyk2qmtROcsc
	 1qRlvXkOoeIBi3Ty5Ep0ndEZrW5P4SqFJRJrI+t8o6eAyh0sYEsd6+PYSkWHFlfL8h
	 i/po5PeHU6hnxFV3jqYWYM+51M9T59M2mjGTIGGE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09KJHA05024910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2020 14:17:10 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 14:17:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 14:17:10 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09KJH9iM105628;
	Tue, 20 Oct 2020 14:17:09 -0500
Subject: Re: [meta-ti] [PATCH] layer.conf: Add gatesgarth to LAYERSERIES_COMPAT
To: <denys@ti.com>, Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201020181601.29276-1-raj.khem@gmail.com>
 <20201020184341.GB14852@beryl>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <0fc0e5e9-005d-02a5-687d-aeb0cb89c4e8@ti.com>
Date: Tue, 20 Oct 2020 14:17:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020184341.GB14852@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello

On 10/20/20 1:43 PM, Denys Dmytriyenko via lists.yoctoproject.org wrote:
> On Tue, Oct 20, 2020 at 11:16:01AM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Reviewed-by: Denys Dmytriyenko <denys@ti.com>
>
> Only applicable to master.

Applied to master only

Dan

