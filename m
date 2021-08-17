Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
 by mx.groups.io with SMTP id smtpd.web09.39493.1629208784886312638
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 06:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@amazon.com header.s=amazon201209 header.b=rQVs1oMG;
 spf=pass (domain: amazon.com, ip: 207.171.188.200, mailfrom: prvs=856554f49=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1629208784; x=1660744784;
  h=to:references:from:message-id:date:mime-version:
   in-reply-to:subject;
  bh=opkkk68HY9rG5wkOmXIR5MKEviNb3Sa5Arkb4z85hRI=;
  b=rQVs1oMGTqdduZ+6sCl+Ml/q7savMKVCCQxKoL6jJTrT5zCp0gAh8hUT
   m2M6RHgx3y3CJVco/a8COOONZPbw/XsoNZ2P4p+qL5mlV2McoAMRM3QVH
   f1vYVkl2ce4IN3HituUCssEzd678NsoW+Rc7EKRuoTlRJ/nT8qkb1ZAja
   Y=;
X-IronPort-AV: E=Sophos;i="5.84,329,1620691200"; 
   d="scan'208,217";a="950990092"
Subject: Re: [meta-ti] Correct MACHINE for
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 17 Aug 2021 13:59:43 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
	by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS id 24838100274
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Aug 2021 13:59:42 +0000 (UTC)
Received: from EX13D37UWA004.ant.amazon.com (10.43.160.23) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 13:59:42 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D37UWA004.ant.amazon.com (10.43.160.23) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 13:59:42 +0000
Received: from u795025edef875e.ant.amazon.com (10.106.179.6) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 17 Aug 2021 13:59:42 +0000
To: <meta-ti@lists.yoctoproject.org>
References: <169C19A45CFCB862.13456@lists.yoctoproject.org>
From: elberger@amazon.com
Organization: Amazon Web Services
Message-ID: <b0f6f1d9-ecfa-de41-5275-d472f84e5305@amazon.com>
Date: Tue, 17 Aug 2021 09:59:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <169C19A45CFCB862.13456@lists.yoctoproject.org>
Content-Type: multipart/alternative;
	boundary="------------EE694B7D36DE3D0351EAFA65"
Content-Language: en-US

--------------EE694B7D36DE3D0351EAFA65
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Nevermind I see it on master branch.

Bummer it seems like I cannot use it for the LTS branch. Is there any 
plan for that?

On 8/17/21 9:02 AM, elberger via lists.yoctoproject.org wrote:
> CAUTION: This email originated from outside of the organization. Do 
> not click links or open attachments unless you can confirm the sender 
> and know the content is safe.
>
>
>
> Hello
>
> I am looking for the correct MACHINE config for the TMDS64GPEVM.
>
> At this page I do not see any reference to TMDS64GPEVM.
>
> https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference 
>
>
> This is the SDK that the board's page points to from here
>
> https://www.ti.com/tool/TMDS64GPEVM
>
> I am also cloning the SDK using the processor-sdk-dunfell-07.01.00.txt
> config if that makes a difference.  Perhaps the configuration is on a
> different branch.
>
> Thank you
>
>
>
> 
>

-- 
Richard Elberger
Principal Technologist
AWS IoT

+1 646.927.6897
+1 203.942.8039 – mobile
elberger@amazon.com – email


--------------EE694B7D36DE3D0351EAFA65
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Nevermind I see it on master branch.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Bummer it seems like I cannot use it
      for the LTS branch. Is there any plan for that?<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 8/17/21 9:02 AM, elberger via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:169C19A45CFCB862.13456@lists.yoctoproject.org">CAUTION:
      This email originated from outside of the organization. Do not
      click links or open attachments unless you can confirm the sender
      and know the content is safe.
      <br>
      <br>
      <br>
      <br>
      Hello
      <br>
      <br>
      I am looking for the correct MACHINE config for the TMDS64GPEVM.
      <br>
      <br>
      At this page I do not see any reference to TMDS64GPEVM.
      <br>
      <br>
<a class="moz-txt-link-freetext" href="https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference">https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference</a>
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
      config if that makes a difference.  Perhaps the configuration is
      on a
      <br>
      different branch.
      <br>
      <br>
      Thank you
      <br>
      <br>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Richard Elberger
Principal Technologist
AWS IoT

+1 646.927.6897
+1 203.942.8039 – mobile
<a class="moz-txt-link-abbreviated" href="mailto:elberger@amazon.com">elberger@amazon.com</a> – email</pre>
  </body>
</html>

--------------EE694B7D36DE3D0351EAFA65--
