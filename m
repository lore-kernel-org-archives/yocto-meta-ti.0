Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.72822.1597776383826165413
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k2VSitjS;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B837E0203E; Tue, 18 Aug 2020 11:46:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.9 NICE_REPLY_A Looks like a legit reply (A)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C3A9E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 11:46:21 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IIkLqq006989
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597776381;
	bh=FquhFx6D15G2ugiSbFLz+cH9XulIynSnyN0lqpqZJlA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=k2VSitjShXalY5i2JpxLfsD5JdIPbHI1ZQphApB0N5KFOACV4Phmy7VqR3jdilm1L
	 9bxkQs9LaY4flDTYXVtGIF606lacx0eh4OiMG276IV0f2BU9f15WV+0UoLCTTWQNxW
	 1D6AgfLg1/xQNL2TrRvuEZ6iWTJ89c9vVh9DZJK0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IIkLxT033973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:46:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 13:46:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 13:46:20 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIkIG1074138;
	Tue, 18 Aug 2020 13:46:19 -0500
Subject: Re: [meta-ti][dunfell PATCH] conf: machine: j7200-evm: Add Jailhouse overlay
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <dmurphy@ti.com>
References: <20200818183314.6089-1-nikhil.nd@ti.com>
 <a3f96a66-0037-76cf-fe22-9dd364c6569e@ti.com> <20200818184247.GK10642@beryl>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <e735eebd-b033-c07f-476b-801f9a1ac354@ti.com>
Date: Wed, 19 Aug 2020 00:16:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818184247.GK10642@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------A0EA1E939F6A5338D35D736A"
Content-Language: en-US

--------------A0EA1E939F6A5338D35D736A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 19/08/20 12:12 am, Denys Dmytriyenko wrote:
> On Wed, Aug 19, 2020 at 12:09:32AM +0530, Nikhil Devshatwar wrote:
>>
>> On 19/08/20 12:03 am, Nikhil Devshatwar wrote:
>>> j7200-evm supports virtualization with Jailhouse hypervisor.
>>> To use Jailhouse, kernel needs to boot with an additional
>>> DTB overlay. Include this in the list of DTBs for the machine.
>>>
>> Apply this after the kernel recipe is updated to latest.
>> I assume Dan will send you the updated kernel recipe for rc1, that's why I
>> am not sending one.
> And rc1 is not planned for about a month. You patch might be lost by then...
Ohh, I misunderstood about the schedule then.
I will send the kernel recipe update right away.

Regards,
Nikhil D
>
>> Regards,
>> Nikhil D
>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>   conf/machine/j7200-evm.conf | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
>>> index d2a81771..dab6d8cb 100644
>>> --- a/conf/machine/j7200-evm.conf
>>> +++ b/conf/machine/j7200-evm.conf
>>> @@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>   KERNEL_DEVICETREE = " \
>>>       ti/k3-j7200-common-proc-board.dtb \
>>> +    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
>>>   "
>>>   UBOOT_MACHINE = "j7200_evm_a72_config"
>>>


--------------A0EA1E939F6A5338D35D736A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 19/08/20 12:12 am, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818184247.GK10642@beryl">
      <pre class="moz-quote-pre" wrap="">On Wed, Aug 19, 2020 at 12:09:32AM +0530, Nikhil Devshatwar wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 19/08/20 12:03 am, Nikhil Devshatwar wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">j7200-evm supports virtualization with Jailhouse hypervisor.
To use Jailhouse, kernel needs to boot with an additional
DTB overlay. Include this in the list of DTBs for the machine.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Apply this after the kernel recipe is updated to latest.
I assume Dan will send you the updated kernel recipe for rc1, that's why I
am not sending one.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And rc1 is not planned for about a month. You patch might be lost by then...
</pre>
    </blockquote>
    Ohh, I misunderstood about the schedule then.<br>
    I will send the kernel recipe update right away.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type="cite" cite="mid:20200818184247.GK10642@beryl">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Nikhil D

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 conf/machine/j7200-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index d2a81771..dab6d8cb 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
+    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
 "
 UBOOT_MACHINE = "j7200_evm_a72_config"

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------A0EA1E939F6A5338D35D736A--
