Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.565.1574707841978621470
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 10:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IoqgFv73;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: j-stiffler@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D217EE00FCC; Mon, 25 Nov 2019 10:50:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5610E00F78
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 10:50:39 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPIocs3125234;
	Mon, 25 Nov 2019 12:50:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574707838;
	bh=m/Nb5rjJptccG5a7/nt51pw1Tr0mAJ9Wq5WHrpqfsJ0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=IoqgFv73m+ndPl+E4pOBOIdxvnaq/Ew+90IJstBHyYFs+BmVY5SWti1jyEedZ6kBn
	 dY1zGH8OovlSNr3Gcc7LF8V8heCRvZWReeClMtBvrG00QDWg2ahu8sP6xJzVZWgsbl
	 BiQO5rdvxyvrEfx2n7rCci1VCX2DBy7HzP1SJm/A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPIoc3d017520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Nov 2019 12:50:38 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 12:50:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 12:50:38 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPIoaVT075535;
	Mon, 25 Nov 2019 12:50:38 -0600
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
To: Khem Raj <raj.khem@gmail.com>
CC: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com>
 <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
 <20191125174203.GC4706@beryl> <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
 <CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <c7b182ec-858d-43b2-7caf-9f12a7fe67d6@ti.com>
Date: Mon, 25 Nov 2019 13:50:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------2CCF400495983BCF015A5F74"
Content-Language: en-US

--------------2CCF400495983BCF015A5F74
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/25/2019 1:16 PM, Khem Raj wrote:
> On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <j-stiffler@ti.com> wrote:
>>
>> On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
>>> On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
>>>> On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
>>>>> Recently individual components and LLD sources have been combined
>>>>> into a single PDK repo. Use this class to specify the common source.
>>>>> Also use this class to keep the sources separate from each other when
>>>>> building. This keeps the build identical to previous recipes while
>>>>> keeping control on interdependencies.
>>>>>
>>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>>> ---
>>> ...
>>>>> +# Extract only required sources from PDK
>>>>> +python do_unpack_append() {
>>>>> +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
>>>>> +        import subprocess
>>>>> +
>>>>> +        src =
>>>>> os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
>>>>> PATH'))
>>>>> +
>>>>> +        # Package up only the required sources
>>>>> +        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
>>>>> d.getVar('S'))
>>>>> +        subprocess.check_output(cmd, shell=True,
>>>>> stderr=subprocess.STDOUT)
>>>>> +
>>>>> +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
>>>>> +}
>>>> perhaps looking in work-shared idea from kernel or gcc or clang
>>>> packages could make it better where, you only untar sources once
>>> Jake,
>>>
>>> Any updates on this - will you be looking into the above suggestion?
>>
>> I had originally considered this approach, but decided against it so
>> that there would be no way a recipe could access other sources in the
>> pdk.git.
>>
>> It may be a bit paranoid, but the work-shared approach would make the
>> entire pdk sources available through a ti-pdk-fetch variable. I wanted
>> it so that the entire pdk.git will never be unpacked in its entirety.
> disk operations are not cheap, so you could save a lot by
> having a monorepo. Is it due to access perms ? then its a single
> tarballs you cant have ACLs. I am still not convinced if monorepo
> approach has downsides, plus its a known approach elsewhere so
> will be easy on users.

We wanted to have this safety net to make sure that this pdk.git does 
not end up as spaghetti code. So this method was devised to ensure that 
only a single component's sources and its DEPENDS are available during 
compilation.

It may be acceptable to clone to the work-shared path, and then symlink 
the specific directory into the WORKDIR. But we will need to remain 
vigilant so that work-shared path is never referenced in the recipe.

>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>>
>> View/Reply Online (#12528): https://lists.yoctoproject.org/g/meta-ti/message/12528
>> Mute This Topic: https://lists.yoctoproject.org/mt/61321552/3619770
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [j-stiffler@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-

--------------2CCF400495983BCF015A5F74
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/25/2019 1:16 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Recently individual components and LLD sources have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Signed-off-by: Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">...
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+# Extract only required sources from PDK
+python do_unpack_append() {
+    if len(d.getVar('TI_PDK_COMP') or '') &gt; 0:
+        import subprocess
+
+        src =
os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
PATH'))
+
+        # Package up only the required sources
+        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
d.getVar('S'))
+        subprocess.check_output(cmd, shell=True,
stderr=subprocess.STDOUT)
+
+        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
+}
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">perhaps looking in work-shared idea from kernel or gcc or clang
packages could make it better where, you only untar sources once
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Jake,

Any updates on this - will you be looking into the above suggestion?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

I had originally considered this approach, but decided against it so
that there would be no way a recipe could access other sources in the
pdk.git.

It may be a bit paranoid, but the work-shared approach would make the
entire pdk sources available through a ti-pdk-fetch variable. I wanted
it so that the entire pdk.git will never be unpacked in its entirety.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
disk operations are not cheap, so you could save a lot by
having a monorepo. Is it due to access perms ? then its a single
tarballs you cant have ACLs. I am still not convinced if monorepo
approach has downsides, plus its a known approach elsewhere so
will be easy on users.
</pre>
    </blockquote>
    <p>We wanted to have this safety net to make sure that this pdk.git
      does not end up as spaghetti code. So this method was devised to
      ensure that only a single component's sources and its DEPENDS are
      available during compilation. <br>
    </p>
    <p>It may be acceptable to clone to the work-shared path, and then
      symlink the specific directory into the WORKDIR. But we will need
      to remain vigilant so that work-shared path is never referenced in
      the recipe.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#12528): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/message/12528">https://lists.yoctoproject.org/g/meta-ti/message/12528</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/61321552/3619770">https://lists.yoctoproject.org/mt/61321552/3619770</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-ti+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/unsub">https://lists.yoctoproject.org/g/meta-ti/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------2CCF400495983BCF015A5F74--
