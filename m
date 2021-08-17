Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by mx.groups.io with SMTP id smtpd.web12.41472.1629216313460662156
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 09:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=tWqIbl9I;
 spf=pass (domain: amazon.com, ip: 72.21.196.25, mailfrom: prvs=856554f49=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1629216314; x=1660752314;
  h=to:references:from:message-id:date:mime-version:
   in-reply-to:subject;
  bh=6SBKLq0AH+KL+afx1ZXd6pTx8BrgZWrIs6/Bht7llvc=;
  b=tWqIbl9IofzBb2Wn4jy6WFLGlt1DWUEUP5aR6UATuHBQGumO0OvLuv8y
   6jw3bcPbdxXCorjGtxLom2YHe54Y0fNln/HlCwJbSzq/tTodZ93b570Kh
   0mBE/zk3EU9bmLKiWn5/FwOVgurV5QhilvVRbZE/nJeVlYXM0S3fMKhqt
   I=;
X-IronPort-AV: E=Sophos;i="5.84,329,1620691200"; 
   d="scan'208,217";a="130031907"
Subject: Re: [meta-ti] Correct MACHINE for
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 17 Aug 2021 16:05:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS id 3D8E2A1C45;
	Tue, 17 Aug 2021 16:05:11 +0000 (UTC)
Received: from EX13D47UWA002.ant.amazon.com (10.43.163.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 16:05:11 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D47UWA002.ant.amazon.com (10.43.163.30) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 16:05:09 +0000
Received: from u795025edef875e.ant.amazon.com (10.106.179.6) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 17 Aug 2021 16:05:09 +0000
To: <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <169C19A45CFCB862.13456@lists.yoctoproject.org>
 <b0f6f1d9-ecfa-de41-5275-d472f84e5305@amazon.com>
 <7729788a-f9fe-689d-2a1f-b18e72fd9cd6@ti.com>
From: elberger@amazon.com
Organization: Amazon Web Services
Message-ID: <cfc8df2d-ce8f-6b4b-d88a-1d4927a6e001@amazon.com>
Date: Tue, 17 Aug 2021 12:05:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7729788a-f9fe-689d-2a1f-b18e72fd9cd6@ti.com>
Content-Type: multipart/alternative;
	boundary="------------EBC7E0355206839A91AA5D16"
Content-Language: en-US

--------------EBC7E0355206839A91AA5D16
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ok wow that SDK version was released only 6 days ago.  Totally missed 
it.  Thank you.

On 8/17/21 11:43 AM, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> CAUTION: This email originated from outside of the organization. Do 
> not click links or open attachments unless you can confirm the sender 
> and know the content is safe.
> )
>
>
> Hi,
>
> On 17/08/21 7:29 pm, elberger via lists.yoctoproject.org wrote:
>> Nevermind I see it on master branch.
>>
>> Bummer it seems like I cannot use it for the LTS branch. Is there any
>> plan for that?
>>
>
> You should see the machine am64xx-evm
> The latest SDK release for AM64 Linux is 08.00.00.21  (based on 2021 LTS
> kernel)
>
> You can find config file at [1]
> and the latest release page at [2]
>
> [1]
> https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt 
>
> [2] 
> https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM64X#release-notes
>
> Regards,
> Nikhil D
>
>
>> On 8/17/21 9:02 AM, elberger via lists.yoctoproject.org wrote:
>>> CAUTION: This email originated from outside of the organization. Do
>>> not click links or open attachments unless you can confirm the sender
>>> and know the content is safe.
>>>
>>>
>>>
>>> Hello
>>>
>>> I am looking for the correct MACHINE config for the TMDS64GPEVM.
>>>
>>> At this page I do not see any reference to TMDS64GPEVM.
>>>
>>> https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference 
>>>
>>>
>>>
>>> This is the SDK that the board's page points to from here
>>>
>>> https://www.ti.com/tool/TMDS64GPEVM
>>>
>>> I am also cloning the SDK using the processor-sdk-dunfell-07.01.00.txt
>>> config if that makes a difference.  Perhaps the configuration is on a
>>> different branch.
>>>
>>> Thank you
>>>
>>>
>>>
>>
>>
>>
>>
>>
>
> 
>


--------------EBC7E0355206839A91AA5D16
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Ok wow that SDK version was released
      only 6 days ago.  Totally missed it.  Thank you.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 8/17/21 11:43 AM, Nikhil Devshatwar
      via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7729788a-f9fe-689d-2a1f-b18e72fd9cd6@ti.com">CAUTION:
      This email originated from outside of the organization. Do not
      click links or open attachments unless you can confirm the sender
      and know the content is safe.
      <br>
      )
      <br>
      <br>
      <br>
      Hi,
      <br>
      <br>
      On 17/08/21 7:29 pm, elberger via lists.yoctoproject.org wrote:
      <br>
      <blockquote type="cite">Nevermind I see it on master branch.
        <br>
        <br>
        Bummer it seems like I cannot use it for the LTS branch. Is
        there any
        <br>
        plan for that?
        <br>
        <br>
      </blockquote>
      <br>
      You should see the machine am64xx-evm
      <br>
      The latest SDK release for AM64 Linux is 08.00.00.21  (based on
      2021 LTS
      <br>
      kernel)
      <br>
      <br>
      You can find config file at [1]
      <br>
      and the latest release page at [2]
      <br>
      <br>
      [1]
      <br>
<a class="moz-txt-link-freetext" href="https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt">https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt</a>
      <br>
      [2]
      <a class="moz-txt-link-freetext" href="https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM64X#release-notes">https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM64X#release-notes</a>
      <br>
      <br>
      Regards,
      <br>
      Nikhil D
      <br>
      <br>
      <br>
      <blockquote type="cite">On 8/17/21 9:02 AM, elberger via
        lists.yoctoproject.org wrote:
        <br>
        <blockquote type="cite">CAUTION: This email originated from
          outside of the organization. Do
          <br>
          not click links or open attachments unless you can confirm the
          sender
          <br>
          and know the content is safe.
          <br>
          <br>
          <br>
          <br>
          Hello
          <br>
          <br>
          I am looking for the correct MACHINE config for the
          TMDS64GPEVM.
          <br>
          <br>
          At this page I do not see any reference to TMDS64GPEVM.
          <br>
          <br>
<a class="moz-txt-link-freetext" href="https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference">https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference</a>
          <br>
          <br>
          <br>
          This is the SDK that the board's page points to from here
          <br>
          <br>
          <a class="moz-txt-link-freetext" href="https://www.ti.com/tool/TMDS64GPEVM">https://www.ti.com/tool/TMDS64GPEVM</a>
          <br>
          <br>
          I am also cloning the SDK using the
          processor-sdk-dunfell-07.01.00.txt
          <br>
          config if that makes a difference.  Perhaps the configuration
          is on a
          <br>
          different branch.
          <br>
          <br>
          Thank you
          <br>
          <br>
          <br>
          <br>
        </blockquote>
        <br>
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EBC7E0355206839A91AA5D16--
