Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.1802.1582682127210935358
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 17:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QdozBmnw;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id dw13so556194pjb.4
        for <meta-ti@lists.yoctoproject.org>; Tue, 25 Feb 2020 17:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OIh6M3vAJg51lj/PO1Tga9e14XyntZ2HGswR6lKDbjc=;
        b=QdozBmnw21B4U3rox9REZ+pMVSJuJZip+9jagf9FO1gyalYGuxqgicgA5VjgIabe8a
         zTbHD/5UQVBdAY25m/1ONaTlUu0Il5DTMlcRlQRwGudnWP9C4r77zdSpJdUjRCNa1b+E
         496GBn5MmRc6J/Qf4TpL2clnYVEakaDrGzxT/4+Ys3pVKKIAoVXvOSISLI43qnqY6dF3
         H/VWLA6Ba5pfUnvSLZIIls6tL57gbKCV2vb7o3VDCc43bycYgpAoW+tpAforO3ILsNtd
         uyIWvwhNAAEQ1AKRbT0wJ0335xlOJprG+mALtNSWCNdYdhHH+abGQZHJ0ly6RxHc8PrT
         GdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OIh6M3vAJg51lj/PO1Tga9e14XyntZ2HGswR6lKDbjc=;
        b=MdoDhMmegGzr9d4Pl7kExhXJh33E+8QgcR8Zqjzhg16VGZ6M6hQ93V6PMt3wS3bnGC
         QEUyM7sVxIIL5oOVP7VbGERUI+lr0sWplFW2c2+1h85kP7UHNoY0hm+c9v3o4Y5O4bFa
         Axd8QrUVcuxccBO9jOWLTSGmRp8nQ8dTVW7iyDHI4KynazJ2CKJqIOCJiLIZRbCmzieE
         n52rsDzMTOSEJSnzwV5zTkaWbK3hYYijuD0FVbCELOc2Hhl0rNTX/am8/7fiDq5Ykvl2
         XsjpN18bmD1iov0xBL2usBn/N5ozpxF215L/xnZAFkx8bir8NXnG1UHPdxC3NDIuBtoU
         qJ/w==
X-Gm-Message-State: APjAAAU4k6wpD0TJaw2yHdcTj4HBl0tzSLKrm//QuX0JzmUwQCchYodp
	AW0nkExwlBdMNtGSegoOx6rrdsNxB0k=
X-Google-Smtp-Source: APXvYqxBROw+1aQhgGUYiIPWr+vmXRbv7/oGdjHG7WLLpLjmAInB5rQ5ml0c2rFbvazO5ZH0mo15Iw==
X-Received: by 2002:a17:90a:8545:: with SMTP id a5mr2245156pjw.43.1582682126164;
        Tue, 25 Feb 2020 17:55:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:923a:5c32:ada4:3e27? ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id j17sm386257pfa.16.2020.02.25.17.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2020 17:55:25 -0800 (PST)
Subject: Re: [meta-ti] [master][PATCH] ti-cgt6x: fix packaging issue due to libc.a
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
References: <1582679379-48365-1-git-send-email-denys@ti.com>
 <bbde41fb-0ff0-ad9f-609f-542371a62d9d@gmail.com>
 <20200226013412.GL22188@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <178a642e-c89e-b1f3-53ca-c76a7a554efe@gmail.com>
Date: Tue, 25 Feb 2020 17:55:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226013412.GL22188@beryl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/25/20 5:34 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 25, 2020 at 05:23:48PM -0800, Khem Raj wrote:
>>
>>
>> On 2/25/20 5:09 PM, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
>>> dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a: not a valid ELF file
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>  recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> index c63c3f6..1188b4e 100644
>>> --- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> @@ -100,6 +100,7 @@ FILES_${PN} += "${datadir}/ti/*"
>>>  FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
>>>  
>>>  INSANE_SKIP_${PN} += "staticdev"
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>>  
>>
>> Thanks for taking care of this issue, does it have any downsides, like
>> not stripping binaries which otherwise should have been stripped besides
>> libc.a
> 
> This is C6000 DSP code and is not the main architecture for the platform being 
> built, so standard ARM tools won't be able to handle that anyway. But all the 
> other ARM binaries in that package are not stripped now, unfortunately.
> 

yeah I thought so, and dwarfsrcfiles is quite simplistic, perhaps you
might want to file a defect so we could define a WHITELIST of files in
recipes which should be spared from
stripping

> On the other hand, I'm getting the same error from dwarfsrcfiles on another 
> static .a library from another package, which contains the proper ARM code, 
> which is rather strange. The only suspicious thing there is an empty metafile 
> called ".created", but for now I have to disable stripping there as well...
> 
> 
>>>  BBCLASSEXTEND = "native nativesdk"
>>>  
>>>
>>>
>>> 
>>>
