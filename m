Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.10381.1605211976108189226
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 12:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OZOjQGnN;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id ADB8D38C11C6
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 20:12:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACKCs5n105590
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 14:12:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605211974;
	bh=EPa35fv1PgOH7pvcfrjcMIp7Ra09/ceXVGd47chHXZE=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=OZOjQGnNJ+zh8fc4MksUeZo+VothgoHNs70qrwTi4p4o9I2H4BOHBldILajgHSwjv
	 dsvp7vaPIvqk4oxx1XkSLfgzdK3d6N4Z+j4vGZwVBLXTE7XOS+6BEPgZcePRlygd6g
	 74nPw5WFTLVS77v8QgnjlqmrLYSyK6vN4/OzPpT4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACKCstx076214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 14:12:54 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 14:12:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 14:12:54 -0600
Received: from [10.250.39.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACKCsx0085689;
	Thu, 12 Nov 2020 14:12:54 -0600
Subject: Re: [meta-ti][dunfell PATCH] k3conf: Update SRCREV to latest
From: "Dan Murphy" <dmurphy@ti.com>
To: Suman Anna <s-anna@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@yoctoproject.org>
References: <20201112134841.7108-1-s-anna@ti.com>
 <f4dd7293-6aad-aa09-c962-f6a2cc02b91f@ti.com>
 <f34c286b-91fe-b516-c34a-506c71f86278@ti.com>
Message-ID: <53f2f60f-4a86-7475-bd3d-e3b2317ccfc3@ti.com>
Date: Thu, 12 Nov 2020 14:12:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f34c286b-91fe-b516-c34a-506c71f86278@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------58982816173083ED2F41BC78"
Content-Language: en-US

--------------58982816173083ED2F41BC78
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Suman

On 11/12/20 9:21 AM, Dan Murphy wrote:
> Suman
>
> On 11/12/20 7:54 AM, Suman Anna wrote:
>> On 11/12/20 7:48 AM, Suman Anna wrote:
>>> Use latest SRCREV on master branch to pick up all the
>>> changes compliant with TIFS 2020.08b firmware.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>> Hi Dan,
>>>
>>> Please pick this up for 07.01.00.006. Will submit a separate patch
>>> for master, looks like Nikhil missed one update to master branch.
>> Sorry, my bad, I take this back, my local master branch was not 
>> up-to-date. This
>> is applicable for master as well.
>>
> OK it is applied to -next and will be pushed shortly
>
> Dan
>
Patch failed to build due to checksum mismatch on the License file due 
to this commit 
https://git.ti.com/gitweb?p=k3conf/k3conf.git;a=commit;h=bf1b4143e0065fb119766c2dddd8c08fb5ded7a9

ERROR: QA Issue: k3conf: The LIC_FILES_CHKSUM does not match for file://common/k3conf.c;beginline=1;endline=34;md5=37f4e460bd8501c6f02ce71f02bc7ccf
k3conf: The new md5 checksum is 7154c0ffcd418064ffa528e34e70ca9d

Dan


--------------58982816173083ED2F41BC78
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Suman</p>
    <div class="moz-cite-prefix">On 11/12/20 9:21 AM, Dan Murphy wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f34c286b-91fe-b516-c34a-506c71f86278@ti.com">Suman
      <br>
      <br>
      On 11/12/20 7:54 AM, Suman Anna wrote:
      <br>
      <blockquote type="cite">On 11/12/20 7:48 AM, Suman Anna wrote:
        <br>
        <blockquote type="cite">Use latest SRCREV on master branch to
          pick up all the
          <br>
          changes compliant with TIFS 2020.08b firmware.
          <br>
          <br>
          Signed-off-by: Suman Anna <a class="moz-txt-link-rfc2396E" href="mailto:s-anna@ti.com">&lt;s-anna@ti.com&gt;</a>
          <br>
          ---
          <br>
          Hi Dan,
          <br>
          <br>
          Please pick this up for 07.01.00.006. Will submit a separate
          patch
          <br>
          for master, looks like Nikhil missed one update to master
          branch.
          <br>
        </blockquote>
        Sorry, my bad, I take this back, my local master branch was not
        up-to-date. This
        <br>
        is applicable for master as well.
        <br>
        <br>
      </blockquote>
      OK it is applied to -next and will be pushed shortly
      <br>
      <br>
      Dan
      <br>
      <br>
    </blockquote>
    <p>Patch failed to build due to checksum mismatch on the License
      file due to this commit
<a class="moz-txt-link-freetext" href="https://git.ti.com/gitweb?p=k3conf/k3conf.git;a=commit;h=bf1b4143e0065fb119766c2dddd8c08fb5ded7a9">https://git.ti.com/gitweb?p=k3conf/k3conf.git;a=commit;h=bf1b4143e0065fb119766c2dddd8c08fb5ded7a9</a><br>
    </p>
    <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">ERROR: QA Issue: k3conf: The LIC_FILES_CHKSUM does not match for <a class="moz-txt-link-freetext" href="file://common/k3conf.c;beginline=1;endline=34;md5=37f4e460bd8501c6f02ce71f02bc7ccf">file://common/k3conf.c;beginline=1;endline=34;md5=37f4e460bd8501c6f02ce71f02bc7ccf</a>
k3conf: The new md5 checksum is 7154c0ffcd418064ffa528e34e70ca9d

Dan
</pre>
  </body>
</html>

--------------58982816173083ED2F41BC78--
