Return-Path: <cliff.brake@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34316E0049F
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 08:42:29 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id l22so3694682vbn.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 08:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DS3BdVlxVEUV3uI0Z3EkU7pPmwOLCvFg9lfNFO+d554=;
	b=x/BUXLPbkJBtxZcSrwNx+/euf90zz7EuM14UZ5EiBEGM48BvZQoWm6E3TiVIPDE378
	frnTqRGP4nO7T/KjWqbTppkYvd/UWoZl0rUFw0wMRts0f/9qEK4J/kJUFxEBhGzzVwrk
	Ki4xJWlKPPUh0mUmaY43Hckzdq5jwKLfnqoiWCAg+Q0dmbBlmti4AmtXnSSvfoxWZdUA
	o9uhJf380GwDZmroZOpPG3qeg0BbgMJWG9F0aDQfuQTPWEsMaRVx5PIFoBlCDpUFoiCV
	0nRZDvNd6zX+Z4d830H8kLEC/UcHQ3l/PyLlaFZ+5d1+QvQaBxlAi+HapzuyJNUUf/0W
	JNpA==
MIME-Version: 1.0
Received: by 10.220.154.68 with SMTP id n4mr19895295vcw.22.1353343349262; Mon,
	19 Nov 2012 08:42:29 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Mon, 19 Nov 2012 08:42:29 -0800 (PST)
In-Reply-To: <CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
Date: Mon, 19 Nov 2012 11:42:29 -0500
Message-ID: <CAOd_LFxPVW1Sx-4H4jhbu=40HB6_uZe6CvUOCPQe_xKTd-NsLQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Enrico <ebutera@users.sourceforge.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Mon, 19 Nov 2012 16:42:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 18, 2012 at 7:06 AM, Enrico <ebutera@users.sourceforge.net> wrote:

> From the boot log you attached it seems that the kernel hanged far
> before the login prompt.
>
> I can send you an uImage i'm using with a similar setup to test, the
> only difference i can see is that i have a pandabord ES.

Yes, I'd be interested in trying your kernel.

I tried the validation image from pandaboard.org, and that seems to boot fine.

Thanks,
Cliff

-- 
=================
http://bec-systems.com

