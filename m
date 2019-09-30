Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A4C1E00B77; Mon, 30 Sep 2019 13:40:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24EF1E00798
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 13:40:27 -0700 (PDT)
Received: by mail-pl1-f196.google.com with SMTP id e5so4343988pls.9
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gdK9mTvtFey7RosXtyoPPOQLe2D8RtJz1FlXcvFtccQ=;
	b=L6Yn7cBCyMpaNPbcFzxWhxR0CDtJk8fh1aGpNTU4QtWLHH03fddTW4AD+0e7OPU0oN
	OsgNH5AYCzyJMj1ZWakJhvgQ+Z/HKpDJh035ZIAdsbxf0gJ5b20uQ/PuNwkuptj4t06E
	jCiKF/HF1OJAiitezKKWXVHN7xY7nmTaXDDv32u4SiBiSG+KlaECT2p0aHrPTtoHL9NM
	RMSpTtxOCGjEJF2tDgVlrNrNGh6Yps9PwkHER83BxfOaEQTFmQd2gaftA78OB1mgwFzQ
	9geAG5Xtc5fMLjWuYwpzCKWycUptpADXwLP0FR0kE2iJ8rP+wt50JNRvadBXp7pMXs4c
	iIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gdK9mTvtFey7RosXtyoPPOQLe2D8RtJz1FlXcvFtccQ=;
	b=BEjXbxPfRnhS4fAjlZgh3d1n5LyfKRUQmWf2/+AgjwnmL3o4Q+jQ41w8BXmFVutu8j
	QjTQjO2BLKLKHjD0zuwFCHcKptYQqzO4oJbU+yyJYrcM4cxFCGRijWG+6tVs9PysJB/c
	eLHqJMIlB2YS9E0n72hg/95gpdtKhOW8OqWwIJjxfx3QrOE0RAPVdfko/hzF82RK4j2u
	qhAtfn0Sj+50Lknqz6jjDW9waIx3z33wc9oU7WEwi3TSHCUb6ffQCIahtipSjE3TJ/Nd
	zhsz23GzQd78fGI8numK8DhEeicRF8SyZz0sg5leO/Y8EmquXQzS338k2TyJdNmhaHb1
	9L4g==
X-Gm-Message-State: APjAAAWTxI8Ej+bNqab0MqROTRL20O8aNzEoCNZPK1VD6gB2i4EdKxQG
	43IbJqozRTjh/ivA7TRq9XmiiMoY/jA=
X-Google-Smtp-Source: APXvYqwpoE90X/KqPP6ItWvyqh1x4bque5C1/s6QWGihjAiKN6UeVfIrMHaYrqhJI+NUxrDYI09Tsw==
X-Received: by 2002:a17:902:a9cb:: with SMTP id
	b11mr2040210plr.340.1569876026089; 
	Mon, 30 Sep 2019 13:40:26 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20::c343? ([2601:646:8500:1c20::c343])
	by smtp.gmail.com with ESMTPSA id
	o24sm14409656pgj.41.2019.09.30.13.40.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 30 Sep 2019 13:40:25 -0700 (PDT)
To: Denys Dmytriyenko <denys@ti.com>
References: <20190929154335.2646732-1-raj.khem@gmail.com>
	<20190929154335.2646732-3-raj.khem@gmail.com>
	<20190930183244.GB12684@beryl>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <83d37389-25a3-bc84-1a98-3e5670dc25f6@gmail.com>
Date: Mon, 30 Sep 2019 13:40:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930183244.GB12684@beryl>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] beaglebone-getting-started: Mention CC-BY-SA-3.0 and correct GPL version
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2019 20:40:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/30/19 11:32 AM, Denys Dmytriyenko wrote:
> On Sun, Sep 29, 2019 at 08:43:35AM -0700, Khem Raj wrote:
>> This is as per
>> https://github.com/jadonk/beaglebone-getting-started/blob/master/LICENSE.txt
> 
> You are looking at the latest LICENSE file, while the recipe hasn't updated 
> its SRCREV since early 2012, back when beagleboard.org was still active in OE. 
> Specifically, GPLv3+ was added in 2013:
> https://github.com/jadonk/beaglebone-getting-started/commits/master/LICENSE.txt
> 
> We don't use this package, but I kept it in case someone still needs it. I did 
> put a README with a note in that directory:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README
> 
> Probably, this can be updated to the latest, as part of fixing the LICENSE? :)
> 

The README should be specific about which recipes are not maintained, it
has a general statement which gives a scare, if the recipe is not
maintained then this should be removed or atleast blacklisted if you
still want to keep it around.

I was trying to help clearing up license warnings, other than that I
dont have any interest in this recipe.

I can send a patch to blacklist it if thats fine with you.

> Denys
> 
> 
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
>> index 6c61a4e9..c86e3518 100644
>> --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
>> +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
>> @@ -4,7 +4,7 @@ PR = "r21"
>>  
>>  inherit allarch
>>  
>> -LICENSE = "GPLv2+ & MIT & PD & others"
>> +LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD & others"
>>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
>>  
>>  SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
>> -- 
>> 2.23.0
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

