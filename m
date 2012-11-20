Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57385E0141C
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 10:08:31 -0800 (PST)
Received: by mail-bk0-f48.google.com with SMTP id jc3so2756233bkc.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=m/p46S0EFq+2C+CbocslHWJf1tuiWwGdYkpKA/ZrLBs=;
	b=czAeXum3Zizn6RxJMwqczLZqXjO+XNIN2ZuszrnF8JA39gOirmFJQi00+x9hsA3QYm
	1WzimWwl2qnpQmcUMGRDvVmkDCripHOqTKj5aLp2Fg14bdaQFK9G8xHbzNH8n/31x1pE
	7O/rwe9bUNv158OpkwDkXUYZZ0uDLM61h3KRVLIIligDp/HoM8qJ2ZNBoTB/U+fP39b0
	AJJZ3iRldcZTbxCSky3rO4k38O8XmE+qqx1IWVGWL/LMAR95BoNYmPcoOKiftpIFlnWO
	33fxOZjYRUzLSTutYiLtw16X4M6DtNm+/qs8MDyPxgs7EYIvCUMKePNm3rG+MPl8QDxH
	7kXQ==
MIME-Version: 1.0
Received: by 10.204.9.147 with SMTP id l19mr6643506bkl.15.1353434909955; Tue,
	20 Nov 2012 10:08:29 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.204.182.136 with HTTP; Tue, 20 Nov 2012 10:08:29 -0800 (PST)
In-Reply-To: <CAOT3mi+325AfgZqaP4D0Ky3M1T-zhdjadRDB_PsVFzgXPvv=Kw@mail.gmail.com>
References: <CAOT3miJT7PUO5_PRSjMwg9razGMxCzV6785Wkq2OkqO78X4pcQ@mail.gmail.com>
	<CAOT3mi+325AfgZqaP4D0Ky3M1T-zhdjadRDB_PsVFzgXPvv=Kw@mail.gmail.com>
Date: Tue, 20 Nov 2012 19:08:29 +0100
X-Google-Sender-Auth: rnESA6WpOL7bhrtx9KLcFg8VJ78
Message-ID: <CA+2YH7tTZACYEngJH8AyoJxQAHJsfERdUnwQe4Z5Oxuf=g6y=g@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: xf86-video-omap and libdrm for OMAP
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
X-List-Received-Date: Tue, 20 Nov 2012 18:08:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 20, 2012 at 6:10 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> well.. obviously, with the libdrm update, and our .bbappend in meta-ti
> things are even worse than I had thought... and the tree doesn't even build
> anymore, at least for panda, as we have:
>
> COMPATIBLE_MACHINE = "omap4|omap5"
>
> in the .bbappend
>
> so now that brings another question... should we start a 'danny' branch on
> meta-ti? if we remove the libdrm and xf86-video-omap recipes from
> meta-ti/master, then we break meta-ti/master with poky/danny...

I think meta-ti should have a danny branch with the current libdrm
2.4.39.bbappend because oe-core danny has 2.4.39 (at least for now),
then in master it can be deleted.

If 2.4.40 doesn't work (i didn't test it) then it should be fixed in
oe-core (unless the fix is not acceptable in oe-core for some reason).

Enrico

