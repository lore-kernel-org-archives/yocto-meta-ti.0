Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2938.1609878525648247755
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 12:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wDH+37Lz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 105KSioG044925
	for <meta-ti@lists.yoctoproject.org>; Tue, 5 Jan 2021 14:28:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609878524;
	bh=Zp3ojNPHJoej9Gak2Hdix5v0DiD7f+NpU/Z4VeTFSy4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=wDH+37LzhkeIZd9Qte1zREpM8oyXofF/fzoemDqq06KpOm6YUUalAxPvTUoZvw8CK
	 fQaYqxgLYDo6zRzbyyH8Bco4rsKrBDaRyTqBtE/y8ORCRHJShFS98d3hFvlOZI8gDL
	 uT8RhZdRjftmw4Qoda58YDybUbZC/k5gsXgOQgp8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 105KSin4117312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 5 Jan 2021 14:28:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 5 Jan
 2021 14:28:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 5 Jan 2021 14:28:44 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 105KSfP8125235;
	Tue, 5 Jan 2021 14:28:43 -0600
Subject: Re: [PATCH] k3conf: Update to latest commit
To: Lokesh Vutla <lokeshvutla@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sekhar Nori <nsekhar@ti.com>
References: <20210105184732.20201-1-lokeshvutla@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <e219b172-a063-49ab-4244-75677251419c@ti.com>
Date: Tue, 5 Jan 2021 14:28:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105184732.20201-1-lokeshvutla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Lokesh

On 1/5/21 12:47 PM, Lokesh Vutla wrote:
> Update k3conf to latest sha, bumping up version to 0.2
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   recipes-devtools/k3conf/k3conf_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Not a big deal but in the $subject the target branches also needs to be 
identified like dunfell/master

Dan


