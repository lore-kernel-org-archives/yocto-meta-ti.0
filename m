Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4466.1604008227061091442
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 14:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WMDIDrEF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TLoPTp012690;
	Thu, 29 Oct 2020 16:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604008225;
	bh=HU8ogFz0PpI4U8NTiY2TUbbMds8ytZ5OveejhFOJ2jI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WMDIDrEF+9glEv9p6ZdbmZ47gHiUdE0j/prxxOenL5ApqKJ47RJEnEbqDmHSE6JUj
	 va38AZrOJx6Br1s7pPVJDE9aDFruzjNFstJja463L1N9Iobab3B4IzwSRZ9etcjLjg
	 Tswh+MyEPbzTjufixpYiK3XHlj+OOa4pYkPH0Y0Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TLoPsO098143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 16:50:25 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 16:50:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 16:50:24 -0500
Received: from [10.250.64.251] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TLoOnZ026507;
	Thu, 29 Oct 2020 16:50:24 -0500
Subject: Re: [meta-ti] [PATCH 1/2] ti-rpmsg-char-examples: Fix cross compile
To: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201026212000.GO19741@beryl>
 <CAMKF1spoTDFaNBAgBmq2NV4Yx3D=UD9OK7Nb7yJUkenvnv=Smw@mail.gmail.com>
 <1641B93D38E82508.16876@lists.yoctoproject.org>
 <20201029180925.GI15849@beryl>
 <CAMKF1srgwQaoEWowG11HfJN+vo2+tBHm4Bhr0K5VP6YXa6f+Cg@mail.gmail.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <9a91ee70-70f0-e350-f81e-94ea7927e302@ti.com>
Date: Thu, 29 Oct 2020 16:50:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srgwQaoEWowG11HfJN+vo2+tBHm4Bhr0K5VP6YXa6f+Cg@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 10/29/20 3:09 PM, Khem Raj wrote:
> On Thu, Oct 29, 2020 at 11:09 AM Denys Dmytriyenko <denys@ti.com> wrote:
>>
>> On Mon, Oct 26, 2020 at 10:43:32PM -0400, Denys Dmytriyenko via lists.yoctoproject.org wrote:
>>> On Mon, Oct 26, 2020 at 04:24:11PM -0700, Khem Raj wrote:
>>>> I think it should be applied but then I don't know how else this
>>>> component is used. maybe there are some toolchains which don't have
>>>> sysrooots used to compile this
>>>
>>> This is meant to be cross-compiled for the target, in which case accessing
>>> host headers or libraries is a bad idea regardless of the toolchain...
>>
>> Khem, Suman,
>>
>> Any conclusion here? Should this change be taken upstream by Suman? Or should
>> this reside here as a patch with "Upstream-Status: Inappropriate [OE-specific]"?
>>
> 
> its needed in OE for sure. Other places I don't know so literally your call.

If it is needed by OE, I am ok with this going in for now. I will leave it to
your expertise for the ack for this patch.

I need to look into this a bit more to see if I need to revise the build stuff
in the actual source repo, or I need to tweak the OE recipe to keep both happy.
I also cross-compile on my host machine when directly using automake, and as
such I don't use --prefix as /usr.

I need to have a successful OE environment for me to evaluate a proper fix, but
I am currently running into various issues when building tisdk-default-image
(tisdk-tiny-image and tisdk-base-image were ok).

regards
Suman

> 
>> Denys
>>
>>
>>>> On Mon, Oct 26, 2020 at 2:20 PM Denys Dmytriyenko <denys@ti.com> wrote:
>>>>>
>>>>> On Sat, Oct 24, 2020 at 11:59:33PM -0700, Khem Raj wrote:
>>>>>> This fixes problems during cross compile where it starts to peek into
>>>>>> build host's include and library paths and causes errors with clang and
>>>>>> QA warnings with gcc
>>>>>>
>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>> ---
>>>>>>  ...-Remove-use-of-includedir-and-libdir.patch | 37 +++++++++++++++++++
>>>>>>  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
>>>>>>  2 files changed, 39 insertions(+)
>>>>>>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
>>>>>>
>>>>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
>>>>>> new file mode 100644
>>>>>> index 00000000..34807152
>>>>>> --- /dev/null
>>>>>> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
>>>>>> @@ -0,0 +1,37 @@
>>>>>> +From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
>>>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>>>> +Date: Sat, 24 Oct 2020 23:46:39 -0700
>>>>>> +Subject: [PATCH] examples: Remove use of includedir and libdir
>>>>>> +
>>>>>> +These point to standard include and library paths which already are used
>>>>>> +from sysroot relative paths secondly, they use absolute paths which
>>>>>> +means we are asking to add -I/usr/include which might be ok in a native
>>>>>> +build but not in cross build. This helps mitigate QA errors found with
>>>>>> +OE build system since it finds it adding host include and library search
>>>>>> +paths to linker/compiler commandline
>>>>>
>>>>> What's the Upstream-Status on this? Should it be "Inappropriate [OE-specific]"?
>>>>>
>>>>>
>>>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>> +---
>>>>>> + examples/Makefile.am | 5 +----
>>>>>> + 1 file changed, 1 insertion(+), 4 deletions(-)
>>>>>> +
>>>>>> +diff --git a/examples/Makefile.am b/examples/Makefile.am
>>>>>> +index 5a9bedb..d547e41 100644
>>>>>> +--- a/examples/Makefile.am
>>>>>> ++++ b/examples/Makefile.am
>>>>>> +@@ -1,6 +1,4 @@
>>>>>> +-INCLUDE = -I${includedir}
>>>>>> +-
>>>>>> +-AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
>>>>>> ++AM_CFLAGS = -Wall -g -O2
>>>>>> +
>>>>>> + bin_PROGRAMS = rpmsg_char_simple
>>>>>> +
>>>>>> +@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
>>>>>> + rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
>>>>>> + rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
>>>>>> + rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
>>>>>> +-rpmsg_char_simple_LDFLAGS = -L${libdir}
>>>>>> +--
>>>>>> +2.29.1
>>>>>> +
>>>>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>>>>>> index 142e5bf0..cbe4d7fd 100644
>>>>>> --- a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>>>>>> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>>>>>> @@ -2,6 +2,8 @@ SUMMARY = "TI RPMsg Char Sample Applications and Tests"
>>>>>>
>>>>>>  require ti-rpmsg-char.inc
>>>>>>
>>>>>> +SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
>>>>>> +
>>>>>>  DEPENDS = "ti-rpmsg-char"
>>>>>>
>>>>>>  inherit autotools pkgconfig
>>>>>> --
>>>>>> 2.29.1
>>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>
>>>
>>>
>>>
>>
>>
>>
>> 
>>

