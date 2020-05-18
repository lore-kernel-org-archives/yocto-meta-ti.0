Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.37706.1589788309313792154
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 May 2020 00:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=W5f1eBQ8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nikhil.nd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04I7pmTO065937
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 May 2020 02:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589788308;
	bh=CvrsNdaxHkFHVXHQ/BBbMmpB5rqFbXGJDiwdrZx46ms=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=W5f1eBQ8bPurMP9ZsHTglfk/VPHILyMqauh1qkjklWMJcpRtigYAxx55E6MJHmuXr
	 Dsv06ESIKykodfs2NdjEbthd0WnbcMT8wGhhYDIDU3u3p+zoiLgwnhQdhWivsRKIs4
	 2W9hLABgRkmKn0Mos8cRSD7Z2HqKpbwQcrL4AH+Y=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04I7pmIb009151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 May 2020 02:51:48 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 02:51:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 02:51:48 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04I7pkBV086187;
	Mon, 18 May 2020 02:51:47 -0500
Subject: Re: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Update SRCREV to latest
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200515135844.4333-1-nikhil.nd@ti.com>
 <20200515170341.GE8594@beryl>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <3704e3e1-2e3b-27a4-3a1d-d49c29efd504@ti.com>
Date: Mon, 18 May 2020 13:21:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170341.GE8594@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------BD1A281F2FB3275BB95C6B69"
Content-Language: en-US

--------------BD1A281F2FB3275BB95C6B69
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 15/05/20 10:33 pm, Denys Dmytriyenko wrote:
> On Fri, May 15, 2020 at 07:28:44PM +0530, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> Any version updates?
No. Only bugfix updates.
> Still 0.12 based?
Yes, Jailhouse versions are released not so often.
Regards,
Nikhil D
>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
>> index 3ee24e58..46447af6 100644
>> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
>> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>>   "
>>   
>>   PV = "0.12+git${SRCPV}"
>> -SRCREV = "2c6516ce3d0e0c4e9372e4439562dd660877cb79"
>> +SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
>>   BRANCH = "ti-jailhouse-0.12"
>>   
>>   SRC_URI = " \
>> -- 
>> 2.17.1
>>


--------------BD1A281F2FB3275BB95C6B69
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 15/05/20 10:33 pm, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200515170341.GE8594@beryl">
      <pre class="moz-quote-pre" wrap="">On Fri, May 15, 2020 at 07:28:44PM +0530, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Any version updates?</pre>
    </blockquote>
    No. Only bugfix updates.<br>
    <blockquote type="cite" cite="mid:20200515170341.GE8594@beryl">
      <pre class="moz-quote-pre" wrap="">Still 0.12 based?
</pre>
    </blockquote>
    Yes, Jailhouse versions are released not so often.<br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type="cite" cite="mid:20200515170341.GE8594@beryl">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 3ee24e58..46447af6 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.12+git${SRCPV}"
-SRCREV = "2c6516ce3d0e0c4e9372e4439562dd660877cb79"
+SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
 BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
-- 
2.17.1

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------BD1A281F2FB3275BB95C6B69--
