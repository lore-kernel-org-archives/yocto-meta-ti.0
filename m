Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62484E009CE; Fri, 17 Mar 2017 10:09:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E50BCE00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:09:23 -0700 (PDT)
Received: by mail-wm0-f42.google.com with SMTP id n11so20518857wma.1
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DkXPAjxz8hpEZaxt2IU9A28TLxP98ifJQa0ZZQB3g/o=;
	b=hInFhLLD6mBZMe9FWzXjx9paFkzRiBvU5zgA7RCiJkYK6HX0jxnV/LqrEyiti8P9hI
	bsd9RkbXktDLzkejos0Xp7YR3nOBZZn+cH+0lCBTe4RVp9alaw5hBncXDav9SfYf4bb+
	sWZRy5cDY4gzSx11W2ZM1ZG5x5758/NfvmgqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DkXPAjxz8hpEZaxt2IU9A28TLxP98ifJQa0ZZQB3g/o=;
	b=GoD4/HVaPoHB5qEMoi1ethHWUe92XsuqLH05N1q4QLHOdF8VMowqgaY3KChqOGtmPR
	WHaTm7vu5zq3krpxFlTrUivwX3KNWV0CVpgg6+glDKZzUlG2lEqKcETXC8jaoEAzewTO
	ay2scUhJ5reb0w8dTc9LHbxteLzYBJVKamM7obj7nfzdjGzzbP8ZHMizE9yLjYi3Ioxp
	NeobsPYE7JB7Cw/jRYQLHmeGI9gDLsr2r87OutPesUCxaPY2ZHJ894xYD246PTS27NgK
	vHSvC5YxwSQD10kxcgv+oVyS1DKJcIuawffS+KAJLplFxixD36JM5R/ss0ANPRtp+Vqg
	ug3A==
X-Gm-Message-State: AFeK/H3zA3inb6AOBgGup8gyzWme2j31epXKe0Z32pYOH1RZV17j1mkj7FbGAIKsAl/p0TJS7ENdFfgzLEjeaDXR
X-Received: by 10.28.212.85 with SMTP id l82mr3775402wmg.45.1489770562170;
	Fri, 17 Mar 2017 10:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Fri, 17 Mar 2017 10:09:21 -0700 (PDT)
In-Reply-To: <20170317170439.GR15664@denix.org>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<20170317170439.GR15664@denix.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Fri, 17 Mar 2017 19:09:21 +0200
Message-ID: <CAGNsrLBi1Du9CmMsggFw1zaTdWKr+USP6RRwTTFS4ij_BB=y3Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty-next][PATCH 1/2] kselftests: add libpcap-ng dependency
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
X-List-Received-Date: Fri, 17 Mar 2017 17:09:25 -0000
Content-Type: text/plain; charset=UTF-8

On 17 March 2017 at 19:04, Denys Dmytriyenko <denis@denix.org> wrote:
> Fathi,
>
> Since I haven't merged morty-next anywhere yet, I can rebase and modify my
> previous patch to not do a workaround for capabilities tests...

works for me. Thanks!

> On Fri, Mar 17, 2017 at 06:36:52PM +0200, Fathi Boudra wrote:
>> libpcap-ng is required to build capabilities tests.
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
>> index a7b4ba67..dd94a65b 100644
>> --- a/recipes-kernel/kselftests/kselftests_4.9.bb
>> +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
>> @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>>
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> -DEPENDS = "libcap popt rsync-native"
>> +DEPENDS = "libcap libcap-ng popt rsync-native"
>>
>>  inherit kernel-arch
>>
>> @@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
>>  FILES_${PN}-zram = "${bindir}/kselftests/zram"
>>  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>>
>> -ALLOW_EMPTY_${PN}-capabilities = "1"
>> -
>>  RDEPENDS_${PN}-cpu-hotplug += "bash"
>>  RDEPENDS_${PN}-efivarfs += "bash"
>>  RDEPENDS_${PN}-memory-hotplug += "bash"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

