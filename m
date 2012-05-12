Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0088E00746
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 18:21:44 -0700 (PDT)
Received: by eaab16 with SMTP id b16so1345067eaa.35
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LSJJpkqp4qDjessf0njrImdUwuNvNGWwHd9WkN+l44o=;
	b=tUv+AByY4q3CKkppiU0sufn1PEYLDDEmVGCerVGabIpFFuW7ithkWtqhzf+8zHnqJ+
	U3LdEsXGhoC7juK8YrLlFC9qvIIxvN0qQvYEsRuCz11AhC1d9i7rXXIP/73KGZOTYzOa
	QLJ4+i+Oo5ZMmTmxta9eEEYat6xq4KuC/Blm8bfK+udqj6rhvnys4GYbJDSIqBXtvzCX
	5hyjR28r45xIuYR43jKFCuSg7HleV8kRGJidOSvgPVvaP+60AIsiHjOUAm1c7EfurJUN
	yD8dAcfSQsd8xuGvZAF+qrf8Hml8UnY3u8sMnEB33WORgKrZCOsmlzWuV/gZk2nfRYLB
	BeGg==
Received: by 10.213.115.193 with SMTP id j1mr27853ebq.141.1336785703225; Fri,
	11 May 2012 18:21:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Fri, 11 May 2012 18:21:12 -0700 (PDT)
In-Reply-To: <F63AF365-5587-4FDC-A8CC-F47BD2E01DB8@dominion.thruhere.net>
References: <1336704080-23643-1-git-send-email-denis@denix.org>
	<F63AF365-5587-4FDC-A8CC-F47BD2E01DB8@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2012 18:21:12 -0700
Message-ID: <CAMKF1spefVF84MbRzjgjwKk71dwGP5FcUH5+RsbnCBFLHfO81A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 12 May 2012 01:21:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 10, 2012 at 11:46 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 11 mei 2012, om 04:41 heeft Denys Dmytriyenko het volgende geschreven:
>
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> BeagleBone kernel is required to be built in Thumb2 mode for fast boot.
>> Gold linker is not yet perfect for this, giving an internal error:
>>
>> | arm-linux-gnueabi-ld: internal error in thumb_branch_common, at .../binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149
>>
>> While this fix can be put in generic linux.inc for all the kernels, it's
>> better to test the Gold linker out as much as possible and only disable it
>> for known issues, like this one (until it gets fixed, of course).
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> Looks good to me.

OK here is blind shot. Try this binutils patch and let me know if it helps.

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gold&id=b72f3238ad32ab420306a0226d8c2e57c52ddf45

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

