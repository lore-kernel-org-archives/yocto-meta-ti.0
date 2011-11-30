Return-Path: <kergoth@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E0B0E0030A
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 08:49:54 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qam2 with SMTP id 2so609088qam.14
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 08:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DKhX5Yqcwfd9bbmyoLqNjyHXgr9jdmqvhU0UUpuC3iY=;
	b=wqpgwdRAYyt0rRCkrzt/S74VsHBr16zgju+S1T7g0sTKSL7FoE8mArRbN0yC9/GLpR
	Ox9vZ3lew9e9q8YVBadjwrpmqWfaAPp+wKH91BzF6zDf38vbsrcwtYhgPzwld3GJhsVp
	NrRRs6+9wniBQ66dFWeFG+u0LUEE3At8jHs9g=
Received: by 10.229.46.8 with SMTP id h8mr526895qcf.86.1322671793518; Wed, 30
	Nov 2011 08:49:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.73.200 with HTTP; Wed, 30 Nov 2011 08:49:32 -0800 (PST)
In-Reply-To: <48FEF49B-BC3F-40F6-9105-26CD2E9FDFEA@dominion.thruhere.net>
References: <4ED658F5.5000804@gmail.com>
	<48FEF49B-BC3F-40F6-9105-26CD2E9FDFEA@dominion.thruhere.net>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 30 Nov 2011 09:49:32 -0700
Message-ID: <CABcZANnBD+rjG8dvSbVA0Z2q6AGGtQ81u75NU_f87zxUCb1WDg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Add lzop-native and depend on it if the kernel needs it
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
X-List-Received-Date: Wed, 30 Nov 2011 16:49:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2011 at 9:34 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 30 nov. 2011, om 17:25 heeft Christopher Larson het volgende geschreven:
>
>> If the kernel has CONFIG_KERNEL_LZO=y, it may well attempt to use the 'lzop'
>> utility to do the lzo compression, but we should not be relying on that utility
>> being installed on the build machine.
>>
>> This currently affects the linux-omap4 build for omap4430-panda.
>
> Would you mind pushing the lzop recipe to oe-core instead of meta-ti?

Will do.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

