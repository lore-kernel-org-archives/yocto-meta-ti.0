Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D0ACE0175D
	for <meta-ti@yoctoproject.org>; Mon, 28 Oct 2013 21:00:01 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id e14so12583587iej.8
	for <meta-ti@yoctoproject.org>; Mon, 28 Oct 2013 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8fGx3bnP+0znIYqpdwg1K4NuhbspkxfiBPNI1na59eE=;
	b=dEblpgkf9ryNMPW24ydclwA4HYSa04KA4t+yzvCsjryWqKLhuQfUMhylw2eKs5QMa5
	NlnlSQgE5QQqcsHpwSjxxOJz2TJf2NJO+nfOY874Yq79Yb5EbyxwPo3So2SyoQMm88eR
	HtqOvqaProM40jrC1gqaUbiK4kceNcooYS6qefQF2MN4UGJROvTI5+GfJH4J8hFSkz+B
	TVMr7Nq8pNlvHukaTh4ZIctxKYgu6VGW8Pb7pAtRfUfvYQdwuAIHg79IudqTjMj1K6D6
	8QJbB+20dMr4QXmktxfRrS3YOPETwMJl10cj3LMwxHR3pKU8URsx/XZAv0XGWITIqk1f
	oSXw==
X-Received: by 10.50.26.36 with SMTP id i4mr10918502igg.33.1383019200962; Mon,
	28 Oct 2013 21:00:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 20:59:30 -0700 (PDT)
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 20:59:30 -0700
Message-ID: <CAMKF1srPxNw4yhyzkGr1GQeGS2FXS4FZrWY+3skv6Xc8SKGN_w@mail.gmail.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: AM335x-SK kernel panic with Poky(master), meta-ti(master) core-image-base
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
X-List-Received-Date: Tue, 29 Oct 2013 04:00:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 22, 2013 at 12:52 PM, Vanderpool Josh
<Joshua.Vanderpool@raymondcorp.com> wrote:
> There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-poky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a394c/git/arch/arm/mach-omap2/cclock3xxx_data.c.
>
> however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/linux-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c
>
> So it appears there is mis-match as the patch is in the 3.10 files that re in the armv7a-vfp-neon-poky-linux-gnueabi directory?
>
> So is this something that is just lost from the 3.12-rc5 kernel and shouldn't the linux-linc-headers be the version being built?
>

linux-libc-headers is basically kernel APIs for userspace and are more
or less independent of the kernel you would use to boot.

