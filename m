Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.2221.1582157190763095598
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 16:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=i5ay7e+6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01K06Uux048965
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:06:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582157190;
	bh=S4nxH+LbvtXPYgGJQ/DY6uyhN5Fr4E+WBnEA4HDuFrw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=i5ay7e+6CLckKKx5hCDzQqTyRqO6Kyw4qnakBf0FKyrst8gzwJdiajL/G23ZLMzG4
	 UP4cxptxPmKOz6sE5rU2ePF7JRAYLdwr9oay/1MbuHDpNx52POcrGGoHeJVjMO26Za
	 SSTHXnbr9rxDdYc3uBbfahBWAMgyvDrOQoY5+kTI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K06TSE023353
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:06:29 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 18:06:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 18:06:29 -0600
Received: from [10.250.73.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K06Tmf026142;
	Wed, 19 Feb 2020 18:06:29 -0600
Subject: Re: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200218160621.26272-1-afd@ti.com> <20200218175234.GJ720@beryl>
 <ed392732-a4bb-fd54-6c0e-3c2358edba49@ti.com> <20200219235832.GY720@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <b1012ba2-e080-3c50-4e92-b16ccf67f1ac@ti.com>
Date: Wed, 19 Feb 2020 19:06:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219235832.GY720@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/19/20 6:58 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 18, 2020 at 01:08:46PM -0500, Andrew F. Davis wrote:
>> On 2/18/20 12:52 PM, Denys Dmytriyenko wrote:
>>> I was sitting on a similar patch in a private testing branch:
>>> https://lists.yoctoproject.org/g/meta-ti/message/12418
>>
>> Why RRECOMMENDS? It should be a real dependency right?
> 
> Andrew,
> 
> Historically kernel modules used RRECOMMENDS.
> 
> Plus, it's easier to break RRECOMMENDS dependency than RDEPENDS. And we had 
> instances in the past, when we needed to be able to build against UM libs, 
> even when KM support is not there. Of course, it may not be an issue in the 
> future, when we split up UM libs package into individual libs and/or move to 
> Mesa based builds...
> 

Okay then, either way works for me, I'm just looking to get the
dependency tree in order so we don't have to explicitly include the
"gpudriver" anymore. It should be pulled in by any app using 3D.

Andrew
