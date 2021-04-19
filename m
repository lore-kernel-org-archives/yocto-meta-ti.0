Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4641.1618807171855921495
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 18 Apr 2021 21:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QN7FnsVd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13J4dUvK017213;
	Sun, 18 Apr 2021 23:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618807170;
	bh=j43A8POcT6vL3FqgVFipkLpDNTd5T3L8bcVgY0Y+cXs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=QN7FnsVdEqJM1GPc6ryDAHAkPyNJI9Zpjc5LU0zs3dFqgfPfbqrladb60RYG/6A5P
	 1YMl+pS5mgqqvIL+CzoDIja5jqWixmJ/Z7ia9SFwQvFCMv5L4mT3x6wfsoP3OIVUAq
	 CMMMCdRx10kjVwW09K887jZSE2aZEnftjOeZcruA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13J4dUUT085815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 18 Apr 2021 23:39:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 18
 Apr 2021 23:39:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 18 Apr 2021 23:39:30 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13J4dTNe032319;
	Sun, 18 Apr 2021 23:39:29 -0500
Subject: Re: [meta-ti] Dunfell linux kernel stuck at starting for v5.10
To: <whuang8933@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <GFNR.1618763697310386194.yEyt@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <2b1f1abb-fcd7-49f3-22a0-eead99e6a5b0@ti.com>
Date: Sun, 18 Apr 2021 23:39:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <GFNR.1618763697310386194.yEyt@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/18/2021 11:34 AM, whuang8933@gmail.com wrote:
> Hi,
> I got my beaglebone booting into kernel 5.4. I tried to change the 
> version to 5.10 in conf/local.conf via 
> PREFERRED_VERSION_linux-ti-staging = "5.10%", however after copying the 
> zImage and rootfs to my SD card,

You will also need the appropriate updated DTB too.

  the console is stuck at "Starting
> kernel ...".
>

Enabling Early printk will show more debug traces and see where the boot 
is failing.

> Am I missing something else?
> 
> 
> 
> 
