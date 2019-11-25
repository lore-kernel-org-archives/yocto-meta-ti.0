Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.48.1574705561776448372
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 10:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=prZzsgVY;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: j-stiffler@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A016CE00FCC; Mon, 25 Nov 2019 10:12:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00BC2E00F78
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 10:12:40 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPICdFL072690;
	Mon, 25 Nov 2019 12:12:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574705560;
	bh=5RKq+aTXidLpfMgt9k0xKhYMn5ngIo5+e5ZjdxUrCow=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=prZzsgVYVt6yPRHmYZfFSq0F/lxgiluWJAeWZ3iH0X/h10dUc0U70m39wK5iCcUjU
	 4LFI0onRYKaaX0e4mfqacIPKUgSnu3j75AJ18TWqw5Xqvc1lpbMXSjeXIxL+Mdy6jL
	 As5CCNEyKNr+FgJ8wpwfiV6G3mmZb1l9sLsQvJXo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPICdxM021074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Nov 2019 12:12:39 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 12:12:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 12:12:39 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPICd3d120569;
	Mon, 25 Nov 2019 12:12:39 -0600
Subject: Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
To: Denys Dmytriyenko <denys@ti.com>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@yoctoproject.org>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com>
 <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
 <20191125174203.GC4706@beryl>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
Date: Mon, 25 Nov 2019 13:12:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125174203.GC4706@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
> On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
>> On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
>>> Recently individual components and LLD sources have been combined
>>> into a single PDK repo. Use this class to specify the common source.
>>> Also use this class to keep the sources separate from each other when
>>> building. This keeps the build identical to previous recipes while
>>> keeping control on interdependencies.
>>>
>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>> ---
> ...
>>> +# Extract only required sources from PDK
>>> +python do_unpack_append() {
>>> +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
>>> +        import subprocess
>>> +
>>> +        src =
>>> os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
>>> PATH'))
>>> +
>>> +        # Package up only the required sources
>>> +        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
>>> d.getVar('S'))
>>> +        subprocess.check_output(cmd, shell=True,
>>> stderr=subprocess.STDOUT)
>>> +
>>> +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
>>> +}
>> perhaps looking in work-shared idea from kernel or gcc or clang
>> packages could make it better where, you only untar sources once
> Jake,
>
> Any updates on this - will you be looking into the above suggestion?


I had originally considered this approach, but decided against it so 
that there would be no way a recipe could access other sources in the 
pdk.git.

It may be a bit paranoid, but the work-shared approach would make the 
entire pdk sources available through a ti-pdk-fetch variable. I wanted 
it so that the entire pdk.git will never be unpacked in its entirety.

