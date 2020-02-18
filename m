Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.197.1582049329496459647
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Feb 2020 10:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kUdQGNqM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01II8m1m108408
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2020 12:08:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582049328;
	bh=kfAqJI7emWAJEM23QqFvO7ksYtGl4mbBZn8Iw4CotOs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=kUdQGNqM6NcSbyC4W+WCOAbbXun81gNCYb8jz8CPzubVhs0SFvWG9p44LBQoqRgUn
	 oIq8T8IR5lDXsv9Wy5arjegTiqRBetzUPsIOHoMW4WI3cr5PtTShjSH1p0e/GCYTz2
	 sqcqD7HoKVLnFORoPoHn38cc/czpZHFhlJxW1tvI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01II8msB002665
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2020 12:08:48 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 12:08:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 12:08:48 -0600
Received: from [10.250.73.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01II8kFn123409;
	Tue, 18 Feb 2020 12:08:47 -0600
Subject: Re: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200218160621.26272-1-afd@ti.com> <20200218175234.GJ720@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <ed392732-a4bb-fd54-6c0e-3c2358edba49@ti.com>
Date: Tue, 18 Feb 2020 13:08:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218175234.GJ720@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/18/20 12:52 PM, Denys Dmytriyenko wrote:
> I was sitting on a similar patch in a private testing branch:
> https://lists.yoctoproject.org/g/meta-ti/message/12418
> 


Why RRECOMMENDS? It should be a real dependency right?

Andrew


> 
> On Tue, Feb 18, 2020 at 11:06:21AM -0500, Andrew F. Davis wrote:
>> The UM doesn't work too well without the KM side, add this dependency.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> index 129d5cee..d4bc0232 100644
>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> @@ -28,7 +28,7 @@ inherit update-rc.d
>>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>>  
>>  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
>> -RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
>> +RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat ti-sgx-ddk-km"
>>  
>>  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
>>  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
>> -- 
>> 2.17.1
>>
