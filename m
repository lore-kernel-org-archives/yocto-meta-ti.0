Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16171E0073F
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 07:33:30 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so1220423bkc.35
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=A0sWUUXs+IgZc/Q8hE0FBLLWrGw0c3GOOgVUDHK5fCU=;
	b=GoQ4Oy+hqzCmy56X5VX1RYwO/BlEptKJZfryf7IIk0NIvTS1UPE7R73cziKXcIBG9K
	RBcP23itjNv+ghqTIguJHijNrthNu9kcc0wzlahXaPAhnjHH44b/pRp3y1h+J+zGT3Ce
	5utUw5pD6D3mO/YqmuUFuLAHlfvGEOHC1qdQyg9CemR/BDNjQCAVVkMEwgpGvxM9glFx
	/q1Gp6u9oOzQmVaxBYDwXA+glLZnbc8w15YPu+YAXVc2qFxYFGKB4TXyikvI+HfN8CB9
	Wdnal+38Rf8Yo7ZtjAlqfYxG7ErFRznWtNBgfM8FUGiauavkhMwisjThFwmEUxX1Kt47
	lDOg==
MIME-Version: 1.0
Received: by 10.204.156.209 with SMTP id y17mr7375419bkw.113.1340807609890;
	Wed, 27 Jun 2012 07:33:29 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.204.18.143 with HTTP; Wed, 27 Jun 2012 07:33:29 -0700 (PDT)
In-Reply-To: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
References: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
Date: Wed, 27 Jun 2012 16:33:29 +0200
X-Google-Sender-Auth: 7AOkyTbahmXMVQK62LifYgRWv8g
Message-ID: <CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Thilo Fromm <fromm@dresearch-fe.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: gstreamer / ti-dmai component does not build for ti8148-evm
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
X-List-Received-Date: Wed, 27 Jun 2012 14:33:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 27, 2012 at 3:26 PM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
> Hi,
>
> building gstreamer for ti8148 fails becasue DMAI does not build:

Are you sure you can use gstreamer-ti with ti8148? AFAIK for
multimedia it's more like the pandaboard so you should use gst-ducati.

But wait for someone with more knowledge to answer to be sure :D

Enrico

