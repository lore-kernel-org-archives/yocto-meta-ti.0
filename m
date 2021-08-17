Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web09.42361.1629220776474988960
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 10:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=pQ1ytpil;
 spf=pass (domain: amazon.com, ip: 99.78.197.218, mailfrom: prvs=856554f49=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1629220776; x=1660756776;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=3aY8DmRYnoHA0des4cW7Ph0Tog8Xgvg7ayApyY5JlfY=;
  b=pQ1ytpilbPh+EI+oBCVKPK3038s4zXo+OMRa/i8Jh+wawqXYfiyHtsH6
   mWSBRg2K7hIr9shMuiRCeVw3VCJI9SD94kNHC1Z8lld2kzSuvRfQpuwjs
   gUXXUFtOhgx/xMl6CjmqA9iA5+otzrhD2Am4waJINgPawrUVUhtPCeQvo
   8=;
X-IronPort-AV: E=Sophos;i="5.84,329,1620691200"; 
   d="scan'208";a="19839468"
Subject: Re: [meta-ti] Correct MACHINE for
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP; 17 Aug 2021 17:19:35 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
	by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS id 42A6AA04E0;
	Tue, 17 Aug 2021 17:19:33 +0000 (UTC)
Received: from EX13D43UWA004.ant.amazon.com (10.43.160.108) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 17:19:33 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D43UWA004.ant.amazon.com (10.43.160.108) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 17:19:33 +0000
Received: from u795025edef875e.ant.amazon.com (10.106.179.6) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 17 Aug 2021 17:19:33 +0000
To: Denys Dmytriyenko <denis@denix.org>
CC: <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <169C19A45CFCB862.13456@lists.yoctoproject.org>
 <b0f6f1d9-ecfa-de41-5275-d472f84e5305@amazon.com>
 <7729788a-f9fe-689d-2a1f-b18e72fd9cd6@ti.com>
 <cfc8df2d-ce8f-6b4b-d88a-1d4927a6e001@amazon.com>
 <20210817171500.GF1528@denix.org>
From: elberger@amazon.com
Organization: Amazon Web Services
Message-ID: <63e3781c-79ba-6930-657e-3151e45a663d@amazon.com>
Date: Tue, 17 Aug 2021 13:19:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817171500.GF1528@denix.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/17/21 1:15 PM, Denys Dmytriyenko wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Tue, Aug 17, 2021 at 12:05:08PM -0400, elberger via lists.yoctoproject.org wrote:
>> Ok wow that SDK version was released only 6 days ago.  Totally
>> missed it.  Thank you.
> FWIW, according to the config at [1], this SDK release is based on
> 08.00.00.004 tag in meta-ti/meta-arago, applied about 4 weeks ago.
> And meta-processor-sdk adds extra OOBE enhancements on top of that.
>
>
>> On 8/17/21 11:43 AM, Nikhil Devshatwar via lists.yoctoproject.org wrote:
>>> CAUTION: This email originated from outside of the organization.
>>> Do not click links or open attachments unless you can confirm the
>>> sender and know the content is safe.
>>> )
>>>
>>>
>>> Hi,
>>>
>>> On 17/08/21 7:29 pm, elberger via lists.yoctoproject.org wrote:
>>>> Nevermind I see it on master branch.
>>>>
>>>> Bummer it seems like I cannot use it for the LTS branch. Is there any
>>>> plan for that?
>>>>
>>> You should see the machine am64xx-evm
>>> The latest SDK release for AM64 Linux is 08.00.00.21  (based on 2021 LTS
>>> kernel)
>>>
>>> You can find config file at [1]
>>> and the latest release page at [2]
>>>
>>> [1]
>>> https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
>>>
>>> [2] https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM64X#release-notes
>>>
>>> Regards,
>>> Nikhil D
>>>
>>>
>>>> On 8/17/21 9:02 AM, elberger via lists.yoctoproject.org wrote:
>>>>> CAUTION: This email originated from outside of the organization. Do
>>>>> not click links or open attachments unless you can confirm the sender
>>>>> and know the content is safe.
>>>>>
>>>>>
>>>>>
>>>>> Hello
>>>>>
>>>>> I am looking for the correct MACHINE config for the TMDS64GPEVM.
>>>>>
>>>>> At this page I do not see any reference to TMDS64GPEVM.
>>>>>
>>>>> https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference
>>>>>
>>>>>
>>>>>
>>>>> This is the SDK that the board's page points to from here
>>>>>
>>>>> https://www.ti.com/tool/TMDS64GPEVM
>>>>>
>>>>> I am also cloning the SDK using the processor-sdk-dunfell-07.01.00.txt
>>>>> config if that makes a difference.  Perhaps the configuration is on a
>>>>> different branch.
>>>>>
>>>>> Thank you
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

Thank you for the detail - was going by the release date here:

https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-RT-AM64X#release-notes

It is still relatively bleeding edge. And it's good to see TI putting a 
lot of energy into these new processors.


