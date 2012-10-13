Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4F9DE0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 17:34:32 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so4908799vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 17:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=lEEB00XK1NnYwXnEXX6oImh3H6n8PvUF47pS1M89h9Q=;
	b=k0604SwskWtmrWQk3fJ9MMYY9QLbXcbo6OzgLBjKlgrDGbqEi6D/FAG2ycjFL+wKtO
	T5ScF3yxtb9jY7wi2+zXui5lYE/oKn47mWbi/o7Qa9qfVXfVRRPTlZYazwxNCJquuCrN
	1EpFgX/fpmav/0A7gNGEHKqPRw596St5wKmRH3AIA4JFvRM+UuHs3Tu2nCf6nAq1hrux
	fYSVJHOrhXmev+a/AO5TyESXRW/cgTONgqZ+0owDlXIBRgQNNKDlqbYj+STKVo7Jjcab
	bavtoerBb3rWwEzN4jHTx09CCgqt2RCxeyWhm9nA8dJ262TlVS/pV85JmuibbYoyVRXf
	LeAQ==
MIME-Version: 1.0
Received: by 10.52.66.36 with SMTP id c4mr2762594vdt.6.1350088471913; Fri, 12
	Oct 2012 17:34:31 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Fri, 12 Oct 2012 17:34:31 -0700 (PDT)
In-Reply-To: <20121012212730.GE32601@denix.org>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
	<20121012205355.GD32601@denix.org>
	<CAOT3miKQiE18HUPtFZBGctYdB4Kb2A_WOjStdy+RegPmOtM3Jw@mail.gmail.com>
	<20121012212730.GE32601@denix.org>
Date: Sat, 13 Oct 2012 02:34:31 +0200
X-Google-Sender-Auth: _-I4t7HP2mABd7X1-v0LlCuE-2E
Message-ID: <CA+2YH7uOvguJS97H5dNqQ85Fsc619Org7xk2S4gvpkL=1rk53g@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Sat, 13 Oct 2012 00:34:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 12, 2012 at 11:27 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Fri, Oct 12, 2012 at 11:11:50PM +0200, Nicolas Dechesne wrote:
>> On Fri, Oct 12, 2012 at 10:53 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> >
>> > https://github.com/rvfh/meta-ti/commit/6342c03a0dba7d906db09630e57e2372998428df
>> >
>> > The recipe itself is quite trivial (I even had my own version in the works)
>> > and I only have couple minor fixes around SRCREV and its comment... But have
>> > you compared the defconfigs between those two patches? I know the first
>> > version of your patch used completely different unofficial defconfig... And
>> > you didn't specify which one you have in v2. I'd prefer to use the defconfig
>> > that was validated by the GLP team. Thanks.
>>
>> i would still prefer that we create a somehow minimalist defconfig, i
>> don't think using the 'monster' ubuntu defconfig (it has hundreds of
>> drivers enabled....) makes too much sense for meta-ti. we used that
>> because it was simpler for now, but I would hold on that patch until
>> we have a simpler config. in fact we have already a config in the tree
>> called omap4plus_defconfig, we will base on that one instead.
>
> Ok, I'm fine with that - we can work out a minimal config.
>
>
>> also we should wait until we have GST and GFX up and running before
>> merging the kernel, to avoid a couple of iterations.
>
> I would prefer to have the new kernel ASAP for many reasons. There were
> several reports about 3.1 not booting for some people. So, resolving that
> before Yocto Project 1.3 is released, is quite important. Plus, this gets us
> aligned better with your current Ubuntu-based release. And we are now starting
> to see patches against the old 3.1 kernel - by moving everyone to newer 3.4 we
> avoid waisting people's time fixing and enhancing the old 3.1...
>
> So, I'd vote to get the new kernel first and worry about GST and GFX later. Do
> you feel there will be extensive changes to the kernel recipe associated with
> those? A little bit of churn on the defconfig would be acceptable...

I just tried the defconfig from github.com/rvfh/.... and gst ducati
works too, so it's just a matter of putting it on a diet :)

I don't know about GFX, but i vote too for including it now, it's
"just" GFX that is out now. It can't be worse than the current 3.1
kernel!

Enrico

