Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9897.1622045678204484379
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 May 2021 09:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LtZsc7St;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QGEX7c096952;
	Wed, 26 May 2021 11:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622045673;
	bh=zy5Fo0wm6Dd1WSyxZLPQim1l1mW8pKiVPpfn4Kbhpnw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=LtZsc7StzoOIxaFLC/mJTIklz2108dLjyt5qu7eT2jLTfHTUuesIuXR7QJ9pWlU2e
	 cJx8CkXnK4M6KPy6Wvd1nYvS0ToZYivgnVU36BYgZykM3KyDna4Rho/6SJrGYjX+GS
	 JsAnbGSN/oYODoL0SGOAPCwdqoh7wYSv4D4m11Hk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QGEXGT039428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 May 2021 11:14:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 11:14:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 11:14:33 -0500
Received: from [10.250.33.188] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QGEXPH020532;
	Wed, 26 May 2021 11:14:33 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH V3] linux-ti-staging: Add extra dtc flags to support dtb overlays
To: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210524224036.13526-1-yogeshs@ti.com>
 <20210525015139.GB1528@denix.org> <20210525115552.5kqo5mcdwonarnjc@retriever>
 <20210526042150.GI1528@denix.org> <20210526131846.fo5bood7l2zl2mfi@sanded>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <64e2255c-362b-f222-1dd8-478a2cc90bc5@ti.com>
Date: Wed, 26 May 2021 11:14:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526131846.fo5bood7l2zl2mfi@sanded>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------3F36D7DEB02AA3FDC8EE69B6"
Content-Language: en-US

--------------3F36D7DEB02AA3FDC8EE69B6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/21 8:18 AM, Nishanth Menon wrote:
> On 00:21-20210526, Denys Dmytriyenko wrote:
>> On Tue, May 25, 2021 at 06:55:52AM -0500, Nishanth Menon wrote:
>>> On 21:51-20210524, Denys Dmytriyenko wrote:
>>>> On Mon, May 24, 2021 at 05:40:36PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
>>>>> Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
>>>>> compile dtbs with symbols. This fixes the issue where the dtbs
>>>>> are build without symbols causing issue with overlays.
>>>>>
>>>>> Enabling overlay support increases the size of the dtb, hence
>>>>> it is done at a platform level rather than globally to allow custom
>>>>> boards disable it from local.conf to reduce size.
>>>>>
>>> ^^
>>>
>>>>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>>>>> ---
>>>>>   conf/machine/am335x-evm.conf                  | 2 ++
>>>>>   conf/machine/am335x-hs-evm.conf               | 2 ++
>>>>>   conf/machine/am437x-evm.conf                  | 2 ++
>>>>>   conf/machine/am437x-hs-evm.conf               | 2 ++
>>>>>   conf/machine/am57xx-evm.conf                  | 2 ++
>>>>>   conf/machine/am57xx-hs-evm.conf               | 3 +++
>>>>>   conf/machine/am65xx-evm.conf                  | 2 ++
>>>>>   conf/machine/am65xx-hs-evm.conf               | 2 ++
>>>>>   conf/machine/dra7xx-evm.conf                  | 2 ++
>>>>>   conf/machine/dra7xx-hs-evm.conf               | 3 +++
>>>>>   conf/machine/j7-evm.conf                      | 2 ++
>>>>>   conf/machine/j7-hs-evm.conf                   | 2 ++
>>>>>   conf/machine/j7200-evm.conf                   | 2 ++
>>>>>   conf/machine/k2g-evm.conf                     | 2 ++
>>>>>   conf/machine/k2g-hs-evm.conf                  | 2 ++
>>>> First question:
>>>> If you are weakly assigning KERNEL_DTB_OVERLAY_SUPPORT in most of the machine
>>>> configs, should it instead be done in SoC include files, like ti33x.inc,
>>>> k3.inc or even ti-soc.inc?
>>> You would want the default behavior as default dtb, not the bloated
>>> symbol loaded overlay capable dtb, no?
>> Well, but from the list above the only machines missing are AM64 and legacy
> ^^^ Arrgh, good catch - we are indeed missing am64..
>
>> K2 HK/L/E. And since the assignment is weak (?=), it can still be changed
>> from local.conf, as the commit message says.
> I think we need to drop k2 platforms - they are just bitrotting..
>
>> Anyway, if you don't think making it a bit more generic for ease of
>> maintenance is not worth it, then I'm fine with current approach.
> Hmmm.. Your point is to get the weak assignment to allows the critical
> mach confs to just override it with =
>
> yeah, I am not exactly a fan of going overboard with entries in machine
> file.
>
> I guess I second your thought about including it in ti-soc.inc instead
> of machine specific includes to prevent us from messing up and allowing
> a little less optimal, but feature rich default.


This is clean. Will make the change and re-submit.


>
>
> btw, where do we document all these variables that need tweaking?
>

--------------3F36D7DEB02AA3FDC8EE69B6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/21 8:18 AM, Nishanth Menon
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210526131846.fo5bood7l2zl2mfi@sanded">
      <pre class="moz-quote-pre" wrap="">On 00:21-20210526, Denys Dmytriyenko wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, May 25, 2021 at 06:55:52AM -0500, Nishanth Menon wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 21:51-20210524, Denys Dmytriyenko wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Mon, May 24, 2021 at 05:40:36PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
compile dtbs with symbols. This fixes the issue where the dtbs
are build without symbols causing issue with overlays.

Enabling overlay support increases the size of the dtb, hence
it is done at a platform level rather than globally to allow custom
boards disable it from local.conf to reduce size.

</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
^^

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Signed-off-by: Yogesh Siraswar <a class="moz-txt-link-rfc2396E" href="mailto:yogeshs@ti.com">&lt;yogeshs@ti.com&gt;</a>
---
 conf/machine/am335x-evm.conf                  | 2 ++
 conf/machine/am335x-hs-evm.conf               | 2 ++
 conf/machine/am437x-evm.conf                  | 2 ++
 conf/machine/am437x-hs-evm.conf               | 2 ++
 conf/machine/am57xx-evm.conf                  | 2 ++
 conf/machine/am57xx-hs-evm.conf               | 3 +++
 conf/machine/am65xx-evm.conf                  | 2 ++
 conf/machine/am65xx-hs-evm.conf               | 2 ++
 conf/machine/dra7xx-evm.conf                  | 2 ++
 conf/machine/dra7xx-hs-evm.conf               | 3 +++
 conf/machine/j7-evm.conf                      | 2 ++
 conf/machine/j7-hs-evm.conf                   | 2 ++
 conf/machine/j7200-evm.conf                   | 2 ++
 conf/machine/k2g-evm.conf                     | 2 ++
 conf/machine/k2g-hs-evm.conf                  | 2 ++
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
First question:
If you are weakly assigning KERNEL_DTB_OVERLAY_SUPPORT in most of the machine 
configs, should it instead be done in SoC include files, like ti33x.inc, 
k3.inc or even ti-soc.inc?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
You would want the default behavior as default dtb, not the bloated
symbol loaded overlay capable dtb, no?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well, but from the list above the only machines missing are AM64 and legacy 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
^^^ Arrgh, good catch - we are indeed missing am64..

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">K2 HK/L/E. And since the assignment is weak (?=), it can still be changed 
from local.conf, as the commit message says.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think we need to drop k2 platforms - they are just bitrotting..

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Anyway, if you don't think making it a bit more generic for ease of 
maintenance is not worth it, then I'm fine with current approach.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmmm.. Your point is to get the weak assignment to allows the critical
mach confs to just override it with =

yeah, I am not exactly a fan of going overboard with entries in machine
file.

I guess I second your thought about including it in ti-soc.inc instead
of machine specific includes to prevent us from messing up and allowing
a little less optimal, but feature rich default.</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>This is clean. Will make the change and re-submit. 
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20210526131846.fo5bood7l2zl2mfi@sanded">
      <pre class="moz-quote-pre" wrap="">


btw, where do we document all these variables that need tweaking?

</pre>
    </blockquote>
  </body>
</html>

--------------3F36D7DEB02AA3FDC8EE69B6--
