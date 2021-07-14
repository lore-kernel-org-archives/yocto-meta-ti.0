Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.10923.1626286876032866797
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jul 2021 11:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jXu+QR03;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16EILBqI093088;
	Wed, 14 Jul 2021 13:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626286871;
	bh=ErSXikVRXim6i+o0wn3XzXBnBpJqHOiVbKaKxgL8n1c=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jXu+QR03o8aWLmbDqcOhf+13mdMVxOdZeY4dBO0T0l4B9pFQ4LQLSz4T5KTTpLmc6
	 gTKYgFa0nZ+AOqoY3QLiG9WvPvzn5qbeiDQ8lP6wzh2Ym4rroL/BBO42I3wWkk27LK
	 ECNKz/68Kzrpk0QwWBFfJwsN7Jm4wTna9RCTuqbg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16EILBVO031216
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jul 2021 13:21:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 14
 Jul 2021 13:21:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 14 Jul 2021 13:21:11 -0500
Received: from [10.250.32.102] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16EILBRe124900;
	Wed, 14 Jul 2021 13:21:11 -0500
Subject: Re: [EXTERNAL] [meta-ti] Merge confict chunk
To: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
References: <CAMKF1srKvR3KrWyKtW18J6rqzLH2H2SaYQLLzSs+sa8QHQh+7w@mail.gmail.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <5070d889-b8c6-e6b1-d86d-0dbc966d1707@ti.com>
Date: Wed, 14 Jul 2021 13:21:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srKvR3KrWyKtW18J6rqzLH2H2SaYQLLzSs+sa8QHQh+7w@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Raj,
Thanks for pointing  it out. Have fixed the same. Will try to be more 
careful in future.

Thanks
Yogesh

  more
On 7/14/21 12:15 PM, Khem Raj wrote:
> Hi Denys
> 
> This commit
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=4c1d26f6282b9959b9ee10aa77b3e05ed56299fb
> 
> has a merge anchor thats committed perhaps accidentally.
> 
> Thanks
> -Khem
> 
> 
> 
> 
> 
