Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.13410.1603293422953561321
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 08:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f4RZOuOt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LFH1w9110623;
	Wed, 21 Oct 2020 10:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603293421;
	bh=ZQo1kdI9KABn6BnYYSSW3IujXTGejc4C7tiVKd7o9lI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=f4RZOuOt9LOunE+QqX6XuAexWejVcAWMbWrF8DAWfQDjT/gtIFwRjiKwhQd5W8weV
	 jWFlQdBBKE+HhfcICLEjfLrXoZ1Mm43VGq4NEXXatJzx/Jf80MNvwUkysnWrL6fgKc
	 hlJgmEEEllhkorv8qkli5vflGHJvA/ywgRMRPXb0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LFH1hx095941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Oct 2020 10:17:01 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 10:17:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 10:17:01 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LFH0ue001175;
	Wed, 21 Oct 2020 10:17:01 -0500
Subject: Re: [meta-ti] [PATCH] layer.conf: Add gatesgarth to LAYERSERIES_COMPAT
To: <denys@ti.com>, Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201020181601.29276-1-raj.khem@gmail.com>
 <20201020184341.GB14852@beryl> <0fc0e5e9-005d-02a5-687d-aeb0cb89c4e8@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <56d43279-dbc4-92b0-67dd-70bb4289e355@ti.com>
Date: Wed, 21 Oct 2020 10:17:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0fc0e5e9-005d-02a5-687d-aeb0cb89c4e8@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------9FC0E64303340E5D3790C8B5"
Content-Language: en-US

--------------9FC0E64303340E5D3790C8B5
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Khem

On 10/20/20 2:17 PM, Dan Murphy via lists.yoctoproject.org wrote:
> Hello
>
> On 10/20/20 1:43 PM, Denys Dmytriyenko via lists.yoctoproject.org wrote:
>> On Tue, Oct 20, 2020 at 11:16:01AM -0700, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Reviewed-by: Denys Dmytriyenko <denys@ti.com>
>>
>> Only applicable to master.
>
> Applied to master only
>
This causes a build failure on master

ERROR: Layer meta-python is not compatible with the core layer which only supports these series: gatesgarth (layer is compatible with warrior thud dunfell zeus)


> Dan
>
>
> 
>

--------------9FC0E64303340E5D3790C8B5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Khem<br>
    </p>
    <div class="moz-cite-prefix">On 10/20/20 2:17 PM, Dan Murphy via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0fc0e5e9-005d-02a5-687d-aeb0cb89c4e8@ti.com">Hello
      <br>
      <br>
      On 10/20/20 1:43 PM, Denys Dmytriyenko via lists.yoctoproject.org
      wrote:
      <br>
      <blockquote type="cite">On Tue, Oct 20, 2020 at 11:16:01AM -0700,
        Khem Raj wrote:
        <br>
        <blockquote type="cite">Signed-off-by: Khem Raj
          <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
          <br>
        </blockquote>
        Reviewed-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
        <br>
        <br>
        Only applicable to master.
        <br>
      </blockquote>
      <br>
      Applied to master only
      <br>
      <br>
    </blockquote>
    <p>This causes a build failure on master</p>
    <pre class="console-output" style="box-sizing: border-box; white-space: pre-wrap; overflow-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">ERROR: Layer meta-python is not compatible with the core layer which only supports these series: gatesgarth (layer is compatible with warrior thud dunfell zeus)</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:0fc0e5e9-005d-02a5-687d-aeb0cb89c4e8@ti.com">Dan
      <br>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9FC0E64303340E5D3790C8B5--
