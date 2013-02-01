Return-Path: <javier@dowhile0.org>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29F93E0072F
	for <meta-ti@yoctoproject.org>; Fri,  1 Feb 2013 03:27:49 -0800 (PST)
Received: by mail-wg0-f53.google.com with SMTP id fn15so2846736wgb.20
	for <meta-ti@yoctoproject.org>; Fri, 01 Feb 2013 03:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=ABkIrAtnW7Xdchx1Kbg+UyH4WxyvllIIKCQYpl3RjCk=;
	b=DierEOg6T9qFXQlk0C7HSxz4Uutdo/2HXvHnckH7jIiGIzG4+qrJR9VamdGVmspLYP
	d7LzbsEalqKGDqUum3P+xucpmO0KIcWY2nIn1wOANxHq+SuM32yJePaZkiDp7NxMkXFZ
	SiInZ5PfS+Z2EIZe70GkHeWHU8PEDidR6w327aKRCcZPoF6x+r86YjAfHDVfsiXZeBn/
	lSucc9ulIzK0OAgIaV2q2X6b9xO1i3s0JpkOde8pQ5a73d980/4i115GEPkP5/Olm+f6
	dsnPxzTuIEK+FBPgKPo2r/yhRVcxDzG9M3a/Dpm4O9CZ/WwoSHqLU10lO9NbM5f44o/s
	pCdA==
MIME-Version: 1.0
X-Received: by 10.180.97.4 with SMTP id dw4mr2232644wib.16.1359718068819; Fri,
	01 Feb 2013 03:27:48 -0800 (PST)
Received: by 10.180.125.235 with HTTP; Fri, 1 Feb 2013 03:27:48 -0800 (PST)
X-Originating-IP: [95.21.135.123]
In-Reply-To: <alpine.DEB.2.02.1301311735390.5243@oneiric>
References: <alpine.DEB.2.02.1301311735390.5243@oneiric>
Date: Fri, 1 Feb 2013 12:27:48 +0100
Message-ID: <CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Gm-Message-State: ALoCoQlaz7N0xBwU/yS4Soqx5h6fEwYQGEBeaziH7J/uahx1AUiMRxmsrNZ/LWjAsRI+bpylxgwN
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: i *really* want a bootable OE image for my pdlogic am1808 experimenter kit
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
X-List-Received-Date: Fri, 01 Feb 2013 11:27:50 -0000
Content-Type: text/plain; charset=UTF-8

> hwclock: can't open '/dev/misc/rtc': No such file or directory
> Thu Jan 31 16:02:00 UTC 2013
> hwclock: can't open '/dev/misc/rtc': No such file or directory
>
>    (hangs)
>

Hi Robert,

I don't have your board but I've seen a similar issue before caused by
using a recent udev and not having enabled CONFIG_DEVTMPFS=y on your
kernel config.

The problem is that since udev-182, udev no longer creates device
nodes under /dev and this has to be managed by the kernel devtmpfs
filesystem.

 This means that a kernel built without devtmpfs config will not boot
since there won't be any device files on /dev.

Hope it helps,
Javier

