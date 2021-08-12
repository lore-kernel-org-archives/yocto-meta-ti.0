Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web11.26420.1628793635980755327
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 11:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=FeVAKUA9;
 spf=pass (domain: amazon.com, ip: 52.95.48.154, mailfrom: prvs=8514718de=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1628793637; x=1660329637;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:subject;
  bh=tWPiWjWQsX/emZ5fzjdiXODRmgTmU66z/EPTNR2a4pQ=;
  b=FeVAKUA9tMW37swMj46d+B5BiTq8ecNJJUeXLA9iF1xKFD0bgTZsShOI
   5pzMAELJAW/iN+XCTsNm44WR/0LyM4zSkChRPyw0vHiIm/iS5Qk6dZVV7
   /P1vSUv/hiPVXbFAFFqrer1303D000jfsFqjOLPZUtu6Jf+EPcq7rcamW
   Y=;
X-IronPort-AV: E=Sophos;i="5.84,316,1620691200"; 
   d="scan'208,217";a="133545352"
Subject: Re: [meta-ti] Correct cross compile toolchain for meta-ti and meta-arago
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 12 Aug 2021 18:40:35 +0000
Received: from EX13MTAUEA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS id D7AFA220144;
	Thu, 12 Aug 2021 18:40:33 +0000 (UTC)
Received: from EX13D10UEA003.ant.amazon.com (10.43.61.26) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 12 Aug 2021 18:40:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D10UEA003.ant.amazon.com (10.43.61.26) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 12 Aug 2021 18:40:33 +0000
Received: from u795025edef875e.ant.amazon.com (10.95.205.23) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Thu, 12 Aug 2021 18:40:32 +0000
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <9Nqj.1628791295114258477.TFr1@lists.yoctoproject.org>
 <20210812181341.GV1528@denix.org>
 <9054b3fc-7510-783a-18bc-fafa338fbdb0@amazon.com>
 <169AA2E061E00355.13770@lists.yoctoproject.org>
 <20210812183606.GZ1528@denix.org>
From: elberger@amazon.com
Organization: Amazon Web Services
Message-ID: <4223995c-aab2-0d66-7e61-2016993beb51@amazon.com>
Date: Thu, 12 Aug 2021 14:40:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812183606.GZ1528@denix.org>
Content-Type: multipart/alternative;
	boundary="------------7B6D873727FA5E55624DA463"
Content-Language: en-US

--------------7B6D873727FA5E55624DA463
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/21 2:36 PM, Denys Dmytriyenko wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Thu, Aug 12, 2021 at 02:34:56PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Aug 12, 2021 at 02:30:17PM -0400, elberger via lists.yoctoproject.org wrote:
>>> On 8/12/21 2:13 PM, Denys Dmytriyenko wrote:
>>>> On Thu, Aug 12, 2021 at 11:01:35AM -0700, elberger via lists.yoctoproject.org wrote:
>>>>> Hello,
>>>>>
>>>>> I am in the process of setting up a new build container for TI targets.
>>>>>
>>>>> This section here
>>>>>
>>>>> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Cross-compile_toolchain
>>>>>
>>>>> Seems to have a conflicting message about versions.  Are the versions in
>>>>> command lines correct or the version number in the initial paragraph?
>>>> See arago-dunfell-config.txt line in the config table - that's the correct one
>>>> and the rest hasn't been updated in a while.
>>>>
>>> Hello Denys,
>>>
>>> I was asking about the compiler toolchain version.  I didn't see it
>>> in the config file.  Maybe not enough sleep on my end.
>> http://arago-project.org/wiki/index.php?title=Setting_Up_Build_Environment&diff=1676&oldid=1675#Available_Layer_Configurations
>>
>> | arago-dunfell-config.txt
>> | Configuration for meta-ti/meta-arago layers matching the "dunfell" stable branch, that corresponds to the Yocto Project version 3.1. Uses Arm 9.2-2019.12
> BTW, that's arago-specific and not really meta-ti related...
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
> 
>
Crystal clear now.  Thank you!



--------------7B6D873727FA5E55624DA463
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/12/21 2:36 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210812183606.GZ1528@denix.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.



On Thu, Aug 12, 2021 at 02:34:56PM -0400, Denys Dmytriyenko wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, Aug 12, 2021 at 02:30:17PM -0400, elberger via lists.yoctoproject.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 8/12/21 2:13 PM, Denys Dmytriyenko wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Thu, Aug 12, 2021 at 11:01:35AM -0700, elberger via lists.yoctoproject.org wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hello,

I am in the process of setting up a new build container for TI targets.

This section here

<a class="moz-txt-link-freetext" href="http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Cross-compile_toolchain">http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Cross-compile_toolchain</a>

Seems to have a conflicting message about versions.  Are the versions in
command lines correct or the version number in the initial paragraph?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">See arago-dunfell-config.txt line in the config table - that's the correct one
and the rest hasn't been updated in a while.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Hello Denys,

I was asking about the compiler toolchain version.  I didn't see it
in the config file.  Maybe not enough sleep on my end.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
<a class="moz-txt-link-freetext" href="http://arago-project.org/wiki/index.php?title=Setting_Up_Build_Environment&amp;diff=1676&amp;oldid=1675#Available_Layer_Configurations">http://arago-project.org/wiki/index.php?title=Setting_Up_Build_Environment&amp;diff=1676&amp;oldid=1675#Available_Layer_Configurations</a>

| arago-dunfell-config.txt
| Configuration for meta-ti/meta-arago layers matching the "dunfell" stable branch, that corresponds to the Yocto Project version 3.1. Uses Arm 9.2-2019.12
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
BTW, that's arago-specific and not really meta-ti related...

--
Regards,
Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denis@denix.org">&lt;denis@denix.org&gt;</a>
PGP: 0x420902729A92C964 - <a class="moz-txt-link-freetext" href="https://denix.org/0x420902729A92C964">https://denix.org/0x420902729A92C964</a>
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p>Crystal clear now.  Thank you!</p>
    <p><br>
    </p>
  </body>
</html>

--------------7B6D873727FA5E55624DA463--
