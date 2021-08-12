Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by mx.groups.io with SMTP id smtpd.web08.26270.1628793020457773850
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 11:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=A1ey/Jyp;
 spf=pass (domain: amazon.com, ip: 72.21.196.25, mailfrom: prvs=8514718de=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1628793020; x=1660329020;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:subject;
  bh=YGl2KZykAZD/9br4dm5PC2Km+VxlTV1IMpvVx+UBWGE=;
  b=A1ey/JypuK1aPUKw8An3ITD6/UPeP5TTSsjmCyjANp7PkkgU4OCFbwBr
   IpjqETKGB98s9w4EO1vpJACZLpQSOVlDFW0l8WH4goaXT5K8sZZE2PxLt
   xy9JnBYa9+NpCdtcnWX5PJ4fus1XOVzpk6OQlN+rHEVsjGGUl8Xp7TAtq
   Y=;
X-IronPort-AV: E=Sophos;i="5.84,316,1620691200"; 
   d="scan'208,217";a="129084361"
Subject: Re: [meta-ti] Correct cross compile toolchain for meta-ti and meta-arago
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 12 Aug 2021 18:30:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
	by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS id 99604140BBC;
	Thu, 12 Aug 2021 18:30:18 +0000 (UTC)
Received: from EX13D31UEA002.ant.amazon.com (10.43.61.73) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 12 Aug 2021 18:30:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D31UEA002.ant.amazon.com (10.43.61.73) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 12 Aug 2021 18:30:17 +0000
Received: from u795025edef875e.ant.amazon.com (10.95.205.23) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Thu, 12 Aug 2021 18:30:17 +0000
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <9Nqj.1628791295114258477.TFr1@lists.yoctoproject.org>
 <20210812181341.GV1528@denix.org>
From: elberger@amazon.com
Organization: Amazon Web Services
Message-ID: <9054b3fc-7510-783a-18bc-fafa338fbdb0@amazon.com>
Date: Thu, 12 Aug 2021 14:30:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812181341.GV1528@denix.org>
Content-Type: multipart/alternative;
	boundary="------------A456B53BDA866247EA73BB4D"
Content-Language: en-US

--------------A456B53BDA866247EA73BB4D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/21 2:13 PM, Denys Dmytriyenko wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Thu, Aug 12, 2021 at 11:01:35AM -0700, elberger via lists.yoctoproject.org wrote:
>> Hello,
>>
>> I am in the process of setting up a new build container for TI targets.
>>
>> This section here
>>
>> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Cross-compile_toolchain
>>
>> Seems to have a conflicting message about versions.  Are the versions in
>> command lines correct or the version number in the initial paragraph?
> See arago-dunfell-config.txt line in the config table - that's the correct one
> and the rest hasn't been updated in a while.
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
> 
>
Hello Denys,

I was asking about the compiler toolchain version.  I didn't see it in 
the config file.  Maybe not enough sleep on my end.

Thank you



--------------A456B53BDA866247EA73BB4D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/12/21 2:13 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210812181341.GV1528@denix.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.



On Thu, Aug 12, 2021 at 11:01:35AM -0700, elberger via lists.yoctoproject.org wrote:
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
      <pre class="moz-quote-pre" wrap="">
See arago-dunfell-config.txt line in the config table - that's the correct one
and the rest hasn't been updated in a while.

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
    <p>Hello Denys,</p>
    <p>I was asking about the compiler toolchain version.  I didn't see
      it in the config file.  Maybe not enough sleep on my end.<br>
    </p>
    <p>Thank you</p>
    <p><br>
    </p>
  </body>
</html>

--------------A456B53BDA866247EA73BB4D--
